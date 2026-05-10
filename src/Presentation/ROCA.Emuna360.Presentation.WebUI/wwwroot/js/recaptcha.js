window.recaptchaInterop = {
    execute: async function (siteKey) {
        return new Promise((resolve) => {
            if (typeof grecaptcha === 'undefined') {
                console.error('reCAPTCHA v3 not loaded');
                resolve(null);
                return;
            }

            grecaptcha.ready(function () {
                grecaptcha.execute(siteKey, { action: 'login' })
                    .then(function (token) {
                        resolve(token);
                    })
                    .catch(function (error) {
                        console.error('reCAPTCHA execution error:', error);
                        resolve(null);
                    });
            });
        });
    }
};
