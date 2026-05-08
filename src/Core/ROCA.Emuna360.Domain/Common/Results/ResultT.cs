namespace ROCA.Emuna360.Domain.Common.Results;

public class Result<T> : Result
{
    public T? Value { get; }

    protected Result(bool isSuccess, string error, T? value) : base(isSuccess, error)
    {
        Value = value;
    }

    public static Result<T> Success(T value) => new(true, string.Empty, value);
    public static new Result<T> Failure(string error) => new(false, error, default);
}
