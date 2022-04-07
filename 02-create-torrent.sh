#!/usr/bin/env bash

## Copyright (C) 2020-2022 Aditya Shakya <adi1090x@gmail.com>
## Everyone is permitted to copy and distribute copies of this file under GNU-GPL3

## Make torrent file for Archcraft ISO
PWD=`pwd`
DIR="$PWD/files"
TRACKERS="/tmp/trackers.txt"
RELEASE=`find $DIR -type f -name "archcraft-*.iso" -printf "%f\n"`
VER=`echo $RELEASE | cut -d'-' -f2 | cut -d'.' -f 1,2`
TAG="v${VER:2}"

# Web seed urls
WEB_SEED=(https://github.com/archcraft-os/releases/releases/download/${TAG}/${RELEASE}
		  https://github.com/archcraft-os/releases/releases/download/${TAG}/${RELEASE}.sha256sum
		  https://github.com/archcraft-os/releases/releases/download/${TAG}/${RELEASE}.sig
)
_webseed_urls=`echo ${WEB_SEED[@]} | sed 's/ /,/g'`

# Fetch latest tracker urls
echo -e "\n[*] Getting most updated list of public BitTorrent trackers...\n"
curl -L -o ${TRACKERS} https://ngosang.github.io/trackerslist/trackers_best.txt

if [[ -e "$TRACKERS" ]]; then
	_tracker=(`cat ${TRACKERS} | sed -r '/^\s*$/d'`)
	_trackers_urls=`echo ${_tracker[@]} | sed 's/ /,/g'`
else
	echo -e "\n[!] File ${TRACKERS} does not exist."
	exit 1
fi

# Generate torrent file
echo -e "\n[*] Creating file torrent for ${RELEASE} ...\n"
mktorrent --announce="$_trackers_urls"\
		  --web-seed="$_webseed_urls"\
		  --comment="$RELEASE"\
		  --name="${RELEASE%.*}"\
		  --output="$DIR/${RELEASE}.torrent"\
		  --verbose\
		  "$DIR"

if [[ -e "$DIR/${RELEASE}.torrent" ]]; then 
	echo -e "\n[*] Torrent created successfully.\n"
else
	echo -e "\n[!] Failed to create torrent.\n"
fi
