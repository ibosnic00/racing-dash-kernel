#!/bin/sh

# Directory containing the PPM frames
FRAMES_DIR="/usr/share/boot-animation"

# Loop through the frames
for i in $(seq -f "%03g" 1 101); do
    cat "$FRAMES_DIR/ezgif-frame-$i.ppm" > /dev/fb0
    sleep 0.04  # Adjust this value to control animation speed
done 