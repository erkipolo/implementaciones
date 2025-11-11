resource "proxmox_lxc" "router-www" {
  cores           = 1
  hostname        = "router-www"
  memory          = 1024
  nameserver      = "190.6.78.50"
  onboot          = true
  ostemplate      = "local:vztmpl/debian-13-standard_13.1-2_amd64.tar.zst"
  ssh_public_keys = var.ct_ssh_public_key
  searchdomain    = "dpvhab.cu"
  start           = true
  swap            = 1024
  target_node     = "node01"
  unprivileged    = true
  vmid            = 101
  features {
    nesting = true
  }
  network {
    bridge   = "vmbr1"
    firewall = true
    ip       = "192.168.245.166/30"
    gw       = "192.168.245.165"
    name     = "eth0"
    tag      = 1001
  }
  network {
    bridge   = "vmbr3"
    firewall = true
    ip       = "190.6.78.49/29"
    name     = "eth1"
  }
  rootfs {
    size    = "5G"
    storage = "local-lvm"
  }
}

resource "proxmox_lxc" "router-nac" {
  cores           = 1
  hostname        = "router-nac"
  memory          = 1024
  nameserver      = "190.6.67.2"
  onboot          = true
  ostemplate      = "local:vztmpl/debian-13-standard_13.1-2_amd64.tar.zst"
  ssh_public_keys = var.ct_ssh_public_key
  searchdomain    = "dpvhab.cu"
  start           = true
  swap            = 1024
  target_node     = "node01"
  unprivileged    = true
  vmid            = 102
  features {
    nesting = true
  }
  network {
    bridge   = "vmbr1"
    firewall = true
    ip       = "192.168.180.214/30"
    gw       = "192.168.180.213"
    name     = "eth0"
    tag      = 1002
  }
  network {
    bridge   = "vmbr4"
    firewall = true
    ip       = "190.6.67.1/29"
    name     = "eth1"
  }
  rootfs {
    size    = "5G"
    storage = "local-lvm"
  }
}

resource "proxmox_lxc" "router-vpn" {
  cores           = 1
  hostname        = "router-vpn"
  memory          = 1024
  nameserver      = "172.32.16.20"
  onboot          = true
  ostemplate      = "local:vztmpl/debian-13-standard_13.1-2_amd64.tar.zst"
  ssh_public_keys = var.ct_ssh_public_key
  searchdomain    = "dpvhab.cu"
  start           = true
  swap            = 1024
  target_node     = "node01"
  unprivileged    = true
  vmid            = 103
  features {
    nesting = true
  }
  network {
    bridge   = "vmbr5"
    firewall = true
    ip       = "172.32.16.1/24"
    gw       = "172.32.16.20"
    name     = "eth0"
  }
  network {
    bridge   = "vmbr1"
    firewall = true
    ip       = "192.168.26.2/30"
    name     = "eth1"
    tag      = 1000
  }
  rootfs {
    size    = "5G"
    storage = "local-lvm"
  }
}

resource "proxmox_lxc" "firewall-www" {
  cores           = 1
  hostname        = "firewall-www"
  memory          = 1024
  nameserver      = "192.168.40.10"
  onboot          = true
  ostemplate      = "local:vztmpl/debian-13-standard_13.1-2_amd64.tar.zst"
  ssh_public_keys = var.ct_ssh_public_key
  searchdomain    = "dpvhab.cu"
  start           = true
  swap            = 1024
  target_node     = "node01"
  unprivileged    = true
  vmid            = 201
  features {
    nesting = true
  }
  network {
    bridge   = "vmbr3"
    firewall = true
    ip       = "190.6.78.50/29"
    gw       = "190.6.78.49"
    name     = "eth0"
  }
  network {
    bridge   = "vmbr3"
    firewall = true
    ip       = "190.6.78.51/29"
    name     = "eth1"
  }
  network {
    bridge   = "vmbr3"
    firewall = true
    ip       = "190.6.78.52/29"
    name     = "eth2"
  }
  network {
    bridge   = "vmbr3"
    firewall = true
    ip       = "190.6.78.53/29"
    name     = "eth3"
  }
  network {
    bridge   = "vmbr3"
    firewall = true
    ip       = "190.6.78.54/29"
    name     = "eth4"
  }
  network {
    bridge   = "vmbr0"
    firewall = true
    ip       = "192.168.40.1/24"
    name     = "eth5"
  }
  rootfs {
    size    = "5G"
    storage = "local-lvm"
  }
}

