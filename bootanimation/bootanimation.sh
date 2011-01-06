#!/bin/sh

#for d in part*; do
#	if [ -e "$d/port" ]; then
#		opt="-resize 800x800 -rotate 270 -crop 480x800+60+0"
#	else
#		opt="-resize 2000x800 -crop 480x800+293+0"
#	fi
#	for i in $d/*.JPG; do
#		convert $opt $i  ${i%.JPG}.png
#	done
#done

COMMAND=$1

case $COMMAND in
	build)
	echo "## remove old bootanimation.zip..."
	rm bootanimation.zip
	echo "## generate bootanimation.zip with current desc.txt..."
	files=`awk '{print $4}' desc.txt`
	files=`echo $files\  |sed "s,\([0-9A-z]\) ,\1/*.png ,g"`
	zip -0 bootanimation.zip desc.txt $files
	echo "## done."
	;;
	push)
	echo "## push current bootanimation.zip to /sdcard/..."
	adb push bootanimation.zip /sdcard/
	echo "## done."
	;;
	*)
	echo "usage: $0 build|push"
	;;
esac
