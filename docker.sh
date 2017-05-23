#!/bin/bash
# chmod +x docker.sh
# docker rm $(docker ps -a -q) #删除所有未运行的容器

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
	upper_disc=`echo ${fold_path:1:1} | tr a-z A-Z`
	# upper_disc=`echo ${fold_path:1:1} | awk '{print toupper($0);}'`
	if [[ "$is_docker_for_windows" != "" ]];then
        echarts_path="/${fold_path:1:1}:${fold_path:2}"
	else
	    echarts_path="/${upper_disc}_DRIVE${fold_path:2}"
	fi
else
	# echo "linux"
	echarts_path=$fold_path
fi

echo "echarts_path:"$echarts_path


docker run -v $echarts_path:/work -w //work --privileged -it node:canvas bash
