using ROCA.Emuna360.Domain.Entities.Registry;
using Dapper;
using Microsoft.Extensions.Configuration;
using ROCA.Emuna360.Application.DTOs.Registry;
using ROCA.Emuna360.Application.Interfaces.Repositories.Registry;
using System.Collections.Generic;
using System.Data;
using System.Threading.Tasks;

namespace ROCA.Emuna360.Infrastructure.Repositories.Registry;

public class RegistroRepository : BaseRepository<Registro>, IRegistroRepository
{
    public RegistroRepository(IConfiguration configuration) : base(configuration) { }

    public async Task<IEnumerable<Registro>> GetByIglesiaAsync(int iglesiaId)
    {
        using var connection = CreateConnection();
        return await connection.QueryAsync<Registro>("SELECT * FROM Registro WHERE IglesiaId = @IglesiaId", new { IglesiaId = iglesiaId });
    }

    public async Task<int> CreateAsync(Registro entity)
    {
        const string sql = """
            INSERT INTO Registro (TipoDocumento, NumeroDocumento, NombreCompleto, Nombres, Apellidos, Sexo, TelefonoCelular, TelefonoResidencia, CorreoElectronico, Direccion, PaisId, DepartamentoId, CiudadId, CorregimientoId, CodigoPostal, Localidad, Barrio, Profesion, Empresa, Ocupacion, Cargo, Edad, FechaNacimiento, NombrePapa, NombreMama, NombreConyugue, TipoPersona, FotoPerfil, IglesiaId, EstructuraOrganizacionalId, FechaActualizacion, Estado)
            OUTPUT INSERTED.RegistroId
            VALUES (@TipoDocumento, @NumeroDocumento, @NombreCompleto, @Nombres, @Apellidos, @Sexo, @TelefonoCelular, @TelefonoResidencia, @CorreoElectronico, @Direccion, @PaisId, @DepartamentoId, @CiudadId, @CorregimientoId, @CodigoPostal, @Localidad, @Barrio, @Profesion, @Empresa, @Ocupacion, @Cargo, @Edad, @FechaNacimiento, @NombrePapa, @NombreMama, @NombreConyugue, @TipoPersona, @FotoPerfil, @IglesiaId, @EstructuraOrganizacionalId, @FechaActualizacion, @Estado)
        """;
        using var connection = CreateConnection();
        return await connection.ExecuteScalarAsync<int>(sql, entity);
    }

    public async Task<bool> UpdateAsync(Registro entity)
    {
        using var connection = CreateConnection();
        var rows = await connection.ExecuteAsync("usp_Registro_Actualizar", entity, commandType: CommandType.StoredProcedure);
        return rows > 0;
    }
    
    public async Task<IEnumerable<Registro>> GetAllAsync()
    {
        using var connection = CreateConnection();
        return await connection.QueryAsync<Registro>("usp_Registro_Listar", commandType: CommandType.StoredProcedure);
    }
    
    public async Task<Registro?> GetByIdAsync(int id)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@RegistroId", id);
        return await connection.QueryFirstOrDefaultAsync<Registro>("usp_Registro_Obtener", parameters, commandType: CommandType.StoredProcedure);
    }

    public async Task<bool> DeleteAsync(int id)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@RegistroId", id);
        var rows = await connection.ExecuteAsync("usp_Registro_Eliminar", parameters, commandType: System.Data.CommandType.StoredProcedure);
        return rows > 0;
    }
}

