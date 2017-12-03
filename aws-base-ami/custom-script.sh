#!/bin/bash
# Install custom packages
yum update -y
yum install -y wget curl htop
# Setting hostname
HOSTNAME=$1
if [ -n "$HOSTNAME" ]
then
  echo "Setting hostname to $HOSTNAME"
  hostname $HOSTNAME
  cp -f /etc/sysconfig/network /etc/sysconfig/network.bak
  sed -ie 's/^\(HOSTNAME\)=.*$/\1='$HOSTNAME'/' /etc/sysconfig/network
else
  echo "No hostname passed"
fi