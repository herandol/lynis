sudo apt-get install libpam-cracklib

cp /etc/login.defs login.defs
chmod a-wx login.defs
sudo sed -i 's/UMASK.*022/UMASK 027/g' /etc/login.defs

sudo apt-get install debsums apt-show-versions

cp /etc/ssh/sshd_config sshd_config
chmod a-wx sshd_config

sudo sed -i 's/^.*AllowTcpForwarding.*$/AllowTcpForwarding no/g' /etc/ssh/sshd_config
sudo sed -i 's/^.*ClientAliveCountMax 3/ClientAliveCountMax 2/g' /etc/ssh/sshd_config
sudo sed -i 's/^.*Compression ^.*/Compression no/g' /etc/ssh/sshd_config
sudo sed -i 's/^.*LogLevel INFO/LogLevel VERBOSE/g' /etc/ssh/sshd_config
sudo sed -i 's/^.*MaxAuthTries 6/MaxAuthTries 3/g' /etc/ssh/sshd_config
sudo sed -i 's/^.*MaxSessions 10/MaxSessions 2/g' /etc/ssh/sshd_config
sudo sed -i 's/^.*TCPKeepAlive yes/TCPKeepAlive no/g' /etc/ssh/sshd_config
sudo sed -i 's/^.*X11Forwarding yes/X11Forwarding no/g' /etc/ssh/sshd_config
sudo sed -i 's/^.*AllowAgentForwarding yes/AllowAgentForwarding no/g' /etc/ssh/sshd_config

sudo apt-get install clamav
sudo apt-get install aide
sudo apt-get install sysstat
sudo apt-get install auditd aide-common

echo "fs.suid_dumpable=0" >> /etc/sysctl.conf
sysctl -p


echo "-a exit,always -F arch=b64 -S execve -k root-commands" >> /etc/audit/rules.d/audit.rules
echo "-a exit,always -F arch=b32 -S execve -k root-commands" >> /etc/audit/rules.d/audit.rules


# pi 2
# sed -e '/arch=b64/ s/^#*/#/' -i rules.d/audit.rules
sudo apt install acct
echo "blacklist firewire-core" > /etc/modprobe.d/firewire.conf
