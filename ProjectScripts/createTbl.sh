 . dataValidation.sh
 touch $1  $2
 chmod  777 $1 
  chmod 777 $2

#  isCol_not_exist()
#  {
#  if  grep -q $1 $2 
#     echo 6
#   else 
#     echo 1

#   fi    


#  }

get_tbl_structure()
{ delemeter1=" "
  delemeter2="\n"
 echo "Enter the number of columns "
 read num 
#  isValid_Num num 


for (( i=1; i<=$num; i++))
do
echo "Enter the name of  column $i"
read colName


if  grep -q $colName $2 
then
 echo "this column Name aleardy exists"
    ((i--))
else

    # is Valid colName
    #   local result_isNot_EmptyString=$(isNot_EmptyString $colName)
    #   local result_isValid_String=$(isValid_String $colName)
   
 
    select choice in "int" "string"
    do
        if [[ -z $choice ]]
            then
                echo "invalid choice"
            else
                type=$choice
                break
        fi
    done 
        echo $colName$delemeter1$type >> $2 
        
fi
    done

}


get_tbl_structure $1 $2