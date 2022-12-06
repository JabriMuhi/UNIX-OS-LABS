#!/bin/bash
function checkFile { 
  if ! [[ -e $1.sh ]]
  then
    echo  "Error: this file doesn't exist $1.sh" #проверка на существование файла
    exit -1
  fi
  if ! [[ -r $1.sh ]]
  then
    echo "Error: insufficient read rights $1.sh" #проверка на права для чтения
    exit -2
  fi
} 
case $1 in
calc)
  checkFile $1
  . ./calc.sh
  calc $2 $3 $4 $#
  exit 0
;;
search)
  checkFile $1
  . ./search.sh
  search $2 $3 $#
  exit 0
;;
reverse)
  checkFile $1
  . ./reverse.sh
  reverse $2 $3 $#
  exit 0
;;
strlen)
  checkFile $1
  . ./strlen.sh
  strlen "$2" $#
  exit 0
;;
log)
  checkFile $1
  . ./log.sh
  log $#
  exit 0
;;
exit)
  checkFile $1
  . ./exit.sh
  exi $2 $#
;;
help)
  checkFile $1
  . ./help.sh
  help $#
  exit 0
;;
interactive)
  checkFile $1
  . ./interactive.sh
  interactive $#
  exit 0
;;
*)
  if ! [[ -z $1 ]]
  then
    echo "There is no such parameter $1"
  fi
  echo "Enter ./main.sh help to learn with functionality"
;;
esac