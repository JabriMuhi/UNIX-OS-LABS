function log {
  ref="/var/log/anaconda/X.log"
  if [[ $1 = "interactive" ]] # обработка интеравктива
  then
    while read line
    do
      if [[ "$line" = *"(WW)"* && "$line" != *"(WW) warning, (EE) error, (NI) not implemented, (??) unknown."* ]]
      then
        echo -e "${line//"(WW)"/"\033[33mWarning:\033[0m"}"
      fi
    done < "$ref"
    while read line
    do
      if [[ "$line" = *"(II)"* && "$line" != *"(++) from command line, (!!) notice, (II) informational,"* ]]
      then
        echo -e "${line//"(II)"/"\033[94mInformation:\033[0m"}"
      fi
    done < "$ref"
    return $?
  fi
  # тут заканчивается интерактив
	if [[ $1 -ne 1 ]]
    then
      echo "Error: command log doesn't have any parametrs"
      exit -1
   fi
   while read line
    do
      if [[ "$line" = *"(WW)"* && "$line" != *"(WW) warning, (EE) error, (NI) not implemented, (??) unknown."* ]]
      then
        echo -e "${line//"(WW)"/"\033[33mWarning:\033[0m"}"
      fi
   done < "$ref"
   while read line
    do
      if [[ "$line" = *"(II)"* && "$line" != *"(++) from command line, (!!) notice, (II) informational,"* ]]
      then
        echo -e "${line//"(II)"/"\033[94mInformation:\033[0m"}"
      fi
   done < "$ref"
}