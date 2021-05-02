#!/bin/bash

sshd_file=/etc/ssh/sshd_config

sed -i 's/^.*AllowTcpForwarding.*$/AllowTcpForwarding no/g' "$sshd_file"
sed -i 's/^.*ClientAliveCountMax.*$/ClientAliveCountMax 2/g' "$sshd_file"
sed -i 's/^.*Compression.*$/Compression no/g' "$sshd_file"
sed -i 's/^.*LogLevel.*$/LogLevel VERBOSE/g' "$sshd_file"
sed -i 's/^.*MaxAuthTries.*$/MaxAuthTries 3/g' "$sshd_file"
sed -i 's/^.*MaxSessions.*$/MaxSessions 2/g' "$sshd_file"
sed -i 's/^.*TCPKeepAlive.*$/TCPKeepAlive no/g' "$sshd_file"
sed -i 's/^.*X11Forwarding.*$/X11Forwarding no/g' "$sshd_file"
sed -i 's/^.*AllowAgentForwarding.*$/AllowAgentForwarding no/g' "$sshd_file"
