namespace ROCA.Emuna360.Application.Interfaces.Services.Security;

public interface IPasswordHasherService
{
    string HashPassword(string password);
    bool VerifyPassword(string password, string passwordHash);
}
