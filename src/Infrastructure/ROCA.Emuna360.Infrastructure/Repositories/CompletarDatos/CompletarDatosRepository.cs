using ROCA.Emuna360.Application.DTOs.Registry;
using ROCA.Emuna360.Application.Interfaces.Repositories.CompletarDatos;
using Microsoft.Extensions.Configuration;
using Dapper;
using System.Data;
using Microsoft.Data.SqlClient;

namespace ROCA.Emuna360.Infrastructure.Repositories.CompletarDatos;

public class CompletarDatosRepository : BaseRepository<object>, ICompletarDatosRepository
{
    public CompletarDatosRepository(IConfiguration configuration) : base(configuration) { }

    public async Task<CompletarDatosDto?> GetByRegistroAsync(int registroId)
    {
        using var conn = CreateConnection();
        var sql = "SELECT TOP 1 * FROM CompletarDatos WHERE RegistroId = @registroId ORDER BY CompletarDatosId DESC";
        var item = await conn.QueryFirstOrDefaultAsync<CompletarDatosDto>(sql, new { registroId });
        return item;
    }

    public async Task<int> CreateAsync(CompletarDatosDto dto)
    {
        using var conn = CreateConnection();
        var sql = @"
INSERT INTO CompletarDatos
(RegistroId,PaisResidenciaId,DepartamentoResidenciaId,CiudadResidenciaId,FechaNacimiento,ParametroIdEstadoCivil,ParametroIdEstudiosAcademicos,ParametroIdEstudiosTeologicos,ParametroIdSituacionLaboral,ParametroIdTipoMiembro,ParametroIdTipoPoblacion,FechaBautismo,PersonaContacto,TelefonoContacto,FechaCreacion,IglesiaId,DenominacionId,IglesiaBautismo,PastorBautismo)
VALUES
(@RegistroId,@PaisResidenciaId,@DepartamentoResidenciaId,@CiudadResidenciaId,@FechaNacimiento,@ParametroIdEstadoCivil,@ParametroIdEstudiosAcademicos,@ParametroIdEstudiosTeologicos,@ParametroIdSituacionLaboral,@ParametroIdTipoMiembro,@ParametroIdTipoPoblacion,@FechaBautismo,@PersonaContacto,@TelefonoContacto,GETUTCDATE(),@IglesiaId,@DenominacionId,@IglesiaBautismo,@PastorBautismo);
SELECT CAST(SCOPE_IDENTITY() as int);
";
        var id = await conn.QuerySingleAsync<int>(sql, dto);
        return id;
    }

    public async Task<bool> UpdateAsync(int id, CompletarDatosDto dto)
    {
        using var conn = CreateConnection();
        var sql = @"
UPDATE CompletarDatos SET
PaisResidenciaId=@PaisResidenciaId,
DepartamentoResidenciaId=@DepartamentoResidenciaId,
CiudadResidenciaId=@CiudadResidenciaId,
FechaNacimiento=@FechaNacimiento,
ParametroIdEstadoCivil=@ParametroIdEstadoCivil,
ParametroIdEstudiosAcademicos=@ParametroIdEstudiosAcademicos,
ParametroIdEstudiosTeologicos=@ParametroIdEstudiosTeologicos,
ParametroIdSituacionLaboral=@ParametroIdSituacionLaboral,
ParametroIdTipoMiembro=@ParametroIdTipoMiembro,
ParametroIdTipoPoblacion=@ParametroIdTipoPoblacion,
FechaBautismo=@FechaBautismo,
PersonaContacto=@PersonaContacto,
TelefonoContacto=@TelefonoContacto,
FechaModificacion=GETUTCDATE(),
IglesiaId=@IglesiaId,
DenominacionId=@DenominacionId,
IglesiaBautismo=@IglesiaBautismo,
PastorBautismo=@PastorBautismo
WHERE CompletarDatosId = @CompletarDatosId;
";
        dto.CompletarDatosId = id;
        var affected = await conn.ExecuteAsync(sql, dto);
        return affected > 0;
    }
}
