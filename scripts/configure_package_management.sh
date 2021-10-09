#!/bin/bash

apt-get install -y debsums
apt-get install -y apt-show-versions
apt-get install -y unattended-upgrades
cp 20auto-upgrades /etc/apt/apt.conf.d/20auto-upgrades