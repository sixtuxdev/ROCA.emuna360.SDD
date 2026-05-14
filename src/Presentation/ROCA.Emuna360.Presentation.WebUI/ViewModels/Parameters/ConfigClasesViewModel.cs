using MudBlazor;
using ROCA.Emuna360.Application.DTOs.Parameters;
using ROCA.Emuna360.Presentation.WebUI.Services;

namespace ROCA.Emuna360.Presentation.WebUI.ViewModels.Parameters;

public sealed class ConfigClasesViewModel
{
    private const int AllStatusFilter = -1;
    private const int ActiveStatusFilter = 1;
    private const int InactiveStatusFilter = 0;
    private const int DefaultPageSize = 10;

    private readonly ParametersApiService _parametersApiService;
    private readonly TokenStorageService _tokenStorageService;
    private readonly ISnackbar _snackbar;
    private readonly IDialogService _dialogService;
    private string _claseSearchText = string.Empty;
    private string _parametroSearchText = string.Empty;
    private int _claseStatusFilter = AllStatusFilter;
    private int _parametroStatusFilter = AllStatusFilter;
    private int _clasePage = 1;
    private int _parametroPage = 1;
    private int _clasePageSize = DefaultPageSize;
    private int _parametroPageSize = DefaultPageSize;

    public ConfigClasesViewModel(
        ParametersApiService parametersApiService,
        TokenStorageService tokenStorageService,
        ISnackbar snackbar,
        IDialogService dialogService)
    {
        _parametersApiService = parametersApiService;
        _tokenStorageService = tokenStorageService;
        _snackbar = snackbar;
        _dialogService = dialogService;
    }

    public int DenominacionId { get; private set; }
    public bool IsLoadingClases { get; private set; }
    public bool IsLoadingParametros { get; private set; }
    public bool IsSavingClase { get; private set; }
    public bool IsSavingParametro { get; private set; }
    public bool IsSavingParent { get; private set; }
    public string? ErrorMessage { get; private set; }
    public IReadOnlyList<ClaseDto> Clases { get; private set; } = [];
    public IReadOnlyList<ParametroDto> Parametros { get; private set; } = [];
    public IReadOnlyList<ParametroDto> ParametrosPadreDisponibles { get; private set; } = [];
    public ClaseDto? SelectedClase { get; private set; }
    public ParametroDto? SelectedParametro { get; private set; }
    public ParametroDto? SelectedPadreParametro { get; set; }
    public ClaseDto ClaseForm { get; private set; } = NewClase();
    public ParametroDto ParametroForm { get; private set; } = NewParametro();
    public bool IsEditingClase { get; private set; }
    public bool IsEditingParametro { get; private set; }
    public bool ShowClaseForm { get; private set; }
    public bool ShowParametroForm { get; private set; }
    public int[] PageSizeOptions { get; } = [5, 10, 20, 50];
    public IReadOnlyList<StatusFilterOption> StatusFilterOptions { get; } =
    [
        new(AllStatusFilter, "Todos"),
        new(ActiveStatusFilter, "Activos"),
        new(InactiveStatusFilter, "Inactivos")
    ];

    public string ClaseSearchText
    {
        get => _claseSearchText;
        set
        {
            if (_claseSearchText == value)
                return;

            _claseSearchText = value ?? string.Empty;
            ClasePage = 1;
        }
    }

    public string ParametroSearchText
    {
        get => _parametroSearchText;
        set
        {
            if (_parametroSearchText == value)
                return;

            _parametroSearchText = value ?? string.Empty;
            ParametroPage = 1;
        }
    }

    public int ClaseStatusFilter
    {
        get => _claseStatusFilter;
        set
        {
            if (_claseStatusFilter == value)
                return;

            _claseStatusFilter = value;
            ClasePage = 1;
        }
    }

    public int ParametroStatusFilter
    {
        get => _parametroStatusFilter;
        set
        {
            if (_parametroStatusFilter == value)
                return;

            _parametroStatusFilter = value;
            ParametroPage = 1;
        }
    }

    public int ClasePage
    {
        get => _clasePage;
        set => _clasePage = ClampPage(value, ClasePageCount);
    }

    public int ParametroPage
    {
        get => _parametroPage;
        set => _parametroPage = ClampPage(value, ParametroPageCount);
    }

    public int ClasePageSize
    {
        get => _clasePageSize;
        set
        {
            if (_clasePageSize == value)
                return;

            _clasePageSize = value;
            ClasePage = 1;
        }
    }

