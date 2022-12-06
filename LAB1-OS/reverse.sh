function reverse {
  IFS=$'\n'
  if [[ "$1" = "interactive" ]] #обработка интерактива
  then 
    read -p "Enter the name of the file you want to reverse - " answer
  if ! [[ -e $answer ]]
  then
    echo "Error: file does not exist $answer" #проверка на существование файла
    return $?
  fi
  if ! [[ -r $answer ]]
  then
    echo "Error: no file permissions to read $answer" #проверка на наличие прав для чтения
    return $?
  fi
  read -p "Enter the name of the file where you want to write result - " file

    if [[ -f $file ]] && ! [[ -w $file ]] #если файл существует, но в этой директории нельзя записывать
    then
    echo "Error: no permission to write in $file"
    return $?
    fi
    if ! [[ -r "$(dirname $file)" ]] #нельзя читать в этой директории 
    then
      echo "Error: no access to read in directory of $file"
      return $?
    fi
    if ! [[ -w "$(dirname $file)" ]] && ! [[ -f "$file" ]] #если файл не существует, то есть мы хотим создать файл, но в этой директории нельзя создавать файлы
    then
    echo "Error: no permission to create in this directory"
    return $?
    fi
    tac $answer >> temp.txt
    rev temp.txt > $file
    rm temp.txt
    return $?
  fi
  #окончание интерактива
	IFS=$'\n'
	if [[ $3 -ne 3 ]] #проверяем на кол-во аргументов
    then
      echo "Error: wrong number of arguments. Enter reverse then file name to read and file name to write"
		exit -1
    fi
    if ! [[ -e $1 ]]
    then
      echo "Error: file does not exist $1" #проверка на существование файла
      exit -2
    fi
	 if ! [[ -r $1 ]]
    then
      echo "Error: no file permissions $1" #проверка на наличие прав для чтения
      exit -3
    fi
 if [[ -f $2 ]] && ! [[ -w $2 ]] #если файл существует, но в него нельзя записывать
    then
    echo "Error: no permission to write in $file"
    return $?
    fi 
    if ! [[ -r "$(dirname $2)" ]] #нельзя читать в этой директории 
    then
      echo "Error: no access to read in directory of $2"
      return $?
    fi
    if ! [[ -w "$(dirname $2)" ]] && ! [[ -f "$2" ]] #если файл не существует, то есть мы хотим создать файл, но в этой директории нельзя создавать файлы
    then
    echo "Error: no permission to create in this directory"
    return $?
    fi
    tac $1 >> temp.txt
    rev temp.txt > $2
    rm temp.txt
}