#!/bin/bash

# Fix permissions on /dev/kvm and the ssh key:
#
cd firecracker-demo
sudo chmod 777 /dev/kvm
sudo -u ec2-user chmod 400 xenial.rootfs.id_rsa

# Create 4000 TAPs, configure networking for them and start 4k iperf3 servers 
# each bound to their respective TAP.
# 
sudo ./0.initial-setup.sh 4000

# Use 6 parallel threads to configure and start 4000 microVMs.
#
sudo -u ec2-user ./parallel-start-many.sh 0 4000 6