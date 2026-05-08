using Microsoft.AspNetCore.Mvc;
using ROCA.Emuna360.Application.DTOs.Common;

namespace ROCA.Emuna360.API.Common;

public static class ApiResponseExtensions
{
    public static IActionResult ToOk<T>(this ControllerBase controller, T data, string message = "Success")
    {
        return controller.Ok(new ApiResponseDto<T>
        {
            Success = true,
            Message = message,
            Data = data
        });
    }

    public static IActionResult ToNotFound(this ControllerBase controller, string message = "Resource not found")
    {
        return controller.NotFound(new ApiResponseDto<object>
        {
            Success = false,
            Message = message
        });
    }

    public static IActionResult ToBadRequest(this ControllerBase controller, string message = "Bad Request")
    {
        return controller.BadRequest(new ApiResponseDto<object>
        {
            Success = false,
            Message = message
        });
    }
}
