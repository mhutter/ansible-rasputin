#!/bin/bash
DOMAIN='{{ rasputin_domain }}'

SITES=(
  objects
  pihole
  registry
  transmission
  vaultwarden
)

# Prepare certificates for haproxy
for s in "${SITES[@]}"; do
  site="${s}.${DOMAIN}"
  cat /etc/letsencrypt/live/"${site}"/{fullchain,privkey}.pem > "{{ rasputin_pki_root }}/haproxy/${site}.pem"
done
systemctl reload haproxy.service

# Prepare certificate for registry
for s in registry; do
  for t in cert privkey; do
    cat "/etc/letsencrypt/live/${s}.${DOMAIN}/${t}.pem" > "{{ rasputin_pki_root }}/${s}/${t}.pem"
  done
done
