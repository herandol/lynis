#!/bin/bash

network_file="/etc/modprobe.d/disable-network.conf"

./replace_or_add_line.sh "dccp" "install dccp /bin/true" "$network_file"
./replace_or_add_line.sh "sctp" "install sctp /bin/true" "$network_file"
./replace_or_add_line.sh "rds" "install rds /bin/true" "$network_file"
./replace_or_add_line.sh "tipc" "install tipc /bin/true" "$network_file"