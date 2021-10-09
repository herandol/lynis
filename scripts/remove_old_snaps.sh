#!/bin/bash
# Removes old revisions of snaps

set -eu

LANG=en_US.UTF-8 snap list --all | awk '/disabled/{print $1, $3}' |
    while read -r snapname revision; do
        snap remove "$snapname" --revision="$revision"
    done