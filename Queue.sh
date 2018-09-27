#!/bin/bash

#Queue and Move from linked script

if pgrep -x "ffmpeg" > /dev/null
then
	echo running ffmpeg
	exit 0
elif pgrep -x "rsync" > /dev/null
then
        echo running rsync
        exit 0
elif pgrep -x "rm" > /dev/null
then
        echo running remove
        exit 0
elif pgrep -x "mv" > /dev/null
then
        echo running move
        exit 0
else
	~/MyScript/encoding.sh
fi
