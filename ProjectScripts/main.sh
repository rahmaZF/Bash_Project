select choice in "create database" "use Database" "show databases" "delete database" "Exit"
do
case $REPLY in
1) echo "create database"

;;
2) echo "use Database"

;;
3) echo "show databases"

;;
4) echo "delete database"

;;
5) echo "good bye"
break
;;
*)echo "invalid choice "
;;

esac

done
