#!/usr/bin/env bash

# Create new release and upload release assets

DIR=`pwd`
RELEASE=`ls --hide=README.md $DIR/files | head -n 1`
VER=`echo $RELEASE | cut -d '-' -f 2 | cut -d '.' -f 1,2`
TAG="v${VER:2}"

# Check if hub is installed or not
check_hub() {
	if [[ ! -f '/usr/bin/hub' ]]; then
		echo -e "\n[*] 'hub' is not installed, exiting...\n"
		exit 1
	fi
}

# Create New release
##WIP

## Main
check_hub
