#!/bin/bash

chmod 600 /etc/at.deny
chmod 600 /etc/crontab
chmod 600 /etc/ssh/sshd_config
chmod 700 /etc/cron.d
chmod 700 /etc/cron.daily
chmod 700 /etc/cron.hourly
chmod 700 /etc/cron.weekly
chmod 700 /etc/cron.monthly
chmod 700 /home/*
chmod 750 /etc/sudoers.d
chmod 644 /var/lib/command-not-found/*
