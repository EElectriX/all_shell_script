number=3.7
floor=$(awk -v num=$number 'BEGIN {print int(num)}')
echo "Floor value: $floor"