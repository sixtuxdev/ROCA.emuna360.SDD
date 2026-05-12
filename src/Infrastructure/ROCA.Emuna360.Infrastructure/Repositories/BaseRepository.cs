using System.Data;
using Microsoft.Extensions.Configuration;
using Microsoft.Data.SqlClient;
using Dapper;
using ROCA.Emuna360.Domain.Common.Results;
using System.Threading.Tasks;
using System.Linq;

namespace ROCA.Emuna360.Infrastructure.Repositories;

public abstract class BaseRepository<TEntity>
{
    protected readonly IConfiguration _configuration;

    protected BaseRepository(IConfiguration configuration)
    {
        _configuration = configuration;
    }

    protected IDbConnection CreateConnection()
    {
        return new SqlConnection(_configuration.GetConnectionString("DefaultConnection"));
    }

    protected async Task<OperationResult<int>> ExecuteCreateAsync(string procedureName, DynamicParameters parameters, string outIdParameter)
    {
        if (!parameters.ParameterNames.Any(n => n.Equals(outIdParameter, System.StringComparison.OrdinalIgnoreCase)))
            parameters.Add(outIdParameter, dbType: DbType.Int32, direction: ParameterDirection.Output);

        if (!parameters.ParameterNames.Any(n => n.Equals("@Resultado", System.StringComparison.OrdinalIgnoreCase)))
            parameters.Add("@Resultado", dbType: DbType.String, direction: ParameterDirection.Output, size: 20);

        if (!parameters.ParameterNames.Any(n => n.Equals("@Mensaje", System.StringComparison.OrdinalIgnoreCase)))
            parameters.Add("@Mensaje", dbType: DbType.String, direction: ParameterDirection.Output, size: 4000);

        using var connection = CreateConnection();
        await connection.ExecuteAsync(procedureName, parameters, commandType: CommandType.StoredProcedure);

        var resultado = parameters.Get<string>("@Resultado");
        var mensaje = parameters.Get<string>("@Mensaje");
        var id = parameters.Get<int>(outIdParameter);

        return new OperationResult<int>
        {
            Success = resultado?.Trim().Equals("Ok", System.StringComparison.OrdinalIgnoreCase) ?? false,
            Data = id,
            Result = resultado ?? string.Empty,
            Message = mensaje ?? string.Empty
        };
    }

    protected async Task<OperationResult<bool>> ExecuteUpdateAsync(string procedureName, DynamicParameters parameters, string outIdParameter)
    {
        if (!parameters.ParameterNames.Any(n => n.Equals(outIdParameter, System.StringComparison.OrdinalIgnoreCase)))
            parameters.Add(outIdParameter, dbType: DbType.Int32, direction: ParameterDirection.Output);

        if (!parameters.ParameterNames.Any(n => n.Equals("@Resultado", System.StringComparison.OrdinalIgnoreCase)))
            parameters.Add("@Resultado", dbType: DbType.String, direction: ParameterDirection.Output, size: 20);

        if (!parameters.ParameterNames.Any(n => n.Equals("@Mensaje", System.StringComparison.OrdinalIgnoreCase)))
            parameters.Add("@Mensaje", dbType: DbType.String, direction: ParameterDirection.Output, size: 4000);

        using var connection = CreateConnection();
        await connection.ExecuteAsync(procedureName, parameters, commandType: CommandType.StoredProcedure);

        var resultado = parameters.Get<string>("@Resultado");
        var mensaje = parameters.Get<string>("@Mensaje");

        return new OperationResult<bool>
        {
            Success = resultado?.Trim().Equals("Ok", System.StringComparison.OrdinalIgnoreCase) ?? false,
            Data = resultado?.Trim().Equals("Ok", System.StringComparison.OrdinalIgnoreCase) ?? false,
            Result = resultado ?? string.Empty,
            Message = mensaje ?? string.Empty
        };
    }
}
