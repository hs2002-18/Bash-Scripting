#!/bin/bash
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

#function that allows to log message in color
log_message() {
    echo -e "$1"
}

#alert function
send_alert() {
    message="$1"

    echo -e "${RED}[ALERT] $message${NC}"

    #The below line logs the alert
    echo "[ALERT] $MESSAGE" >> "$LOG_FILE"
}