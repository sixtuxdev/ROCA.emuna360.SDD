using Dapper;
using Microsoft.Extensions.Configuration;
using ROCA.Emuna360.Application.DTOs.Organization;
using ROCA.Emuna360.Application.Interfaces.Repositories.Organization;
using System.Collections.Generic;
using System.Data;
using System.Threading.Tasks;

namespace ROCA.Emuna360.Infrastructure.Repositories.Organization;

public class IglesiaRepository : BaseRepository<IglesiaDto>, IIglesiaRepository
{
    public IglesiaRepository(IConfiguration configuration) 
        : base(configuration, "Iglesias", "IglesiaId") { }

    public async Task<IEnumerable<IglesiaDto>> GetByDenominacionAsync(int denominacionId)
    {
        using var connection = CreateConnection();
        return await connection.QueryAsync<IglesiaDto>("SELECT * FROM Iglesias WHERE DenominacionId = @DenominacionId", new { DenominacionId = denominacionId });
    }

    public override async Task<int> CreateAsync(IglesiaDto dto)
    {
        const string sql = """
            INSERT INTO Iglesias (DenominacionId, Nombre, Slug, PersoneriaJuridica, PaisId, DepartamentoId, CiudadId, CorregimientoId, Direccion, Telefono, Correo, Slogan, Activa, FechaCreacion)
            OUTPUT INSERTED.IglesiaId
            VALUES (@DenominacionId, @Nombre, @Slug, @PersoneriaJuridica, @PaisId, @DepartamentoId, @CiudadId, @CorregimientoId, @Direccion, @Telefono, @Correo, @Slogan, @Activa, @FechaCreacion)
        """;
        using var connection = CreateConnection();
        return await connection.ExecuteScalarAsync<int>(sql, dto);
    }

    public override async Task<bool> UpdateAsync(IglesiaDto dto)
    {
        using var connection = CreateConnection();
        var rows = await connection.ExecuteAsync("usp_Iglesias_Actualizar", dto, commandType: CommandType.StoredProcedure);
        return rows > 0;
    }
    
    public override async Task<IEnumerable<IglesiaDto>> GetAllAsync()
    {
        using var connection = CreateConnection();
        return await connection.QueryAsync<IglesiaDto>("usp_Iglesias_Listar", commandType: CommandType.StoredProcedure);
    }
    
    public override async Task<IglesiaDto?> GetByIdAsync(int id)
    {
        using var connection = CreateConnection();
        return await connection.QueryFirstOrDefaultAsync<IglesiaDto>("usp_Iglesias_Obtener", new { IglesiaId = id }, commandType: CommandType.StoredProcedure);
    }
}
