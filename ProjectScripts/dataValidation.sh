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

 isDir_Not_exist()
 { 
  if [ -d $1 ]
  then 
  echo 2
  else 
  echo 1
  fi 

  

 }

 isFile_Not_exist()
 { 
  if [ -e $1 ]
  then 
  echo 2
  else 
  echo 1
  fi 

  

 }
 isValid_String()
 
 { 
  if [[ $1 == [a-zA-Z_]+([a-zA-Z0-9_]*) ]]

   then #matched 
   echo 1
   else 
   echo 5
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

