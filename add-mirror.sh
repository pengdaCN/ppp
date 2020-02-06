#! /bin/bash -
work=/home/pengda/registry/ppp
add() {
	name=$(echo $1 | awk 'BEGIN{FS="/"} {print $NF}') # 获取镜像名+tag
	dir=$(echo $name | awk 'BEGIN{FS=":"} {print $1}')
	if [ -z $dir ]; then
		exit 1
	fi
	[ ! -d $dir ] && mkdir $dir
	echo "FROM $1" > $work/$dir/Dockerfile
	unset dir
	unset name
}

for image in $@; do
	add $image
done
unset image
