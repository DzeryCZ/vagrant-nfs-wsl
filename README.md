# Vagrant Hanewin NFS

Manage and adds support for NFS on Windows under WSL.

## Supported Platforms

Only tested with Vagrant 1.5.0 or later

Supported guests:

  * Linux

## Requirements

* How to run Vagrant with WSL - [tutorial](https://www.w3cschool.cn/doc_vagrant/vagrant-other-wsl.html)
  * Basically you have to install the same version of Vagrant on Windows and on WSL and then connect them.
* Install Hanewin to `C:\Program Files\nfsd\`
* Mount Windows drives in wsl under root `/`. For Windows 10 18.03+ or newer edit `/etc/wsl.conf` like this:
  ```conf
  [automount]
  root = /
  options = "metadata"
  ```

## Installation

```
$ vagrant plugin install vagrant-hanewin-nfs-wsl
```

## Hanewin NFS

You need to install Hanewin NFS Server to use this plugin. Hanewin NFS is
shareware and can be evaluated for 30 days.D 

You can get it here:

http://www.hanewin.de/nfs-d.htm


## Thanks to

* @simonswine [vagrant-hanewin-nfs](https://github.com/simonswine/vagrant-hanewin-nfs) - implementation for windows cmd (without WSL)
* @GM-Alex [vagrant-winnfsd](https://github.com/GM-Alex/vagrant-winnfsd) - idea and basic structure of this plugin



