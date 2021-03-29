#!/bin/bash
#Name - Iresh Kariyakarawanage   Student Number - 10494634

log_file="access_log.txt"

continue_script="y"
while [[ $continue_script == "y" ]]; do # main loop
  echo ""
  read -p "Pattern to be searched: " pattern
  echo "Want to search an whole word match or any match on the line"
  read -p "Press 1 to whole, 2 for any: " match
  while :;
  do
    case $match in
      [1]) break ;;
      [2]) break ;;
      *) read -p "Press 1 to whole, 2 for any: " match
     esac
  done

  echo "Want to do an inverted match, i.e. retrieve lines that do not contain the pattern"
  read -p "1 for normal, 2 for inverted: " inverted_match

  while :;
  do
    case $inverted_match in
      [1]) break ;;
      [2]) break ;;
      *) read -p "Press 1 for normal, 2 for inverted: " inverted_match
     esac
  done


  # grep manual page
  #https://www.man7.org/linux/man-pages/man1/grep.1.html
  # -n, --line-number
  #          Prefix each line of output with the 1-based line number
  #          within its input file.
  # -i, --ignore-case
  #          Ignore case distinctions in patterns and input data, so
  #          that characters that differ only in case match each other.
  # -v, --invert-match
  #          Invert the sense of matching, to select non-matching
  #          lines.

  arguments="-ni"
  if [[ $match == 1 ]];then
    # use \b in the word to search whole word match
    pattern="\b$pattern\b"
  fi

  if [[ $inverted_match == 2 ]]; then
    arguments=$arguments"v"
  fi
  # use wc to count the lines output
  match_found=$(grep $arguments "$pattern" "$log_file" | wc -l)

  if [[ $match_found == 0 ]]; then
    echo "No matches found"
  else
    echo "$match_found matches found"
    echo "List of results:"
    echo ""
    grep $arguments "$pattern" "$log_file"
  fi

  read -p "Want to run the script again? (y/n)" continue_script
done
