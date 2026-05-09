using ROCA.Emuna360.Domain.Entities.Parameters;
using Dapper;
using Microsoft.Extensions.Configuration;
using ROCA.Emuna360.Application.DTOs.Parameters;
using ROCA.Emuna360.Application.Interfaces.Repositories.Parameters;
using System.Collections.Generic;
using System.Data;
using System.Threading.Tasks;

namespace ROCA.Emuna360.Infrastructure.Repositories.Parameters;

public class ParametroRepository : BaseRepository<Parametro>, IParametroRepository
{
    public ParametroRepository(IConfiguration configuration) : base(configuration) { }

    public async Task<IEnumerable<Parametro>> GetByDenominacionAsync(int denominacionId)
    {
        using var connection = CreateConnection();
        return await connection.QueryAsync<Parametro>("usp_Parametro_Listar_por_DenominacionId", new { DenominacionId = denominacionId }, commandType: CommandType.StoredProcedure);
    }

    public async Task<Parametro?> GetByIdAsync(int id)
    {
        using var connection = CreateConnection();
        return await connection.QueryFirstOrDefaultAsync<Parametro>("usp_Parametro_Obtener", new { ParametroId = id }, commandType: CommandType.StoredProcedure);
    }

    public async Task<int> CreateAsync(Parametro entity)
    {
        const string sql = """
            INSERT INTO Parametro (DenominacionId, ClaseId, PadreParametroId, Nombre, Descripcion, Valor, ValorAuxiliar, Estado, FechaCreacion, Editable)
            OUTPUT INSERTED.ParametroId
            VALUES (@DenominacionId, @ClaseId, @PadreParametroId, @Nombre, @Descripcion, @Valor, @ValorAuxiliar, @Estado, @FechaCreacion, @Editable)
        """;
        using var connection = CreateConnection();
        return await connection.ExecuteScalarAsync<int>(sql, entity);
    }

    public async Task<bool> UpdateAsync(Parametro entity)
    {
        const string sql = """
            UPDATE Parametro SET DenominacionId = @DenominacionId, ClaseId = @ClaseId, PadreParametroId = @PadreParametroId, Nombre = @Nombre, Descripcion = @Descripcion, Valor = @Valor, ValorAuxiliar = @ValorAuxiliar, Estado = @Estado, Editable = @Editable
            WHERE ParametroId = @ParametroId
        """;
        using var connection = CreateConnection();
        return await connection.ExecuteAsync(sql, entity) > 0;
    }

    public async Task<System.Collections.Generic.IEnumerable<Parametro>> GetAllAsync()
    {
        using var connection = CreateConnection();
        return await connection.QueryAsync<Parametro>("usp_Parametro_Listar", commandType: System.Data.CommandType.StoredProcedure);
    }



    public async Task<bool> DeleteAsync(int id)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@ParametroId", id);
        var rows = await connection.ExecuteAsync("usp_Parametro_Eliminar", parameters, commandType: System.Data.CommandType.StoredProcedure);
        return rows > 0;
    }
}

