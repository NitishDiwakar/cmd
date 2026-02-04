#!/bin/bash

BASE_URL="https://example.com/uploads"
EXT="mp4"

for i in $(seq 1000 1999); do
    FILE="$i.$EXT"
    URL="$BASE_URL/$FILE"

    echo "Checking $URL ..."

    # Check if file exists (HTTP 200)
    if curl -s --head --fail "$URL" > /dev/null; then
        echo "Found. Downloading $FILE"
        curl -O "$URL"
    else
        echo "Not found. Skipping $FILE"
    fi
done
