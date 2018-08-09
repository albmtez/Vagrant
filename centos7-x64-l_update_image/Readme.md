# centos7-x64-l_update_image
Easy and automatic update of box albmtez/centos7-x64-l ([albmtez/centos7-x64-l](https://app.vagrantup.com/albmtez/boxes/centos7-x64-l)).

You need to have installed:
- Vagrant
- Hypervisor used by the box

Actions lanched:
- VM creation using the box albmtez/centos7-x64-l.
- VM provisionning: Packages update.
- VM halt.
- Box export to file package.box.
- VM remove from hypervisor.

To launch the generation of the updated box launch the script:
```
$ ./export_updated/image.sh
```