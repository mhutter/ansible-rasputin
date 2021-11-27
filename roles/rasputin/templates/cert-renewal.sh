#!/bin/bash
set -e -u -o pipefail

DOMAIN='{{ rasputin_domain }}'

# Prepare certificates for haproxy
ls -1 /etc/letsencrypt/live/ | \
grep -v README | \
while read -r site; do
  cat /etc/letsencrypt/live/"${site}"/{fullchain,privkey}.pem > "{{ rasputin_pki_root }}/haproxy/${site}.pem"
done
systemctl reload haproxy.service

# Prepare certificate for registry
for s in registry; do
  for t in cert privkey; do
    cat "/etc/letsencrypt/live/${s}.${DOMAIN}/${t}.pem" > "{{ rasputin_pki_root }}/${s}/${t}.pem"
  done
done

curl -fsS -m 10 --retry 5 -o /dev/null https://hc-ping.com/fb3b7853-613e-4108-a9ee-c7935eb44edb
