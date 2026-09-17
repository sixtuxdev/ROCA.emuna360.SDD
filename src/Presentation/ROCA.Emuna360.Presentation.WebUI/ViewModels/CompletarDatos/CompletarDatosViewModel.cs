using Microsoft.AspNetCore.Components;
using MudBlazor;
using ROCA.Emuna360.Application.DTOs.Registry;
using ROCA.Emuna360.Application.DTOs.Geography;
using ROCA.Emuna360.Application.DTOs.Organization;
using ROCA.Emuna360.Presentation.WebUI.Services;

namespace ROCA.Emuna360.Presentation.WebUI.ViewModels.CompletarDatos;

public sealed class CompletarDatosViewModel
{
    private readonly CompletarDatosApiService _completarService;
    private readonly TokenStorageService _tokenStorageService;
    private readonly ISnackbar _snackbar;
    private readonly GeographyApiService _geographyApiService;
    private readonly IglesiasApiService _iglesiasApiService;
    private readonly ParametersApiService _parametersApiService;

    public CompletarDatosViewModel(
        CompletarDatosApiService completarService,
        TokenStorageService tokenStorageService,
        ISnackbar snackbar,
        GeographyApiService geographyApiService,
        IglesiasApiService iglesiasApiService,
        ParametersApiService parametersApiService)
    {
        _completarService = completarService;
        _tokenStorageService = tokenStorageService;
        _snackbar = snackbar;
        _geographyApiService = geographyApiService;
        _iglesiasApiService = iglesiasApiService;
        _parametersApiService = parametersApiService;
    }

    public CompletarDatosDto Model { get; private set; } = new();
    public bool IsLoading { get; private set; }
    public bool IsSaving { get; private set; }
    public bool HasData => Model is not null && Model.CompletarDatosId > 0;

    public IReadOnlyList<PaisDto> Paises { get; private set; } = [];
    public IReadOnlyList<DepartamentoDto> Departamentos { get; private set; } = [];
    public IReadOnlyList<CiudadDto> Ciudades { get; private set; } = [];
    public IReadOnlyList<IglesiaDto> Iglesias { get; private set; } = [];
    // Parámetros para binds en la UI
    public IReadOnlyList<ROCA.Emuna360.Application.DTOs.Parameters.ParametroDto> EstadoCivil { get; private set; } = [];
    public IReadOnlyList<ROCA.Emuna360.Application.DTOs.Parameters.ParametroDto> EstudiosAcademicos { get; private set; } = [];
    public IReadOnlyList<ROCA.Emuna360.Application.DTOs.Parameters.ParametroDto> EstudiosTeologicos { get; private set; } = [];
    public IReadOnlyList<ROCA.Emuna360.Application.DTOs.Parameters.ParametroDto> SituacionLaboral { get; private set; } = [];
    public IReadOnlyList<ROCA.Emuna360.Application.DTOs.Parameters.ParametroDto> TipoPoblacion { get; private set; } = [];
    public IReadOnlyList<ROCA.Emuna360.Application.DTOs.Parameters.ParametroDto> TipoMiembro { get; private set; } = [];

    public async Task InitializeAsync()
    {
        IsLoading = true;

        try
        {
            System.Diagnostics.Debug.WriteLine("PASO 1: antes de GetRegisterInfoAsync");

            var reg = await _tokenStorageService.GetRegisterInfoAsync();

            System.Diagnostics.Debug.WriteLine("PASO 2: despues de GetRegisterInfoAsync");

            var registroId = reg?.RegistroId ?? 0;

            if (registroId > 0)
            {
                var existing = await _completarService.GetByRegistroAsync(registroId);

                if (existing is not null)
                {
                    Model = existing;
                }
                else
                {
                    Model = new CompletarDatosDto
                    {
                        RegistroId = registroId
                    };
                }
            }
            else
            {
                Model = new CompletarDatosDto();
            }

            // =========================================================
            // DENOMINACIÓN
            // =========================================================

            try
            {
                var denom = await _tokenStorageService.GetAuthDenominacionIdAsync();

                if (denom > 0)
                    Model.DenominacionId = denom;
            }
            catch
            {
                // La validación al guardar mostrará el error si falta.
            }

            // =========================================================
            // IGLESIA
            //
            // Si CompletarDatos ya tiene una iglesia, se conserva.
            // Si no tiene iglesia, se toma la iglesia del usuario
            // autenticado, igual que AdminRegistroViewModel.
            // =========================================================

            if (!Model.IglesiaId.HasValue || Model.IglesiaId.Value <= 0)
            {
                try
                {
                    var iglesiaId = await _tokenStorageService.GetAuthIglesiaIdAsync();

                    if (iglesiaId > 0)
                        Model.IglesiaId = iglesiaId;
                }
                catch
                {
                    // Si no se puede obtener, se mantiene sin iglesia.
                }
            }

            // =========================================================
            // CATÁLOGOS
            // =========================================================

            await LoadPaisesAsync();

            System.Diagnostics.Debug.WriteLine("PASO 3: antes de LoadIglesiasAsync");

            await LoadIglesiasAsync();

            System.Diagnostics.Debug.WriteLine("PASO 4: despues de LoadIglesiasAsync");

            // =========================================================
            // GEOGRAFÍA
            // =========================================================

            if (Model.PaisResidenciaId.HasValue)
                await LoadDepartamentosAsync(Model.PaisResidenciaId.Value);

            if (Model.DepartamentoResidenciaId.HasValue)
                await LoadCiudadesAsync(Model.DepartamentoResidenciaId.Value);

            // =========================================================
            // PARÁMETROS
            // =========================================================

            await EnsureDefaultParametrosAsync();
        }
        catch
        {
            _snackbar.Add(
                "No fue posible cargar los datos personales.",
                Severity.Error);
        }
        finally
        {
            IsLoading = false;
        }
    }

