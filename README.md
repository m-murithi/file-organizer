# File organizer
File Organizer is a bash script that organizes files in specified directories based on their file types. It categorizes files into subdirectories such as '*Images*', '*Documents*', '*Music*' and '*Videos*', making it easier to manage and find files

#### Features
- Organizes files based on their extensions
- Automatically creates subdirectories for each file type category 
- Moves files into the appropriate subdirectories
- Supports multiple directory paths as input
- Logs actions taken during the organization process

#### Requirements
- Bash 

### Usage
1. Clone or download the repository
2. Make the script executable:
```bash
chmod +x organize_files.sh
```
3. Run the script with one or more directory paths as arguments:
```bash
./organize_files.sh /path/to/directory1 /path/to/directory2
```

#### File Type Categories
The script categorizes the files based on their extensions into the following predefined categories:

    - Images: jpg, jpeg, png, gif, bmp
    - Documents: txt, pdf, doc, docx
    - Spreadsheets: xls, xlsx
    - Music: mp3, wav, flac
    - Videos: mp4, mkv, avi

You can customize these categories and extensions by modifying the 'FILE_TYPES' associative array in the script

### Logging 
The script logs its actions to a file named '*organize_files.log*' in the current directory. The log includes information about moved files and any issues encountered.
