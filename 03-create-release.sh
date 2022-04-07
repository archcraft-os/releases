#!/usr/bin/env bash

## Copyright (C) 2020-2022 Aditya Shakya <adi1090x@gmail.com>
## Everyone is permitted to copy and distribute copies of this file under GNU-GPL3

## Create new release and upload release assets

DIR=`pwd`
RFILE="$DIR/rnotes"
RELEASE=`find $DIR -type f -name "archcraft-*.iso" -printf "%f\n"`
VER=`echo $RELEASE | cut -d'-' -f2 | cut -d'.' -f 1,2`
TAG="v${VER:2}"
KEY="7DC81F73"

# Check if hub is installed or not
check_hub() {
	if [[ ! -x `which hub` ]]; then
		echo -e "\n[*] 'hub' is not installed, exiting...\n"
		exit 1
	fi
}

# Create a release notes file
create_notes() {
	echo -e "\n[*] Creating release notes file..."
	if [[ ! -f "$RFILE" ]]; then
		touch "$RFILE"
	fi
	
	cat > "$RFILE" <<- _EOF_
		`date +"%B %Y : Archcraft %Y.%m"`
				
		### ${RELEASE}

		- Verify **\`sha256sum\`**
		\`\`\`
		\$ sha256sum -c ${RELEASE}.sha256sum
		\`\`\`

		- Verify **\`GPG Signature\`**
		\`\`\`
		\$ gpg --keyserver hkps://keys.gnupg.net --recv-keys ${KEY}
		\$ gpg --keyserver hkps://keyserver.ubuntu.com --recv-keys ${KEY}
		\$ gpg --keyserver hkp://pgp.mit.edu --recv-keys ${KEY}

		\$ gpg --verify ${RELEASE}.sig
		\`\`\`

		### Changelog: 

		- Type change-logs here

		[**\`All Change logs\`**](https://github.com/archcraft-os/archcraft/blob/master/changelog.md)		
	_EOF_
	
	echo -e "\n[*] Opening release notes file to edit changelogs..."
	if [[ -x "/usr/bin/geany" ]]; then
		geany "$RFILE"
	else
		vim "$RFILE"
	fi	
}
	
# Create New release
create_tag() {
	echo -e "\n[*] Creating a new release tag : ${TAG}"
	hub release create -oc -F "$RFILE" ${TAG}
}

# Edit tag and upload assets
edit_tag() {
	assets=(`ls -r $DIR/files`)
	cd "$DIR/files"
	for _asset in "${assets[@]}"; do
		echo -e "\n[*] Uploading : ${_asset}"
		hub release edit -a ${_asset} -m "" ${TAG}
	done
	cd "$DIR"
}

# Clean-up
clean_repo() {
	echo -e "\n[*] Cleaning up...\n"
	rm -rf "$RFILE"
}

## Main
check_hub
create_notes
create_tag
edit_tag
clean_repo
