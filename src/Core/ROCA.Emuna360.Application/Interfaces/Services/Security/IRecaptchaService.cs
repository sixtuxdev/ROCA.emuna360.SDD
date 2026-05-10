namespace ROCA.Emuna360.Application.Interfaces.Services.Security;

public interface IRecaptchaService
{
    Task<bool> VerifyAsync(string token);
}
