@echo off
:: we need this to address variables (namely the errorlevel) in the nested if statement
setlocal enableDelayedExpansion
REM cd /d "%~dp0"
pushd "%~dp0" 2>NUL
call :read_settings w10lite.ini

:: determine the config we're gonna use
if %config%==tom (set cfg=ooshutup10tom.cfg
	) else if %config%==master (set cfg=ooshutup10tom.cfg
	) else if %config%==bare (set cfg=ooshutup10bare.cfg
	) else (
		echo "config" in w10lite.ini is not properly set. check your config
		pause
		exit
		)

:: legacy boot mode stuff
if %safemode%==legacy (bcdedit /set {default} bootmenupolicy legacy
	) else if %safemode%==modern (echo>nul
	) else (
		echo "safemode" in w10lite.ini is not properly set. check your config
		pause
		exit
		)

:: lets wait for 90 seconds to reduce the resource impact on startup
ping localhost -n 91 >nul
wget -N https://raw.githubusercontent.com/thaatz/w10lite/master/bin/%cfg%
:: we cant pipe the output of wget, so we make a log file instead
choco upgrade shutup10 -y
@REM wget -N https://dl5.oo-software.com/files/ooshutup10/OOSU10.exe -o testlog.txt
@REM if %config%==master (
@REM 	find /i "saved" testlog.txt >nul
@REM 	REM echo errorlevel !errorlevel!
@REM 	if !errorlevel!==0 (
@REM 		msg * OOSU10 was updated!
@REM 		)
@REM 	)
:: some other interesting message ideas that i did not use because the script will run as system, not user
:: but i might need this some other day
:: https://stackoverflow.com/questions/12514475/how-can-you-create-pop-up-messages-in-a-batch-script

::delete the wget log file
@REM del testlog.txt
OOSU10.exe %cfg% /quiet /nosrp
exit

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