    public int ParametroPageSize
    {
        get => _parametroPageSize;
        set
        {
            if (_parametroPageSize == value)
                return;

            _parametroPageSize = value;
            ParametroPage = 1;
        }
    }

    public string ParametrosSubtitle => SelectedClase is null
        ? "Seleccione una clase para ver sus parámetros"
        : $"Parámetros de {SelectedClase.Descripcion}";

    public bool CanSaveClase => !IsSavingClase && !string.IsNullOrWhiteSpace(ClaseForm.Descripcion);
    public bool CanSaveParametro => !IsSavingParametro && SelectedClase is not null && !string.IsNullOrWhiteSpace(ParametroForm.Descripcion);
    public bool CanSaveParent => !IsSavingParent && SelectedParametro is not null && SelectedPadreParametro is not null;
    public bool CanRemoveParent => !IsSavingParent && SelectedParametro?.PadreParametroId is not null;
    public IReadOnlyList<ClaseDto> FilteredClases => Clases
        .Where(MatchesClaseFilters)
        .ToList();

    public IReadOnlyList<ClaseDto> PagedClases => FilteredClases
        .Skip((ClasePage - 1) * ClasePageSize)
        .Take(ClasePageSize)
        .ToList();

    public int ClaseTotalItems => FilteredClases.Count;
    public int ClasePageCount => GetPageCount(ClaseTotalItems, ClasePageSize);
    public bool HasClaseFilters => !string.IsNullOrWhiteSpace(ClaseSearchText) || ClaseStatusFilter != AllStatusFilter;

    public IReadOnlyList<ParametroDto> FilteredParametros => Parametros
        .Where(MatchesParametroFilters)
        .ToList();

    public IReadOnlyList<ParametroDto> PagedParametros => FilteredParametros
        .Skip((ParametroPage - 1) * ParametroPageSize)
        .Take(ParametroPageSize)
        .ToList();

    public int ParametroTotalItems => FilteredParametros.Count;
    public int ParametroPageCount => GetPageCount(ParametroTotalItems, ParametroPageSize);
    public bool HasParametroFilters => !string.IsNullOrWhiteSpace(ParametroSearchText) || ParametroStatusFilter != AllStatusFilter;

    public async Task InitializeAsync()
    {
        var userInfo = await _tokenStorageService.GetUserInfoAsync();
        if (userInfo is null)
        {
            ErrorMessage = "No fue posible obtener la denominación del usuario autenticado.";
            return;
        }

        DenominacionId = userInfo.DenominacionId;
        await LoadClasesAsync();
    }

    public async Task LoadClasesAsync()
    {
        if (DenominacionId <= 0)
            return;

        IsLoadingClases = true;
        ErrorMessage = null;

        try
        {
            Clases = await _parametersApiService.GetClasesAsync(DenominacionId);
            _clasePage = ClampPage(_clasePage, ClasePageCount);

            if (SelectedClase is not null)
            {
                SelectedClase = Clases.FirstOrDefault(clase => clase.ClaseId == SelectedClase.ClaseId);
                if (SelectedClase is not null)
                    await LoadParametrosAsync();
            }
        }
        catch
        {
            ErrorMessage = "No fue posible cargar las clases.";
            _snackbar.Add(ErrorMessage, Severity.Error);
        }
        finally
        {
            IsLoadingClases = false;
        }
    }

    public async Task SelectClaseAsync(ClaseDto clase)
    {
        SelectedClase = clase;
        SelectedParametro = null;
        SelectedPadreParametro = null;
        ShowParametroForm = false;
        ParametroPage = 1;
        await LoadParametrosAsync();
    }

    public async Task LoadParametrosAsync()
    {
        if (SelectedClase is null)
        {
            Parametros = [];
            ParametroPage = 1;
            return;
        }

        IsLoadingParametros = true;
        ErrorMessage = null;

        try
        {
            Parametros = await _parametersApiService.GetParametrosByClaseAsync(SelectedClase.ClaseId, DenominacionId);
            _parametroPage = ClampPage(_parametroPage, ParametroPageCount);

            if (SelectedParametro is not null)
            {
                SelectedParametro = Parametros.FirstOrDefault(parametro => parametro.ParametroId == SelectedParametro.ParametroId);
                SelectedPadreParametro = SelectedParametro?.PadreParametroId is null
                    ? null
                    : ParametrosPadreDisponibles.FirstOrDefault(parametro => parametro.ParametroId == SelectedParametro.PadreParametroId);
            }
        }
        catch
        {
            ErrorMessage = "No fue posible cargar los parámetros.";
            _snackbar.Add(ErrorMessage, Severity.Error);
        }
        finally
        {
            IsLoadingParametros = false;
        }
    }

