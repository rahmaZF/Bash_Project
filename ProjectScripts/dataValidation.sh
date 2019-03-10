#!/usr/bin/bash
LC_ALL=C 
shopt -s extglob
hasNo_space()
{
case "$1" in  
     *\ * )
           echo 4
          ;;
       *)
           echo 1
           ;;
esac
}
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
  if [[ $1 =~ ^[a-z|A-Z][0-9|a-z|A-Z|_|\d]*$ ]]

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
is_Int ()
{

 if ! [[ $1 =~ ^[0-9]+$ ]]
then 
echo 6

else 
echo 1
fi

}
