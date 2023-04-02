# ------------------------- #
# Serge GCP Instance
# ------------------------- #
# Serge instance
resource "google_compute_instance" "serge_instance" {
  # Add number of instances
  count                      = var.cloud_provider == "gcp" ? 1 : 0
  # Add instance name
  name                       = var.gcp_name
  # Add instances type
  machine_type               = var.gcp_instance_type
  # Add zone
  zone                       = var.gcp_zone
  # Add cloud-init
  metadata_startup_script    = file("user-data/serge-${var.cloud_distro}.yml")
  # Add tags
  tags                       = [var.gcp_name]
  # Add image type
  boot_disk {
    initialize_params {
      image                  = var.gcp_image_serge
      size                   = var.gcp_instance_volume_size
    }
  }
  # Add network
  network_interface {
    network                  = "default"
    // Ephemeral IP
    access_config {}
  }
  # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
  service_account {
    email                    = google_service_account.default.email
    scopes                   = ["cloud-platform"]
  }
}

# Resource block for the firewall
resource "google_compute_firewall" "serge_firewall" {
  name                        = "serge-fw"
  network                     = "default"
  allow {
    protocol                  = "tcp"
    ports                     = ["22", "8008"]
  }
  source_ranges               = ["0.0.0.0/0"]
}