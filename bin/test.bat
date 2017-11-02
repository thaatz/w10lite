@echo off
cd /d "%~dp0"
REM lets wait for 90 seconds to reduce the resource impact on startup
ping localhost -n 91 >nul
echo %time%>>testtest.txt
REM "%~dp0\wget" -N https://dl5.oo-software.com/files/ooshutup10/OOSU10.exe
OOSU10.exe ooshutup10.cfg /quiet /nosrp
pause