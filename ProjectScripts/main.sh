
#!/usr/bin/bash
LC_ALL=C 
shopt -s extglob
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
 create()
 {
     read dbName
    local result_isNot_EmptyString=$(isNot_EmptyString $dbName)
    local result_isNot_exist=$(isNot_exist "../DBMS/$dbName") 
    local result_isValid_String=$(isValid_String $dbName)
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
    # if [ $result_isValid_String -eq 3 ]
    # then 
    #     generate_error_msg $result_isValid_String
    #     sub_menu  " enter db name again" create 

    # fi  
 }
createTbl()
{

   read tblName
    local result_isNot_EmptyString=$(isNot_EmptyString $tblName)
    local result_isNot_exist=$(isNot_exist $1/$tblName) 
    if [ $result_isNot_EmptyString -eq 1 -a $result_isNot_exist -eq 1 ]
    then
        ./createTbl.sh $1/$tblName
    fi 
    if [ $result_isNot_EmptyString -eq 0 ]
    then
    generate_error_msg $result_isNot_EmptyString
    sub_menu  " enter table name again" createTbl  
        
    fi

    if [ $result_isNot_exist -eq 2 ]
    then
        generate_error_msg $result_isNot_exist
        sub_menu  " enter table name again" createTbl 
    fi 
                    

}
#  show_tables(){
#     select choice in `ls ../DBMS/$1`
#     do
#     file=$choice
#     echo $file            
#     done 

#  }

 use_menu(){
     select choice in "create table" "display table" "delete table" "insert into table" "update table" "display row" "delete row" 
    do
    case $REPLY in
    1) echo "enter the name of the table"
           createTbl $1
        break
        ;;
    2) echo "choose table to display"
            
        break
        ;;
    3) echo "choose table to delete"
            select choice in `ls ../DBMS/$1`
            do
            file=$choice
            echo $file
            ./deleteTbl.sh ../DBMS/$1/$file
            echo "table deleted successfully"
            use_menu $1
            done 
        break
        ;;
    4) echo "choose table to insert in"
            
        break
        ;;
    5) echo "choose table to update in"

        
        ;;
    6)echo "choose table"


    ;;
    7)echo "choose table"
    ;;    
    *)echo "invalid choice , enter your choice again"

    ;;

    esac

    done

 }

 use(){
    read dbName
    local result_isNot_EmptyString=$(isNot_EmptyString $dbName)
    local result_is_exist=$(is_exist "../DBMS/$dbName") 
    if [ $result_isNot_EmptyString -eq 1 -a $result_is_exist -eq 1 ]
    then
        ./usedb.sh "../DBMS/$dbName"
        use_menu "../DBMS/$dbName"
    fi 
    if [ $result_isNot_EmptyString -eq 0 ]
    then
        generate_error_msg $result_isNot_EmptyString
        sub_menu  "enter db name again" use  
      
    fi
    if [ $result_is_exist -eq 3 ]
    then
       generate_error_msg $result_is_exist
        sub_menu  "enter db name again" use 
    fi 
 }

 delete(){
    select choice in `ls ../DBMS/`
    do
        dir=$choice
        echo $dir
        ./deletedb.sh "../DBMS/$dir"
    done   
 }

main_menu(){
    select choice in "create database" "use Database" "show databases" "delete database" "Exit"
    do
    case $REPLY in
    1) echo "enter the name of the database"
            create 
            
        break
        ;;
    2) echo "enter the name of the database you want to use"
            use
        break
        ;;
    3) echo "show databases"
            ./showdbs.sh "../DBMS/"
        break
        ;;
    4) echo "delete database"
            delete
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