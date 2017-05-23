FROM ubuntu:16.04
# docker pull lb1104/node-canvas
# docker.sh build -t nodejs:canvas . #生成镜像
# docker.sh rm $(docker.sh ps -a -q) #删除所有未运行的容器
USER root
# 更新源,时区
RUN sed -i 's/http:\/\/.*\.com/http:\/\/mirrors\.aliyun\.com/g' /etc/apt/sources.list && apt update -yqq &&\
    apt install -yqq tzdata &&\
    ln -sf /usr/share/zoneinfo/Asia/ShangHai /etc/localtime &&\
	echo "Asia/Shanghai" > /etc/timezone &&\
	dpkg-reconfigure -f noninteractive tzdata &&\
	apt install -yqq curl && curl -sL https://deb.nodesource.com/setup_6.x | bash -  && \
    apt install -yqq nodejs libcairo2-dev libjpeg8-dev libpango1.0-dev libgif-dev python&& \
    npm install -g canvas && \
    apt autoclean &&\
    apt autoremove &&\
    rm -rf /var/lib/apt/lists/*
#build-essential g++
ENV NODE_PATH /usr/lib/node_modules
# 中文，toolbox 似乎没有反应
ENV LANG C.UTF-8
