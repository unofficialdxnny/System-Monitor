#!/bin/bash

# Function to get system information
get_system_info() {
    echo "System Information:"
    echo "-------------------"
    echo "Hostname: $(hostname)"
    echo "Kernel Version: $(uname -r)"
    echo "Uptime: $(uptime)"
    echo "Load Average: $(cat /proc/loadavg)"
    echo "CPU Usage: $(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')%"
    echo "Memory Usage: $(free -m | awk '/Mem/ {print $3 "MB / " $2 "MB"}')"
    echo "Disk Usage: $(df -h / | awk '/\// {print $3 " / " $2}')"
    echo "-------------------"
}

# Function to monitor CPU usage
monitor_cpu_usage() {
    echo "CPU Usage Monitor:"
    echo "------------------"
    while true; do
        echo "$(date +%H:%M:%S) - CPU Usage: $(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')%"
        sleep 1
    done
}

# Function to monitor memory usage
monitor_memory_usage() {
    echo "Memory Usage Monitor:"
    echo "---------------------"
    while true; do
        echo "$(date +%H:%M:%S) - Memory Usage: $(free -m | awk '/Mem/ {print $3 "MB / " $2 "MB"}')"
        sleep 1
    done
}

# Function to monitor disk usage
monitor_disk_usage() {
    echo "Disk Usage Monitor:"
    echo "--------------------"
    while true; do
        echo "$(date +%H:%M:%S) - Disk Usage: $(df -h / | awk '/\// {print $3 " / " $2}')"
        sleep 1
    done
}

# Main menu
while true; do
    clear
    echo "System Monitoring Script"
    echo "------------------------"
    echo "1. Get System Information"
    echo "2. Monitor CPU Usage"
    echo "3. Monitor Memory Usage"
    echo "4. Monitor Disk Usage"
    echo "5. Exit"
    echo "------------------------"
    read -p "Enter your choice (1-5): " choice

    case $choice in
        1) get_system_info;;
        2) monitor_cpu_usage;;
        3) monitor_memory_usage;;
        4) monitor_disk_usage;;
        5) break;;
        *) echo "Invalid choice. Please try again.";;
    esac

    read -p "Press enter to continue..."
done
