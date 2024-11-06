#!/bin/bash
# system_monitor.sh - Monitor system resources

INTERVAL=${1:-5}  # Default interval of 5 seconds if none is provided

while true; do
  echo "----- System Monitoring -----"
  echo "Timestamp: $(date)"
  echo "CPU Usage:"
  top -bn1 | grep "Cpu(s)" | \
    awk '{print "CPU Load: " $2 + $4 "%"}'
  echo "Memory Usage:"
  free -h | awk '/Mem/{printf("Used: %s, Free: %s\n", $3, $4)}'
  echo "Disk Usage:"
  df -h | awk '$NF=="/"{printf "Disk Used: %d/%dGB (%s)\n", $3,$2,$5}'
  echo "-----------------------------"
  sleep "$INTERVAL"
done

