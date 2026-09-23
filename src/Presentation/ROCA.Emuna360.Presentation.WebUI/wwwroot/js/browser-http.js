window.browserApiHttp = (() => {
    const pendingRequests = new Map();

    function errorResponse(status, statusText, message) {
        return {
            status: status,
            statusText: statusText,
            headers: { "content-type": "application/json; charset=utf-8" },
            body: JSON.stringify({ error: message })
        };
    }

    return {
        send: async function (request) {
            const method = (request.method || "GET").toUpperCase();
            const controller = new AbortController();
            const requestId = request.requestId || "";
            const timeoutMilliseconds = Number(request.timeoutMilliseconds) > 0
                ? Number(request.timeoutMilliseconds)
                : 30000;
            const options = {
                method: method,
                headers: request.headers || {},
                cache: "no-store",
                credentials: "same-origin",
                signal: controller.signal
            };

            if (request.body !== null && request.body !== undefined && method !== "GET" && method !== "HEAD") {
                options.body = request.body;
            }

            if (requestId) {
                pendingRequests.set(requestId, controller);
            }

            const timeoutId = window.setTimeout(() => controller.abort(), timeoutMilliseconds);

            try {
                const response = await fetch(request.url, options);
                const headers = {};
                response.headers.forEach((value, key) => {
                    headers[key] = value;
                });

                return {
                    status: response.status,
                    statusText: response.statusText,
                    headers: headers,
                    body: await response.text()
                };
            } catch (error) {
                if (error && error.name === "AbortError") {
                    return errorResponse(408, "Request Timeout", "La solicitud a la API excedió el tiempo permitido.");
                }

                return errorResponse(502, "Bad Gateway", "No fue posible comunicarse con la API.");
            } finally {
                window.clearTimeout(timeoutId);
                if (requestId) {
                    pendingRequests.delete(requestId);
                }
            }
        },

        abort: function (requestId) {
            const controller = pendingRequests.get(requestId);
            if (controller) {
                controller.abort();
            }
        }
    };
})();
