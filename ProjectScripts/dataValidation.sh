isNot_EmptyString ()
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

 is_exist()
 { 
  if [ -d $1 ]
  then 
  echo 1
  else 
  echo 3
  fi 

  

 }