    public void StartNewClase()
    {
        ClaseForm = NewClase(DenominacionId);
        IsEditingClase = false;
        ShowClaseForm = true;
    }

    public void StartEditClase(ClaseDto clase)
    {
        ClaseForm = CloneClase(clase);
        IsEditingClase = true;
        ShowClaseForm = true;
    }

    public void CancelClaseForm()
    {
        ShowClaseForm = false;
        IsEditingClase = false;
        ClaseForm = NewClase(DenominacionId);
    }

    public async Task SaveClaseAsync()
    {
        if (!CanSaveClase)
        {
            _snackbar.Add("La descripción de la clase es obligatoria.", Severity.Warning);
            return;
        }

        IsSavingClase = true;

        try
        {
            ClaseForm.DenominacionId = DenominacionId;
            ClaseForm.FechaActualizacion = DateTime.UtcNow;

            if (IsEditingClase)
            {
                var updated = await _parametersApiService.UpdateClaseAsync(ClaseForm);
                if (!updated)
                {
                    _snackbar.Add("No fue posible actualizar la clase.", Severity.Error);
                    return;
                }
            }
            else
            {
                ClaseForm.ClaseId = 0;
                ClaseForm.FechaCreacion = DateTime.UtcNow;
                var newId = await _parametersApiService.CreateClaseAsync(ClaseForm);
                if (newId is null)
                {
                    _snackbar.Add("No fue posible crear la clase.", Severity.Error);
                    return;
                }
            }

            _snackbar.Add(IsEditingClase ? "Clase actualizada correctamente." : "Clase creada correctamente.", Severity.Success);
            ShowClaseForm = false;
            var selectedId = IsEditingClase ? ClaseForm.ClaseId : 0;
            await LoadClasesAsync();

            if (selectedId > 0)
            {
                SelectedClase = Clases.FirstOrDefault(clase => clase.ClaseId == selectedId);
            }
        }
        catch
        {
            _snackbar.Add("Ocurrió un error al guardar la clase.", Severity.Error);
        }
        finally
        {
            IsSavingClase = false;
        }
    }

    public async Task DeleteClaseAsync(ClaseDto clase)
    {
        var confirmed = await _dialogService.ShowMessageBox(
            "Eliminar clase",
            $"¿Desea eliminar la clase {clase.Descripcion}?",
            yesText: "Eliminar",
            cancelText: "Cancelar");

        if (confirmed != true)
            return;

        try
        {
            var deleted = await _parametersApiService.DeleteClaseAsync(clase.ClaseId, DenominacionId);
            if (!deleted)
            {
                _snackbar.Add("No fue posible eliminar la clase. Verifique si tiene parámetros asociados.", Severity.Error);
                return;
            }

            if (SelectedClase?.ClaseId == clase.ClaseId)
            {
                SelectedClase = null;
                SelectedParametro = null;
                SelectedPadreParametro = null;
                Parametros = [];
                ParametroPage = 1;
            }

            await LoadClasesAsync();
            _snackbar.Add("Clase eliminada correctamente.", Severity.Success);
        }
        catch
        {
            _snackbar.Add("Ocurrió un error al eliminar la clase.", Severity.Error);
        }
    }

    public void StartNewParametro()
    {
        if (SelectedClase is null)
        {
            _snackbar.Add("Seleccione una clase antes de crear un parámetro.", Severity.Warning);
            return;
        }

        ParametroForm = NewParametro(DenominacionId, SelectedClase.ClaseId);
        IsEditingParametro = false;
        ShowParametroForm = true;
    }

    public void StartEditParametro(ParametroDto parametro)
    {
        ParametroForm = CloneParametro(parametro);
        IsEditingParametro = true;
        ShowParametroForm = true;
    }

    public void CancelParametroForm()
    {
        ShowParametroForm = false;
        IsEditingParametro = false;
        ParametroForm = NewParametro(DenominacionId, SelectedClase?.ClaseId ?? 0);
    }

