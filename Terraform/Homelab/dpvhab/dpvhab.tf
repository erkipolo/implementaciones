resource "proxmox_lxc" "r1" {
  cores           = 1
  hostname        = "r1"
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
  vmid            = 101
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

resource "proxmox_lxc" "r2" {
  cores           = 1
  hostname        = "r2"
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
  vmid            = 102
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
    bridge   = "vmbr4"
    firewall = true
    ip       = "190.6.78.49/29"
    name     = "eth1"
  }
  rootfs {
    size    = "5G"
    storage = "local-lvm"
  }
}

resource "proxmox_lxc" "r3" {
  cores           = 1
  hostname        = "r3"
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
  vmid            = 103
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
    bridge   = "vmbr3"
    firewall = true
    ip       = "190.6.67.1/29"
    name     = "eth1"
  }
  rootfs {
    size    = "5G"
    storage = "local-lvm"
  }
}

resource "proxmox_lxc" "fw1" {
  cores           = 1
  hostname        = "fw1"
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

resource "proxmox_lxc" "fw2" {
  cores           = 1
  hostname        = "fw2"
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
    ip       = "190.6.78.50/29"
    gw       = "190.6.78.49"
    name     = "eth0"
  }
  network {
    bridge   = "vmbr4"
    firewall = true
    ip       = "190.6.78.51/29"
    name     = "eth1"
  }
  network {
    bridge   = "vmbr4"
    firewall = true
    ip       = "190.6.78.52/29"
    name     = "eth2"
  }
  network {
    bridge   = "vmbr4"
    firewall = true
    ip       = "190.6.78.53/29"
    name     = "eth3"
  }
  network {
    bridge   = "vmbr4"
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

resource "proxmox_lxc" "fw3" {
  cores           = 1
  hostname        = "fw3"
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
    bridge   = "vmbr3"
    firewall = true
    ip       = "190.6.67.2/29"
    gw       = "190.6.67.1"
    name     = "eth0"
  }
  network {
    bridge   = "vmbr3"
    firewall = true
    ip       = "190.6.67.3/29"
    name     = "eth1"
  }
  network {
    bridge   = "vmbr3"
    firewall = true
    ip       = "190.6.67.4/29"
    name     = "eth2"
  }
  network {
    bridge   = "vmbr3"
    firewall = true
    ip       = "190.6.67.5/29"
    name     = "eth3"
  }
  network {
    bridge   = "vmbr3"
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

resource "proxmox_lxc" "ns1" {
  cores           = 1
  hostname        = "ns1"
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

resource "proxmox_lxc" "mx1" {
  cores           = 1
  hostname        = "mx1"
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

resource "proxmox_lxc" "px1" {
  cores           = 1
  hostname        = "px1"
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
    ip       = "192.168.40.30/24"
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
