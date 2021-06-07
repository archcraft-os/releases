<p align="center">
<a href="https://archcraft.io"><img src="https://raw.githubusercontent.com/archcraft-os/archcraft-misc-pkgs/main/archcraft-pixmaps/src/icons/archcraft.png" height="100" width="100" alt="Archcraft"></a>
</p>

<p align="center">
<a href="https://www.buymeacoffee.com/adi1090x"><img width="32px" src="https://raw.githubusercontent.com/adi1090x/files/master/other/1.png" alt="Buy Me A Coffee"></a>
<a href="https://ko-fi.com/adi1090x"><img width="32px" src="https://raw.githubusercontent.com/adi1090x/files/master/other/2.png" alt="Support me on ko-fi"></a>
<a href="https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=U3VK2SSVQWAPN"><img width="32px" src="https://raw.githubusercontent.com/adi1090x/files/master/other/3.png" alt="Support me on Paypal"></a>
<a href="https://www.patreon.com/adi1090x"><img width="32px" src="https://raw.githubusercontent.com/adi1090x/files/master/other/4.png" alt="Support me on Patreon"></a>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Maintained%3F-Yes-green?style=flat-square">
  <img src="https://img.shields.io/sourceforge/dt/archcraft.svg?color=teal&style=flat-square">
  <img src="https://img.shields.io/github/license/archcraft-os/archcraft?style=flat-square">
</p>

<p align="center">
Yet another minimal linux distribution, based on <a href="https://www.archlinux.org">Arch Linux</a>.
</p>

<p align="center">
<a href="https://archcraft.io">Home</a> | 
<a href="https://archcraft.io/install">Installation</a> | 
<a href="https://archcraft.io/features">Features</a> | 
<a href="https://archcraft.io/gallery">Screenshots</a> | 
<a href="https://archcraft.io/blog">Wiki</a>
</p>

#

### Latest Release

- **`ISO`** : [archcraft-2021.06.06-x86_64.iso](https://github.com/archcraft-os/releases/releases/download/v21.06/archcraft-2021.06.06-x86_64.iso)
- **`SIG`** : [archcraft-2021.06.06-x86_64.iso.sig](https://github.com/archcraft-os/releases/releases/download/v21.06/archcraft-2021.06.06-x86_64.iso.sig)
- **`SHA`** : [archcraft-2021.06.06-x86_64.iso.sha256sum](https://github.com/archcraft-os/releases/releases/download/v21.06/archcraft-2021.06.06-x86_64.iso.sha256sum)
`de3781ce9016b83c92140ba673c6b3491ebe00a8daf6e561baf83fd7e1c1882f`
- **`TORRENT`** : [archcraft-2021.06.06-x86_64.iso.torrent](https://github.com/archcraft-os/releases/releases/download/v21.06/archcraft-2021.06.06-x86_64.iso.torrent)

### Verify the authenticity of the ISO

- Download the **`ISO`**, **`gpg signature`** and **`sha256sum`** files
- Make sure all the files are present in the same directory (Assuming `~/Downloads`)
- First, Verify the details of the key on keyserver, Open a terminal and run :
```
$ gpg --recv-keys 7DC81F73
```

- Then, Open `terminal` in the `~/Downloads` folder and run following command :
```
$ gpg --verify archcraft-2021.06.06-x86_64.iso.sig
```

- Finally, Verify the `sha256sum` by running :
```
$ sha256sum -c archcraft-2021.06.06-x86_64.iso.sha256sum
```
