#!/usr/bin/env bash

# Make torrent file for Archcraft ISO

DIR="`pwd`/files"
TRACKERS="/tmp/trackers.txt"
RELEASE=`ls --hide=README.md $DIR | head -n 1`

# Web seed urls
WEB_SEED=(https://github.com/archcraft-os/releases/releases/download/v21.06/${RELEASE}
		  https://github.com/archcraft-os/releases/releases/download/v21.06/${RELEASE}.sha256sum
		  https://github.com/archcraft-os/releases/releases/download/v21.06/${RELEASE}.sig
)
_webseed_urls=`echo ${WEB_SEED[@]} | sed 's/ /,/g'`

# Fetch latest tracker urls
echo -e "\n[*] Getting most updated list of public BitTorrent trackers...\n"
curl -L -o ${TRACKERS} https://ngosang.github.io/trackerslist/trackers_best.txt

if [[ -f "$TRACKERS" ]]; then
	_tracker=(`cat ${TRACKERS} | sed -r '/^\s*$/d'`)
	_trackers_urls=`echo ${_tracker[@]} | sed 's/ /,/g'`
else
	echo -e "\n[*] File ${TRACKERS} does not exist."
	exit 1
fi

# Generate torrent file
echo -e "\n[*] Creating file torrent for ${RELEASE} ...\n"
mktorrent --announce="$_trackers_urls"\
		  --web-seed="$_webseed_urls"\
		  --comment="$RELEASE"\
		  --name="$RELEASE"\
		  --output="$DIR/${RELEASE}.torrent"\
		  --private\
		  --verbose\
		  "$DIR"

if [[ -f "$DIR/${RELEASE}.torrent" ]]; then 
	echo -e "\n[*] Torrent created successfully.\n"
else
	echo -e "\n[*] Failed to create torrent.\n"
fi
