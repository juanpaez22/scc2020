#!/bin/sh

# Download Fiji from downloads link
wget https://downloads.imagej.net/fiji/latest/fiji-linux64.zip

# Unzip the file and remove the zip
echo "Unzipping compressed directory, this may take a minute"
unzip -q fiji-linux64.zip
rm -f fiji-linux64.zip

# List Directory and indicate completetion
ls
echo "Done!"

