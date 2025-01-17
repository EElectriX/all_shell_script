#Write a script that counts and displays the number 
#of lines, words, and characters in all
#text files within a directory. The file type and directory should be passed as arguments
#to the script.
if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <directory_path> <file_extension>"
  exit 1
fi

directory_path=$1
file_extension=$2

if [ ! -d "$directory_path" ]; then
  echo "Directory $directory_path does not exist."
  exit 1
fi
total_lines=0
total_words=0
total_chars=0


for file in "$directory_path"/*."$file_extension"; do

  if [ -f "$file" ]; then
    echo "Processing file: $file"


    lines=$(wc -l < "$file")
    words=$(wc -w < "$file")
    chars=$(wc -m < "$file")


    echo "Lines: $lines, Words: $words, Characters: $chars"


    total_lines=$((total_lines + lines))
    total_words=$((total_words + words))
    total_chars=$((total_chars + chars))
  fi
done

echo "Total Lines: $total_lines, Total Words: $total_words, Total Characters: $total_chars"

