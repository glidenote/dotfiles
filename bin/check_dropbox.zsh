#!/bin/zsh

set -A array $(ps aux -m | grep Dropbox.app | grep -v grep | grep akira)
if [ $(echo $array |wc -w) -eq 0 ]
then    # Dropboxが起動してなかったら通知・起動
    /usr/local/bin/growlnotify -t 'Warning' -m 'DropBox is dead!!' -I /Applications/Dropbox.app
    osascript ~/bin/runDropbox.scpt
else    # メモリ消費量が512MBを超えてる or CPU使用率が80%以上ならkill
    if [ $array[6] -gt 512000 -o $(echo "$array[3]>80" | bc) -eq 1 ]
    then
        kill $array[2] && /usr/local/bin/growlnotify -t 'Report' -m 'DropBox was killed.' -I /Applications/Dropbox.app
        osascript ~/bin/runDropbox.scpt
    fi
fi

