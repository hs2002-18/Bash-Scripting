#!/bin/bash
source config.conf
source utils.sh

#Create log files if it does not exist
mkdir -p logs
touch "$LOG_FILE"

echo "------ $(date) ------" >> "$LOG_FILE"

#CPU usage
CPU=$(top -bn1 | grep "Cpu" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
echo "CPU Usage: $CPU%" >> "$LOG_FILE"
if (( $(echo "$CPU > $CPU_Threshold" | bc -l) )); 
then
    send_alert "High CPU usage: $CPU%"
fi

#MEMORY USAGE
MEM=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
echo "Memory Usage: $MEM%" >> "$LOG_FILE"
if (( $(echo "$MEM > $MEMORY_Threshold" | bc -l) )); then
    send_alert "High Memory usage: $MEM%"
fi

#DISK Usage
DISK=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')
echo "Disk Usage: $DISK%" >> "$LOG_FILE"
if (( DISK > DISK_Threshold )); then
    send_alert "High Disk usage: $DISK%"
fi

#Check Service (nginx)
if pgrep -x "$SERVICE" > /dev/null; then
    echo "Service $SERVICE is running" >> "$LOG_FILE"
else
    send_alert "Service $SERVICE is NOT running!"
fi

echo "" >> "$LOG_FILE"