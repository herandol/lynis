#!/bin/bash


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

apt-get install -y sysstat

sysstat_file=/etc/default/sysstat
sed -i 's|^.*ENABLED.*$|ENABLED="true"|g' "$sysstat_file"

apt-get install -y auditd
apt-get install -y aide aide-common
apt-get install -y acct

cp audit.rules /etc/audit/rules.d/audit.rules

# replace_or_add_line "arch=b64" "-a exit,always -F arch=b64 -S execve -k root-commands" "$audit_rules"
# replace_or_add_line "arch=b32" "-a exit,always -F arch=b32 -S execve -k root-commands" "$audit_rules"

aideinit