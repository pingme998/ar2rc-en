#!/bin/bash
# jupyter notebook --ip=0.0.0.0 --port=$PORT --NotebookApp.token='' --NotebookApp.password=''
cd /$REPONAME
cp -r * /
cat /$REPONAME/app.py |sed "s/THEPORTNUMBER/$PORT/g" >/app.py
cd /
command="python3 /app.py"
log="/data.txt"
logx="/data2.txt"
match="WORD"
touch /data.txt
$command > "$logx" 2>&1 &
pid=$!

while sleep 6
do
    if fgrep --quiet "$match" "$log"
    then
        aria2c -x12 'https://github.com/userdocs/qbittorrent-nox-static/releases/download/release-4.4.2_v2.0.6/x86_64-qbittorrent-nox'
        chmod +x x86_64-qbittorrent-nox
        curl "$CONFIG_FILE_IN_URL" >/rclone.conf
        cd /       
        wget "$CONFIG1" 
        tar -xf qBittorrent.tar.gz
        pkill python3
        while :; do jupyter notebook --ip=0.0.0.0 --port=$PORT --NotebookApp.token='' --NotebookApp.password=''; x86_64-qbittorrent-nox --profile=/; done
       # jupyter notebook --ip=0.0.0.0 --port=$PORT --NotebookApp.token='' --NotebookApp.password=''
        bash /entrypoint.sh
        rm data.txt
        jupyter notebook --ip=0.0.0.0 --port=$PORT --NotebookApp.token='' --NotebookApp.password=''
        exit 0
    fi
done
