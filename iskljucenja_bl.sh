#! /bin/bash

# This is necessary for cron task to run properly.
#xhost local:$USER > /dev/null

echo "Running1" > /home/oroundo/Downloads/rrr

DIR="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SEARCH_TERM=$1

echo " $DIR | $SEARCH_TERM" >> /home/oroundo/Downloads/rrr
echo " $USER" >> /home/oroundo/Downloads/rrr
echo " $(whoami)" >> /home/oroundo/Downloads/rrr
echo " $XDG_RUNTIME_DIR=" >> /home/oroundo/Downloads/rrr

wget -O- "https://www.banjaluka.rs.ba/gradjani/servisne-informacije/" | grep "$SEARCH_TERM"

RESULT=$?

if [ $RESULT -eq 0 ];
then
	echo " start" >> /home/oroundo/Downloads/rrr
        aplay "$DIR/cow.wav"
	# Display argument is necessary for cron task to run properly.
	XDG_RUNTIME_DIR=$XDG_RUNTIME_DIR DISPLAY=:0 notify-send -u normal -t $((24*3600*1000)) "$SEARCH_TERM се спомиње у сервисним информацијам. https://www.banjaluka.rs.ba/gradjani/servisne-informacije/"
	zenity --warning --display=:0.0 --text "$SEARCH_TERM се спомиње у сервисним информацијама. https://www.banjaluka.rs.ba/gradjani/servisne-informacije/"
	echo " stop" >> /home/oroundo/Downloads/rrr
fi

