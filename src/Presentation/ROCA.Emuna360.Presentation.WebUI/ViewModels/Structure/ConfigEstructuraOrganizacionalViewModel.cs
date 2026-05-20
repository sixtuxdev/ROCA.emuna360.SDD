using MudBlazor;
using ROCA.Emuna360.Application.DTOs.Structure;
using ROCA.Emuna360.Presentation.WebUI.Services;

namespace ROCA.Emuna360.Presentation.WebUI.ViewModels.Structure;

public sealed class ConfigEstructuraOrganizacionalViewModel
{
    private readonly EstructuraOrganizacionalApiService _estructuraApiService;
    private readonly TokenStorageService _tokenStorageService;
    private readonly ISnackbar _snackbar;
    private readonly IDialogService _dialogService;
    private readonly HashSet<int> _expandedNodeIds = [];
    private readonly HashSet<EstructuraFormField> _touchedFields = [];

    public ConfigEstructuraOrganizacionalViewModel(
        EstructuraOrganizacionalApiService estructuraApiService,
        TokenStorageService tokenStorageService,
        ISnackbar snackbar,
        IDialogService dialogService)
    {
        _estructuraApiService = estructuraApiService;
        _tokenStorageService = tokenStorageService;
        _snackbar = snackbar;
        _dialogService = dialogService;
    }

    public int DenominacionId { get; private set; }
    public bool IsLoadingTree { get; private set; }
    public bool IsSaving { get; private set; }
    public bool IsDeleting { get; private set; }
    public string? ErrorMessage { get; private set; }
    public IReadOnlyList<EstructuraOrganizacionalDto> Estructuras { get; private set; } = [];
    public EstructuraOrganizacionalDto EstructuraForm { get; private set; } = NewEstructura();
    public EstructuraOrganizacionalDto? SelectedEstructura { get; private set; }
    public EstructuraOrganizacionalDto? SelectedPadre { get; set; }
    public bool IsEditing { get; private set; }

    public string DenominacionLabel => DenominacionId > 0 ? DenominacionId.ToString() : "Sin denominacion";
    public string FormTitle => IsEditing ? "Editar Estructura Organizacional" : "Nueva Estructura Organizacional";
    public string SaveButtonText => IsSaving ? "Guardando..." : "Guardar";
    public bool HasEstructuras => Estructuras.Any();
    public bool CanSave => !IsSaving && ValidateForm().Count == 0;
    public bool CanDeleteSelected => !IsDeleting && SelectedEstructura is not null && IsEditing;

    public IReadOnlyList<EstructuraOrganizacionalDto> RootEstructuras => Estructuras
        .Where(estructura => estructura.GrupoEstructuraOrganizacionalId is null)
        .OrderBy(estructura => estructura.Orden)
        .ThenBy(estructura => estructura.Descripcion)
        .ToList();

    public enum EstructuraFormField
    {
        Descripcion,
        Responsable,
        Padre
    }

    public async Task InitializeAsync()
    {
        DenominacionId = await _tokenStorageService.GetAuthDenominacionIdAsync();

        if (DenominacionId <= 0)
        {
            var userInfo = await _tokenStorageService.GetUserInfoAsync();
            DenominacionId = userInfo?.DenominacionId ?? 0;
        }

        if (DenominacionId <= 0)
        {
            ErrorMessage = "No fue posible obtener la denominacion del usuario autenticado.";
            _snackbar.Add(ErrorMessage, Severity.Error);
            return;
        }

        await LoadEstructurasAsync();
        StartNewRoot();
    }

    public async Task LoadEstructurasAsync()
    {
        if (DenominacionId <= 0)
            return;

        IsLoadingTree = true;
        ErrorMessage = null;
        var selectedId = SelectedEstructura?.EstructuraOrganizacionalId;
        var formParentId = EstructuraForm.GrupoEstructuraOrganizacionalId;

        try
        {
            Estructuras = await _estructuraApiService.GetEstructurasAsync(DenominacionId);

            if (selectedId.HasValue)
            {
                SelectedEstructura = Estructuras.FirstOrDefault(estructura => estructura.EstructuraOrganizacionalId == selectedId.Value);
            }

            SelectedPadre = formParentId.HasValue
                ? Estructuras.FirstOrDefault(estructura => estructura.EstructuraOrganizacionalId == formParentId.Value)
                : null;

            RemoveMissingExpandedNodes();
        }
        catch
        {
            ErrorMessage = "No fue posible cargar las estructuras organizacionales.";
            _snackbar.Add(ErrorMessage, Severity.Error);
        }
        finally
        {
            IsLoadingTree = false;
        }
    }

