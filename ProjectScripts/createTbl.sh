 . dataValidation.sh
 touch $1  $2
chmod 777 $1 
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
      local result_isNot_EmptyString=$(isNot_EmptyString $colName)
      local result_isValid_String=$(isValid_String $colName)
   
  if [ $result_isNot_EmptyString -eq 1 -a $result_isValid_String -eq 1 ]
  then
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
<<<<<<< HEAD
        echo $colName$delemeter1$type >> $2 
        
=======
        
#########
PK="PK"
if  grep -q $PK $2 
then
 echo $colName$delemeter1$type >> $2
 
else
echo "is $colName PK ?"

 select choice in "yes" "no"
 do 
 case $REPLY in
 1)
 echo $colName$delemeter1$type$delemeter1$PK >> $2
 echo $1$delemeter1$i>> ../DBMS/tablesPKs
 break
 ;;
 2)
 if [ $i -eq $num ]
 then
 echo $colName$delemeter1$type >> $2
 echo "this table must contain a primay key , try again "
 > $2
 get_tbl_structure $1 $2
 fi
break
;;
 *) echo "invalid choise , enter your choice agian"
 ;;

 esac
 

 done

fi
#########
 
   else 
    echo "this column name is not valid "
    ((i--))

   fi     

   
>>>>>>> 88e1fdf925897c19eacb7f9011e145fb5419183f
fi
    done

}


get_tbl_structure $1 $2