read -p "Enter the file name: " filename
if [ ! -e "$filename" ]; then
echo "File does not exist."
exit 1
fi
if [ -x "$filename" ] && [ -r "$filename" ] && [ -r "$filename" ]; then
echo "File has execute permission for owner and read permission for all."
chmod u-x,g-r,o-r "$filename"
echo "Permissions updated: removed execute permission for owner, and read permission for group and others."
else
echo "File does not have the required permissions."
fi