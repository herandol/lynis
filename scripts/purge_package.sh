#!/bin/bash

apt-get purge $(dpkg --list | grep ^rc | awk '{ print $2; }')