using Microsoft.AspNetCore.Components;
using MudBlazor;
using ROCA.Emuna360.Presentation.WebUI.Services;

namespace ROCA.Emuna360.Presentation.WebUI.ViewModels.Organization;

public sealed class AdminIglesiaViewModel : ConfigIglesiasViewModel, IDisposable
{
    public AdminIglesiaViewModel(
        IglesiasApiService iglesiasApiService,
        UsuariosApiService usuariosApiService,
        IglesiasEstructurasApiService iglesiasEstructurasApiService,
        EstructuraOrganizacionalApiService estructuraOrganizacionalApiService,
        GeographyApiService geographyApiService,
        TokenStorageService tokenStorageService,
        ISnackbar snackbar,
        IDialogService dialogService,
        NavigationManager navigation,
        IglesiaStateService iglesiaStateService
        )
        : base(
            iglesiasApiService,
            usuariosApiService,
            iglesiasEstructurasApiService,
            estructuraOrganizacionalApiService,
            geographyApiService,
            tokenStorageService,
            snackbar,
            dialogService,
            navigation,
            iglesiaStateService)
    {
        _iglesiaStateService.EstructuraChanged += HandleEstructuraChangedAsync;
    }

    public event Action? StateChanged;

    public int IglesiaId { get; private set; }

    public new async Task InitializeAsync()
    {
        DenominacionId = await _tokenStorageService.GetAuthDenominacionIdAsync();
        IglesiaId = await _tokenStorageService.GetAuthIglesiaIdAsync();

        if (await _tokenStorageService.GetIsAdminDenominacionAsync())
        {
            _navigation.NavigateTo("/iglesias/configuracion", replace: true);
            return;
        }

        if (DenominacionId <= 0)
        {
            ErrorMessage = "No fue posible obtener la denominación del usuario autenticado.";
            _snackbar.Add(ErrorMessage, Severity.Error);
            return;
        }

        if (IglesiaId <= 0)
        {
            ErrorMessage = "No fue posible identificar la iglesia asignada al usuario autenticado.";
            _snackbar.Add(ErrorMessage, Severity.Error);
            return;
        }

        await LoadPaisesAsync();
        await LoadEstructurasDisponiblesAsync();
        await LoadPastoresDisponiblesAsync();
        await LoadInfoDenominacionAsync();
        await LoadAdminIglesiaAsync();
    }

    public async Task LoadAdminIglesiaAsync()
    {
        IsLoading = true;
        ErrorMessage = null;

        try
        {
            var iglesia = await _iglesiasApiService.GetIglesiaAsync(IglesiaId, DenominacionId);            
            if (iglesia is null)
            {
                ErrorMessage = "No fue posible cargar la iglesia asignada.";
                _snackbar.Add(ErrorMessage, Severity.Error);
                return;
            }

            await RefreshEstructuraForIglesiaAsync(iglesia);
            if (PastoresDisponibles.Any())
            {
                var pastor = PastoresDisponibles.FirstOrDefault(item => item.UsuarioId == iglesia.PastorResponsableRegistroId);
                iglesia.PastorResponsable = pastor;
            }
            Iglesias = [iglesia];
            SelectedIglesia = iglesia;
            IglesiaForm = CloneIglesia(iglesia);
            ApplyInfoDenominacionToForm();
            IsEditing = true;
            await LoadGeographyForFormAsync();
        }
        catch
        {
            ErrorMessage = "No fue posible cargar la iglesia asignada.";
            _snackbar.Add(ErrorMessage, Severity.Error);
        }
        finally
        {
            IsLoading = false;
        }
    }

    protected override async Task AfterSaveAsync(bool wasEditing, int selectedId)
    {
        await LoadAdminIglesiaAsync();
        NotifyStateChanged();
    }

    protected override async Task AfterClearEstructuraAsync()
    {
        await LoadAdminIglesiaAsync();
        NotifyStateChanged();
        await _iglesiaStateService.NotifyEstructuraChangedAsync(this);
    }

    private async Task HandleEstructuraChangedAsync(object? source)
    {
        if (ReferenceEquals(source, this))
            return;

        await LoadAdminIglesiaAsync();
        NotifyStateChanged();
    }

    private void NotifyStateChanged()
    {
        StateChanged?.Invoke();
    }

    public void Dispose()
    {
        _iglesiaStateService.EstructuraChanged -= HandleEstructuraChangedAsync;
    }
}
