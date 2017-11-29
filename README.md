# w10lite
## what it do? ##
This is supposed to be some Windows 10 debloating. In particular, this is supposed to automate O&O Shutup 10 configuration and updating.

If you run "bin\1addtask.bat" to install the scheduled task, the task will run in the background on login of any user approximately 90 seconds after the login. The 90 second wait is to reduce the startup impact on the computer and in some cases to allow a computer to establish an internet connection. If you do not want to have the script wait 90 seconds, you can manually run it using "runnow.bat", editing "bin\test.bat", or by manually using oosu10.exe.

## installation ##
1. run "bin\1addtask.bat" as administrator
1. log out
1. log in

run "bin\1removetask.bat" as administrator to uninstall

run "runnow.bat" to run the process right away (instead of waiting 90 seconds)

### todo ###
* add hwinfo debloat script with modifications
* ~~auto update oosu10.exe and cfg file from github~~
* ~~scheduled task to run on any user login~~

### binary sources ###
* wget from https://eternallybored.org/misc/wget/
