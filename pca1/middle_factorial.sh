# 5
factorial() {
    local num=$1
    fact=1
    for (( i=2; i<=num; i++ )); do
        fact=$((fact * i))
    done
    echo $fact
}
read -p "Enter the start of the range: " start
read -p "Enter the end of the range: " end
if [ $start -gt $end ]; then
    echo "Invalid range. Start should be less than or equal to end."
    exit 1
fi

range=($(seq $start $end))
length=${#range[@]}

if (( length % 2 == 1 )); then
    middle_index=$((length / 2))
    middle_element=${range[middle_index]}
    echo "Middle element: $middle_element"
    echo "Factorial of $middle_element: $(factorial $middle_element)"
else
    
    middle_index1=$((length / 2 - 1))
    middle_index2=$((length / 2))
    middle_element1=${range[middle_index1]}
    middle_element2=${range[middle_index2]}
    echo "Middle elements: $middle_element1, $middle_element2"
    echo "Factorial of $middle_element1: $(factorial $middle_element1)"
    echo "Factorial of $middle_element2: $(factorial $middle_element2)"
fi
