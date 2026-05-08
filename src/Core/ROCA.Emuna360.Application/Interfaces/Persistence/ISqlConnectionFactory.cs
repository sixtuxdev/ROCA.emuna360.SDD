using System.Data;

namespace ROCA.Emuna360.Application.Interfaces.Persistence;

public interface ISqlConnectionFactory
{
    IDbConnection CreateConnection();
}
