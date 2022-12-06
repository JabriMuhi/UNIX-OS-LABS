#!/bin/bash
function sum {
  echo $(( $1 + $2 ))
}
function sub {
  echo $(( $1 - $2 ))
}
function mul {
  echo $(( $1 * $2 ))
}
function div {
  echo $(( $1 / $2 ))
}

function calc {
  if [[ "$1" = "interactive" ]] #обработка интерактива
  then
    read -p "Enter your operation (sum/sub/mul/div) - " answer
    if [[ "$answer" != "sum" && "$answer" != "sub" && "$answer" != "mul" && "$answer" != "div" ]]
    then
      echo "Error: wrong second argument.The second argument MUST be sum/sub/mul/div"
      return $?
    fi
    read -p "Enter the second integer - " number1
    re='^-?[0-9]+$'
    if ! [[ "$number1" =~ $re ]]
    then
      echo "Error: first number is not an integer."
      return $?
    fi
    read -p "Enter the first integer - " number2
    if ! [[ "$number2" =~ $re || "$number2" = "+0"  ]]
    then
      echo "Error: second number is not an integer."
      return $?
    fi
    if [[ "$answer" = "div" && $(mul $number2 $number2) -eq 0 ]]
    then
      echo "Division by zero is not possible"
      return $?
    fi
      echo "Result - "$($answer $number1 $number2)
      return $?
  fi
#тут заканчивается интерактив 

  if [[ $4 -ne 4 ]]
  then
    echo "Error: wrong number of arguments. Enter calc then sum/sub/mul/div and two integers"
    exit -1
  fi
  if [[ "$1" != "sum" && "$1" != "sub" && "$1" != "mul" && "$1" != "div" ]]
  then
    echo "Error: wrong second argument.The second argument MUST be sum/sub/mul/div"
    exit -2
  fi
  re='^-?[0-9]+$'
  if ! [[ "$2" =~ $re ]]
  then
    echo "Error: third argument is not an integer. Select the third argument as an integer"
    exit -2
  fi
  if ! [[ "$3" =~ $re || "$3" = "+0" ]]
  then
    echo "Error: fourth argument is not an integer. Select the fourth argument as an integer"
    exit -3
  fi
  if [[ "$1" = "div" && $(mul $3 $3) -eq 0 ]]
  then
    echo "Division by zero is not possible"
    exit -4
  fi
   echo $($1 $2 $3)
}