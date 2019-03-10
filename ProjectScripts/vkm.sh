#echo `grep "../DBMS/xyz/tbl3" "../DBMS/tablesPKs" | cut -d ' ' -f2`

  pkToCheck=122
    tablePath="../DBMS/xyz/tbl3"
 pkFeildNum=`grep "../DBMS/xyz/tbl3" "../DBMS/tablesPKs" | cut -d ' ' -f2` 
 echo $pkFeildNum
 array=($(cut -d ' ' -f$pkFeildNum $tablePath))
 if [ $pkToCheck in $array ]
 then
 ehco 10
 else 
 echo 1
 fi
