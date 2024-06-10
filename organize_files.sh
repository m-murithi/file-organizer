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

