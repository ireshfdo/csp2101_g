#!/bin/bash
#Name - Iresh Kariyakarawanage   Student Number - 10494634

folder_choice="$1"
# declare counters on zero
file_contain_data=0
file_empty=0
dir_empty=0
dir_nonempty=0

# itinerate over all items in the chose folder
for item in $folder_choice/*; do
   if [[ -f "$item" ]]; then # check if is file
    # use stat to get the size of the file
    size=$(stat -c '%s' "$item")
    if [[ $size == 0 ]]; then # if stat is zero, then the file are empty
      ((file_empty++)) # increase counter
    else
      ((file_contain_data++))# increase counter
    fi

    else #its folder then
    if [ "$(ls -A "$item")" ]; then # check if folder have items inside
      ((dir_nonempty++))# increase counter
    else
      ((dir_empty++))# increase counter
    fi
  fi
done

echo "The $folder_choice directory contains:"
echo "$file_contain_data files that contain data"
echo "$file_empty files that are empty"
echo "$dir_nonempty non-empty directories"
echo "$dir_empty empty directories"
