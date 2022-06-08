#!/usr/bin/env bash

## Copyright (C) 2020-2022 Aditya Shakya <adi1090x@gmail.com>
## Everyone is permitted to copy and distribute copies of this file under GNU-GPL3

## Generate README.md file

DIR=`pwd`
FILE="$DIR/README.md"
URL="https://github.com/archcraft-os/releases/releases/download"
SITE="https://archcraft.io"
WIKI="https://wiki.archcraft.io"
RELEASE=`find $DIR -type f -name "archcraft-*.iso" -printf "%f\n"`
VER=`echo $RELEASE | cut -d'-' -f2 | cut -d'.' -f 1,2`
TAG="v${VER:2}"
KEY="7DC81F73"
SHA=`cat $DIR/files/${RELEASE}.sha256sum | awk '{print $1}'`

# Truncate the file
if [[ -f "$FILE" ]]; then
	echo -e "\n[*] Overwriting `basename $FILE`..."
	: > "$FILE"
fi

# Write new data in file
echo -e "\n[*] Generating README.md file..."
cat > "$FILE" <<- _EOF_
	<p align="center">
	  <a href="${SITE}"><img src="https://raw.githubusercontent.com/archcraft-os/archcraft-packages/main/archcraft-artworks/files/logo/png/logo-circle/logo-circle-1.png" height="100" width="100" alt="Archcraft"></a>
	</p>

	<p align="center">
	  <a href="https://ko-fi.com/adi1090x"><img width="32px" src="https://raw.githubusercontent.com/archcraft-os/.github/main/profile/assets/1.png" alt="Donate for Archcraft on ko-fi"></a>&nbsp;
	  <a href="https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=6VETHHYHXESRN"><img width="32px" src="https://raw.githubusercontent.com/archcraft-os/.github/main/profile/assets/2.png" alt="Donate for Archcraft via Paypal"></a>&nbsp;
	  <a href="https://liberapay.com/adi1090x"><img width="32px" src="https://raw.githubusercontent.com/archcraft-os/.github/main/profile/assets/3.png" alt="Donate for Archcraft via Liberapay"></a>
	</p>

	<p align="center">
	  <img src="https://img.shields.io/badge/Maintained%3F-Yes-green?style=flat-square">
	  <img src="https://img.shields.io/github/downloads/archcraft-os/releases/total?label=downloads&logo=github&color=blue&style=flat-square">
	  <img src="https://img.shields.io/sourceforge/dt/archcraft.svg?label=downloads&logo=sourceforge&color=teal&style=flat-square">
	  <img src="https://img.shields.io/github/license/archcraft-os/releases?color=orange&style=flat-square">
	</p>

	<p align="center">
	Yet another minimal linux distribution, based on <a href="https://www.archlinux.org">Arch Linux</a>.
	</p>

	<p align="center">
	  <a href="${SITE}" target="_blank"><img alt="home" src="https://img.shields.io/badge/HOME-blue?style=flat-square"></a>
	  <a href="${WIKI}" target="_blank"><img alt="wiki" src="https://img.shields.io/badge/WIKI-blue?style=flat-square"></a>
	  <a href="${SITE}/gallery" target="_blank"><img alt="screenshots" src="https://img.shields.io/badge/SCREENSHOTS-blue?style=flat-square"></a>
	  <a href="https://www.reddit.com/r/archcraft" target="_blank"><img alt="reddit" src="https://img.shields.io/badge/REDDIT-blue?style=flat-square"></a>
	  <a href="https://discord.gg/3PzeJ5S7Pu" target="_blank"><img alt="discord" src="https://img.shields.io/badge/DISCORD-blue?style=flat-square"></a>
	  <a href="https://t.me/archcraftos" target="_blank"><img alt="telegram" src="https://img.shields.io/badge/TELEGRAM-blue?style=flat-square"></a>
	  <a href="https://matrix.to/#/#archcraft:matrix.org" target="_blank"><img alt="matrix" src="https://img.shields.io/badge/MATRIX-blue?style=flat-square"></a>
	</p>

	![img](https://raw.githubusercontent.com/archcraft-os/core-packages/main/calamares-config/files/calamares/branding/archcraft/welcome.png)

	#

	### Latest Release

	- **\`ISO\`** : [${RELEASE}](${URL}/${TAG}/${RELEASE})
	- **\`SIG\`** : [${RELEASE}.sig](${URL}/${TAG}/${RELEASE}.sig)
	- **\`SHA\`** : [${RELEASE}.sha256sum](${URL}/${TAG}/${RELEASE}.sha256sum)
	\`${SHA}\`
	- **\`TORRENT\`** : [${RELEASE}.torrent](${URL}/${TAG}/${RELEASE}.torrent)

	### Verify the authenticity of the ISO

	- Download the **\`ISO\`**, **\`gpg signature\`** and **\`sha256sum\`** files
	- Make sure all the files are present in the same directory (Assuming \`~/Downloads\`)
	- First, Verify the details of the key on keyserver, Open a terminal and run (any one):
	\`\`\`
	\$ gpg --keyserver hkps://keys.gnupg.net --recv-keys ${KEY}
	\$ gpg --keyserver hkps://keyserver.ubuntu.com --recv-keys ${KEY}
	\$ gpg --keyserver hkp://pgp.mit.edu --recv-keys ${KEY}
	\`\`\`

	- Then, Open \`terminal\` in the \`~/Downloads\` folder and run following command :
	\`\`\`
	\$ gpg --verify ${RELEASE}.sig
	\`\`\`

	- Finally, Verify the \`sha256sum\` by running :
	\`\`\`
	\$ sha256sum -c ${RELEASE}.sha256sum
	\`\`\`
_EOF_

if [[ `cat $FILE | wc -l` -eq "63" ]]; then
	echo -e "\n[*] File generated successfully.\n"
	read -p "[?] Do you want to delete the 'files' directory (y/n) : "
	if [[ "$REPLY" == "y" ]]; then
		rm -rf "$DIR/files"
	fi
	echo && exit 0
else
	echo -e "\n[*] Failed to generate file.\n"
	exit 1
fi