    // no helper required; use TokenStorageService.GetRegisterInfoAsync directly

    public async Task LoadPaisesAsync()
    {
        try
        {
            Paises = (await _geographyApiService.GetPaisesAsync())
                .Where(p => p.Estado)
                .OrderBy(p => p.PaisNombre)
                .ToList();
        }
        catch
        {
            _snackbar.Add("No fue posible cargar los países.", Severity.Error);
        }
    }

    public async Task LoadDepartamentosAsync(int paisId)
    {
        try
        {
            Departamentos = (await _geographyApiService.GetDepartamentosAsync(paisId))
                .Where(d => d.Estado)
                .OrderBy(d => d.DepartamentoNombre)
                .ToList();
        }
        catch
        {
            _snackbar.Add("No fue posible cargar los departamentos.", Severity.Error);
        }
    }

    public async Task LoadCiudadesAsync(int departamentoId)
    {
        try
        {
            Ciudades = (await _geographyApiService.GetCiudadesAsync(departamentoId))
                .Where(c => c.Estado)
                .OrderBy(c => c.CiudadNombre)
                .ToList();
        }
        catch
        {
            _snackbar.Add("No fue posible cargar las ciudades.", Severity.Error);
        }
    }

    public async Task ChangePaisAsync(int? paisId)
    {
        Model.PaisResidenciaId = paisId;
        Model.DepartamentoResidenciaId = null;
        Model.CiudadResidenciaId = null;
        Departamentos = [];
        Ciudades = [];
        if (paisId.HasValue)
            await LoadDepartamentosAsync(paisId.Value);
    }

    public async Task ChangeDepartamentoAsync(int? departamentoId)
    {
        Model.DepartamentoResidenciaId = departamentoId;
        Model.CiudadResidenciaId = null;
        Ciudades = [];
        if (departamentoId.HasValue)
            await LoadCiudadesAsync(departamentoId.Value);
    }

    public Task ChangeCiudadAsync(int? ciudadId)
    {
        Model.CiudadResidenciaId = ciudadId;
        return Task.CompletedTask;
    }
    public async Task LoadForRegistroAsync(int registroId)
    {
        IsLoading = true;

        try
        {
            if (registroId > 0)
            {
                var existing =
                    await _completarService.GetByRegistroAsync(registroId);

                if (existing is not null)
                {
                    Model = existing;
                }
                else
                {
                    Model = new CompletarDatosDto
                    {
                        RegistroId = registroId
                    };
                }
            }
            else
            {
                Model = new CompletarDatosDto();
            }

            // =========================================================
            // DENOMINACIÓN
            // =========================================================

            try
            {
                var denom =
                    await _tokenStorageService.GetAuthDenominacionIdAsync();

                if (denom > 0)
                    Model.DenominacionId = denom;
            }
            catch
            {
                // Se valida al guardar.
            }

            // =========================================================
            // IGLESIA
            //
            // Si ya existe en CompletarDatos, NO la reemplazamos.
            // Si no existe, tomamos la iglesia del usuario autenticado.
            // =========================================================

            if (!Model.IglesiaId.HasValue || Model.IglesiaId.Value <= 0)
            {
                try
                {
                    var iglesiaId =
                        await _tokenStorageService.GetAuthIglesiaIdAsync();

                    if (iglesiaId > 0)
                        Model.IglesiaId = iglesiaId;
                }
                catch
                {
                    // Se mantiene null si no se puede determinar.
                }
            }

            // =========================================================
            // CATÁLOGOS
            // =========================================================

            await LoadPaisesAsync();

            await LoadIglesiasAsync();

            // =========================================================
            // GEOGRAFÍA
            // =========================================================

            if (Model.PaisResidenciaId.HasValue)
                await LoadDepartamentosAsync(
                    Model.PaisResidenciaId.Value);

            if (Model.DepartamentoResidenciaId.HasValue)
                await LoadCiudadesAsync(
                    Model.DepartamentoResidenciaId.Value);

            // =========================================================
            // PARÁMETROS
            // =========================================================

            await EnsureDefaultParametrosAsync();
        }
        catch
        {
            _snackbar.Add(
                "No fue posible cargar los datos personales.",
                Severity.Error);
        }
        finally
        {
            IsLoading = false;
        }
    }