    public IReadOnlyList<EstructuraOrganizacionalDto> GetChildren(EstructuraOrganizacionalDto parent)
    {
        return Estructuras
            .Where(estructura => estructura.GrupoEstructuraOrganizacionalId == parent.EstructuraOrganizacionalId)
            .OrderBy(estructura => estructura.Orden)
            .ThenBy(estructura => estructura.Descripcion)
            .ToList();
    }

    public bool HasChildren(EstructuraOrganizacionalDto parent)
    {
        return Estructuras.Any(estructura => estructura.GrupoEstructuraOrganizacionalId == parent.EstructuraOrganizacionalId);
    }

    public bool IsExpanded(EstructuraOrganizacionalDto estructura)
    {
        return _expandedNodeIds.Contains(estructura.EstructuraOrganizacionalId);
    }

    public void SetExpanded(EstructuraOrganizacionalDto estructura, bool expanded)
    {
        if (expanded)
        {
            _expandedNodeIds.Add(estructura.EstructuraOrganizacionalId);
            return;
        }

        _expandedNodeIds.Remove(estructura.EstructuraOrganizacionalId);
    }

    public bool IsSelected(EstructuraOrganizacionalDto estructura)
    {
        return SelectedEstructura?.EstructuraOrganizacionalId == estructura.EstructuraOrganizacionalId;
    }

    public void SelectEstructura(EstructuraOrganizacionalDto estructura)
    {
        SelectedEstructura = estructura;
        EstructuraForm = CloneEstructura(estructura);
        SelectedPadre = estructura.GrupoEstructuraOrganizacionalId.HasValue
            ? Estructuras.FirstOrDefault(item => item.EstructuraOrganizacionalId == estructura.GrupoEstructuraOrganizacionalId.Value)
            : null;
        IsEditing = true;
        ResetFormInteraction();
    }

    public void StartNewRoot()
    {
        SelectedEstructura = null;
        SelectedPadre = null;
        EstructuraForm = NewEstructura(DenominacionId);
        IsEditing = false;
        ResetFormInteraction();
    }

    public void StartNewChild()
    {
        if (SelectedEstructura is null)
        {
            _snackbar.Add("Seleccione una estructura para crear un hijo.", Severity.Warning);
            return;
        }

        SelectedPadre = SelectedEstructura;
        EstructuraForm = NewEstructura(DenominacionId);
        EstructuraForm.GrupoEstructuraOrganizacionalId = SelectedEstructura.EstructuraOrganizacionalId;
        EstructuraForm.Orden = GetNextChildOrder(SelectedEstructura.EstructuraOrganizacionalId);
        IsEditing = false;
        ResetFormInteraction();
        _expandedNodeIds.Add(SelectedEstructura.EstructuraOrganizacionalId);
    }

    public void ClearParent()
    {
        SelectedPadre = null;
        EstructuraForm.GrupoEstructuraOrganizacionalId = null;
    }

    public void SetParent(EstructuraOrganizacionalDto? padre)
    {
        SelectedPadre = padre;
        EstructuraForm.GrupoEstructuraOrganizacionalId = padre?.EstructuraOrganizacionalId;
    }

    public async Task<IEnumerable<EstructuraOrganizacionalDto>> SearchParentAsync(string? searchText, CancellationToken cancellationToken)
    {
        var options = Estructuras
            .Where(CanUseAsParent);

        if (!string.IsNullOrWhiteSpace(searchText))
        {
            options = options.Where(estructura =>
                estructura.Descripcion.Contains(searchText.Trim(), StringComparison.OrdinalIgnoreCase)
                || (!string.IsNullOrWhiteSpace(estructura.Responsable)
                    && estructura.Responsable.Contains(searchText.Trim(), StringComparison.OrdinalIgnoreCase)));
        }

        return await Task.FromResult(options
            .OrderBy(estructura => estructura.Descripcion)
            .Take(30));
    }

