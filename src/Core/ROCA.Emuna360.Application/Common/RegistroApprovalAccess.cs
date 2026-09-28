namespace ROCA.Emuna360.Application.Common;

public static class RegistroApprovalAccess
{
    public const string RoleCodeClaimType = "Roles";

    private static readonly string[] RoleKeys =
    [
        "ADMIN",
        "PASTOR",
        "SECRETARIA"
    ];

    public static IReadOnlyCollection<string> AllowedRoleKeys { get; } = Array.AsReadOnly(RoleKeys);

    public static bool IsAllowedRoleCode(string? codigo)
    {
        return IsAllowedRoleKey(codigo);
    }

    private static bool IsAllowedRoleKey(string? value)
    {
        if (string.IsNullOrWhiteSpace(value))
            return false;

        var normalizedValue = value.Trim();
        return RoleKeys.Contains(normalizedValue, StringComparer.OrdinalIgnoreCase);
    }
}
