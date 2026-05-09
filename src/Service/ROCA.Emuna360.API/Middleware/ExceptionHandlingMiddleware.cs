using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Logging;
using System;
using System.Text.Json;
using System.Threading.Tasks;
using ROCA.Emuna360.Application.DTOs.Common;

namespace ROCA.Emuna360.API.Middleware;

public class ExceptionHandlingMiddleware
{
    private readonly RequestDelegate _next;
    private readonly ILogger<ExceptionHandlingMiddleware> _logger;

    public ExceptionHandlingMiddleware(RequestDelegate next, ILogger<ExceptionHandlingMiddleware> logger)
    {
        _next = next;
        _logger = logger;
    }

    public async Task InvokeAsync(HttpContext context)
    {
        try
        {
            await _next(context);
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Ocurrió un error no controlado.");
            await HandleExceptionAsync(context, ex);
        }
    }

    private static Task HandleExceptionAsync(HttpContext context, Exception exception)
    {
        context.Response.ContentType = "application/json";
        context.Response.StatusCode = StatusCodes.Status500InternalServerError;

        string message = "Ocurrió un error interno en el servidor.";

        if (exception.GetType().Name == "SqlException")
        {
            message = $"Error controlado: {exception.Message}";
        }

        var response = new ApiResponseDto<object>
        {
            Success = false,
            Message = message,
            Data = null
        };

        var options = new JsonSerializerOptions { PropertyNamingPolicy = JsonNamingPolicy.CamelCase };
        var jsonResponse = JsonSerializer.Serialize(response, options);

        return context.Response.WriteAsync(jsonResponse);
    }
}
