#!/bin/bash
Sexit(){

  command -v $1 >/dev/null 2>&1 || { echo "Package not found. Aborting." >&2; exit 1; }

}

Help(){

  echo "Should include package name, e.g. into echo"
  echo "[While using into]"
  echo "-ih: for help"
  echo "-to: If you want to change to another package, type: -to packageName"
  echo "cls: to clear the terminal screen"
  echo "[available operations]: ls, cp, mv, rm, chmod, cat, ps, kill, su, echo,\
   cd, pwd"

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

    if [ "$#" = 0 ] || [ "$1" = "-ih" ]; then
        Help
    elif [ "$1" = "-to" ]; then
        Sexit $2
        line="$2"
    elif [ "$1" = "cls" ]; then
        clear
    elif [[ "$1" =~ ^("ls"|"cp"|"mv"|"rm"|"chmod"|"cat"|"ps"|"kill"|"su"|"echo"\
    |"cd"|"pwd")$ ]]; then
        $after
    else
        tail=" "$after
        echo $line $tail
        $line$tail
    fi

done
