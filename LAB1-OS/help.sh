function help {
  if [[ "$1"="interactive" ]]
  then
  echo  -e "\nLaunch parameters:\n"
  echo  "calc - calculator. Enter sum / sub / mul / div for the operation and two integers"
  echo  "search - recursive search of the contents of files in a directory. Enter directory and regulary phrase"
  echo  "reverse - writing in reverse order the contents of the first file to the second file. Enter the names of the two files"
  echo  "strlen - the number of characters in the line. Enter the string"
  echo  "log - log output from /var/log/anaconda/X.log"
  echo  "exit - end of the program"
  echo  "help - information on functionality"
  echo  "interactive - интерактивный режим работы"
  return $?
  fi
  if [[ $1 -ne 1 ]]
  then
    echo "Error: command help doesn't have any parametrs"
    exit -1
  fi
  echo  -e "\nLaunch parameters:\n"
  echo  "calc - calculator. Enter sum / sub / mul / div for the operation and two integers"
  echo  "search - recursive search of the contents of files in a directory. Enter directory and regulary phrase"
  echo  "reverse - writing in reverse order the contents of the first file to the second file. Enter the names of the two files"
  echo  "strlen - the number of characters in the line. Enter the string"
  echo  "log - log output from /var/log/anaconda/X.log"
  echo  "exit - end of the program"
  echo  "help - information on functionality"
  echo  "interactive - interactive way of working"
}