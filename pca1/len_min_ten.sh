#1
read -p "Enter a String:" input 
if [ ${#input} -ge 10 ];then 
    echo "The string has at least 10 characters"
else 
    echo "The string has less than 10 characters"
fi 