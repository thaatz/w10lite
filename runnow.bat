@echo off
REM cd /d "%~dp0\bin"
pushd "%~dp0\bin" 2>NUL

call :read_settings w10lite.ini

REM determine the config we're gonna use
if %config%==tom (set cfg=ooshutup10tom.cfg
	) else if %config%==bare (set cfg=ooshutup10bare.cfg
	) else echo "config" in w10lite.ini is not properly set. check your config

REM legacy boot mode stuff
if %safemode%==legacy (bcdedit /set {default} bootmenupolicy legacy
	) else if %safemode%==modern (echo>nul
	) else echo "safemode" in w10lite.ini is not properly set. check your config

:: lets wait for 90 seconds to reduce the resource impact on startup
REM ping localhost -n 91 >nul
REM echo %time%>>testtest.txt
wget -N https://raw.githubusercontent.com/thaatz/w10lite/master/bin/%cfg%
wget -N https://dl5.oo-software.com/files/ooshutup10/OOSU10.exe
OOSU10.exe %cfg% /quiet /nosrp

:read_settings
set SETTINGSFILE=%1
if not exist %SETTINGSFILE% (
	echo w10lite.ini does not exist
	pause
    exit
)
for /f "eol=# delims== tokens=1,2" %%i in (%SETTINGSFILE%) do (
    set %%i=%%j
)
exit /b 0