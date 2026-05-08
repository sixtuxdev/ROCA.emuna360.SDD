using Dapper;
using Microsoft.Extensions.Configuration;
using ROCA.Emuna360.Application.DTOs.Organization;
using ROCA.Emuna360.Application.Interfaces.Repositories.Organization;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace ROCA.Emuna360.Infrastructure.Repositories.Organization;

public class ConfiguracionIglesiaColorRepository : BaseRepository<ConfiguracionIglesiaColorDto>, IConfiguracionIglesiaColorRepository
{
    public ConfiguracionIglesiaColorRepository(IConfiguration configuration) 
        : base(configuration, "ConfiguracionIglesiaColores", "ConfiguracionIglesiaId") { }

    public async Task<IEnumerable<ConfiguracionIglesiaColorDto>> GetByDenominacionAsync(int denominacionId)
    {
        using var connection = CreateConnection();
        return await connection.QueryAsync<ConfiguracionIglesiaColorDto>("SELECT * FROM ConfiguracionIglesiaColores WHERE DenominacionId = @DenominacionId", new { DenominacionId = denominacionId });
    }

    public override async Task<int> CreateAsync(ConfiguracionIglesiaColorDto dto)
    {
        const string sql = """
            INSERT INTO ConfiguracionIglesiaColores (DenominacionId, NombreColor, ValorColor)
            OUTPUT INSERTED.ConfiguracionIglesiaId
            VALUES (@DenominacionId, @NombreColor, @ValorColor)
        """;
        using var connection = CreateConnection();
        return await connection.ExecuteScalarAsync<int>(sql, dto);
    }

    public override async Task<bool> UpdateAsync(ConfiguracionIglesiaColorDto dto)
    {
        const string sql = """
            UPDATE ConfiguracionIglesiaColores SET DenominacionId = @DenominacionId, NombreColor = @NombreColor, ValorColor = @ValorColor
            WHERE ConfiguracionIglesiaId = @ConfiguracionIglesiaId
        """;
        using var connection = CreateConnection();
        return await connection.ExecuteAsync(sql, dto) > 0;
    }
}
