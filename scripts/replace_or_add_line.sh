#!/bin/bash

search_text=$1
replace_text=$2
file=$3

if grep "$search_text" "$file" > /dev/null 2>&1;
then
        current_time=$(date +%k%M%S)
        sed -i.backup."$current_time" "/${search_text}/ c\\${replace_text}" "$file"
else
        echo "Not found. Adding a line"
        echo "$replace_text" >> "$file"
fi
