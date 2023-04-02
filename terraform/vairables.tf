#####     Serge     #####

# Serge cloud provider variable definition
variable "cloud_provider" {
    description = "Cloud provider to deploy instance [aws, gcp, do, hcloud]"
    sensitive = true
    type = string
}

# Serge linux distro variable definition
variable "cloud_distro" {
    description = "Linux distro to deploy instance [ubuntu, debian, rocky, rhel, fedora]"
    sensitive = true
    type = string
}

#####     AWS     #####

# Access key variable definition
variable "aws_access_key" {
    description = "Access key to AWS console"
    sensitive = true
    type = string
}

# Secret key variable definition
variable "aws_secret_key" {
    description = "Secret key to AWS console"
    sensitive = true
    type = string
}

# AWS Region Key variable definition
variable "aws_region" {
    description = "The AWS region to deploy the EC2 instance in."
    sensitive = true
    type = string
}

# AWS Name variable definition instance
variable "aws_name" {
    description = "The name of the EC2 instance."
    sensitive = true
    type = string
}

# AMI ID variable Serge definition
variable "aws_image_serge" {
    description = "The AMI to use for Serge"
    sensitive = true
    type = string
}

# Serge Instance type variable definition
variable "aws_instance_type" {
    description = "Serge Instance type for EC2"
    sensitive = true
    type = string
}

# Serge Instance key name variable definition
variable "aws_key_name" {
    description = "Serge Instance EC2 key pair"
    sensitive = true
    type = string
}

# AWS Serge volume size variable definition
variable "aws_instance_volume_size" {
    description = "Serge Instance volume size for EC2"
    sensitive = true
    type = number
}

#####     Digital Ocean     #####

# Digital Ocean token
variable "do_token" {
        description = "Digital Ocean token auth"
        type = string
        sensitive = true
}

# Digital Ocean region
variable "do_region" {
        description = "Digital Ocean region"
        type = string
        sensitive = true
}

# Digital Ocean name
variable "do_name" {
        description = "Digital Ocean name"
        type = string
        sensitive = true
}

# Digital Ocean instance type
variable "do_instance_type" {
        description = "Digital Ocean instance type"
        type = string
        sensitive = true
}

# Digital Ocean image
variable "do_image_serge" {
        description = "Digital Ocean image"
        type = string
        sensitive = true
}

#####     GCP     #####
# GCP project ID
variable "gcp_project_id" {
        description = "GCP project ID"
        type = string
        sensitive = true
}

# GCP region
variable "gcp_region" {
        description = "GCP region"
        type = string
        sensitive = true
}

# GCP instance type
variable "gcp_instance_type" {
        description = "GCP instance type"
        type = string
        sensitive = true
}

# GCP instance name
variable "gcp_name" {
        description = "GCP name"
        type = string
        sensitive = true
}

# GCP image
variable "gcp_image_serge" {
        description = "GCP image"
        type = string
        sensitive = true
}

# GCP zone
variable "gcp_zone" {
        description = "GCP zone"
        type = string
        sensitive = true
}

# GCP instance volume size
variable "gcp_instance_volume_size" {
        description = "GCP instance volume size"
        type = string
        sensitive = true
}

#####     Hetzner - hcloud    #####

# hcloud token
variable "hcloud_token" {
        description = "hcloud token auth"
        type = string
        sensitive = true
}

# hcloud region
variable "hcloud_region" {
        description = "hcloud region"
        type = string
        sensitive = true
}

# hcloud instance name
variable "hcloud_name" {
        description = "hcloud name"
        type = string
        sensitive = true
}

# hcloud instance type
variable "hcloud_instance_type" {
        description = "hcloud instance type"
        type = string
        sensitive = true
}

# hcloud instance zone
variable "hcloud_zone" {
        description = "hcloud zone"
        type = string
        sensitive = true
}

# hcloud image
variable "hcloud_image_serge" {
        description = "hcloud image"
        type = string
        sensitive = true
}
