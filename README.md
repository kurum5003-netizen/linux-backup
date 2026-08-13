# Bash Backup Automation Script

A simple Bash script for creating compressed backups of directories.

The script validates the source directory, prepares the destination directory, creates a timestamped `.tar.gz` archive, and reports whether the backup operation was successful.

## Features

- Source directory validation
- Automatic destination directory creation
- Timestamped backup files
- `.tar.gz` compression using `tar`
- Command-line options with `getopts`
- Function-based Bash structure
- Exit code based error handling
- Backup file size reporting

## Usage

```bash
./backup.sh -s SOURCE -d DESTINATION
