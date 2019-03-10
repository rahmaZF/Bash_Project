
#!/usr/bin/bash

 . dataValidation.sh
 . errorMessage.sh


 create()
 {
     read dbName
    local result_isNot_EmptyString=$(isNot_EmptyString $dbName)
   
    local result_isValid_String=$(isValid_String $dbName)
    
    if [ $result_isNot_EmptyString -eq 1 -a $result_isValid_String -eq 1 ]
    then 
       local result_isDir_Not_exist=$(isDir_Not_exist "../DBMS/$dbName") 
      if [ $result_isDir_Not_exist -eq 1 ]
      then
        ./createdb.sh $dbName
      else
        generate_error_msg $result_isDir_Not_exist
        sub_menu  " enter db name again" create 
      fi  

    fi 
    if [ $result_isNot_EmptyString -eq 0 ]
    then
        generate_error_msg $result_isNot_EmptyString
        sub_menu  " enter db name again" create  
      
    fi

   
    if [ $result_isValid_String -eq 5 ]
    then 
        generate_error_msg $result_isValid_String
        sub_menu  " enter db name again" create 

    fi  
 }
  use(){
     read dbName
    local result_isNot_EmptyString=$(isNot_EmptyString $dbName)
     
    local result_isValid_String=$(isValid_String $dbName)
    
    if [ $result_isNot_EmptyString -eq 1 -a $result_isValid_String -eq 1 ]
    then
    local result_is_exist=$(is_exist "../DBMS/$dbName")
     if [ $result_is_exist -eq 1 ]
     then
        ./usedb.sh "../DBMS/$dbName"
        use_menu "../DBMS/$dbName"
     else
        generate_error_msg $result_is_exist
        sub_menu  "enter db name again" use 

     fi     
    fi 
    if [ $result_isNot_EmptyString -eq 0 ]
    then
        generate_error_msg $result_isNot_EmptyString
        sub_menu  "enter db name again" use  
      
    fi
     if [ $result_isValid_String  -eq 5 ]
    then
        generate_error_msg $result_isValid_String 
        sub_menu  "enter db name again" use  
      
    fi

   
  
 }

 delete(){
    select choice in `ls ../DBMS/`
    do
      if [[ -z $choice ]]
        then
          echo "invalid choice"
         
       else
        dir=$choice
        echo $dir
      
        ./deletedb.sh "../DBMS/$dir"
        main_menu
   
      fi 
     done 
 }
createTbl()
{
    read tblName
    meta=".meta"
    metafile=$meta$tblName
    local result_isNot_EmptyString=$(isNot_EmptyString $tblName)
    local result_isFile_Not_exist=$(isFile_Not_exist "$1/$tblName") 
    local result_isValid_String=$(isValid_String $tblName)
    
    if [ $result_isNot_EmptyString -eq 1 -a $result_isFile_Not_exist -eq 1  -a $result_isValid_String -eq 1 ]
    then
         chmod 777 $1
        ./createTbl.sh $1/$tblName  $1/$metafile
    fi 
    if [ $result_isNot_EmptyString -eq 0 ]
    then
        generate_error_msg $result_isNot_EmptyString
        sub_menu  " enter table name again" createTbl      
    fi
    if [ $result_isFile_Not_exist -eq 2 ]
    then
        generate_error_msg $result_isFile_Not_exist
        sub_menu  " enter table name again" createTbl 
    fi 
    if [ $result_isValid_String -eq 5 ]
    then 
        generate_error_msg $result_isValid_String
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

 use_menu(){
     select choice in "create table" "display table" "delete table" "insert into table" "update table" "display row" "delete row" 
    do
    case $REPLY in
    1) echo "enter the name of the table"
           createTbl $1
        break
        ;;
    2) echo "choose table to display"
        meta=".meta"
           select choice in `ls ../DBMS/$1`
            do
             if [[ -z $choice ]]
                then
             echo "invalid choice"
             else
            file=$choice
            echo $file
             metafile=$meta$file
            ./displayTbls.sh ../DBMS/$1/$file ../DBMS/$1/$metafile           
            use_menu $1
            fi
            done
            
        break
        ;;
    3) echo "choose table to delete"
            select choice in `ls ../DBMS/$1`
            do
             if [[ -z $choice ]]
                then
             echo "invalid choice"
             else
            file=$choice
            echo $file
            ./deleteTbl.sh ../DBMS/$1/$file
            echo "table deleted successfully"
            use_menu $1
            fi
            done 
        break
        ;;
    4) echo "choose table to insert in"
          meta=".meta"
           select choice in `ls ../DBMS/$1`
            do
             if [[ -z $choice ]]
                then
             echo "invalid choice"
             else
            file=$choice
            echo $file
             metafile=$meta$file
            ./insertIntoTbl.sh ../DBMS/$1/$file ../DBMS/$1/$metafile           
            use_menu $1
            fi
             
            done 
      
            
        break
        ;;
    5) echo "choose table to update in"

        
        ;;
    6)echo "choose table to display row"
            meta=".meta"
           select choice in `ls ../DBMS/$1`
            do
             if [[ -z $choice ]]
                then
             echo "invalid choice"
             else
            file=$choice
            echo $file
             metafile=$meta$file
            ./displayRow.sh ../DBMS/$1/$file ../DBMS/$1/$metafile           
            use_menu $1
            fi
            done

    ;;
    7)echo "choose table to delete row"
     meta=".meta"
           select choice in `ls ../DBMS/$1`
            do
             if [[ -z $choice ]]
                then
             echo "invalid choice"
             else
            file=$choice
            echo $file
             metafile=$meta$file
            ./deleteRow.sh ../DBMS/$1/$file ../DBMS/$1/$metafile           
            use_menu $1
            fi
            done
    ;;    
    *)echo "invalid choice , enter your choice again"

    ;;

    esac

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