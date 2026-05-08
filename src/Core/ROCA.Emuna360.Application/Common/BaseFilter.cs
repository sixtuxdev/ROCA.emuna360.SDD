namespace ROCA.Emuna360.Application.Common;

public class BaseFilter : PaginationRequest
{
    public string? SearchTerm { get; set; }
    public string? SortColumn { get; set; }
    public string? SortDirection { get; set; } = "ASC";
}
