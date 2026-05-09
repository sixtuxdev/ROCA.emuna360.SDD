using ROCA.Emuna360.Domain.Entities.Security;
using System.Data;
using Dapper;
using Microsoft.Extensions.Configuration;
using ROCA.Emuna360.Application.DTOs.Security;
using ROCA.Emuna360.Application.Interfaces.Repositories.Security;
using System.Threading.Tasks;

namespace ROCA.Emuna360.Infrastructure.Repositories.Security;

public class TokenVerificacionCorreoRepository : BaseRepository<TokenVerificacionCorreo>, ITokenVerificacionCorreoRepository
{
    public TokenVerificacionCorreoRepository(IConfiguration configuration) : base(configuration) { }

    public async Task<int> CreateAsync(TokenVerificacionCorreo entity)
    {
        const string sql = """
            INSERT INTO TokensVerificacionCorreo (DenominacionId, UsuarioId, IglesiaId, TokenHash, ExpiraEn, UsadoEn)
            OUTPUT INSERTED.TokenId
            VALUES (@DenominacionId, @UsuarioId, @IglesiaId, @TokenHash, @ExpiraEn, @UsadoEn)
        """;
        using var connection = CreateConnection();
        return await connection.ExecuteScalarAsync<int>(sql, entity);
    }

    public async Task<bool> UpdateAsync(TokenVerificacionCorreo entity)
    {
        const string sql = """
            UPDATE TokensVerificacionCorreo SET DenominacionId = @DenominacionId, UsuarioId = @UsuarioId, IglesiaId = @IglesiaId, TokenHash = @TokenHash, ExpiraEn = @ExpiraEn, UsadoEn = @UsadoEn
            WHERE TokenId = @TokenId
        """;
        using var connection = CreateConnection();
        return await connection.ExecuteAsync(sql, entity) > 0;
    }

    public async Task<System.Collections.Generic.IEnumerable<TokenVerificacionCorreo>> GetAllAsync()
    {
        using var connection = CreateConnection();
        return await connection.QueryAsync<TokenVerificacionCorreo>("usp_TokenVerificacionCorreo_Listar", commandType: System.Data.CommandType.StoredProcedure);
    }

    public async Task<TokenVerificacionCorreo?> GetByIdAsync(int id)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@TokenId", id);
        return await connection.QueryFirstOrDefaultAsync<TokenVerificacionCorreo>("usp_TokenVerificacionCorreo_Obtener", parameters, commandType: System.Data.CommandType.StoredProcedure);
    }

    public async Task<bool> DeleteAsync(int id)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@TokenId", id);
        var rows = await connection.ExecuteAsync("usp_TokenVerificacionCorreo_Eliminar", parameters, commandType: System.Data.CommandType.StoredProcedure);
        return rows > 0;
    }
}

