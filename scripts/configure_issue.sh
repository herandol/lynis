#!/bin/bash

sshd_file=/etc/ssh/sshd_config
issue_net=/etc/issue.net

cp ./issue /etc/issue
cp ./issue "$issue_net"

sed -i "s|^.*Banner.*$|Banner $issue_net|g" "$sshd_file"