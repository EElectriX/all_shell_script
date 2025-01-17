#4
if [[ -z "$1" ]]; then
    echo "Error: No file provided."
    echo "Usage: $0 <filename>"
    exit 1
fi
file="$1"
if [[ ! -f "$file" ]]; then
    echo "Error: File '$file' does not exist."
    exit 1
fi
while IFS= read -r line; do
    if [[ $((${#line} % 2)) -eq 0 ]]; then
        echo "$line"
    fi
done < "$file"
