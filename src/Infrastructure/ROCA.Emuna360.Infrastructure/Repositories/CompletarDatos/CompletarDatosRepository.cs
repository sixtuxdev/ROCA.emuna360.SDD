using Dapper;
using Microsoft.Extensions.Configuration;
using ROCA.Emuna360.Application.DTOs.Registry;
using ROCA.Emuna360.Application.Interfaces.Repositories.CompletarDatos;
using System.Data;

namespace ROCA.Emuna360.Infrastructure.Repositories.CompletarDatos;

public class CompletarDatosRepository : BaseRepository<object>, ICompletarDatosRepository
{
    public CompletarDatosRepository(IConfiguration configuration) : base(configuration)
    {
    }

    public async Task<CompletarDatosDto?> GetByRegistroAsync(int registroId)
    {
        using var connection = CreateConnection();

        var parameters = new DynamicParameters();
        parameters.Add("@RegistroId", registroId);

        return await connection.QueryFirstOrDefaultAsync<CompletarDatosDto>(
            "usp_CompletarDatos_ObtenerPorRegistro",
            parameters,
            commandType: CommandType.StoredProcedure);
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
        parameters.Add("@ParametroIdEstudiosAcademicos", dto.ParametroIdEstudiosAcademicos);
        parameters.Add("@ParametroIdEstudiosTeologicos", dto.ParametroIdEstudiosTeologicos);
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

    public async Task<bool> UpdateAsync(int id, CompletarDatosDto dto)
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
        parameters.Add("@ParametroIdEstudiosAcademicos", dto.ParametroIdEstudiosAcademicos);
        parameters.Add("@ParametroIdEstudiosTeologicos", dto.ParametroIdEstudiosTeologicos);
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

        var rows = await connection.ExecuteAsync(
            "usp_CompletarDatos_Actualizar",
            parameters,
            commandType: CommandType.StoredProcedure);

        return rows > 0;
    }
}