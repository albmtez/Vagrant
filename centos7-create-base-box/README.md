# Creación de un box base Centos 7 en Virtualbox

Como para el caso de la creación del box base Debian 9, creamos una máquina virtual con las siguientes **características**:

* RAM: 1GB. Se podrá cambiar al crear máquinas desde Vagrant modificando el VagrantFile.
* vCPUs: 1. Modificable también desde el Vagrantfile.
* Creamos un disco virtual:
  * Formato VDI.
  * Reservado dinámicamente.
  * Tamaño: 20GB
* Deshabilitamos:
  * Controlador de Audio.
  * Controlador USB.
* Montamos la ISO de instalación de Debian 9.3.0.

Configuramos con los siguientes vamores e instalamos:

* Password de root: vagrant
* Usuario: vagrant
* Password: vagrant
* Particionado (usamos LVM):
  * Una única partición primaria configurada como “Volúmen físico para LVM” y marca de arranque activada.
  * Un único VG con nombre “systemvg”.
  * Creamos 3 LV:
    * boot de 500MB.
    * swap de 2048MB.
    * root con el resto de espacio disponible en el vg.
* Activamos la red.
* Establecemos el hostname a ‘centos7’.

Una vez instalado Centos 7:

* Actualizamos los paquetes con:

```
# yum update
```

* Reiniciamos para asegurarnos de que arrancamos con la última versión del kernel.
* Instalamos algunos paquetes:

```
# yum install net-tools
# yum groupinstall “Development Tools”
# yum install kernel-devel
# yum install epel-release
# yum install dkms
# yum install nano
```

* Instalamos las Virtualbox Guest Additions.

```
# mkdir /mnt/VBoxLinuxAdditions
# mount /dev/cdrom /mnt/VBoxLinuxAdditions
# sh /mnt/VBoxLinuxAdditions/VBoxLinuxAdditions.run
# umount /mnt/VBoxLinuxAdditions
# rm -rf /mnt/VBoxLinuxAdditions
```

## Sudo sin password

Editamos el archivo de sudoers con el comando ‘visudo’ y añadimos al final:

```
vagrant ALL=(ALL) NOPASSWD: ALL
```

## SSH Insecure Keypair

Descargamos el archivo vagrant.pub de https://github.com/mitchellh/vagrant/tree/master/keys.

Lo renombramos como authorized_keys y le damos permisos 0600.

Creamos el directorio $HOME/.ssh, con permisos 0700.

Movemos el archivo authorized_keys a $HOME/.ssh.

## Empaquetado del box

Empaquetamos el box ejecutando:

```
$ vagrant package --base centos7
```

Para probar el box, hemos de importarlo:

```
$ vagrant box add --name centos7 package.box
```

Ya podemos hacer un **vagrant init** y **vagrant up**.