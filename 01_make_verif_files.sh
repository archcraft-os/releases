#!/usr/bin/env bash

## Generate sha256sum and gpg signature files

DIR="`pwd`/files"
RELEASE=`ls --hide=README.md $DIR | head -n 1`

if [[ -n "$RELEASE" ]]; then
	echo -e "\n[*] Generating sha256sum for ${RELEASE} ..."
	cd "$DIR" && sha256sum ${RELEASE} > ${RELEASE}.sha256sum
	if [[ -f "${RELEASE}.sha256sum" ]]; then
		echo -e "\n[*] Checksum generated successfully."
	else
		echo -e "\n[*] Failed to generate checksum file."
	fi	
	
	echo -e "\n[*] Generating gpg signature for ${RELEASE} ..."
	gpg --default-key adi1090x@gmail.com --output ${RELEASE}.sig --detach-sig ${RELEASE}
	if [[ -f "${RELEASE}.sig" ]]; then
		echo -e "\n[*] Signature generated successfully.\n"
	else
		echo -e "\n[*] Failed to generate signature file.\n"
	fi
else
	echo -e "\n[!] There's no ISO file in 'files' directory.\n"
	exit 1
fi
