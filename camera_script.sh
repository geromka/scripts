#!/bin/sh

if [ `uname` == "Linux" ]
then 
	cd /mnt/tv/VideoSec
else
	cd /d/temp/photo
fi

if [ ! -z "$1" ]; then
	echo "Parameter 1 (Year_Month):" $1
	dfilt=$1
else
	echo "No parameter 1 (Year_Month)"
	dfilt="14_6_7"
	exit 1
fi

list_day="1"
if [ ! -z "$2" ]; then
	echo "Parameter 2 (\"List Days\"):" $2
	list_day=$2
else
	echo "No parameter 2(\"List Days\")"
	exit 1
fi

dfilt2=$dfilt

for c in $list_day
do
	dfilt=$dfilt2"_"$c
	echo $dfilt
	#break
	if [ ! -d $dfilt ]; then
	   mkdir $dfilt
	else
	  echo "directory exist"
	fi


#find . -iname "IPC_IPCamera_${dfilt}_*"
ls -p IPC_IPCamera_${dfilt}_* | grep -v / | while read filename; do \
	shortname="${filename##*/}"; \
	if [ $filename != "./$dfilt/$shortname" ]; then \
		echo "mv $filename"; \
		mv $filename $dfilt; \
	fi; \
done;

done;
