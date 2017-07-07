This is the client app for the FaaS Enterprise Integration Pattern hackathon project.

Before deploying, updating `manifest.yml` by setting `EIP_ENDPOINT`.

The app will POST to the endpoint, sending as request data the user agent of the app visitor. Then, it will expect the endpoint to return a URL as the response body. The app then redirects to that URL.
