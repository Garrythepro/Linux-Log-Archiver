#!/bin/bash

# Check if the user provided a log directory argument
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <log-directory>"
    exit 1
fi

LOG_DIR="$1"

# Check if the provided directory exists
if [ ! -d "$LOG_DIR" ]; then
    echo "Error: Directory '$LOG_DIR' does not exist!"
    exit 1
fi

# Create an archive directory if it doesn't exist
ARCHIVE_DIR="/var/log/archive"
mkdir -p "$ARCHIVE_DIR"

# Generate timestamp
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

# Archive filename
ARCHIVE_FILE="$ARCHIVE_DIR/logs_archive_$TIMESTAMP.tar.gz"

# Compress the logs
tar --checkpoint=1000 --checkpoint-action=echo="Checkpoint: %u files archived" -czf "$ARCHIVE_FILE" -C "$LOG_DIR" .

# Log the operation
LOG_FILE="$ARCHIVE_DIR/archive_log.txt"
echo "$TIMESTAMP - Archived logs from $LOG_DIR to $ARCHIVE_FILE" >> "$LOG_FILE"

# Print success message
echo "Logs from '$LOG_DIR' archived to '$ARCHIVE_FILE'."

