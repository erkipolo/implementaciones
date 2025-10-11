Create the base config file to work with proxmox 

tee main.tf <<EOF
terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
      version = "3.0.2-rc04"
    }
  }
}
EOF

Initialize the working directory containing terraform configuration files (basically download the providers 8P)

terraform init

*Before to add conection to proxmox, you need an API token from proxmox:

pveum role add terraform -privs "Datastore.AllocateSpace, Datastore.Audit, Pool.Allocate, SDN.Use, Sys.Audit, Sys.Console, Sys.Modify, Sys.PowerMgmt, VM.Allocate, VM.Audit, VM.Clone, VM.Config.CDROM, VM.Config.CPU, VM.Config.Cloudinit, VM.Config.Disk, VM.Config.HWType, VM.Config.Memory, VM.Config.Network, VM.Config.Options, VM.Migrate, VM.PowerMgmt"
pveum group add terraform
pveum aclmod / -group terraform -role terraform
pveum user add terraform@pam -group terraform
pveum user token add terraform@pam provider --privsep=0
  

Don't write the credentials inside the terraform main.tf file. Create another and use it as variables content

tee credentials.auto.tfvars <<EOF
proxmox_api_url         = "https://172.30.0.23:8006/api2/json"
proxmox_api_token_id    = "terraform@pam!provider"
proxmox_api_token_secret = "64d22e01-4537-4dac-b38e-6f24219c71f3"
EOF

Add how terraform conect to the proxmox server

tee -a main.tf <<EOF
variable "proxmox_api_url" {
  type = string
}
variable "proxmox_api_token_id" {
  type = string
  sensitive = true
}
variable "proxmox_api_token_secret" {
  type = string
  sensitive = true
}
provider "proxmox" {
  pm_api_url          = var.proxmox_api_url
  pm_api_token_id     = var.proxmox_api_token_id
  pm_api_token_secret = var.proxmox_api_token_secret
  pm_tls_insecure     = true
}
EOF

Create a Resource to deploy

tee -a main.tf <<EOF
resource "proxmox_lxc" "DOCKER_HOST" {
  cores           = 1
  hostname        = "homelab-lxc-tf-docker0"
  memory          = 512
  nameserver      = "192.168.56.1"
  onboot          = true
  ostemplate      = "local:vztmpl/debian-12-standard_12.7-1_amd64.tar.zst"
  password        = (sensitive value)
  searchdomain    = "homelab.cu"
  ssh_public_keys = (sensitive value)
  start           = true
  swap            = 512
  target_node     = "pve1"
  unprivileged    = true
  vmid            = 100
  features {
    nesting = true
  }
  mountpoint {
    key       = "0"
    mp        = "/var/www/html/"
    size      = "2G"
    slot      = 0
    storage   = "local-lvm"
  }
  network {
    bridge   = "vmbr0"
    firewall = true
    gw       = "192.168.56.1"
    ip       = "192.168.56.40/24"
    name     = "eth0"
  }
  network {
    bridge   = "vmbr0"
    firewall = true
    ip       = "192.168.56.41/24"
    name     = "eth1"
  }
  network {
    bridge   = "vmbr0"
    firewall = true
    ip       = "dhcp"
    name     = "eth3"
  }
  rootfs {
    size    = "2G"
    storage = "local-lvm"
  }
}
EOF

Execution plan, witch lets you preview the changes that terraform plans to make to your infrastructure

terraform plan

Apply the plan

terraform apply

Destroy the plan

terraform destroy

Exec part of config

terraform apply -target='proxmox_lxc.DOCKER_HOST'
