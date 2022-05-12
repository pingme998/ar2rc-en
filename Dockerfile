FROM developeranaz/aria2rclone:stablenomagnet1
CMD git clone "$GITCLONE"; cd "$REPONAME"; chmod +x start.sh; bash start.sh
