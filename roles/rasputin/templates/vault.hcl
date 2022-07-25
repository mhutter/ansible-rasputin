storage "raft" {
  path = "{{ vault_raft_path }}"
}

listener "tcp" {
  address     = "127.0.0.1:{{ vault_port }}"
  tls_disable = 1 # No point encrypting local traffic
}
ui = true

api_addr     = "https://vault.{{ rasputin_domain }}"
cluster_addr = "http://127.0.0.1:{{ vault_cluster_port }}"
cluster_name = "rasputin"
