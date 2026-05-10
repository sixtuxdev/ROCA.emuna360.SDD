namespace ROCA.Emuna360.Domain.Common.Results;

public class OperationResult<T>
{
    public bool Success { get; set; }
    public T? Data { get; set; }
    public string Result { get; set; } = string.Empty;
    public string Message { get; set; } = string.Empty;
}
