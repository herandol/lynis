#!/bin/bash

echo "Setting account expire date for $1"

chage -l "$1"
chage -m 1 -M 60 -W 14 "$1"
chage -l "$1"