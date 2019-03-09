 . dataValidation.sh
 touch $1  $2
 
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
# is Valid colName

# isCol_not_exist 

#write tbl name+" " in mata




#choose type 

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
#((count++))

done

}
get_tbl_structure $1 $2