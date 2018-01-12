# nodejs-canvas-echarts

docker基于ubuntu16.04，安装nodejs,canvas全局模块，设置时区，utf8，主要用于nodejs后端使用echarts，生成报表图片文件,支持汉字。

~~~bash

docker pull lb1104/nodejs-canvas-echarts 	#拉取镜像,或者build,修改docker.sh里面的镜像名
./docker.sh 			#映射目录,进入ubuntu环境
	node test 			#在ubuntu环境下生成box.png

~~~
