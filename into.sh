#!/bin/bash
Sexit(){

  command -v $1 >/dev/null 2>&1 || { echo "Package not found. Aborting." >&2; exit 1; }
  if [ "$1" = "" ]; then
    echo "Package not found. Aborting."
    exit 1;
  fi

}

Help(){

echo "Should include package name, e.g. into echo"
echo "[While using into]"
echo "-to: If you want to change to another package, type: -to packageName"
echo "cls: to clear the terminal screen"

}


if [ $# -eq 0 ]; then
Help
else
line=$1
Sexit $line
fi

while [[ $# > 0 ]]

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
