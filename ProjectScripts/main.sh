
 . dataValidation.sh
 . errorMessage.sh
sub_menu(){
    select choice in "try again" "back to main menu" "exit program" 
    do
    case $REPLY in
    1) 
       echo $1
       $2     
        break
        ;;
    2) echo "back"
    main_menu
        break
        ;;
    3) echo "good bye"
        exit 1
        ;;
    *)echo "invalid choice , enter your choice again"

    ;;

    esac

    done
}
 create ()
 {
     read dbName
    local result_isNot_EmptyString=$(isNot_EmptyString $dbName)
    local result_isNot_exist=$(isNot_exist "../DBMS/$dbName") 
    if [ $result_isNot_EmptyString -eq 1 -a $result_isNot_exist -eq 1 ]
    then
        ./createdb.sh $dbName
    fi 
    if [ $result_isNot_EmptyString -eq 0 ]
    then
        generate_error_msg $result_isNot_EmptyString
        sub_menu  " enter db name again" create  
      
    fi

    if [ $result_isNot_exist -eq 2 ]
    then
       generate_error_msg $result_isNot_exist
        sub_menu  " enter db name again" create 
    fi 

    

 }


main_menu(){
    select choice in "create database" "use Database" "show databases" "delete database" "Exit"
    do
    case $REPLY in
    1) echo "enter the name of the database"
            create 
            
        break
        ;;
    2) echo "use Database"
        break
        ;;
    3) echo "show databases"
        break
        ;;
    4) echo "delete database"
        break
        ;;
    5) echo "good bye"

        exit 1
        ;;
    *)echo "invalid choice , enter your choice again"

    ;;

    esac

    done

} 

main_menu 