    public async Task SaveParametroAsync()
    {
        if (!CanSaveParametro)
        {
            _snackbar.Add("La descripción del parámetro es obligatoria.", Severity.Warning);
            return;
        }

        IsSavingParametro = true;

        try
        {
            ParametroForm.DenominacionId = DenominacionId;
            ParametroForm.ClaseId = SelectedClase!.ClaseId;
            ParametroForm.FechaActualizacion = DateTime.UtcNow;

            if (IsEditingParametro)
            {
                var updated = await _parametersApiService.UpdateParametroAsync(ParametroForm);
                if (!updated)
                {
                    _snackbar.Add("No fue posible actualizar el parámetro.", Severity.Error);
                    return;
                }
            }
            else
            {
                ParametroForm.ParametroId = 0;
                ParametroForm.FechaCreacion = DateTime.UtcNow;
                var newId = await _parametersApiService.CreateParametroAsync(ParametroForm);
                if (newId is null)
                {
                    _snackbar.Add("No fue posible crear el parámetro.", Severity.Error);
                    return;
                }
            }

            _snackbar.Add(IsEditingParametro ? "Parámetro actualizado correctamente." : "Parámetro creado correctamente.", Severity.Success);
            ShowParametroForm = false;
            var selectedId = IsEditingParametro ? ParametroForm.ParametroId : 0;
            await LoadParametrosAsync();

            if (selectedId > 0)
            {
                SelectedParametro = Parametros.FirstOrDefault(parametro => parametro.ParametroId == selectedId);
            }
        }
        catch
        {
            _snackbar.Add("Ocurrió un error al guardar el parámetro.", Severity.Error);
        }
        finally
        {
            IsSavingParametro = false;
        }
    }

    public async Task DeleteParametroAsync(ParametroDto parametro)
    {
        var confirmed = await _dialogService.ShowMessageBox(
            "Eliminar parámetro",
            $"¿Desea eliminar el parámetro {parametro.Descripcion}?",
            yesText: "Eliminar",
            cancelText: "Cancelar");

        if (confirmed != true)
            return;

        try
        {
            var deleted = await _parametersApiService.DeleteParametroAsync(parametro.ParametroId, DenominacionId);
            if (!deleted)
            {
                _snackbar.Add("No fue posible eliminar el parámetro. Verifique si tiene hijos asociados.", Severity.Error);
                return;
            }

            if (SelectedParametro?.ParametroId == parametro.ParametroId)
            {
                SelectedParametro = null;
                SelectedPadreParametro = null;
            }

            await LoadParametrosAsync();
            _snackbar.Add("Parámetro eliminado correctamente.", Severity.Success);
        }
        catch
        {
            _snackbar.Add("Ocurrió un error al eliminar el parámetro.", Severity.Error);
        }
    }

    public async Task SelectParametroAsync(ParametroDto parametro)
    {
        SelectedParametro = parametro;
        await EnsureParentOptionsLoadedAsync();
        SelectedPadreParametro = parametro.PadreParametroId is null
            ? null
            : ParametrosPadreDisponibles.FirstOrDefault(item => item.ParametroId == parametro.PadreParametroId);
    }

    public async Task<IEnumerable<ParametroDto>> SearchParentParametrosAsync(string? searchText, CancellationToken cancellationToken)
    {
        await EnsureParentOptionsLoadedAsync();

        var options = ParametrosPadreDisponibles
            .Where(parametro => SelectedParametro is null || parametro.ParametroId != SelectedParametro.ParametroId);

        if (!string.IsNullOrWhiteSpace(searchText))
        {
            options = options.Where(parametro => parametro.Descripcion.Contains(searchText, StringComparison.OrdinalIgnoreCase));
        }

        return options.Take(20);
    }

    public async Task SaveParentAsync()
    {
        if (SelectedParametro is null || SelectedPadreParametro is null)
            return;

        if (SelectedParametro.ParametroId == SelectedPadreParametro.ParametroId)
        {
            _snackbar.Add("Un parámetro no puede ser padre de sí mismo.", Severity.Warning);
            return;
        }

        IsSavingParent = true;

        try
        {
            var parametro = CloneParametro(SelectedParametro);
            parametro.PadreParametroId = SelectedPadreParametro.ParametroId;
            parametro.FechaActualizacion = DateTime.UtcNow;

            var updated = await _parametersApiService.UpdateParametroAsync(parametro);
            if (!updated)
            {
                _snackbar.Add("No fue posible guardar la asociación de padre.", Severity.Error);
                return;
            }

            _snackbar.Add("Asociación de padre guardada correctamente.", Severity.Success);
            await LoadParametrosAsync();
        }
        catch
        {
            _snackbar.Add("Ocurrió un error al guardar la asociación de padre.", Severity.Error);
        }
        finally
        {
            IsSavingParent = false;
        }
    }

