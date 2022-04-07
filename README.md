<p align="center">
<a href="https://archcraft.io"><img src="https://raw.githubusercontent.com/archcraft-os/archcraft-packages/main/archcraft-artworks/files/logo/png/logo-circle/logo-circle-1.png" height="100" width="100" alt="Archcraft"></a>
</p>

<p align="center">
<a href="https://www.buymeacoffee.com/adi1090x"><img width="32px" src="https://raw.githubusercontent.com/adi1090x/files/master/other/1.png" alt="Buy Me A Coffee"></a>
<a href="https://ko-fi.com/adi1090x"><img width="32px" src="https://raw.githubusercontent.com/adi1090x/files/master/other/2.png" alt="Donate for Archcraft on ko-fi"></a>
<a href="https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=6VETHHYHXESRN"><img width="32px" src="https://raw.githubusercontent.com/adi1090x/files/master/other/3.png" alt="Donate for Archcraft via Paypal"></a>
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
  <a href="https://archcraft.io" target="_blank"><img alt="home" src="https://img.shields.io/badge/HOME-blue?style=flat-square"></a>
  <a href="https://wiki.archcraft.io" target="_blank"><img alt="wiki" src="https://img.shields.io/badge/WIKI-blue?style=flat-square"></a>
  <a href="https://archcraft.io/gallery" target="_blank"><img alt="screenshots" src="https://img.shields.io/badge/SCREENSHOTS-blue?style=flat-square"></a>
  <a href="https://www.reddit.com/r/archcraft" target="_blank"><img alt="reddit" src="https://img.shields.io/badge/REDDIT-blue?style=flat-square"></a>
  <a href="https://discord.gg/3PzeJ5S7Pu" target="_blank"><img alt="discord" src="https://img.shields.io/badge/DISCORD-blue?style=flat-square"></a>
  <a href="https://t.me/archcraftos" target="_blank"><img alt="telegram" src="https://img.shields.io/badge/TELEGRAM-blue?style=flat-square"></a>
  <a href="https://matrix.to/#/#archcraft:matrix.org" target="_blank"><img alt="matrix" src="https://img.shields.io/badge/MATRIX-blue?style=flat-square"></a>
</p>

![img](https://raw.githubusercontent.com/archcraft-os/core-packages/main/calamares-config/files/calamares/branding/archcraft/welcome.png)

#

### Latest Release

- **`ISO`** : [archcraft-2022.02.02-x86_64.iso](https://github.com/archcraft-os/releases/releases/download/v22.02/archcraft-2022.02.02-x86_64.iso)
- **`SIG`** : [archcraft-2022.02.02-x86_64.iso.sig](https://github.com/archcraft-os/releases/releases/download/v22.02/archcraft-2022.02.02-x86_64.iso.sig)
- **`SHA`** : [archcraft-2022.02.02-x86_64.iso.sha256sum](https://github.com/archcraft-os/releases/releases/download/v22.02/archcraft-2022.02.02-x86_64.iso.sha256sum)
`c5c19c0b7d5382ed6f1db2c91d6c2d426ffd0111f62cbac455315abd1bd736df`
- **`TORRENT`** : [archcraft-2022.02.02-x86_64.iso.torrent](https://github.com/archcraft-os/releases/releases/download/v22.02/archcraft-2022.02.02-x86_64.iso.torrent)

### Verify the authenticity of the ISO

- Download the **`ISO`**, **`gpg signature`** and **`sha256sum`** files
- Make sure all the files are present in the same directory (Assuming `~/Downloads`)
- First, Verify the details of the key on keyserver, Open a terminal and run (any one):
```
$ gpg --keyserver hkps://keys.gnupg.net --recv-keys 7DC81F73
$ gpg --keyserver hkps://keyserver.ubuntu.com --recv-keys 7DC81F73
$ gpg --keyserver hkp://pgp.mit.edu --recv-keys 7DC81F73
```

- Then, Open `terminal` in the `~/Downloads` folder and run following command :
```
$ gpg --verify archcraft-2022.02.02-x86_64.iso.sig
```

- Finally, Verify the `sha256sum` by running :
```
$ sha256sum -c archcraft-2022.02.02-x86_64.iso.sha256sum
```
