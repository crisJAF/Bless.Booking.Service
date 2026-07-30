# Azure deployment settings

Configure these values in Azure App Service under Settings > Environment variables > App settings.

## Required settings

```text
ASPNETCORE_ENVIRONMENT=Production
ConnectionStrings__BarberDB=Server=tcp:<sql-server-name>.database.windows.net,1433;Initial Catalog=<database-name>;Persist Security Info=False;User ID=<sql-user>;Password=<sql-password>;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;
Jwt__Key=<long-random-signing-key>
Jwt__Issuer=https://<app-service-name>.azurewebsites.net
Jwt__Audience=https://<app-service-name>.azurewebsites.net
```

Local frontend origins are enabled by default with `Cors__AllowLocalDevelopmentOrigins=true`. This accepts local VS Code/dev-server URLs on any port for `localhost`, `127.0.0.1`, `::1`, `0.0.0.0`, and private LAN IPs such as `192.168.x.x`, `10.x.x.x`, and `172.16-31.x.x`.

## Optional settings

```text
Google__ApiKey=<google-places-api-key>
Google__PlaceId=<google-place-id>
Google__ReviewsCacheMinutes=720
SendGrid__ApiKey=<sendgrid-api-key>
SendGrid__ToEmail=<destination-email>
SendGrid__FromEmail=<verified-sender-email>
SendGrid__FromName=Formulario de Contacto
```

If the frontend is deployed to a public URL later, add it explicitly:

```text
Cors__AllowedOrigins__0=https://icy-river-0998dfe10.7.azurestaticapps.net
```

After deployment, open:

```text
https://<app-service-name>.azurewebsites.net/health
```

The API is reachable if it returns `status: ok`.

## Local-only overrides

For local secrets, create `Bless.Booking.Service/appsettings.Local.json`. This file is ignored by Git and is only loaded in Development.
