resource "proxmox_lxc" "adm" {
  cores           = 1
  hostname        = "adm"
  memory          = 1024
  nameserver      = "172.30.1.20"
  onboot          = true
  ostemplate      = "local:vztmpl/debian-13-standard_13.1-2_amd64.tar.zst"
  ssh_public_keys = var.ct_ssh_public_key
  searchdomain    = "nc.mitrans.gob.cu"
  start           = true
  swap            = 1024
  target_node     = "nodo00"
  unprivileged    = true
  vmid            = 285
  features {
    nesting = true
  }
  network {
    bridge   = "vmbr0"
    firewall = true
    ip       = "172.30.0.28/26"
    gw       = "172.30.0.5"
    name     = "eth0"
  }
  network {
    bridge   = "vmbr2"
    firewall = true
    ip       = "172.30.1.199/24"
    name     = "eth1"
  }
  rootfs {
    size    = "5G"
    storage = "mitrans-zfs"
  }
}
