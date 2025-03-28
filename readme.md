# Log Archiver

## Overview
The **Log Archiver** is a Bash script that compresses and archives logs from a specified directory. This tool helps in maintaining system cleanliness by regularly storing logs in a compressed format for future reference.

## Features
- Accepts a log directory as a command-line argument.
- Compresses the logs into a `.tar.gz` file.
- Stores the archive in `/var/log/archive`.
- Logs each archiving operation with a timestamp.
- Can be scheduled using `cron` for automated execution.

## Usage
### Running the Script Manually
```bash
./log-archive.sh <log-directory>
```
Example:
```bash
./log-archive.sh /var/log
```

### Automating with Cron
To schedule the script to run daily at midnight, add the following entry to `crontab`:
```bash
0 0 * * * /path/to/log-archive.sh /var/log
```

## Installation
1. **Download the Script**
   ```bash
   curl -O https://your-repo-url/log-archive.sh
   ```
2. **Give Execution Permissions**
   ```bash
   chmod +x log-archive.sh
   ```

## Archive Storage Location
- All archived log files are stored in:
  ```
  /var/log/archive
  ```
- The archive filenames follow this format:
  ```
  logs_archive_YYYYMMDD_HHMMSS.tar.gz
  ```

## Log File
Each operation is logged in:
```bash
/var/log/archive/archive_log.txt
```
Example entry:
```
20240816_100648 - Archived logs from /var/log to /var/log/archive/logs_archive_20240816_100648.tar.gz
```

## Dependencies
- Bash
- tar
- gzip
- cron (optional for automation)


