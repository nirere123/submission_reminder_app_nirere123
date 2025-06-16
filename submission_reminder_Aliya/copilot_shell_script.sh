#!/bin/bash

# ask  for assignment name
printf "Assignment to check: "
read assignment_input

#  the path for the files
CONFIG_FILE="config/config.env"
STARTUP_SCRIPT="startup.sh"

# Exit if config file doesn't exist
[ ! -e "$CONFIG_FILE" ] && {
  echo " Config file missing at $CONFIG_FILE"
  exit 1
}

# Create a temp file
awk -v val="$assignment_input" '
  BEGIN { found = 0 }
  /^ASSIGNMENT=/ {
    print "ASSIGNMENT=\"" val "\""
    found = 1
    next
  }
  { print }
  END {
    if (!found) print "ASSIGNMENT=\"" val "\""
  }
' "$CONFIG_FILE" > "${CONFIG_FILE}.tmp" && mv "${CONFIG_FILE}.tmp" "$CONFIG_FILE"

echo "ASSIGNMENT set to '$assignment_input' in config file."

# Run the startup script using `bash` 
if [[ -f "$STARTUP_SCRIPT" && -x "$STARTUP_SCRIPT" ]]; then
  echo "Starting reminder check..."
  bash "$STARTUP_SCRIPT"
else
  echo " startup.sh is missing or not executable."
  exit 1
fi
