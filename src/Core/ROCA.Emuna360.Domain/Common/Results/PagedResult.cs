using System.Collections.Generic;

namespace ROCA.Emuna360.Domain.Common.Results;

public class PagedResult<T> : Result<IEnumerable<T>>
{
    public int TotalRecords { get; }
    public int PageNumber { get; }
    public int PageSize { get; }
    public int TotalPages => PageSize > 0 ? (int)Math.Ceiling(TotalRecords / (double)PageSize) : 0;

    protected PagedResult(bool isSuccess, string error, IEnumerable<T>? value, int totalRecords, int pageNumber, int pageSize) 
        : base(isSuccess, error, value)
    {
        TotalRecords = totalRecords;
        PageNumber = pageNumber;
        PageSize = pageSize;
    }

    public static PagedResult<T> Success(IEnumerable<T> data, int totalRecords, int pageNumber, int pageSize)
    {
        return new(true, string.Empty, data, totalRecords, pageNumber, pageSize);
    }

    public static new PagedResult<T> Failure(string error)
    {
        return new(false, error, default, 0, 0, 0);
    }
}
