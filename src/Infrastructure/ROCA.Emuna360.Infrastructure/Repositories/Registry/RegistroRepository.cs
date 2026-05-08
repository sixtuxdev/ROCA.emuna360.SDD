using Dapper;
using Microsoft.Extensions.Configuration;
using ROCA.Emuna360.Application.DTOs.Registry;
using ROCA.Emuna360.Application.Interfaces.Repositories.Registry;
using System.Collections.Generic;
using System.Data;
using System.Threading.Tasks;

namespace ROCA.Emuna360.Infrastructure.Repositories.Registry;

public class RegistroRepository : BaseRepository<RegistroDto>, IRegistroRepository
{
    public RegistroRepository(IConfiguration configuration) 
        : base(configuration, "Registro", "RegistroId") { }

    public async Task<IEnumerable<RegistroDto>> GetByIglesiaAsync(int iglesiaId)
    {
        using var connection = CreateConnection();
        return await connection.QueryAsync<RegistroDto>("SELECT * FROM Registro WHERE IglesiaId = @IglesiaId", new { IglesiaId = iglesiaId });
    }

    public override async Task<int> CreateAsync(RegistroDto dto)
    {
        const string sql = """
            INSERT INTO Registro (TipoDocumento, NumeroDocumento, NombreCompleto, Nombres, Apellidos, Sexo, TelefonoCelular, TelefonoResidencia, CorreoElectronico, Direccion, PaisId, DepartamentoId, CiudadId, CorregimientoId, CodigoPostal, Localidad, Barrio, Profesion, Empresa, Ocupacion, Cargo, Edad, FechaNacimiento, NombrePapa, NombreMama, NombreConyugue, TipoPersona, FotoPerfil, IglesiaId, EstructuraOrganizacionalId, FechaActualizacion, Estado)
            OUTPUT INSERTED.RegistroId
            VALUES (@TipoDocumento, @NumeroDocumento, @NombreCompleto, @Nombres, @Apellidos, @Sexo, @TelefonoCelular, @TelefonoResidencia, @CorreoElectronico, @Direccion, @PaisId, @DepartamentoId, @CiudadId, @CorregimientoId, @CodigoPostal, @Localidad, @Barrio, @Profesion, @Empresa, @Ocupacion, @Cargo, @Edad, @FechaNacimiento, @NombrePapa, @NombreMama, @NombreConyugue, @TipoPersona, @FotoPerfil, @IglesiaId, @EstructuraOrganizacionalId, @FechaActualizacion, @Estado)
        """;
        using var connection = CreateConnection();
        return await connection.ExecuteScalarAsync<int>(sql, dto);
    }

    public override async Task<bool> UpdateAsync(RegistroDto dto)
    {
        using var connection = CreateConnection();
        var rows = await connection.ExecuteAsync("usp_Registro_Actualizar", dto, commandType: CommandType.StoredProcedure);
        return rows > 0;
    }
    
    public override async Task<IEnumerable<RegistroDto>> GetAllAsync()
    {
        using var connection = CreateConnection();
        return await connection.QueryAsync<RegistroDto>("usp_Registro_Listar", commandType: CommandType.StoredProcedure);
    }
    
    public override async Task<RegistroDto?> GetByIdAsync(int id)
    {
        using var connection = CreateConnection();
        return await connection.QueryFirstOrDefaultAsync<RegistroDto>("usp_Registro_Obtener", new { RegistroId = id }, commandType: CommandType.StoredProcedure);
    }
}
