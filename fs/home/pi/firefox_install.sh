#!/bin/sh
URL=ftp://ports.ubuntu.com/ubuntu-ports/pool/main/f/firefox/
curl "$URL" > firefox_files.txt
LATEST_BUILD=`cat firefox_files.txt|grep 18.04.2_armhf.deb|tail -n 1|awk '{print $9}'`

if [ -e $LATEST_BUILD ]
 then
   echo "Unable to find latest build"
   exit 1
fi

curl "$URL$LATEST_BUILD" > $LATEST_BUILD

sudo dpkg -i $LATEST_BUILD || exit 1

echo "Firefox installed. Open about:config and set layers.acceleration.force-enabled to true to enable hardware acceleration."
