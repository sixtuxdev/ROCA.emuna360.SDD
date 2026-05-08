using Dapper;
using Microsoft.Extensions.Configuration;
using ROCA.Emuna360.Application.DTOs.Security;
using ROCA.Emuna360.Application.Interfaces.Repositories.Security;
using System.Collections.Generic;
using System.Data;
using System.Threading.Tasks;

namespace ROCA.Emuna360.Infrastructure.Repositories.Security;

public class UsuarioRepository : BaseRepository<UsuarioDto>, IUsuarioRepository
{
    public UsuarioRepository(IConfiguration configuration) 
        : base(configuration, "Usuarios", "UsuarioId") { }

    public async Task<IEnumerable<UsuarioDto>> GetByDenominacionAsync(int denominacionId)
    {
        using var connection = CreateConnection();
        return await connection.QueryAsync<UsuarioDto>("SELECT * FROM Usuarios WHERE DenominacionId = @DenominacionId", new { DenominacionId = denominacionId });
    }

    public override async Task<int> CreateAsync(UsuarioDto dto)
    {
        using var connection = CreateConnection();
        // Uses stored procedure based on SPEC-003
        var p = new DynamicParameters(dto);
        p.Add("@UsuarioId", dbType: DbType.Int32, direction: ParameterDirection.Output);
        
        await connection.ExecuteAsync("sp_Usuarios_Insertar", p, commandType: CommandType.StoredProcedure);
        return p.Get<int>("@UsuarioId");
    }

    public override async Task<bool> UpdateAsync(UsuarioDto dto)
    {
        using var connection = CreateConnection();
        var rows = await connection.ExecuteAsync("sp_Usuarios_Actualizar", dto, commandType: CommandType.StoredProcedure);
        return rows > 0;
    }
}
