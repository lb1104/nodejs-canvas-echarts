#!/bin/bash
fold_path=$(cd `dirname $0`; pwd)
#echo $fold_path


is_win=$(echo $OS | grep -i "win")

if [ $is_win ]; then
	# echo "win"
	upper_disc=`echo ${fold_path:1:1} | tr a-z A-Z`
	# upper_disc=`echo ${fold_path:1:1} | awk '{print toupper($0);}'`
	img_path="/${upper_disc}_DRIVE${fold_path:2}"
	echo "img_path:"$img_path
	docker-machine start
	docker-machine ssh default "docker run -v $img_path:/work --privileged --rm lb1104/nodejs-canvas-echarts node /work/test.js"

else
	# echo "linux"
	img_path=$fold_path
	echo "img_path:"$img_path
	docker run -v $img_path:/work --privileged --rm lb1104/nodejs-canvas-echarts node /work/test.js
fi
