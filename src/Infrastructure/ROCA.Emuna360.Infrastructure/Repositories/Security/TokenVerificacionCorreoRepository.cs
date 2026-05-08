using Dapper;
using Microsoft.Extensions.Configuration;
using ROCA.Emuna360.Application.DTOs.Security;
using ROCA.Emuna360.Application.Interfaces.Repositories.Security;
using System.Threading.Tasks;

namespace ROCA.Emuna360.Infrastructure.Repositories.Security;

public class TokenVerificacionCorreoRepository : BaseRepository<TokenVerificacionCorreoDto>, ITokenVerificacionCorreoRepository
{
    public TokenVerificacionCorreoRepository(IConfiguration configuration) 
        : base(configuration, "TokensVerificacionCorreo", "TokenId") { }

    public override async Task<int> CreateAsync(TokenVerificacionCorreoDto dto)
    {
        const string sql = """
            INSERT INTO TokensVerificacionCorreo (DenominacionId, UsuarioId, IglesiaId, TokenHash, ExpiraEn, UsadoEn)
            OUTPUT INSERTED.TokenId
            VALUES (@DenominacionId, @UsuarioId, @IglesiaId, @TokenHash, @ExpiraEn, @UsadoEn)
        """;
        using var connection = CreateConnection();
        return await connection.ExecuteScalarAsync<int>(sql, dto);
    }

    public override async Task<bool> UpdateAsync(TokenVerificacionCorreoDto dto)
    {
        const string sql = """
            UPDATE TokensVerificacionCorreo SET DenominacionId = @DenominacionId, UsuarioId = @UsuarioId, IglesiaId = @IglesiaId, TokenHash = @TokenHash, ExpiraEn = @ExpiraEn, UsadoEn = @UsadoEn
            WHERE TokenId = @TokenId
        """;
        using var connection = CreateConnection();
        return await connection.ExecuteAsync(sql, dto) > 0;
    }
}
