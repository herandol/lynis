#!/bin/bash

login_defs=/etc/login.defs

sed -i "s|UMASK.*$|UMASK\t\t027|g" "$login_defs"
sed -i "s|PASS_MAX_DAYS.*$|PASS_MAX_DAYS\t60|g" "$login_defs"
sed -i "s|PASS_MIN_DAYS.*$|PASS_MIN_DAYS\t1|g" "$login_defs"
sed -i "s|PASS_WARN_AGE.*$|PASS_WARN_AGE\t14|g" "$login_defs"

apt-get install libpam-cracklib

sed -i "s|^.*SHA_CRYPT_MIN_ROUNDS.*$|SHA_CRYPT_MIN_ROUNDS\t10000|g" "$login_defs"
sed -i "s|^.*SHA_CRYPT_MAX_ROUNDS.*$|SHA_CRYPT_MAX_ROUNDS\t10000|g" "$login_defs"
./replace_or_add_line.sh "try_first_pass sha512" "password        [success=1 default=ignore]      pam_unix.so obscure use_authtok try_first_pass sha512 rounds=10000" /etc/pam.d/common-password
