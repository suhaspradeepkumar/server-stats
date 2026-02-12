#!/bin/bash

echo "CPU Usage:"
top -bn1 | grep "Cpu(s)" | awk '{print 100-$8"% used"}'

echo -e "\nMemory Usage:"
free -h | awk '/Mem:/ {print "Used:", $3, "Free:", $4, "(" $3*100/$2 "% used)"}'

echo -e "\nDisk Usage:"
df -h / | awk 'NR==2 {print "Used:", $3, "Free:", $4, "(" $5 " used)"}'

echo -e "\nTop 5 CPU Processes:"
ps -eo pid,comm,%cpu --sort=-%cpu | head -6

echo -e "\nTop 5 Memory Processes:"
ps -eo pid,comm,%mem --sort=-%mem | head -6

echo "System Uptime:"
uptime
echo "Hello"