    public async Task LoadIglesiasAsync()
    {
        try
        {
            var denominacionId =
                await _tokenStorageService.GetAuthDenominacionIdAsync();

            if (denominacionId <= 0)
            {
                Iglesias = [];
                return;
            }

            Iglesias = (await _iglesiasApiService.GetIglesiasAsync(denominacionId))
                .Where(i => i.Activa)
                .OrderBy(i => i.Nombre)
                .ToList();

            // Si ya tenemos una iglesia seleccionada,
            // conservarla automáticamente.
            if (Model.IglesiaId.HasValue && Model.IglesiaId.Value > 0)
            {
                var iglesiaExiste = Iglesias.Any(
                    i => i.IglesiaId == Model.IglesiaId.Value);

                if (!iglesiaExiste)
                {
                    Model.IglesiaId = null;
                }
            }
        }
        catch
        {
            _snackbar.Add(
                "No fue posible cargar las iglesias.",
                Severity.Error);
        }
    }

    public Task SelectIglesiaAsync(int? iglesiaId)
    {
        Model.IglesiaId = iglesiaId;
        return Task.CompletedTask;
    }

    public async Task<bool> SaveAsync()
    {
        IsSaving = true;
        try
        {
            // Asegurar parámetros por defecto antes de guardar (en caso InitializeAsync no los cargó)
            await EnsureDefaultParametrosAsync();

            // Asegurar denominación antes de guardar
            var denomId = await _tokenStorageService.GetAuthDenominacionIdAsync();
            if (denomId > 0)
                Model.DenominacionId = denomId;

            if (Model.DenominacionId <= 0)
            {
                _snackbar.Add("No se pudo determinar la denominación para guardar.", Severity.Error);
                return false;
            }

            try
            {
                if (Model.CompletarDatosId > 0)
                {
                    var ok = await _completarService.UpdateAsync(Model.CompletarDatosId, Model);
                    if (ok) _snackbar.Add("Datos actualizados", Severity.Success);
                    else _snackbar.Add("Error actualizando los datos.", Severity.Error);
                    return ok;
                }

                var id = await _completarService.CreateAsync(Model);
                if (id.HasValue)
                {
                    Model.CompletarDatosId = id.Value;
                    _snackbar.Add("Datos guardados", Severity.Success);
                    return true;
                }

                _snackbar.Add("Error al crear el registro de completar datos.", Severity.Error);
                return false;
            }
            catch (HttpRequestException httpEx)
            {
                _snackbar.Add($"Error al guardar los datos: {httpEx.Message}", Severity.Error);
                return false;
            }
            catch (Exception ex)
            {
                _snackbar.Add($"Excepción al guardar: {ex.Message}", Severity.Error);
                return false;
            }
        }
        catch (Exception ex)
        {
            _snackbar.Add($"Excepción al guardar: {ex.Message}", Severity.Error);
            return false;
        }
        finally
        {
            IsSaving = false;
        }
    }

    private async Task EnsureDefaultParametrosAsync()
    {
        try
        {
            var denomId = await _tokenStorageService.GetAuthDenominacionIdAsync();

            if (denomId <= 0)
            {
                _snackbar.Add(
                    "No se encontró la denominación.",
                    Severity.Warning);

                return;
            }

            var estadoCivil =
                await _parametersApiService.GetParametrosByNombreClase(
                    "ESTADO CIVIL",
                    denomId);

            EstadoCivil = estadoCivil;

            var estudios =
                await _parametersApiService.GetParametrosByNombreClase(
                    "ESTUDIOS REALIZADOS",
                    denomId);

            EstudiosAcademicos = estudios;

            var estudiosTeologicos =
                await _parametersApiService.GetParametrosByNombreClase(
                    "ESTUDIOS TEOLÓGICOS",
                    denomId);

            EstudiosTeologicos = estudiosTeologicos;

            var situacion =
                await _parametersApiService.GetParametrosByNombreClase(
                    "Situación Laboral",
                    denomId);

            SituacionLaboral = situacion;

            var tipoPoblacion =
                await _parametersApiService.GetParametrosByNombreClase(
                    "TIPO DE POBLACION",
                    denomId);

            TipoPoblacion = tipoPoblacion;

            var tipoMiembro =
                await _parametersApiService.GetParametrosByNombreClase(
                    "TIPO DE MIEMBRO",
                    denomId);

            TipoMiembro = tipoMiembro;
        }
        catch (Exception ex)
        {
            _snackbar.Add(
                $"Error cargando parámetros: {ex.Message}",
                Severity.Error);
        }
    }
}
