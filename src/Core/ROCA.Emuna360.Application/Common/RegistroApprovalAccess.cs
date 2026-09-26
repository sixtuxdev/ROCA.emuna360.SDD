namespace ROCA.Emuna360.Application.Common;

public static class RegistroApprovalAccess
{
    private static readonly int[] RoleIds = [1, 2, 4];

    public static IReadOnlyCollection<int> AllowedRoleIds { get; } = Array.AsReadOnly(RoleIds);
}
