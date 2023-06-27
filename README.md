# w10lite
## what it do? ##
This is supposed to be some Windows 10 debloating. In particular, this is supposed to automate O&O Shutup 10 configuration and updating.

## installation ##
1. install chocolatey
    - `Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))`
    - https://chocolatey.org/install
1. run "shell:startup" and make a shortcut to runnow.bat in this location
1. log out
1. log in

## uninstall
1. delete the runnow.bat shortcut in the startup folder

### todo ###
* add hwinfo debloat script with modifications
* ~~auto update oosu10.exe and cfg file from github~~
* ~~scheduled task to run on any user login~~
* use chocolatey installation
