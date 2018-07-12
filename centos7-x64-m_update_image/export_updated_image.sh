#/bin/bash

vagrant up
vagrant halt
vagrant package --base centos7-x64-m
vagrant destroy
