function interactive {
  if [[ $1 -ne 1 ]]
  then
    echo "Error: command interactive doesn't have any parametrs"
    exit -1
  fi
  answer=2
  while [[ "$answer" != "exit" ]]
  do
  echo -e "\nChoose what you want\n"
  echo  "*) calc"
  echo  "*) search"
  echo  "*) reverse"
  echo  "*) strlen"
  echo  "*) log"
  echo  "*) exit"
  echo  "*) help"
  read -p "Your choose? - " answer
  if [[ ${#answer} -le 2 ]]
  then
  clear
  echo -e "\nPlease write only the name of the function"
  continue
  fi
  if ! [[ -e $answer.sh ]]
  then
    clear
    echo "Error: this file doesn't exist $answer.sh"
    continue
  fi
  if ! [[ -r $answer.sh ]]
  then
    clear
    echo "Error: insufficient read rights $answer.sh"
    continue
  fi
  . ./"$answer".sh
  if [[ "$answer" = "exit" ]]
  then
  exi interactive
  continue
  fi
  $answer interactive
  continue
  done
}