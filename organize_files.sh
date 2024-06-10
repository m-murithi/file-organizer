#!/bin/bash

declare -A FILE_TYPES
FILE_TYPES=( ["jpg"]="Images" ["jpeg"]="Images" ["png"]="Images" ["gif"]="Images" ["bmp"]="Images"
             ["txt"]="Documents" ["pdf"]="Documents" ["doc"]="Documents" ["docx"]="Documents"
             ["xls"]="Spreadsheets" ["xlsx"]="Spreadsheets"
             ["mp3"]="Music" ["wav"]="Music" ["flac"]="Music"
             ["mp4"]="Videos" ["mkv"]="Videos" ["avi"]="Videos" )

if ["$#" -lt 1]; then
    echo "Usage: $0 directory_path [another_directory ...]"
    exit 1
fi

LOG_FILE="organize_files.log"

for DIR in "$@"; do
    if [! -d "$DIR"]; then
        echo "DIrectory $DIR does not exist." | tee -a "$LOG_FILE"
        continue
    fi
    cd "$DIR"

    for FILE in *; do
        if [-f "$FILE"]; then
            EXT="${FILE##*.}"
            CATEGORY="${FILE_TYPES[$EXT]}"
            if [-n "$CATEGORY"]; then
                mkdir -p "$CATEGORY"
                mv "$FILE" "$CATEGORY/" | tee -a "$LOG_FILE"
            else
                echo "No category defined for file type .$EXT. Skipping $FILE." | tee -a "$LOG_FILE"
            fi
        fi
    doc
    cd -> /dev/null
done