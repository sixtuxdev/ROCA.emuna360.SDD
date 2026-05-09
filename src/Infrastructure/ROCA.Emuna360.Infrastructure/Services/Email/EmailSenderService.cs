using ROCA.Emuna360.Application.Interfaces.Services.Security;
using Microsoft.Extensions.Logging;

namespace ROCA.Emuna360.Infrastructure.Services.Email;

public class EmailSenderService : IEmailSenderService
{
    private readonly ILogger<EmailSenderService> _logger;

    public EmailSenderService(ILogger<EmailSenderService> logger)
    {
        _logger = logger;
    }

    public async Task SendEmailConfirmationAsync(string email, string fullName, string confirmationUrl)
    {
        // Mock implementation
        _logger.LogInformation("Sending email confirmation to {Email} for {FullName}. Link: {Url}", email, fullName, confirmationUrl);
        await Task.CompletedTask;
    }
}
