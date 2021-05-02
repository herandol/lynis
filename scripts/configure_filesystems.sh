#!/bin/bash

file="/etc/modprobe.d/disable-filesystems.conf"


./replace_or_add_line.sh "cramfs" "install cramfs /bin/true" "$file"
./replace_or_add_line.sh "freevxfs" "install freevxfs /bin/true" "$file"
./replace_or_add_line.sh "hfs" "install hfs /bin/true" "$file"
./replace_or_add_line.sh "hfsplus" "install hfsplus /bin/true" "$file"
./replace_or_add_line.sh "jffs2" "install jffs2 /bin/true" "$file"
./replace_or_add_line.sh "udf" "install udf /bin/true" "$file"
