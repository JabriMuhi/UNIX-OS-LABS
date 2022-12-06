#!/bin/bash
function search {
   if [[ "$1" = "interactive" ]] #обработка интерактива
   then
    read -p "Enter your directory where we will search " answer #проверка на существование директории
    if ! [[ -d $answer ]]
    then
      echo "Error: this directory doesn't exist"
      return $?
    fi
    if ! [[ -r $answer ]]
    then
      echo "Error: insufficient permission to read the file $answer" #проверка на наличие прав для чтения директории
      return $?
    fi
    read -p "Enter your regulary phrase " phrase
    grep -r -s "$phrase" "$answer"
    return $?
   fi
   #окончание интерактива
   if [[ $3 -ne 3 ]]  #проверка на кол-во аргументов
    then
      echo "Error: wrong number of arguments. After search enter directory and your expression"
      exit -1;
    fi
    if ! [[ -d $1 ]]
    then
      echo "Error: this directory doesn't exist" #проверка на существование директории
      exit -2
    fi
    if ! [[ -r $1 ]]
    then
      echo "Error: insufficient permission to read the file $1" #проверка на наличие прав для чтения директории
      exit -3
    fi
    grep -r -s "$2" "$1"
}