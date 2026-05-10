using ROCA.Emuna360.Domain.Common.Results;
using ROCA.Emuna360.Domain.Entities.Organization;
using System.Data;
using Dapper;
using Microsoft.Extensions.Configuration;
using ROCA.Emuna360.Application.Interfaces.Repositories.Organization;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace ROCA.Emuna360.Infrastructure.Repositories.Organization;

public class ConfiguracionIglesiaRepository : BaseRepository<ConfiguracionIglesia>, IConfiguracionIglesiaRepository
{
    public ConfiguracionIglesiaRepository(IConfiguration configuration) : base(configuration) { }

    public async Task<IEnumerable<ConfiguracionIglesia>> GetByDenominacionAsync(int denominacionId)
    {
        return await GetAllAsync(denominacionId);
    }

    public async Task<IEnumerable<ConfiguracionIglesia>> GetByIglesiaAsync(int iglesiaId, int denominacionId)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@IglesiaId", iglesiaId);
        parameters.Add("@DenominacionId", denominacionId);
        return await connection.QueryAsync<ConfiguracionIglesia>("usp_ConfiguracionIglesia_ListarPorIglesia", parameters, commandType: CommandType.StoredProcedure);
    }

    public async Task<OperationResult<int>> CreateAsync(ConfiguracionIglesia entity)
    {
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@DenominacionId", entity.DenominacionId);
        parameters.Add("@IglesiaId", entity.IglesiaId);
        parameters.Add("@SitioWeb", entity.SitioWeb);
        parameters.Add("@Logo", entity.Logo);
        parameters.Add("@HostEmail", entity.HostEmail);
        parameters.Add("@HostUsuarioEmail", entity.HostUsuarioEmail);
        parameters.Add("@Host", entity.Host);
        parameters.Add("@FromEmail", entity.FromEmail);
        parameters.Add("@HostPort", entity.HostPort);
        parameters.Add("@TextFromEmail", entity.TextFromEmail);
        parameters.Add("@KeySecretAPIRecaptcha", entity.KeySecretAPIRecaptcha);
        parameters.Add("@KeySecretWebRecaptcha", entity.KeySecretWebRecaptcha);
        parameters.Add("@InfoTextoEncabezado", entity.InfoTextoEncabezado);
        parameters.Add("@Activa", entity.Activa);
        parameters.Add("@FechaCreacion", entity.FechaCreacion);
        parameters.Add("@FechaActualizacion", entity.FechaActualizacion);
        return await ExecuteCreateAsync("usp_ConfiguracionIglesia_Insertar", parameters, "@OutConfiguracionIglesiaId");
    }

    public async Task<OperationResult<bool>> UpdateAsync(ConfiguracionIglesia entity)
    {
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@ConfiguracionIglesiaId", entity.ConfiguracionIglesiaId);
        parameters.Add("@DenominacionId", entity.DenominacionId);
        parameters.Add("@IglesiaId", entity.IglesiaId);
        parameters.Add("@SitioWeb", entity.SitioWeb);
        parameters.Add("@Logo", entity.Logo);
        parameters.Add("@HostEmail", entity.HostEmail);
        parameters.Add("@HostUsuarioEmail", entity.HostUsuarioEmail);
        parameters.Add("@Host", entity.Host);
        parameters.Add("@FromEmail", entity.FromEmail);
        parameters.Add("@HostPort", entity.HostPort);
        parameters.Add("@TextFromEmail", entity.TextFromEmail);
        parameters.Add("@KeySecretAPIRecaptcha", entity.KeySecretAPIRecaptcha);
        parameters.Add("@KeySecretWebRecaptcha", entity.KeySecretWebRecaptcha);
        parameters.Add("@InfoTextoEncabezado", entity.InfoTextoEncabezado);
        parameters.Add("@Activa", entity.Activa);
        parameters.Add("@FechaCreacion", entity.FechaCreacion);
        parameters.Add("@FechaActualizacion", entity.FechaActualizacion);
        return await ExecuteUpdateAsync("usp_ConfiguracionIglesia_Actualizar", parameters, "@OutConfiguracionIglesiaId");
    }

    public async Task<IEnumerable<ConfiguracionIglesia>> GetAllAsync(int denominacionId)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@DenominacionId", denominacionId);
        return await connection.QueryAsync<ConfiguracionIglesia>("usp_ConfiguracionIglesia_Listar", parameters, commandType: CommandType.StoredProcedure);
    }

    public async Task<ConfiguracionIglesia?> GetByIdAsync(int id, int denominacionId)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@ConfiguracionIglesiaId", id);
        parameters.Add("@DenominacionId", denominacionId);
        return await connection.QueryFirstOrDefaultAsync<ConfiguracionIglesia>("usp_ConfiguracionIglesia_Obtener", parameters, commandType: CommandType.StoredProcedure);
    }

    public async Task<bool> DeleteAsync(int id, int denominacionId)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@ConfiguracionIglesiaId", id);
        parameters.Add("@DenominacionId", denominacionId);
        var rows = await connection.ExecuteAsync("usp_ConfiguracionIglesia_Eliminar", parameters, commandType: CommandType.StoredProcedure);
        return rows > 0;
    }
}

