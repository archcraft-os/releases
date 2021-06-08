#!/usr/bin/env bash

# Generate README.md file

DIR=`pwd`
FILE="$DIR/README.md"
RELEASE=`ls --hide=README.md $DIR/files | head -n 1`
URL="https://github.com/archcraft-os/releases/releases/download"
SITE="https://archcraft.io"
VER=`echo $RELEASE | cut -d '-' -f 2 | cut -d '.' -f 1,2`
TAG="v${VER:2}"
KEY="7DC81F73"
SHA=`cat $DIR/files/${RELEASE}.sha256sum | awk '{print $1}'`

# Empty the file
if [[ -f "$FILE" ]]; then
	echo -e "\n[*] Overwriting the file..."
	cat > "$FILE" &
fi

# Write new data in file
echo -e "\n[*] Generating README.md file..."
cat > "$FILE" <<- _EOF_
	<p align="center">
	<a href="${SITE}"><img src="https://raw.githubusercontent.com/archcraft-os/archcraft-misc-pkgs/main/archcraft-pixmaps/src/icons/archcraft.png" height="100" width="100" alt="Archcraft"></a>
	</p>

	<p align="center">
	<a href="https://www.buymeacoffee.com/adi1090x"><img width="32px" src="https://raw.githubusercontent.com/adi1090x/files/master/other/1.png" alt="Buy Me A Coffee"></a>
	<a href="https://ko-fi.com/adi1090x"><img width="32px" src="https://raw.githubusercontent.com/adi1090x/files/master/other/2.png" alt="Support me on ko-fi"></a>
	<a href="https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=U3VK2SSVQWAPN"><img width="32px" src="https://raw.githubusercontent.com/adi1090x/files/master/other/3.png" alt="Support me on Paypal"></a>
	<a href="https://www.patreon.com/adi1090x"><img width="32px" src="https://raw.githubusercontent.com/adi1090x/files/master/other/4.png" alt="Support me on Patreon"></a>
	</p>

	<p align="center">
	  <img src="https://img.shields.io/badge/Maintained%3F-Yes-green?style=flat-square">
	  <img src="https://img.shields.io/github/downloads/archcraft-os/releases/total?label=downloads&logo=github&color=blue&style=flat-square">
	  <img src="https://img.shields.io/sourceforge/dt/archcraft.svg?label=downloads&logo=sourceforge&color=teal&style=flat-square">
	  <img src="https://img.shields.io/github/license/archcraft-os/archcraft?style=flat-square">
	</p>

	<p align="center">
	Yet another minimal linux distribution, based on <a href="https://www.archlinux.org">Arch Linux</a>.
	</p>

	<p align="center">
	<a href="${SITE}">Home</a> | 
	<a href="${SITE}/install">Installation</a> | 
	<a href="${SITE}/features">Features</a> | 
	<a href="${SITE}/gallery">Screenshots</a> | 
	<a href="${SITE}/blog">Wiki</a>
	</p>

	![img](./.screens.png)

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
	- First, Verify the details of the key on keyserver, Open a terminal and run :
	\`\`\`
	\$ gpg --recv-keys ${KEY}
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

if [[ `cat $FILE | wc -l` -eq "60" ]]; then
	echo -e "\n[*] File generated successfully.\n"
	exit 0
else
	echo -e "\n[*] Failed to generate file.\n"
	exit 1
fi