resource "proxmox_lxc" "firewall-nac" {
  cores           = 1
  hostname        = "firewall-nac"
  memory          = 1024
  nameserver      = "192.168.40.10"
  onboot          = true
  ostemplate      = "local:vztmpl/debian-13-standard_13.1-2_amd64.tar.zst"
  ssh_public_keys = var.ct_ssh_public_key
  searchdomain    = "dpvhab.cu"
  start           = true
  swap            = 1024
  target_node     = "node01"
  unprivileged    = true
  vmid            = 202
  features {
    nesting = true
  }
  network {
    bridge   = "vmbr4"
    firewall = true
    ip       = "190.6.67.2/29"
    gw       = "190.6.67.1"
    name     = "eth0"
  }
  network {
    bridge   = "vmbr4"
    firewall = true
    ip       = "190.6.67.3/29"
    name     = "eth1"
  }
  network {
    bridge   = "vmbr4"
    firewall = true
    ip       = "190.6.67.4/29"
    name     = "eth2"
  }
  network {
    bridge   = "vmbr4"
    firewall = true
    ip       = "190.6.67.5/29"
    name     = "eth3"
  }
  network {
    bridge   = "vmbr4"
    firewall = true
    ip       = "190.6.67.6/29"
    name     = "eth4"
  }
  network {
    bridge   = "vmbr0"
    firewall = true
    ip       = "192.168.40.2/24"
    name     = "eth5"
  }
  rootfs {
    size    = "5G"
    storage = "local-lvm"
  }
}

resource "proxmox_lxc" "firewall-vpn" {
  cores           = 1
  hostname        = "firewall-vpn"
  memory          = 1024
  nameserver      = "192.168.40.10"
  onboot          = true
  ostemplate      = "local:vztmpl/debian-13-standard_13.1-2_amd64.tar.zst"
  ssh_public_keys = var.ct_ssh_public_key
  searchdomain    = "dpvhab.cu"
  start           = true
  swap            = 1024
  target_node     = "node01"
  unprivileged    = true
  vmid            = 203
  features {
    nesting = true
  }
  network {
    bridge   = "vmbr5"
    firewall = true
    ip       = "172.32.16.20/24"
    name     = "eth0"
  }
  network {
    bridge   = "vmbr0"
    firewall = true
    ip       = "192.168.40.3/24"
    gw       = "192.168.40.1"
    name     = "eth1"
  }
  rootfs {
    size    = "5G"
    storage = "local-lvm"
  }
}

resource "proxmox_lxc" "firewall-lan" {
  cores           = 1
  hostname        = "firewall-lan"
  memory          = 1024
  nameserver      = "192.168.40.10"
  onboot          = true
  ostemplate      = "local:vztmpl/debian-13-standard_13.1-2_amd64.tar.zst"
  ssh_public_keys = var.ct_ssh_public_key
  searchdomain    = "dpvhab.cu"
  start           = true
  swap            = 1024
  target_node     = "node01"
  unprivileged    = true
  vmid            = 204
  features {
    nesting = true
  }
  network {
    bridge   = "vmbr0"
    firewall = true
    ip       = "192.168.40.4/24"
    gw       = "192.168.40.1"
    name     = "eth0"
  }
  network {
    bridge   = "vmbr2"
    firewall = true
    ip       = "10.16.50.20/17"
    name     = "eth1"
  }
  rootfs {
    size    = "5G"
    storage = "local-lvm"
  }
}

