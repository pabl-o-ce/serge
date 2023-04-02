# ------------------------- #
# Serge Hetzner Instance
# ------------------------- #
# Serge instance
resource "hcloud_server" "serge_instance" {
  # Add number of instances
  count                      = var.cloud_provider == "hcloud" ? 1 : 0
  # Add instance name
  name                       = var.hcloud_name
  # Add instances type
  server_type                = var.hcloud_instance_type
  # Add zone
  location                   = var.hcloud_zone
  # Add cloud-init
  user_data                  = file("user-data/serge-${var.cloud_distro}.yml")
  # Add image type
  image                      = var.hcloud_image_serge
  # Add network
  public_net {
    ipv4_enabled = true
    ipv6_enabled = true
  }
  labels = {
    ai = var.hcloud_name
  }
}

# Resource block for the firewall
resource "hcloud_firewall" "serge_firewall" {
  name                        = "${var.hcloud_name}-firewall"
  network_id                  = hcloud_network.serge_network.id
  # Add rules
  rule {
    direction               = "in"
    protocol                = "tcp"
    port                    = "22"
    source_ips              = ["0.0.0.0/0, ::/0"]
  }
  rule {
    direction               = "in"
    protocol                = "tcp"
    port                    = "8008"
    source_ips              = ["0.0.0.0/0, ::/0"]
  }
}