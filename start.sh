#!/bin/bash
jupyter notebook --ip=0.0.0.0 --port=$PORT --NotebookApp.token='' --NotebookApp.password=''
cd /$REPONAME
cp -r * /
cat /$REPONAME/app.py |sed "s/THEPORTNUMBER/$PORT/g" >/app.py
cd /
command="python3 /app.py"
log="/data.txt"
match="WORD"

$command > "$log" 2>&1 &
pid=$!

while sleep 6
do
    if fgrep --quiet "$match" "$log"
    then
        pkill python3
        bash /entrypoint.sh
        rm data.txt
        exit 0
    fi
done
