terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.60.0"
    }
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
    google = {
      source = "hashicorp/google"
      version = "4.0.0"
    }
    hcloud = {
      source = "hetznercloud/hcloud"
      version = "1.37.0"
    }
  }
}

# AWS provider
provider "aws" {
  # Add AWS region
  region= var.aws_region
  # Add AWS keys
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

// Digital Ocean provider
provider "digitalocean" {
  # Add Digital Ocean token
  token = var.do_token
}

// GCP provider
provider "google" {
  // Add GCP project
  region  = var.gcp_region
  project = var.gcp_project_id
}

// Hetzner provider
provider "hcloud" {
  // Add hcloud token
  token = var.hetzner_token
}