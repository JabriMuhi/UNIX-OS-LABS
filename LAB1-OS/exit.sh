function exi {
  if [[ $1 = "interactive" ]] # обработка интерактива
  then
  read -p "Enter your return code (-255;255) - " answer
  if ! [[ $answer ]] # если ничего не ввели, то по умолчанию
  then
  exit 0
  fi
  re='^-?[0-9]+$'
  if ! [[ $answer =~ $re ]] # проверка что целое
  then
  echo "Error: return code must be integer"
  return $?
  fi
  if [[ "$answer" -lt 256 && "$answer" -gt -256 ]]
  then
  exit $answer
  fi 
  echo "Error: exit code must be integer and between -255 and 255"      # проверка является ли целым числом 
  return $?                                                             # и входит ли в диапазон  (-255; 255)
  fi
  # тут кончается интерактив

  if [[ $2 -gt 2 ]]
  then
    echo "Error: enter exit then return code"  
    exit -1 # проверка на кол-во аргументов
  fi
  if ! [[ $2 ]] # вывод кода возврата по умолчанию
  then
    exit 0
  fi
  re='^-?[0-9]+$'
  if ! [[ $1 =~ $re ]] # проверка что целое
  then
  echo "Error: return code must be integer"
  exit -1
  fi
  if [[ "$1" -lt 256 && "$1" -gt -256 ]] # входит ли в диапазон
  then
  exit $1
  fi 
  echo "Error: exit code must be integer and between -255 and 255" 
  exit -2       
}