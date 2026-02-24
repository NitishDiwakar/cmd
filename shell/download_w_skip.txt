#!/bin/bash

BASE_URL="https://example.com/uploads/myfiless/id"
EXT="mp4"

for i in $(seq 59000 59999); do
    FILE="$i.$EXT"
    URL="$BASE_URL/$FILE"

    echo "Checking $URL ..."

    # Check if file exists (HTTP 200) with timeouts
    if curl -s --head --fail \
        --connect-timeout 3 \
        --max-time 5 \
        "$URL" > /dev/null; then

        echo "Found. Downloading $FILE"
        curl -O "$URL"
    else
        echo "Not found or no response. Skipping $FILE"
        sleep 1
    fi
done


# To execute this file:
# chmod +x file.sh
# ./file.sh