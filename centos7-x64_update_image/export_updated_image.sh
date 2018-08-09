################################################################################
# export_updated_image.sh
#
# This script is used to automatically update packages in albmtez/centos7-x64
# Vagrant box.
# It creates a VM, provision it and halt. An export is then made, deleting the
# VM to keep the hypervisor clean.
################################################################################

#/bin/bash

vagrant up
vagrant halt
vagrant package --base centos7-x64
vagrant destroy
