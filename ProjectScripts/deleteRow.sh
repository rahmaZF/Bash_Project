echo "enter primary key of table you want to delete"
read pk 


sed -i '$pk d' $1