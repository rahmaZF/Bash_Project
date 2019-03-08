is_valid_dbName ()
 {
    if [[ -z $1 ]]
   then
   echo 0
   else
   echo 1
   fi


 }

 isNot_exist()
 { 
  if [ -d $1 ]
  then 
  echo 2
  else 
  echo 1
  fi 

  

 }