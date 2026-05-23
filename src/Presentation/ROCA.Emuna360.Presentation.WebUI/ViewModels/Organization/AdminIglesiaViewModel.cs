using Microsoft.AspNetCore.Components;
using MudBlazor;
using ROCA.Emuna360.Presentation.WebUI.Services;

namespace ROCA.Emuna360.Presentation.WebUI.ViewModels.Organization;

public sealed class AdminIglesiaViewModel : ConfigIglesiasViewModel
{
    public AdminIglesiaViewModel(
        IglesiasApiService iglesiasApiService,
        IglesiasEstructurasApiService iglesiasEstructurasApiService,
        EstructuraOrganizacionalApiService estructuraOrganizacionalApiService,
        GeographyApiService geographyApiService,
        TokenStorageService tokenStorageService,
        ISnackbar snackbar,
        IDialogService dialogService,
        NavigationManager navigation
        )
        : base(
            iglesiasApiService,
            iglesiasEstructurasApiService,
            estructuraOrganizacionalApiService,
            geographyApiService,
            tokenStorageService,
            snackbar,
            dialogService,
            navigation)
    {
    }

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

            Iglesias = [iglesia];
            SelectedIglesia = iglesia;
            IglesiaForm = CloneIglesia(iglesia);
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
    }
}
