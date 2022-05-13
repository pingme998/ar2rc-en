FROM ubuntu:latest
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update
RUN apt install curl git unzip zip python3 pip jupyter aria2 -y
# RUN echo 'voila==0.2.15' >reqx.txt
COPY req0.txt /req0.txt
RUN pip install ipython 
RUN pip install flask
RUN pip install voila
RUN curl https://rclone.org/install.sh | bash
CMD cd /; git clone "$GITCLONE"; chmod +x /$REPONAME/start.sh; /$REPONAME/start.sh
