@echo off
cd /d "%~dp0\bin"
REM echo %time%>>testtest.txt
"wget" -N https://raw.githubusercontent.com/thaatz/w10lite/master/bin/ooshutup10.cfg
"wget" -N https://dl5.oo-software.com/files/ooshutup10/OOSU10.exe
OOSU10.exe ooshutup10.cfg /quiet /nosrp
pause