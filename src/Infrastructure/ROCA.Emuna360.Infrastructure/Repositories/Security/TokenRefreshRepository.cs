using ROCA.Emuna360.Domain.Entities.Security;
using System.Data;
using Dapper;
using Microsoft.Extensions.Configuration;
using ROCA.Emuna360.Application.DTOs.Security;
using ROCA.Emuna360.Application.Interfaces.Repositories.Security;
using System.Threading.Tasks;

namespace ROCA.Emuna360.Infrastructure.Repositories.Security;

public class TokenRefreshRepository : BaseRepository<RefreshToken>, ITokenRefreshRepository
{
    public TokenRefreshRepository(IConfiguration configuration) : base(configuration) { }

    public async Task<int> CreateAsync(RefreshToken entity)
    {
        const string sql = """
            INSERT INTO TokensRefresh (DenominacionId, UsuarioId, IglesiaId, TokenHash, ExpiraEn, RevocadoEn, ReemplazadoPor, UserAgent, Ip)
            OUTPUT INSERTED.RefreshTokenId
            VALUES (@DenominacionId, @UsuarioId, @IglesiaId, @TokenHash, @ExpiraEn, @RevocadoEn, @ReemplazadoPor, @UserAgent, @Ip)
        """;
        using var connection = CreateConnection();
        return await connection.ExecuteScalarAsync<int>(sql, entity);
    }

    public async Task<bool> UpdateAsync(RefreshToken entity)
    {
        const string sql = """
            UPDATE TokensRefresh SET DenominacionId = @DenominacionId, UsuarioId = @UsuarioId, IglesiaId = @IglesiaId, TokenHash = @TokenHash, ExpiraEn = @ExpiraEn, RevocadoEn = @RevocadoEn, ReemplazadoPor = @ReemplazadoPor, UserAgent = @UserAgent, Ip = @Ip
            WHERE RefreshTokenId = @RefreshTokenId
        """;
        using var connection = CreateConnection();
        return await connection.ExecuteAsync(sql, entity) > 0;
    }

    public async Task<System.Collections.Generic.IEnumerable<RefreshToken>> GetAllAsync()
    {
        using var connection = CreateConnection();
        return await connection.QueryAsync<RefreshToken>("usp_TokenRefresh_Listar", commandType: System.Data.CommandType.StoredProcedure);
    }

    public async Task<RefreshToken?> GetByIdAsync(int id)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@RefreshTokenId", id);
        return await connection.QueryFirstOrDefaultAsync<RefreshToken>("usp_TokenRefresh_Obtener", parameters, commandType: System.Data.CommandType.StoredProcedure);
    }

    public async Task<bool> DeleteAsync(int id)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@RefreshTokenId", id);
        var rows = await connection.ExecuteAsync("usp_TokenRefresh_Eliminar", parameters, commandType: System.Data.CommandType.StoredProcedure);
        return rows > 0;
    }
}