    public async Task SaveAsync()
    {
        var validationErrors = ValidateForm();
        if (validationErrors.Count > 0)
        {
            _snackbar.Add(validationErrors[0], Severity.Warning);
            return;
        }

        IsSaving = true;

        try
        {
            var wasEditing = IsEditing;
            var selectedId = EstructuraForm.EstructuraOrganizacionalId;
            var parentId = SelectedPadre?.EstructuraOrganizacionalId;

            EstructuraForm.DenominacionId = DenominacionId;
            EstructuraForm.Descripcion = EstructuraForm.Descripcion.Trim();
            EstructuraForm.Responsable = EstructuraForm.Responsable?.Trim();
            EstructuraForm.GrupoEstructuraOrganizacionalId = parentId;
            EstructuraForm.FechaActualizacion = DateTime.UtcNow;

            if (wasEditing)
            {
                var updated = await _estructuraApiService.UpdateEstructuraAsync(EstructuraForm);
                if (!updated)
                {
                    _snackbar.Add("No fue posible actualizar la estructura organizacional.", Severity.Error);
                    return;
                }
            }
            else
            {
                EstructuraForm.EstructuraOrganizacionalId = 0;
                EstructuraForm.FechaCreacion = DateTime.UtcNow;
                var newId = await _estructuraApiService.CreateEstructuraAsync(EstructuraForm);
                if (newId is null)
                {
                    _snackbar.Add("No fue posible crear la estructura organizacional.", Severity.Error);
                    return;
                }

                selectedId = newId.Value;
            }

            if (parentId.HasValue)
                _expandedNodeIds.Add(parentId.Value);
            

            _snackbar.Add(
                wasEditing ? "Estructura organizacional actualizada correctamente." : "Estructura organizacional creada correctamente.",
                Severity.Success);            

            await LoadEstructurasAsync();

            var saved = Estructuras.FirstOrDefault(estructura => estructura.EstructuraOrganizacionalId == selectedId);
            if (saved is not null)
                SelectEstructura(saved);

            StartNewRoot();
        }
        catch
        {
            _snackbar.Add("Ocurrio un error al guardar la estructura organizacional.", Severity.Error);
        }
        finally
        {
            IsSaving = false;
        }
    }

    public async Task DeleteSelectedAsync()
    {
        if (SelectedEstructura is null)
            return;

        var confirmed = await _dialogService.ShowMessageBox(
            "Eliminar estructura",
            $"Desea eliminar la estructura {SelectedEstructura.Descripcion}?",
            yesText: "Eliminar",
            cancelText: "Cancelar");

        if (confirmed != true)
            return;

        IsDeleting = true;

        try
        {
            var deleted = await _estructuraApiService.DeleteEstructuraAsync(
                SelectedEstructura.EstructuraOrganizacionalId,
                DenominacionId);

            if (!deleted)
            {
                _snackbar.Add("No fue posible eliminar la estructura. Verifique si tiene hijos asociados.", Severity.Error);
                return;
            }

            _snackbar.Add("Estructura organizacional eliminada correctamente.", Severity.Success);
            StartNewRoot();
            await LoadEstructurasAsync();
        }
        catch
        {
            _snackbar.Add("Ocurrio un error al eliminar la estructura organizacional.", Severity.Error);
        }
        finally
        {
            IsDeleting = false;
        }
    }

    public string? ValidateDescripcion(string? value)
    {
        return string.IsNullOrWhiteSpace(value) ? "La descripcion es obligatoria." : null;
    }

    public string? ValidateResponsable(string? value)
    {
        return string.IsNullOrWhiteSpace(value) ? "El responsable es obligatorio." : null;
    }

    public string? ValidateParent()
    {
        if (SelectedPadre is null)
            return null;

        if (IsEditing && SelectedPadre.EstructuraOrganizacionalId == EstructuraForm.EstructuraOrganizacionalId)
            return "Una estructura no puede ser padre de si misma.";

        if (IsEditing && IsDescendantOf(SelectedPadre.EstructuraOrganizacionalId, EstructuraForm.EstructuraOrganizacionalId))
            return "Una estructura no puede ser hija de uno de sus descendientes.";

        return null;
    }

    public void TouchFormField(EstructuraFormField field)
    {
        _touchedFields.Add(field);
    }

