# 1 - Cómo usar las variables del escenario:
## 1.0 - Modifique y adapte las variables del escenario (ejemplo):
`MAIL_NAME: 'vps'`

`MAIL_DOMAIN: 'homelab.cu'`

### Nota: Para crear una contraseña aleatoria, sugerimos el uso de:
`pwgen -s 80 -1 -v -c -0`

## 1.1 - Modifique y adapte el inventario de equipos a gestionar

# 2 - Cómo usar el código:

## 2.0 - Instalamos "Ansible"
`apt -yq install ansible sshpass`

## 2.1 - Verificamos la versión de "Ansible"
`ansible --version`

## 2.2 - Verificamos las sintaxis del escenario
`ansible-playbook --syntax-check stage.yml`

## 2.3 - Ejecutamos el escenario
`ansible-playbook stage.yml`

## 2.4 - Ejecutamos algunas tareas del escenario
`ansible-playbook --tags "upgrade" stage.yml`

# 3 - Tareas incluidas en el escenario:
## 3.1  - Actualizacion del sistema
### Nombre: upgrade
### Descripción:
### Actualiza los índices del repositorio configurado y actualiza el sistema operativo
## 3.2  - Install additional packages
## 3.3  - Create new sudo user
## 3.4  - Set up SSH authentication for new user
## 3.5  - Set timezone
## 3.6  - Enable fail2ban
## 3.7  - Change server hostname
## 3.8  - Add a swap file
## 3.9  - Configure unattended-upgrades
## 3.10 - Enable UFW and allow some ports
## 3.11 - Disable root login & password authentication, change SSH Port