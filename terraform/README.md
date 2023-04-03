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
cloud_distro = "<ubuntu | debian | rocky | rhel | fedora>"
```
This example we are using `aws` as cloud provider and `rocky` as linux distro.
```bash
sed -i 's/<cloud_provider>/aws/g' terraform.tfvars
sed -i 's/<cloud_distro>/rocky/g' terraform.tfvars
```
6. In the same file `terraform.tfvars` edit only the values of your cloud and distro you choose and comment/erase the rest.
```vim
#####     AWS     #####
aws_access_key = "<aws_access_key>"
aws_secret_key = "<aws_secret_key>"
aws_region = "<aws_region>"
## This is the image id of the AMI has to be same as the one you use on the cloud-distro
aws_image_serge = "<aws_image_serge>"
# Check for a 4GB RAM instance or more
aws_instance_type = "m7g.2xlarge"
aws_key_name = "<key_pair>"
aws_instance_volume_size = 100
```

7. On the directory `user-data` choose the `cloud-init` that is with the same name as your linux distro `<cloud-distro>` and change this parameters `<timezone>`, `<username>`, `<hashed password>` and `<pub-key>` with the ones you want to use. In the example below we are using `America/Guayaquil` as timezone `serge` as username, `serge` as password and `serge` as public key on `cloud-distro=rocky`. The file can be replaced with any other `cloud-init` file like `serge-<cloud-distro>.yml`.
```bash
sed -i 's/<timezone>/America\/Guayaquil/g' user-data/serge-rocky.yml
sed -i 's/<username>/serge/g' user-data/serge-rocky.yml
sed -i 's/<hashed password>/serge/g' user-data/serge-rocky.yml
sed -i 's/<pub-key>/serge/g' user-data/serge-rocky.yml
```
8. Run `terraform init` to initialize the Terraform environment.
```bash
terraform init
```
9. Run `terraform plan` to see what changes will be made.
```bash
terraform plan
```
10. Run `terraform apply` to apply the changes.
```bash
terraform apply
```
11. Check the ip it generate `http://<ip>:8008`

## Cleanup
When you are finished, run `terraform destroy` to destroy the resources.
```bash
terraform destroy
```

## License

This Terraform template is licensed under the MIT License.