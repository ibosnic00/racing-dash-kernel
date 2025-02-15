#!/bin/sh

if [ $(tty) = "/dev/tty1" ]; then
    # Print debug message
    echo "Autostart script running..."
    
    # Wait a bit for system to settle (optional)
    sleep 2
    
    # Start your application
    #/usr/bin/your-application &
    
    # Print confirmation
    echo "Application started"
fi