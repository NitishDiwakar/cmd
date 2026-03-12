#!/bin/bash
PATH=/usr/local/bin:/usr/bin:/bin

BASE_DIR="$HOME/programming/github/cmd/s"
EMAIL="example_receiver@gmail.com"
DATE_STR=$(date '+%Y-%m-%d')

TMP_BODY=$(mktemp)
COUNT=0
MAX_FILES=5

# Loop through first-level directories only
for dir in "$BASE_DIR"/*/; do
    [ -d "$dir" ] || continue

    # Stop if already selected max files
    [ "$COUNT" -ge "$MAX_FILES" ] && break

    # Find .txt files only at depth 1 (ignore deeper folders)
    mapfile -t files < <(find "$dir" -maxdepth 1 -type f -name "*.txt")

    # Skip if no txt files
    [ ${#files[@]} -eq 0 ] && continue

    # Pick random file
    random_file="${files[RANDOM % ${#files[@]}]}"

    folder_name="$(basename "$(dirname "$random_file")")"
    file_name="$(basename "$random_file")"

    echo "File: $folder_name/$file_name" >> "$TMP_BODY"
    echo "" >> "$TMP_BODY"
    cat "$random_file" >> "$TMP_BODY"
    echo "" >> "$TMP_BODY"
    echo "----------------------------------------" >> "$TMP_BODY"
    echo "" >> "$TMP_BODY"

    COUNT=$((COUNT + 1))
done

# Send email
mail -s "Revision notes - $DATE_STR" "$EMAIL" < "$TMP_BODY"

rm -f "$TMP_BODY"