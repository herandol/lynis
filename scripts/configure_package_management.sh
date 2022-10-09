#!/bin/bash

apt-get install -y debsums
apt-get install -y apt-show-versions
apt-get install -y unattended-upgrades
cp 20auto-upgrades /etc/apt/apt.conf.d/20auto-upgrades
file_unattended_upgrades="/etc/apt/apt.conf.d/50unattended-upgrades"
sed -i 's|\/\/\t"${distro_id}:${distro_codename}-updates";|\t"${distro_id}:${distro_codename}-updates";|g' "$file_unattended_upgrades"
unattended-upgrades --dry-run