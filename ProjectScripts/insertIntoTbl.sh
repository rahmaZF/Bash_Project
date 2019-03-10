#!/bin/bash
 . dataValidation.sh
 . errorMessage.sh
echo "insertIntoTbl"
isValid_PK()
{   pkToCheck=$1
    tablePath=$2
 pkFeildNum=`grep $2 "../DBMS/tablesPKs" | cut -d ' ' -f2` 
 echo $pkFeildNum

array=( $(cut -d ' ' -f$pkFeildNum $tablePath) )
for x in ${array[@]};
do
 if [ $pkToCheck -eq $x ]
   then 
    echo 10
   else 
    echo 1 
   fi

done


}
insertIntoTbl()
{ 
for col in `cut -d' ' -f1 $2`
 do 


#   echo $col 
  echo "Enter value of $col"
  read colVal
  colType=`grep $col $2|cut -d' ' -f2`
  colPK=`grep PK $2|cut -d' ' -f1`
#   echo $colType
if [ $col == $colPK ]
then 
  local result_isValid_PK=$(isValid_PK $colVal $tablePath)
  
#   primay key
# #################################
  if [ $colType == "int" ]
  then
    local result_is_Int=$(is_Int $colVal)
  
        if [ $result_is_Int -eq 1 ]
        then
            if [ $result_isValid_PK -eq 1 ]
            then
                 echo -n  $colVal " " >> $1
            else
                echo "this PK alrready exist , please try again "
                insertIntoTbl $1 $2

            fi
        else 
            generate_error_msg $result_is_Int 
            insertIntoTbl $1 $2
        fi 

elif [ $colType == "string" ]
then
  local result_isValid_String=$(isValid_String $colName)
  if [ $result_isValid_String -eq 1 ]
  then 
      if [ $result_isValid_PK -eq 1 ]
        then
                echo -n  $colVal " " >> $1
        else
            echo "this PK alrready exist , please try again "
            insertIntoTbl $1 $2

        fi
  else 
  generate_error_msg $result_isValid_String 
  insertIntoTbl $1 $2

  fi 
fi
#   #############
    




else  
        if [ $colType == "int" ]
        then
            local result_is_Int=$(is_Int $colVal)
        
            if [ $result_is_Int -eq 1 ]
            then
            echo -n  $colVal " " >> $1
            else 
            generate_error_msg $result_is_Int 
            insertIntoTbl $1 $2
            fi 

        elif [ $colType == "string" ]
        then
          local result_isValid_String=$(isValid_String $colName)
          if [ $result_isValid_String -eq 1 ]
          then 
        echo -n  $colVal " " >> $1
          else 
          generate_error_msg $result_isValid_String 
          insertIntoTbl $1 $2

          fi 
            
        fi

fi  


 
 done 


}
insertIntoTbl $1 $2