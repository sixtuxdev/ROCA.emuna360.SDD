using System.Text.Json.Serialization;

namespace ROCA.Emuna360.Application.DTOs.Security;

public class RecaptchaValidationResponse
{
    [JsonPropertyName("success")]
    public bool Success { get; set; }

    [JsonPropertyName("challenge_ts")]
    public DateTime ChallengeTs { get; set; }

    [JsonPropertyName("hostname")]
    public string Hostname { get; set; } = string.Empty;

    [JsonPropertyName("score")]
    public double Score { get; set; }

    [JsonPropertyName("action")]
    public string Action { get; set; } = string.Empty;

    [JsonPropertyName("error-codes")]
    public List<string> ErrorCodes { get; set; } = new();
}
