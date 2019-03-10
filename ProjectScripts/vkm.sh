#echo `grep "../DBMS/xyz/tbl3" "../DBMS/tablesPKs" | cut -d ' ' -f2`

pkToCheck=879797
    tablePath="../DBMS/xyz/tbl3"
 pkFeildNum=`grep "../DBMS/xyz/tbl3" "../DBMS/tablesPKs" | cut -d ' ' -f2` 

array=( $(cut -d ' ' -f$pkFeildNum $tablePath) )
for x in ${array[@]};
do
 if [ $pkToCheck -eq $x ]
   then 
    echo "error"
   fi

done




