using Dapper;
using Microsoft.Extensions.Configuration;
using ROCA.Emuna360.Application.DTOs.Security;
using ROCA.Emuna360.Application.Interfaces.Repositories.Security;
using System.Threading.Tasks;

namespace ROCA.Emuna360.Infrastructure.Repositories.Security;

public class TokenRefreshRepository : BaseRepository<RefreshTokenDto>, ITokenRefreshRepository
{
    public TokenRefreshRepository(IConfiguration configuration) 
        : base(configuration, "TokensRefresh", "RefreshTokenId") { }

    public override async Task<int> CreateAsync(RefreshTokenDto dto)
    {
        const string sql = """
            INSERT INTO TokensRefresh (DenominacionId, UsuarioId, IglesiaId, TokenHash, ExpiraEn, RevocadoEn, ReemplazadoPor, UserAgent, Ip)
            OUTPUT INSERTED.RefreshTokenId
            VALUES (@DenominacionId, @UsuarioId, @IglesiaId, @TokenHash, @ExpiraEn, @RevocadoEn, @ReemplazadoPor, @UserAgent, @Ip)
        """;
        using var connection = CreateConnection();
        return await connection.ExecuteScalarAsync<int>(sql, dto);
    }

    public override async Task<bool> UpdateAsync(RefreshTokenDto dto)
    {
        const string sql = """
            UPDATE TokensRefresh SET DenominacionId = @DenominacionId, UsuarioId = @UsuarioId, IglesiaId = @IglesiaId, TokenHash = @TokenHash, ExpiraEn = @ExpiraEn, RevocadoEn = @RevocadoEn, ReemplazadoPor = @ReemplazadoPor, UserAgent = @UserAgent, Ip = @Ip
            WHERE RefreshTokenId = @RefreshTokenId
        """;
        using var connection = CreateConnection();
        return await connection.ExecuteAsync(sql, dto) > 0;
    }
}
