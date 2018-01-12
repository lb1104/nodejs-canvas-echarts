FROM ubuntu:16.04

RUN apt update -yqq &&\
    apt install -yqq tzdata &&\
    ln -sf /usr/share/zoneinfo/Asia/Chongqing /etc/localtime &&\
	echo "Asia/Chongqing" > /etc/timezone &&\
	dpkg-reconfigure -f noninteractive tzdata &&\
	apt install -yqq curl && curl -sL https://deb.nodesource.com/setup_6.x | bash -  && \
    apt install -yqq nodejs libcairo2-dev libjpeg8-dev libpango1.0-dev libgif-dev python&& \
    npm install -g canvas echarts lowdb&& \
    apt autoclean &&\
    apt autoremove &&\
    rm -rf /var/lib/apt/lists/*

ENV NODE_PATH /usr/lib/node_modules

ENV LANG C.UTF-8
