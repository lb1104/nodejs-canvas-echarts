#!/bin/bash
# chmod +x docker.sh

#########docker ToolBox##########
# docker ToolBox 需要打开virtualbox设置default虚拟机，将程序所在盘如d:设置为共享文件夹D_DRIVE
# 只能在docker quickstart terminal下使用

#########docker for windows##########
# 需要配置shared drives
# 在git bash下运行./docker.sh,出现the input device is not a TTY. If you are using mintty, try prefixing the command with 'winpty'
# 需要重新安装git,选择use windows'default console window

fold_path=$(cd `dirname $0`; pwd)
#fold_name=$(basename $fold_path)

echo $fold_path

echarts_path=""  #挂载目录

is_win=$(echo $OS | grep -i "win")

is_docker_for_windows=$(which docker | grep -i "Resources/bin")

if [ $is_win ]; then
	# echo "win"
	disc=${fold_path:1:1}
	upper_disc=`echo $disc | tr a-z A-Z`
	# upper_disc=`echo ${fold_path:1:1} | awk '{print toupper($0);}'`
	if [[ "$is_docker_for_windows" != "" ]];then
        echarts_path="/${disc}:${fold_path:2}"  # /d:/www
	else
	    echarts_path="/${upper_disc}_DRIVE${fold_path:2}" #/D_DRIVE/www
	fi
else
	# echo "linux"
	echarts_path=$fold_path
fi

echo "echarts_path:"$echarts_path

date=$1  #带参数1
param=$2  #带参数2

if [ -n "$date" ];
then
	echo "arg:$date $param"
	docker run -v $echarts_path:/work -w //work --privileged -it lb1104/nodejs-canvas-echarts node //work/test.js $date $param
else
	echo "bash"
	docker run -v $echarts_path:/work -w //work --privileged -it lb1104/nodejs-canvas-echarts bash
fi

# docker for windows git bash下 /work 需要多加个/