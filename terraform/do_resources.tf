# ------------------------- #
# Serge DigitalOcean Instance
# ------------------------- #
# Serge instance
resource "digitalocean_droplet" "serge_instance" {
  # Add number of instances
  count                      = var.cloud_provider == "do" ? 1 : 0
  # Add instance name
  name                       = var.do_name
  # Add instances type
  size                       = var.do_instance_type
  # Add image type
  image                      = var.do_image_serge
  # Add tags
  tags                       = [var.do_name]
  # Add user-data
  user_data                  = file("user-data/serge-${var.cloud_distro}.yml")
  # Add network
  vpc_uuid                   = digitalocean_vpc.serge_vpc.id
  # Add firewall
  firewall_ids               = [digitalocean_firewall.serge_firewall.id]
}
// Resource block for the firewall
resource "digitalocean_firewall" "serge_firewall" {
  name                        = "${var.do_name}-firewall"
  droplet_ids                 = [digitalocean_droplet.serge_instance.id]
  inbound_rule {
    protocol                = "tcp"
    port_range              = "22"
    source_addresses        = ["0.0.0.0/0", "::/0"]
  }
  inbound_rule {
    protocol                = "tcp"
    port_range              = "8008"
    source_addresses        = ["0.0.0.0/0", "::/0"]
  }
}