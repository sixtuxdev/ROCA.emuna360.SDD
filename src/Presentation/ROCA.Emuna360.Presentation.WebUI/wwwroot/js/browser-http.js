window.browserApiHttp = {
    send: async function (request) {
        const method = (request.method || "GET").toUpperCase();
        const options = {
            method: method,
            headers: request.headers || {},
            cache: "no-store",
            credentials: "same-origin"
        };

        if (request.body !== null && request.body !== undefined && method !== "GET" && method !== "HEAD") {
            options.body = request.body;
        }

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
    }
};
