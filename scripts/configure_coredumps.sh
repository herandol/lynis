#!/bin/bash

# KRNL-5820

file_limits=/etc/security/limits.conf

sed -i 's/^.*soft.*core.*$/* soft core 0/g' "$file_limits"
sed -i 's/^.*hard.*core.*$/* hard core 0/g' "$file_limits"

file_coredump=/etc/systemd/coredump.conf

replace_or_add_line () {
    search_text=$1
    replace_text=$2
    file=$3

    if grep "$search_text" "$file" > /dev/null ; 
    then 
            current_time=$(date +%k%M%S)
            sed -i.backup."$current_time" "/${search_text}/ c\\${replace_text}" "$file"

    else 
            echo "Not found. Adding a line"
            echo "$replace_text" >> "$file"  
    fi
}

replace_or_add_line "ProcessSizeMax" "ProcessSizeMax=0" "$file_coredump"
replace_or_add_line "Storage" "Storage=none" "$file_coredump"

replace_or_add_line "ulimit" "ulimit -c 0" "/etc/profile.d/disable_coredumps.sh"

network_file="/etc/modprobe.d/disable-network.conf"

replace_or_add_line "dccp" "install dccp /bin/true" "$network_file"
replace_or_add_line "sctp" "install sctp /bin/true" "$network_file"
replace_or_add_line "rds" "install rds /bin/true" "$network_file"
replace_or_add_line "tipc" "install tipc /bin/true" "$network_file"