    public string? GetFormFieldError(EstructuraFormField field)
    {
        if (!_touchedFields.Contains(field))
            return null;

        return field switch
        {
            EstructuraFormField.Descripcion => ValidateDescripcion(EstructuraForm.Descripcion),
            EstructuraFormField.Responsable => ValidateResponsable(EstructuraForm.Responsable),
            EstructuraFormField.Padre => ValidateParent(),
            _ => null
        };
    }

    public string GetParentPath(EstructuraOrganizacionalDto estructura)
    {
        var parentNames = new Stack<string>();
        var parentId = estructura.GrupoEstructuraOrganizacionalId;

        while (parentId.HasValue)
        {
            var parent = Estructuras.FirstOrDefault(item => item.EstructuraOrganizacionalId == parentId.Value);
            if (parent is null)
                break;

            parentNames.Push(parent.Descripcion);
            parentId = parent.GrupoEstructuraOrganizacionalId;
        }

        return parentNames.Count == 0 ? "Nodo raiz" : string.Join(" / ", parentNames);
    }

    private List<string> ValidateForm()
    {
        var errors = new List<string>();

        AddIfNotNull(errors, ValidateDescripcion(EstructuraForm.Descripcion));
        AddIfNotNull(errors, ValidateResponsable(EstructuraForm.Responsable));
        AddIfNotNull(errors, ValidateParent());

        if (DenominacionId <= 0)
            errors.Add("La denominacion es obligatoria.");

        return errors;
    }

    private bool CanUseAsParent(EstructuraOrganizacionalDto estructura)
    {
        if (!IsEditing)
            return true;

        return estructura.EstructuraOrganizacionalId != EstructuraForm.EstructuraOrganizacionalId
            && !IsDescendantOf(estructura.EstructuraOrganizacionalId, EstructuraForm.EstructuraOrganizacionalId);
    }

    private bool IsDescendantOf(int candidateId, int parentId)
    {
        var current = Estructuras.FirstOrDefault(estructura => estructura.EstructuraOrganizacionalId == candidateId);

        while (current?.GrupoEstructuraOrganizacionalId is not null)
        {
            if (current.GrupoEstructuraOrganizacionalId.Value == parentId)
                return true;

            current = Estructuras.FirstOrDefault(estructura =>
                estructura.EstructuraOrganizacionalId == current.GrupoEstructuraOrganizacionalId.Value);
        }

        return false;
    }

    private int GetNextChildOrder(int parentId)
    {
        var childOrders = Estructuras
            .Where(estructura => estructura.GrupoEstructuraOrganizacionalId == parentId)
            .Select(estructura => estructura.Orden)
            .ToList();

        return childOrders.Count == 0 ? 1 : childOrders.Max() + 1;
    }

    private void RemoveMissingExpandedNodes()
    {
        var existingIds = Estructuras
            .Select(estructura => estructura.EstructuraOrganizacionalId)
            .ToHashSet();

        _expandedNodeIds.RemoveWhere(id => !existingIds.Contains(id));
    }

    private void ResetFormInteraction()
    {
        _touchedFields.Clear();
    }

    private static EstructuraOrganizacionalDto NewEstructura(int denominacionId = 0)
    {
        return new EstructuraOrganizacionalDto
        {
            DenominacionId = denominacionId,
            Estado = true,
            Orden = 1
        };
    }

    private static EstructuraOrganizacionalDto CloneEstructura(EstructuraOrganizacionalDto estructura)
    {
        return new EstructuraOrganizacionalDto
        {
            EstructuraOrganizacionalId = estructura.EstructuraOrganizacionalId,
            DenominacionId = estructura.DenominacionId,
            Descripcion = estructura.Descripcion,
            GrupoEstructuraOrganizacionalId = estructura.GrupoEstructuraOrganizacionalId,
            Orden = estructura.Orden,
            Responsable = estructura.Responsable,
            Estado = estructura.Estado,
            FechaCreacion = estructura.FechaCreacion,
            FechaActualizacion = estructura.FechaActualizacion
        };
    }

    private static void AddIfNotNull(List<string> errors, string? error)
    {
        if (!string.IsNullOrWhiteSpace(error))
            errors.Add(error);
    }
}
