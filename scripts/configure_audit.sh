#!/bin/bash

apt-get install -y sysstat

sysstat_file=/etc/default/sysstat
sed -i 's|^.*ENABLED.*$|ENABLED="true"|g' "$sysstat_file"

apt-get install -y auditd
apt-get install -y acct

cp audit.rules /etc/audit/rules.d/audit.rules
