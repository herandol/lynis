#!/bin/bash

log_file=/var/log/lynis.log

grep "Account without expire date" "$log_file"