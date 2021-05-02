#!/bin/bash

login_defs=/etc/login.defs

sed -i "s|UMASK.*$|UMASK\t\t027|g" "$login_defs"
sed -i "s|PASS_MAX_DAYS.*$|PASS_MAX_DAYS\t60|g" "$login_defs"
sed -i "s|PASS_MIN_DAYS.*$|PASS_MIN_DAYS\t1|g" "$login_defs"
sed -i "s|PASS_WARN_AGE.*$|PASS_WARN_AGE\t14|g" "$login_defs"

sudo apt-get install libpam-cracklib

sed -i "s|^.*SHA_CRYPT_MIN_ROUNDS.*$|SHA_CRYPT_MIN_ROUNDS\t10000|g" "$login_defs"
sed -i "s|^.*SHA_CRYPT_MAX_ROUNDS.*$|SHA_CRYPT_MAX_ROUNDS\t10000|g" "$login_defs"
