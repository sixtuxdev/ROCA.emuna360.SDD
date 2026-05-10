using ROCA.Emuna360.Domain.Common.Results;
using ROCA.Emuna360.Domain.Entities.Security;
using System.Data;
using Dapper;
using Microsoft.Extensions.Configuration;
using ROCA.Emuna360.Application.Interfaces.Repositories.Security;
using System.Threading.Tasks;

namespace ROCA.Emuna360.Infrastructure.Repositories.Security;

public class TokenVerificacionCorreoRepository : BaseRepository<TokenVerificacionCorreo>, ITokenVerificacionCorreoRepository
{
    public TokenVerificacionCorreoRepository(IConfiguration configuration) : base(configuration) { }

    public async Task<OperationResult<int>> CreateAsync(TokenVerificacionCorreo entity)
    {
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@DenominacionId", entity.DenominacionId);
        parameters.Add("@UsuarioId", entity.UsuarioId);
        parameters.Add("@IglesiaId", entity.IglesiaId);
        parameters.Add("@TokenHash", entity.TokenHash);
        parameters.Add("@ExpiraEn", entity.ExpiraEn);
        parameters.Add("@UsadoEn", entity.UsadoEn);
        parameters.Add("@FechaCreacion", entity.FechaCreacion);
        return await ExecuteCreateAsync("usp_TokenVerificacionCorreo_Insertar", parameters, "@OutTokenId");
    }

    public async Task<OperationResult<bool>> UpdateAsync(TokenVerificacionCorreo entity)
    {
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@TokenId", entity.TokenId);
        parameters.Add("@DenominacionId", entity.DenominacionId);
        parameters.Add("@UsuarioId", entity.UsuarioId);
        parameters.Add("@IglesiaId", entity.IglesiaId);
        parameters.Add("@TokenHash", entity.TokenHash);
        parameters.Add("@ExpiraEn", entity.ExpiraEn);
        parameters.Add("@UsadoEn", entity.UsadoEn);
        parameters.Add("@FechaCreacion", entity.FechaCreacion);
        return await ExecuteUpdateAsync("usp_TokenVerificacionCorreo_Actualizar", parameters, "@OutTokenId");
    }

    public async Task<System.Collections.Generic.IEnumerable<TokenVerificacionCorreo>> GetAllAsync(int denominacionId)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@DenominacionId", denominacionId);
        return await connection.QueryAsync<TokenVerificacionCorreo>("usp_TokenVerificacionCorreo_Listar", parameters, commandType: System.Data.CommandType.StoredProcedure);
    }

    public async Task<TokenVerificacionCorreo?> GetByIdAsync(int id, int denominacionId)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@TokenId", id);
        parameters.Add("@DenominacionId", denominacionId);
        return await connection.QueryFirstOrDefaultAsync<TokenVerificacionCorreo>("usp_TokenVerificacionCorreo_Obtener", parameters, commandType: System.Data.CommandType.StoredProcedure);
    }

    public async Task<bool> DeleteAsync(int id, int denominacionId)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@TokenId", id);
        parameters.Add("@DenominacionId", denominacionId);
        var rows = await connection.ExecuteAsync("usp_TokenVerificacionCorreo_Eliminar", parameters, commandType: System.Data.CommandType.StoredProcedure);
        return rows > 0;
    }
}

