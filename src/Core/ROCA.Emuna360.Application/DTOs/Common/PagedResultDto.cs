using System.Collections.Generic;
using ROCA.Emuna360.Application.Common;

namespace ROCA.Emuna360.Application.DTOs.Common;

public class PagedResultDto<T> : PaginationResponse
{
    public IEnumerable<T> Data { get; set; } = new List<T>();
}
