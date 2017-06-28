#!/bin/bash
Sexit(){

  command -v $1 >/dev/null 2>&1 || { echo "Package or command not found. Aborting." >&2; exit 1; }
  if [ "$1" = "" ]; then
    echo "Package or command not found. Aborting."
    exit 1;
  fi

}


read -e -p "Launch >> " line
Sexit $line

while true

   do

    read -r -p "$line >> " after
    set -- $after

    if [ "$1" = "-to" ]
    then
        Sexit $2
        line="$2"
    elif [ "$1" = "cls" ]
    then
      clear
    else
      $cat $line $after
    fi

done
