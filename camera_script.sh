#!/bin/sh

if [ `uname` == "Linux" ]
then 
	cd /mnt/tv/VideoSec
else
	cd /d/temp/photo
fi

if [ ! -z "$1" ]; then
  echo "Parameter 1:" $1
  dfilt=$1
else
  echo "No parameter 1"
  dfilt="14_6_7"
  exit 1
fi

list_day="1"
if [ ! -z "$2" ]; then
  echo "Parameter 2:" $2
  list_day=$2
else
  echo "No parameter 2"
  exit 1
fi

#IFS=' ' read -a array <<< "$list_day"
#array=(${list_day// / })
#IFS=' '

dfilt2=$dfilt
#for c in "${array[@]}"

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

find . -iname "IPC_IPCamera_${dfilt}_*" | while read filename; do \
 echo $filename; \
 shortname=$(basename $filename); \
 if [ $filename != "./$dfilt/$shortname" ]; then \
   echo mv $filename; \
   mv $filename $dfilt; \
 fi; \
done;

done;
