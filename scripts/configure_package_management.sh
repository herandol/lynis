#!/bin/bash

apt-get install -y debsums
apt-get install -y apt-show-versions
apt-get install -y unattended-upgrades
cp 20auto-upgrades /etc/apt/apt.conf.d/20auto-upgrades
file_unattended_upgrades="/etc/apt/apt.conf.d/50unattended-upgrades"
current_time=$(date +%k%M%S)
sed -i.backup."$current_time" '/\/\/      "${distro_id}:${distro_codename}-updates";/ c\\        "${distro_id}:${distro_codename}-updates";' "$file_unattended_upgrades"
unattended-upgrades --dry-run