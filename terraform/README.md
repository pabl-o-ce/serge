# Terraform for Serge template
This Serge Terraform is designed to for help people deploy the Serge project to [AWS, Digital Ocean, Google Cloud, Hetzner] directly using terraform. To use this template, follow the instructions below.
## Prerequisites
Before you can use this Terraform template, you must have the following prerequisites installed:
- Terraform
- Token access from AWS, Digital Ocean, Google Cloud, Hetzner.
## Installation
To use this Terraform template, follow these steps:
1. Clone this repository to your local machine:
```bash
git clone https://github.com/nsarrazin/serge.git
```
2. Change to the `terraform` directory:
```bash
cd serge/terraform
```
3. Copy the `terraform.tfvars.example` file to `terraform.tfvars`:
```bash
cp terraform.tfvars.example terraform.tfvars
```
4. Edit the `terraform.tfvars` file and fill in the required values.
```vim
cloud_provider = "<aws | do | gcp | hcloud>"
cloud_provider = "<ubuntu | debian | rocky | rhel | fedora>"
```
6. In the same file `terraform.tfvars` edit only the values of your cloud and distro you choose and erase the rest.
6. Run `terraform init` to initialize the Terraform environment.
```bash
terraform init
```
7. Run `terraform plan` to see what changes will be made.
```bash
terraform plan
```
8. Run `terraform apply` to apply the changes.
```bash
terraform apply
```

## Cleanup
When you are finished, run `terraform destroy` to destroy the resources.
```bash
terraform destroy
```

## License

This Terraform template is licensed under the MIT License.