    public async Task RemoveParentAsync()
    {
        if (SelectedParametro is null)
            return;

        IsSavingParent = true;

        try
        {
            var parametro = CloneParametro(SelectedParametro);
            parametro.PadreParametroId = null;
            parametro.FechaActualizacion = DateTime.UtcNow;

            var updated = await _parametersApiService.UpdateParametroAsync(parametro);
            if (!updated)
            {
                _snackbar.Add("No fue posible quitar el parámetro padre.", Severity.Error);
                return;
            }

            SelectedPadreParametro = null;
            _snackbar.Add("Parámetro padre removido correctamente.", Severity.Success);
            await LoadParametrosAsync();
        }
        catch
        {
            _snackbar.Add("Ocurrió un error al quitar el parámetro padre.", Severity.Error);
        }
        finally
        {
            IsSavingParent = false;
        }
    }

    public string GetParentContext(ParametroDto parametro)
    {
        if (SelectedClase is null)
            return string.Empty;

        return parametro.ClaseId == SelectedClase.ClaseId ? "Misma clase" : "Otra clase";
    }

    private async Task EnsureParentOptionsLoadedAsync()
    {
        if (ParametrosPadreDisponibles.Any() || DenominacionId <= 0)
            return;

        try
        {
            ParametrosPadreDisponibles = await _parametersApiService.GetParametrosByDenominacionAsync(DenominacionId);
        }
        catch
        {
            ParametrosPadreDisponibles = Parametros;
        }
    }

    private static ClaseDto NewClase(int denominacionId = 0)
    {
        return new ClaseDto
        {
            DenominacionId = denominacionId,
            Estado = true
        };
    }

    private static ParametroDto NewParametro(int denominacionId = 0, int claseId = 0)
    {
        return new ParametroDto
        {
            DenominacionId = denominacionId,
            ClaseId = claseId,
            Estado = true
        };
    }

    private static ClaseDto CloneClase(ClaseDto clase)
    {
        return new ClaseDto
        {
            ClaseId = clase.ClaseId,
            DenominacionId = clase.DenominacionId,
            Descripcion = clase.Descripcion,
            Estado = clase.Estado,
            FechaCreacion = clase.FechaCreacion,
            FechaActualizacion = clase.FechaActualizacion
        };
    }

    private static ParametroDto CloneParametro(ParametroDto parametro)
    {
        return new ParametroDto
        {
            ParametroId = parametro.ParametroId,
            DenominacionId = parametro.DenominacionId,
            ClaseId = parametro.ClaseId,
            Descripcion = parametro.Descripcion,
            Observacion = parametro.Observacion,
            PadreParametroId = parametro.PadreParametroId,
            Estado = parametro.Estado,
            FechaCreacion = parametro.FechaCreacion,
            FechaActualizacion = parametro.FechaActualizacion
        };
    }

    private bool MatchesClaseFilters(ClaseDto clase)
    {
        return MatchesStatus(clase.Estado, ClaseStatusFilter)
            && MatchesText(clase.Descripcion, ClaseSearchText);
    }

    private bool MatchesParametroFilters(ParametroDto parametro)
    {
        return MatchesStatus(parametro.Estado, ParametroStatusFilter)
            && (MatchesText(parametro.Descripcion, ParametroSearchText)
                || MatchesText(parametro.Observacion, ParametroSearchText));
    }

    private static bool MatchesText(string? value, string searchText)
    {
        return string.IsNullOrWhiteSpace(searchText)
            || (!string.IsNullOrWhiteSpace(value)
                && value.Contains(searchText.Trim(), StringComparison.OrdinalIgnoreCase));
    }

    private static bool MatchesStatus(bool estado, int statusFilter)
    {
        return statusFilter == AllStatusFilter
            || (statusFilter == ActiveStatusFilter && estado)
            || (statusFilter == InactiveStatusFilter && !estado);
    }

    private static int GetPageCount(int totalItems, int pageSize)
    {
        if (totalItems <= 0)
            return 1;

        return (int)Math.Ceiling(totalItems / (double)Math.Max(1, pageSize));
    }

    private static int ClampPage(int page, int pageCount)
    {
        return Math.Clamp(page, 1, Math.Max(1, pageCount));
    }

    public sealed record StatusFilterOption(int Value, string Text);
}
