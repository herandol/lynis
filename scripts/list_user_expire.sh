#!/bin/bash

log_file=/var/log/lynis.log

grep "Accounts without expire date" "$log_file"