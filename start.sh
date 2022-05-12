#!/bin/bash
cd /$REPONAME
cp -r * /
cd /
command="python3 /app.py"
log="/data.txt"
match="WORD"

$command > "$log" 2>&1 &
pid=$!

while sleep 60
do
    if fgrep --quiet "$match" "$log"
    then
        pkill python3
        bash /entrypoint.sh
        rm data.txt
        exit 0
    fi
done
