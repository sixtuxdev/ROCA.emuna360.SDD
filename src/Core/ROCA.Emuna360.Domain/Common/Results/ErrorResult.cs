namespace ROCA.Emuna360.Domain.Common.Results;

public class ErrorResult : Result
{
    public ErrorResult(string error) : base(false, error)
    {
    }
}
