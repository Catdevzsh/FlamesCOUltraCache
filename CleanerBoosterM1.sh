#!/bin/bash

# Enhanced cache cleaning and performance optimization script for macOS

echo "Starting system optimization for your Mac..."

# Check for administrative privileges
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

# Clearing system caches
echo "Clearing system caches..."
rm -rf /Library/Caches/*
rm -rf /System/Library/Caches/*

# Clearing user caches
echo "Clearing user caches..."
rm -rf ~/Library/Caches/*

# Optional: Clearing system logs
echo "Clearing system logs..."
rm -rf /var/log/*

# Optional: Clearing application logs
echo "Clearing application logs..."
rm -rf ~/Library/Logs/*

# Recreating necessary folders to avoid system errors
mkdir /Library/Caches
mkdir /System/Library/Caches
mkdir ~/Library/Caches
mkdir /var/log
mkdir ~/Library/Logs

# Purging disk cache (requires macOS 10.10 or later)
echo "Purging disk cache..."
sync; sudo purge

# Freeing up unused RAM
echo "Freeing up unused RAM..."
sudo purge

echo "System optimization completed!"

# Warning: This script is a basic example and might have unintended consequences.
# Always back up your data before running such scripts.
# Additionally, constantly clearing cache and RAM might not always result in performance improvements and should be used judiciously.
