using System;
using System.Collections.Generic;
using System.Data;
using Microsoft.Data.SqlClient;
using System.Threading.Tasks;
using Dapper;
using Microsoft.Extensions.Configuration;
using ROCA.Emuna360.Application.Interfaces.Repositories;

namespace ROCA.Emuna360.Infrastructure.Repositories;

public abstract class BaseRepository<TDto> : IBaseRepository<TDto>
{
    protected readonly string _connectionString;
    protected readonly string _tableName;
    protected readonly string _keyColumn;

    protected BaseRepository(IConfiguration configuration, string tableName, string keyColumn)
    {
        _connectionString = configuration.GetConnectionString("DefaultConnection") ?? "";
        _tableName = tableName;
        _keyColumn = keyColumn;
    }

    protected IDbConnection CreateConnection() => new SqlConnection(_connectionString);

    public virtual async Task<IEnumerable<TDto>> GetAllAsync()
    {
        using var connection = CreateConnection();
        return await connection.QueryAsync<TDto>($"SELECT * FROM {_tableName}");
    }

    public virtual async Task<TDto?> GetByIdAsync(int id)
    {
        using var connection = CreateConnection();
        return await connection.QueryFirstOrDefaultAsync<TDto>($"SELECT * FROM {_tableName} WHERE {_keyColumn} = @Id", new { Id = id });
    }

    public virtual async Task<bool> DeleteAsync(int id)
    {
        using var connection = CreateConnection();
        var rows = await connection.ExecuteAsync($"DELETE FROM {_tableName} WHERE {_keyColumn} = @Id", new { Id = id });
        return rows > 0;
    }

    public virtual Task<int> CreateAsync(TDto dto) => throw new NotImplementedException();
    public virtual Task<bool> UpdateAsync(TDto dto) => throw new NotImplementedException();
}
