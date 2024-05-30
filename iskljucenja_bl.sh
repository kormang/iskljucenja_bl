#! /bin/bash

DIR="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SEARCH_TERM=$1

wget -O- "https://www.banjaluka.rs.ba/gradjani/servisne-informacije/" | grep "$SEARCH_TERM"

RESULT=$?

if [ $RESULT -eq 0 ];
then
        aplay "$DIR/cow.wav"
	# Display argument is necessary for cron task to run properly.
	XDG_RUNTIME_DIR=$XDG_RUNTIME_DIR DISPLAY=:0 notify-send -u normal -t $((24*3600*1000)) "$SEARCH_TERM се спомиње у сервисним информацијам. https://www.banjaluka.rs.ba/gradjani/servisne-informacije/"
	zenity --warning --display=:0.0 --text "$SEARCH_TERM се спомиње у сервисним информацијама. https://www.banjaluka.rs.ba/gradjani/servisne-informacije/"
fi

