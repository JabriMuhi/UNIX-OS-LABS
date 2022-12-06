function strlen {
	if [[ "$1" = "interactive" ]] #обработка интерактива
	then 
	read -p "Enter your string - " answer
	echo ${#answer}
	return $?
	fi
	#тут заканчивается интерактив
	if [[ $2 -eq 1 ]]
	then
	echo "Error: wrong number of arguments. Enter strlen then string"
	exit -1
	fi
	if [[ $2 -ne 2 ]]
    	then
        echo "Error: wrong number of arguments. Enter strlen then string" 
	exit -1 #проверка на кол-во аргументов
	fi
	str="$1"
	echo ${#str}
}