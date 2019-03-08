#!/usr/bin/bash
LC_ALL=C 
shopt -s extglob

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
#  isValid_String()
#  { LC_ALL=C 
#   shopt -s extglob
#    if [[ $1 =~ ^[A-Za-z]\w*$] ]];   then
#    echo 1
#    else 
#    echo 3
#    fi

#  }


 is_exist()
 { 
  if [ -d $1 ]
  then 
  echo 1
  else 
  echo 3
  fi 

  

 }

