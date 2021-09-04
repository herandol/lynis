#!/bin/bash

./replace_or_add_line.sh "smtpd_banner = \$myhostname ESMTP \$mail_name (Ubuntu)" "smtpd_banner = \$myhostname ESMTP" "/etc/postfix/main.cf"