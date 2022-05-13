FROM ubuntu:latest
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update
RUN apt install curl git unzip zip python3 pip jupyter aria2 -y
RUN pip install voila 
RUN pip install flask
RUN curl https://rclone.org/install.sh | bash
CMD cd /; git clone "$GITCLONE"; chmod +x /$REPONAME/start.sh; /$REPONAME/start.sh
