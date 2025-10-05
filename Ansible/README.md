# Ansible:
##  1- Instalamos "Ansible"
`apt -yq install ansible sshpass`

##  2- Verificamos la versión de "Ansible"
`ansible --version`

##  3- Verificamos el archivo de inventario
`ansible-inventory --list`

##  4- Chequear el acceso a todo el inventario
`ansible all -m ping`

##  5- Verificamos las sintaxis del escenario
`ansible-playbook --syntax-check ../stage.yml`

##  6- Ejecutamos el escenario
`ansible-playbook ../stage.yml`

##  7- Ejecutamos algunas tareas del escenario
`ansible-playbook --tags "upgrade" ../stage.yml`

##  8- Ejecutamos el escenario en un solo servidor
`ansible-playbook --limit vps --tags "upgrade" ../stage.yml`

##  9- Ejecutamos el escenario en un grupo de servidores
`ansible-playbook --limit vm ../stage.yml`

## 10- Ejecutamos algunas tareas en un grupo de servidores
`ansible-playbook --limit vm --tags "upgrade,create-sudo-user,iptables" ../stage.yml`

# Escenarios:
## 1- Roles de la Configuración Inicial de Debian
### 1.1- Actualizar los índices del repositorio y el sistema operativo
### 1.2- Crear un nuevo usuario con privilegios de sudo y acceso SSH por llave
#### Instalar paquete requerido
`apt install whois`
#### Generar la contraseña del nuevo usuario
`mkpasswd --method=sha-512`
#### Modifique las variables correspondientes en la configuración del escenario
`NORMAL_USER_NAME: 'sysadmin'`

`NORMAL_USER_PASS: '$6$1/g/rmFXEQeo.rBm$H5ab4JI3K5NbYyqp8PF9u9NipArTvygwbCqBrBvyU3fdxLo7K.dxHJSyowdawqmB.F.aPY28zYt0Q6RsZOCHM0'`

`NORMAL_USER_PUB_KEY: 'ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILb4r5KUCCXyJthR8MUeTI9R2+9g6pBIDs45bkcVcn43 sysadmin'`
### 1.3- Habilitar Cortafuegos (ufw)
### 1.4- Habilitar Notificaciones via e-mail (postfix)
### 1.5- Habilitar autenticación en el servidor de envio de e-mail (Requiere Habilitar Notificaciones via e-mail usando postfix [Opcional])
#### Instalar paquete requerido
`apt install postfix`
#### Crear archivo de contraseñas
`editor /etc/postfix/sasl/sasl_passwd`
#### Con el contenido (ejemplo)
`[smtp.gmail.com]:587 erkipolo@gmail.com:diiflrfqllahsgdt`
#### Cree el archivo de base de datos ha copiar al servidor
`postmap sasl_passwd`
#### Copiar dentro de la carpeta "files" que se encuentra dentro del rol
`cp -v sasl_passwd.db roles/sendonly-postfix-auth/files/`
### 1.6- Habilitar Notificaciones de Acceso al servicio SSH (Requiere Habilitar Notificaciones via e-mail usando postfix)
#### Modifique el usuario de e-mail que recibe la notificación dentro del guión
### 1.7- Habilitar HIPS con notificaciones via e-mail usando fail2ban (Requiere Habilitar Notificaciones via e-mail usando postfix)
#### Modifique el usuario de e-mail que recibe la notificación dentro de la configuración personalizada
### 1.8- Habilitar las actualizaciones automáticas con notificaciones via e-mail (Requiere Habilitar Notificaciones via e-mail usando postfix)
#### Modifique el usuario de e-mail que recibe la notificación dentro de la configuración personalizada




## 2- Roles de la XXXXX
## 3.11 - Disable root login & password authentication, change SSH Port
