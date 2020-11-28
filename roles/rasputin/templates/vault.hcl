ui       = true
api_addr = "https://vault.{{ rasputin_domain }}"

listener "tcp" {
  address                 = "0.0.0.0:8200"
  tls_cert_file           = "/certs/cert.pem"
  tls_key_file            = "/certs/privkey.pem"
  tls_min_version         = "tls13"
  proxy_protocol_behavior = "use_always"
}

storage "file" {
  path = "/vault/file"
}
