data_dir = "/opt/nomad/data"
bind_addr = "0.0.0.0"
name = "nomad2"

# Advertise on nebula2 interface only (nomad2 has more interfaces, one with public IP and one with private IP - nebula1 interface)
advertise {
  # Defaults to the first private IP address.
  http = "192.168.1.19"
  rpc  = "192.168.1.19"
  serf = "192.168.1.19"
}

# Enable client and setup server's IP to the nomad1 IP
client {
  enabled = true
  #network_interface =
  servers = ["192.168.1.1"]
}

# Enable raw_exec Nomad driver
plugin "raw_exec" {
  config {
    enabled = true
  }
}
# Consul agent will be running locally
consul {
  address = "127.0.0.1:8500"
}
vault {
  enable = true
  address = "http://127.0.0.1:8200"
  task_token_ttl = "1h"
  create_from_role = "nomad-cluster"
  token = "s.TdAm30Jt3wy10bizyDC5v1Gr"
}
