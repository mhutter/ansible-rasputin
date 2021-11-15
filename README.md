# Ansible RASPUTIN :robot:

## Create certificates

Get Account API token (unfortunately the versions available are too old for custom API tokens).

Prepare `/root/.secrets/certbot/cloudflare.ini`:

```ini
dns_cloudflare_email = <ACCOUNT EMAIL>
dns_cloudflare_api_key = <TOKEN>
```

To get a certificate, use:

    certbot certonly \
      --dns-cloudflare \
      --dns-cloudflare-credentials /root/.secrets/certbot/cloudflare.ini \
      -d $domain
