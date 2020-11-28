# Ansible RASPUTIN :robot:

## Create certificates

Get GCloud service account JSON, put in `/root/.secrets/certbot/google.json`

To get a certificate, use:

    certbot certonly \
      --dns-google \
      --dns-google-credentials /root/.secrets/certbot/google.json \
      --dns-google-propagation-seconds 120 \
      -d $domain
