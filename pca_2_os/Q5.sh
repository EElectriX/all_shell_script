#Create a script that synchronizes two directories by copying new or updated files from
#one directory to another. The script should only copy files modified in the last 24 hours.
usage() {
  echo "Usage: $0 <source_directory> <target_directory>"
  exit 1
}


if [ "$#" -ne 2 ]; then
  usage
fi

SOURCE_DIR=$1
TARGET_DIR=$2


if [ ! -d "$SOURCE_DIR" ]; then
  echo "Error: Source directory '$SOURCE_DIR' does not exist."
  exit 1
fi

if [ ! -d "$TARGET_DIR" ]; then
  echo "Error: Target directory '$TARGET_DIR' does not exist."
  exit 1
fi


echo "Synchronizing files from '$SOURCE_DIR' to '$TARGET_DIR'..."


find "$SOURCE_DIR" -type f -mtime -1 | while read FILE; do
  
  RELATIVE_PATH="${FILE#$SOURCE_DIR/}"
  
  
  TARGET_FILE="$TARGET_DIR/$RELATIVE_PATH"
  mkdir -p "$(dirname "$TARGET_FILE")"

 
  cp "$FILE" "$TARGET_FILE"
  echo "Copied: $FILE to $TARGET_FILE"
done

echo "Synchronization complete."

