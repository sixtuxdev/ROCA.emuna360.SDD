using Dapper;
using Microsoft.Extensions.Configuration;
using ROCA.Emuna360.Application.DTOs.Parameters;
using ROCA.Emuna360.Application.Interfaces.Repositories.Parameters;
using System.Collections.Generic;
using System.Data;
using System.Threading.Tasks;

namespace ROCA.Emuna360.Infrastructure.Repositories.Parameters;

public class ParametroRepository : BaseRepository<ParametroDto>, IParametroRepository
{
    public ParametroRepository(IConfiguration configuration) 
        : base(configuration, "Parametro", "ParametroId") { }

    public async Task<IEnumerable<ParametroDto>> GetByDenominacionAsync(int denominacionId)
    {
        using var connection = CreateConnection();
        return await connection.QueryAsync<ParametroDto>("usp_Parametro_Listar_por_DenominacionId", new { DenominacionId = denominacionId }, commandType: CommandType.StoredProcedure);
    }

    public override async Task<ParametroDto?> GetByIdAsync(int id)
    {
        using var connection = CreateConnection();
        return await connection.QueryFirstOrDefaultAsync<ParametroDto>("usp_Parametro_Obtener", new { ParametroId = id }, commandType: CommandType.StoredProcedure);
    }

    public override async Task<int> CreateAsync(ParametroDto dto)
    {
        const string sql = """
            INSERT INTO Parametro (DenominacionId, ClaseId, PadreParametroId, Nombre, Descripcion, Valor, ValorAuxiliar, Estado, FechaCreacion, Editable)
            OUTPUT INSERTED.ParametroId
            VALUES (@DenominacionId, @ClaseId, @PadreParametroId, @Nombre, @Descripcion, @Valor, @ValorAuxiliar, @Estado, @FechaCreacion, @Editable)
        """;
        using var connection = CreateConnection();
        return await connection.ExecuteScalarAsync<int>(sql, dto);
    }

    public override async Task<bool> UpdateAsync(ParametroDto dto)
    {
        const string sql = """
            UPDATE Parametro SET DenominacionId = @DenominacionId, ClaseId = @ClaseId, PadreParametroId = @PadreParametroId, Nombre = @Nombre, Descripcion = @Descripcion, Valor = @Valor, ValorAuxiliar = @ValorAuxiliar, Estado = @Estado, Editable = @Editable
            WHERE ParametroId = @ParametroId
        """;
        using var connection = CreateConnection();
        return await connection.ExecuteAsync(sql, dto) > 0;
    }
}