resource "proxmox_lxc" "ns" {
  cores           = 1
  hostname        = "ns"
  memory          = 1024
  nameserver      = "192.168.40.10"
  onboot          = true
  ostemplate      = "local:vztmpl/debian-13-standard_13.1-2_amd64.tar.zst"
  ssh_public_keys = var.ct_ssh_public_key
  searchdomain    = "dpvhab.cu"
  start           = true
  swap            = 1024
  target_node     = "node01"
  unprivileged    = true
  vmid            = 310
  features {
    nesting = true
  }
  network {
    bridge   = "vmbr0"
    firewall = true
    ip       = "192.168.40.10/24"
    gw       = "192.168.40.1"
    name     = "eth0"
  }
  rootfs {
    size    = "5G"
    storage = "local-lvm"
  }
}

resource "proxmox_lxc" "px" {
  cores           = 1
  hostname        = "px"
  memory          = 1024
  nameserver      = "192.168.40.10"
  onboot          = true
  ostemplate      = "local:vztmpl/debian-13-standard_13.1-2_amd64.tar.zst"
  ssh_public_keys = var.ct_ssh_public_key
  searchdomain    = "dpvhab.cu"
  start           = true
  swap            = 1024
  target_node     = "node01"
  unprivileged    = true
  vmid            = 312
  features {
    nesting = true
  }
  network {
    bridge   = "vmbr0"
    firewall = true
    ip       = "192.168.40.12/24"
    gw       = "192.168.40.1"
    name     = "eth0"
  }
  rootfs {
    size    = "5G"
    storage = "local-lvm"
  }
}

resource "proxmox_lxc" "mx" {
  cores           = 1
  hostname        = "mx"
  memory          = 1024
  nameserver      = "192.168.40.10"
  onboot          = true
  ostemplate      = "local:vztmpl/debian-13-standard_13.1-2_amd64.tar.zst"
  ssh_public_keys = var.ct_ssh_public_key
  searchdomain    = "dpvhab.cu"
  start           = true
  swap            = 1024
  target_node     = "node01"
  unprivileged    = true
  vmid            = 314
  features {
    nesting = true
  }
  network {
    bridge   = "vmbr0"
    firewall = true
    ip       = "192.168.40.14/24"
    gw       = "192.168.40.1"
    name     = "eth0"
  }
  rootfs {
    size    = "5G"
    storage = "local-lvm"
  }
}

resource "proxmox_lxc" "repo" {
  cores           = 1
  hostname        = "repo"
  memory          = 1024
  nameserver      = "192.168.40.10"
  onboot          = true
  ostemplate      = "local:vztmpl/debian-13-standard_13.1-2_amd64.tar.zst"
  ssh_public_keys = var.ct_ssh_public_key
  searchdomain    = "dpvhab.cu"
  start           = true
  swap            = 1024
  target_node     = "node01"
  unprivileged    = true
  vmid            = 316
  features {
    nesting = true
  }
  network {
    bridge   = "vmbr0"
    firewall = true
    ip       = "192.168.40.16/24"
    gw       = "192.168.40.1"
    name     = "eth0"
  }
  rootfs {
    size    = "180G"
    storage = "local-lvm"
  }
}

resource "proxmox_lxc" "adm" {
  cores           = 1
  hostname        = "adm"
  memory          = 1024
  nameserver      = "192.168.40.10"
  onboot          = true
  ostemplate      = "local:vztmpl/debian-13-standard_13.1-2_amd64.tar.zst"
  ssh_public_keys = var.ct_ssh_public_key
  searchdomain    = "dpvhab.cu"
  start           = true
  swap            = 1024
  target_node     = "node01"
  unprivileged    = true
  vmid            = 318
  features {
    nesting = true
  }
  network {
    bridge   = "vmbr0"
    firewall = true
    ip       = "192.168.40.18/24"
    gw       = "192.168.40.1"
    name     = "eth0"
  }
  rootfs {
    size    = "5G"
    storage = "local-lvm"
  }
}
