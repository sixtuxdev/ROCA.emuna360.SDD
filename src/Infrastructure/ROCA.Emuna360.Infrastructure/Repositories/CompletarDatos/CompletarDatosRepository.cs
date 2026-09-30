using Dapper;
using Microsoft.Extensions.Configuration;
using ROCA.Emuna360.Application.DTOs.Registry;
using ROCA.Emuna360.Application.Interfaces.Repositories.CompletarDatos;
using System.Data;
using System.Text.Json;

namespace ROCA.Emuna360.Infrastructure.Repositories.CompletarDatos;

public class CompletarDatosRepository
    : BaseRepository<object>, ICompletarDatosRepository
{
    public CompletarDatosRepository(IConfiguration configuration)
        : base(configuration)
    {
    }

    public async Task<CompletarDatosDto?> GetByRegistroAsync(int registroId)
    {
        using var connection = CreateConnection();

        var parameters = new DynamicParameters();
        parameters.Add("@RegistroId", registroId);

        using var multi = await connection.QueryMultipleAsync(
            "usp_CompletarDatos_ObtenerPorRegistro",
            parameters,
            commandType: CommandType.StoredProcedure);

        // 1. Datos principales
        var dto = await multi.ReadFirstOrDefaultAsync<CompletarDatosDto>();

        if (dto is null)
            return null;

        // 2. Estudios académicos
        dto.ParametrosEstudiosAcademicos =
            (await multi.ReadAsync<int>()).ToList();

        // 3. Estudios teológicos
        dto.ParametrosEstudiosTeologicos =
            (await multi.ReadAsync<int>()).ToList();

        return dto;
    }

    public async Task<int> CreateAsync(CompletarDatosDto dto)
    {
        using var connection = CreateConnection();

        var parameters = new DynamicParameters();

        parameters.Add("@RegistroId", dto.RegistroId);
        parameters.Add("@PaisResidenciaId", dto.PaisResidenciaId);
        parameters.Add("@DepartamentoResidenciaId", dto.DepartamentoResidenciaId);
        parameters.Add("@CiudadResidenciaId", dto.CiudadResidenciaId);
        parameters.Add("@FechaNacimiento", dto.FechaNacimiento);
        parameters.Add("@ParametroIdEstadoCivil", dto.ParametroIdEstadoCivil);

        // NUEVO: listas de estudios
        parameters.Add(
            "@EstudiosAcademicosJson",
            JsonSerializer.Serialize(dto.ParametrosEstudiosAcademicos));

        parameters.Add(
            "@EstudiosTeologicosJson",
            JsonSerializer.Serialize(dto.ParametrosEstudiosTeologicos));

        parameters.Add("@ParametroIdSituacionLaboral", dto.ParametroIdSituacionLaboral);
        parameters.Add("@ParametroIdTipoMiembro", dto.ParametroIdTipoMiembro);
        parameters.Add("@ParametroIdTipoPoblacion", dto.ParametroIdTipoPoblacion);
        parameters.Add("@FechaBautismo", dto.FechaBautismo);
        parameters.Add("@PersonaContacto", dto.PersonaContacto);
        parameters.Add("@TelefonoContacto", dto.TelefonoContacto);
        parameters.Add("@IglesiaId", dto.IglesiaId);
        parameters.Add("@DenominacionId", dto.DenominacionId);
        parameters.Add("@IglesiaBautismo", dto.IglesiaBautismo);
        parameters.Add("@PastorBautismo", dto.PastorBautismo);

        parameters.Add(
            "@OutCompletarDatosId",
            dbType: DbType.Int32,
            direction: ParameterDirection.Output);

        await connection.ExecuteAsync(
            "usp_CompletarDatos_Insertar",
            parameters,
            commandType: CommandType.StoredProcedure);

        return parameters.Get<int>("@OutCompletarDatosId");
    }

    public async Task<bool> UpdateAsync(
        int id,
        CompletarDatosDto dto)
    {
        using var connection = CreateConnection();

        var parameters = new DynamicParameters();

        parameters.Add("@CompletarDatosId", id);
        parameters.Add("@RegistroId", dto.RegistroId);
        parameters.Add("@PaisResidenciaId", dto.PaisResidenciaId);
        parameters.Add("@DepartamentoResidenciaId", dto.DepartamentoResidenciaId);
        parameters.Add("@CiudadResidenciaId", dto.CiudadResidenciaId);
        parameters.Add("@FechaNacimiento", dto.FechaNacimiento);
        parameters.Add("@ParametroIdEstadoCivil", dto.ParametroIdEstadoCivil);

        parameters.Add(
            "@EstudiosAcademicosJson",
            JsonSerializer.Serialize(
                dto.ParametrosEstudiosAcademicos ?? new List<int>()));

        parameters.Add(
            "@EstudiosTeologicosJson",
            JsonSerializer.Serialize(
                dto.ParametrosEstudiosTeologicos ?? new List<int>()));

        parameters.Add("@ParametroIdSituacionLaboral", dto.ParametroIdSituacionLaboral);
        parameters.Add("@ParametroIdTipoMiembro", dto.ParametroIdTipoMiembro);
        parameters.Add("@ParametroIdTipoPoblacion", dto.ParametroIdTipoPoblacion);
        parameters.Add("@FechaBautismo", dto.FechaBautismo);
        parameters.Add("@PersonaContacto", dto.PersonaContacto);
        parameters.Add("@TelefonoContacto", dto.TelefonoContacto);
        parameters.Add("@IglesiaId", dto.IglesiaId);
        parameters.Add("@DenominacionId", dto.DenominacionId);
        parameters.Add("@IglesiaBautismo", dto.IglesiaBautismo);
        parameters.Add("@PastorBautismo", dto.PastorBautismo);

        await connection.ExecuteAsync(
            "usp_CompletarDatos_Actualizar",
            parameters,
            commandType: CommandType.StoredProcedure);

        // Si el SP no lanzó excepción, consideramos que la operación terminó correctamente.
        return true;
    }

    public async Task<BautizadosPaginadoDto> ListarAsync(
        string? buscar,
        int pagina,
        int registrosPorPagina)
    {
        using var connection = CreateConnection();

        var parameters = new DynamicParameters();

        parameters.Add("@Buscar", buscar);
        parameters.Add("@Pagina", pagina);
        parameters.Add("@RegistrosPorPagina", registrosPorPagina);

        using var multi = await connection.QueryMultipleAsync(
            "usp_CompletarDatos_ListarBautizados",
            parameters,
            commandType: CommandType.StoredProcedure);

        var items = (await multi.ReadAsync<BautizadosDto>())
            .ToList();

        var totalRegistros = await multi.ReadFirstAsync<int>();

        return new BautizadosPaginadoDto
        {
            Items = items,
            TotalRegistros = totalRegistros,
            Pagina = pagina,
            RegistrosPorPagina = registrosPorPagina
        };
    }
}