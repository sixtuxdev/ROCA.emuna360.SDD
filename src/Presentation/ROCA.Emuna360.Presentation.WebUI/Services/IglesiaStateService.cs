namespace ROCA.Emuna360.Presentation.WebUI.Services;

public sealed class IglesiaStateService
{
    public event Func<object?, Task>? EstructuraChanged;

    public Task NotifyEstructuraChangedAsync(object? source = null)
    {
        var handlers = EstructuraChanged;
        if (handlers is null)
            return Task.CompletedTask;

        var notifications = handlers
            .GetInvocationList()
            .Cast<Func<object?, Task>>()
            .Select(handler => handler(source));

        return Task.WhenAll(notifications);
    }
}
