#3
if [[ -z "$1" ]]; then
    echo "Error: No input provided."
    exit 1
fi
number="$1"

if ! [[ "$number" =~ ^[0-9]+$ ]]; then
    echo "Error: Please enter a valid number."
    exit 1
fi
reversed=$( echo "$number" | rev)
echo "Reversed number: $reversed"
