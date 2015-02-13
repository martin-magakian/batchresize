#!/bin/bash



function isRecursive() {
	if [ "$1" = "-r" ]; then
		echo ""
	elif [ "$1" = "-R" ]; then
		echo ""
	else
		echo "-print -maxdepth 1"
	fi
}

function resolution() {
	if [ "$1" = "retina" ] || [ "$2" = "retina" ]; then
		echo "2880x1800"
	elif [ "$1" = "nonretina" ] || [ "$2" = "nonretina" ]; then
		echo "1440x900"
	elif [ "$1" = "mini" ] || [ "$2" = "mini" ]; then
                echo "800x600"
	else
		resolution "retina"
	fi
}

function checkMogrifyInstall() {
	mogrify -version >/dev/null 2>&1 || { echo -e "ImageMagick need to be installed first.\n brew install imagemagick\n apt-get install imagemagick" >&2; exit 1; }
}

function resize() {
	if [ $1 == "dry" ]; then
		find . -iname '*.jpg' -type f $2
	elif [ $1 == "do" ]; then
		checkMogrifyInstall
		find . -iname '*.jpg' -type f $2 -exec echo -n '"{}" ' \; | xargs -P 8 -n 8 mogrify -resize $3
		#$cmd | xargs -P 8 -n 8 mogrify -resize $3
	fi
}

function warning() {
	echo "$(tput setaf 1)$(tput setab 0)"
	echo "*****************************"
	echo "********* WARNING ***********"
	echo "*****************************"
	echo "Your picture will be altered$(tput sgr 0)"
}

function displayNotice() {
	echo "supported size:"
	echo "retina|nonretina|mini"
	echo ""
	echo "* Resize pictures in current directory to retina size"
	echo "$ batchresize.sh retina"
	echo "* Resize pictures recurcivly in current directory to nonretina size"
	echo "$ batchresize.sh -R nonretina"
}

if [ "$1" = "--help" ] || [ "$2" = "--help" ]; then
	displayNotice
	exit
fi

recursive=$(isRecursive $1)
resolution=$(resolution $1 $2)

resize "dry" "${recursive}" $resolution
warning
echo "resize all by $resolution ? [y/n] "
while true; do
read yn
case $yn in
    [Yy]* ) resize "do" "${recursive}" $resolution; break;;
    [Nn]* ) break;;
    * ) echo "Please answer yes or no. [y/n]";;
esac
done



#find . -iname "*.jpg" -type f -print | xargs -P 8 -n 8 mogrify -resize 2880x1800
