### Overview
This is readme breaking down the syntax and components used in the script.

#### Shebang and Initial Setup
```bash
#!/bin/bash
```

- *#!/bin/bash:* This is called a shebang. It specifies the path to the bash interpreter, telling the system to execute the script using bash.

#### Argument Handling and Initial Checks
```bash
if [ "$#" -lt 1 ]; then
  echo "Usage: $0 directory_path [another_directory_path ...]"
  exit 1
fi
```

- *"$#":* This variable represents the number of arguments passed to the script.
- *-lt 1:* This is a comparison operator that checks if the number of arguments is less than 1.
- *if [ condition ]; then ... fi:* This is a conditional statement in bash. If the condition inside the square brackets is true, the commands between then and fi are executed.
- *echo "Usage: $0 directory_path [another_directory_path ...]":* This prints a usage message. $0 represents the name of the script.
- *exit 1:* This exits the script with a status code of 1, indicating an error.

#### Associative Array for File Types
```bash
declare -A FILE_TYPES
FILE_TYPES=( ["jpg"]="Images" ["png"]="Images" ["gif"]="Images" ["txt"]="Documents" ["pdf"]="Documents" ["doc"]="Documents" ["docx"]="Documents" )
```

- *declare -A FILE_TYPES:* This declares an associative array named FILE_TYPES.
- *FILE_TYPES=( [key1]=value1 [key2]=value2 ... ):* This initializes the associative array with keys and corresponding values.

#### Looping through directories
```bash
for DIR in "$@"; do
  if [ ! -d "$DIR" ]; then
    echo "Directory $DIR does not exist."
    continue
  fi
  cd "$DIR"
```

- *for VAR in "$@"; do ... done:* This is a loop that iterates over all the arguments passed to the script ("$@" represents all the arguments).
- *if [ ! -d "$DIR" ]; then ... fi:* This checks if DIR is not a directory. ! -d is the test for "not a directory".
- *continue:* This skips the rest of the loop iteration and proceeds to the next item.
- *cd "$DIR":* This changes the current directory to DIR.

#### Processing
```bash
  for FILE in *; do
    if [ -f "$FILE" ]; then
      EXT="${FILE##*.}"
      CATEGORY="${FILE_TYPES[$EXT]}"
      if [ -n "$CATEGORY" ]; then
        mkdir -p "$CATEGORY"
        mv "$FILE" "$CATEGORY/"
      else
        echo "No category defined for file type .$EXT"
      fi
    fi
  done
  cd - > /dev/null
done
```

- *for FILE in *; do ... done:* This loops through all files and directories in the current directory (* is a wildcard representing all files).
- *if [ -f "$FILE" ]; then ... fi:* This checks if FILE is a regular file. -f is the test for a regular file.
- *EXT="${FILE##*.}":* This extracts the file extension. ${FILE##*.} removes everything up to and including the last dot (.) from FILE.
- *CATEGORY="${FILE_TYPES[$EXT]}":* This looks up the category in the FILE_TYPES associative array using the file extension EXT.
- *if [ -n "$CATEGORY" ]; then ... fi:* This checks if CATEGORY is not empty. -n tests for a non-zero length string.
- *mkdir -p "$CATEGORY":* This creates the directory CATEGORY if it doesn't already exist. -p ensures no error if the directory exists and creates parent directories as needed.
- *mv "$FILE" "$CATEGORY/":* This moves the file FILE to the directory CATEGORY.

#### Logging and Error Handling
```bash
LOG_FILE="organize_files.log"

for DIR in "$@"; do
  if [ ! -d "$DIR" ]; then
    echo "Directory $DIR does not exist." | tee -a "$LOG_FILE"
    continue
  fi
  cd "$DIR"
  
  for FILE in *; do
    if [ -f "$FILE" ]; then
      EXT="${FILE##*.}"
      CATEGORY="${FILE_TYPES[$EXT]}"
      if [ -n "$CATEGORY" ]; then
        mkdir -p "$CATEGORY"
        mv "$FILE" "$CATEGORY/"
        echo "Moved $FILE to $CATEGORY/" | tee -a "$LOG_FILE"
      else
        echo "No category defined for file type .$EXT. Skipping $FILE." | tee -a "$LOG_FILE"
      fi
    fi
  done
  cd - > /dev/null
done
```

- *LOG_FILE="organize_files.log":* This sets the log file name.
- *echo "message" | tee -a "$LOG_FILE":* This prints message to both the terminal and appends it to LOG_FILE.
- *cd - > /dev/null:* This returns to the previous directory. The > /dev/null part discards any output.LOG_FILE="organize_files.log": This sets the log file name.
- *echo "message" | tee -a "$LOG_FILE":* This prints message to both the terminal and appends it to LOG_FILE.
- *cd - > /dev/null:* This returns to the previous directory. The > /dev/null part discards any output.

These components collectively form a bash script that organizes files into categorized directories, handling multiple directories and providing logging for actions taken 