FROM ubuntu:latest
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update
RUN apt install curl git unzip zip python3 pip jupyter aria2 -y
# RUN echo 'voila==0.2.15' >reqx.txt
COPY req.txt /req.txt
RUN cat /req.txt | sed 's/^/pip install /g' >req2.sh
RUN chmod +x /req2.sh
RUN bash /req2.sh
#RUN pip install -r req.txt
RUN curl https://rclone.org/install.sh | bash
CMD cd /; git clone "$GITCLONE"; chmod +x /$REPONAME/start.sh; /$REPONAME/start.sh
