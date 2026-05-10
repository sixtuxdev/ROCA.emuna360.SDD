using ROCA.Emuna360.Domain.Common.Results;
using ROCA.Emuna360.Domain.Entities.Security;
using System.Data;
using Dapper;
using Microsoft.Extensions.Configuration;
using ROCA.Emuna360.Application.Interfaces.Repositories.Security;
using System.Threading.Tasks;

namespace ROCA.Emuna360.Infrastructure.Repositories.Security;

public class TokenRefreshRepository : BaseRepository<RefreshToken>, ITokenRefreshRepository
{
    public TokenRefreshRepository(IConfiguration configuration) : base(configuration) { }

    public async Task<OperationResult<int>> CreateAsync(RefreshToken entity)
    {
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@DenominacionId", entity.DenominacionId);
        parameters.Add("@UsuarioId", entity.UsuarioId);
        parameters.Add("@IglesiaId", entity.IglesiaId);
        parameters.Add("@TokenHash", entity.TokenHash);
        parameters.Add("@ExpiraEn", entity.ExpiraEn);
        parameters.Add("@RevocadoEn", entity.RevocadoEn);
        parameters.Add("@ReemplazadoPor", entity.ReemplazadoPor);
        parameters.Add("@UserAgent", entity.UserAgent);
        parameters.Add("@Ip", entity.Ip);
        parameters.Add("@FechaCreacion", entity.FechaCreacion);
        return await ExecuteCreateAsync("usp_TokenRefresh_Insertar", parameters, "@OutRefreshTokenId");
    }

    public async Task<OperationResult<bool>> UpdateAsync(RefreshToken entity)
    {
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@RefreshTokenId", entity.RefreshTokenId);
        parameters.Add("@DenominacionId", entity.DenominacionId);
        parameters.Add("@UsuarioId", entity.UsuarioId);
        parameters.Add("@IglesiaId", entity.IglesiaId);
        parameters.Add("@TokenHash", entity.TokenHash);
        parameters.Add("@ExpiraEn", entity.ExpiraEn);
        parameters.Add("@RevocadoEn", entity.RevocadoEn);
        parameters.Add("@ReemplazadoPor", entity.ReemplazadoPor);
        parameters.Add("@UserAgent", entity.UserAgent);
        parameters.Add("@Ip", entity.Ip);
        parameters.Add("@FechaCreacion", entity.FechaCreacion);
        return await ExecuteUpdateAsync("usp_TokenRefresh_Actualizar", parameters, "@OutRefreshTokenId");
    }

    public async Task<System.Collections.Generic.IEnumerable<RefreshToken>> GetAllAsync(int denominacionId)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@DenominacionId", denominacionId);
        return await connection.QueryAsync<RefreshToken>("usp_TokenRefresh_Listar", parameters, commandType: System.Data.CommandType.StoredProcedure);
    }

    public async Task<RefreshToken?> GetByIdAsync(int id, int denominacionId)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@RefreshTokenId", id);
        parameters.Add("@DenominacionId", denominacionId);
        return await connection.QueryFirstOrDefaultAsync<RefreshToken>("usp_TokenRefresh_Obtener", parameters, commandType: System.Data.CommandType.StoredProcedure);
    }

    public async Task<bool> DeleteAsync(int id, int denominacionId)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@RefreshTokenId", id);
        parameters.Add("@DenominacionId", denominacionId);
        var rows = await connection.ExecuteAsync("usp_TokenRefresh_Eliminar", parameters, commandType: System.Data.CommandType.StoredProcedure);
        return rows > 0;
    }
}

