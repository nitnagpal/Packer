#!/bin/bash
# Install custom packages
apt update -y
apt install -y wget curl htop
# Setting hostname
HOSTNAME=$1
if [ -n "$HOSTNAME" ]
then
  echo "Setting hostname to $HOSTNAME"
  hostname $HOSTNAME
  echo "$HOSTNAME" > /etc/hostname
  hostnamectl set-hostname $HOSTNAME
else
  echo "No hostname passed"
fi