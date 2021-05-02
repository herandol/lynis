#!/bin/bash

# KRNL-5820

file_limits=/etc/security/limits.conf

sed -i 's/^.*soft.*core.*$/* soft core 0/g' "$file_limits"
sed -i 's/^.*hard.*core.*$/* hard core 0/g' "$file_limits"

file_coredump=/etc/systemd/coredump.conf

./replace_or_add_line.sh "ProcessSizeMax" "ProcessSizeMax=0" "$file_coredump"
./replace_or_add_line.sh "Storage" "Storage=none" "$file_coredump"

./replace_or_add_line.sh "ulimit" "ulimit -c 0" "/etc/profile.d/disable_coredumps.sh"

network_file="/etc/modprobe.d/disable-network.conf"

./replace_or_add_line.sh "dccp" "install dccp /bin/true" "$network_file"
./replace_or_add_line.sh "sctp" "install sctp /bin/true" "$network_file"
./replace_or_add_line.sh "rds" "install rds /bin/true" "$network_file"
./replace_or_add_line.sh "tipc" "install tipc /bin/true" "$network_file"
