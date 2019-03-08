#!/usr/bin/bash
generate_error_msg(){
code_error=$1 
case $code_error in
0) 
echo "you should enter a value  "
;;
2)
echo "this name already exist "
;;
3)
echo "this is not valid name "
;;
3)
echo "no database with a name you entered"
esac 
}