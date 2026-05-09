namespace ROCA.Emuna360.Application.Interfaces.Services.Security;

public interface IEmailSenderService
{
    Task SendEmailConfirmationAsync(string email, string fullName, string confirmationUrl);
}
