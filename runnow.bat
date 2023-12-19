@echo off
REM cd /d "%~dp0\bin"
pushd "%~dp0" 2>NUL

REM legacy boot mode stuff
bcdedit /set {default} bootmenupolicy legacy

curl.exe -s --insecure "https://raw.githubusercontent.com/ChrisTitusTech/winutil/main/ooshutup10_winutil_settings.cfg" -o ooshutup10.cfg
rem curl.exe -s --insecure "https://dl5.oo-software.com/files/ooshutup10/OOSU10.exe" -o OOSU10.exe
choco upgrade shutup10 -y
rem we use start /wait (alternatively we could use cmd /c) because if it executes too quickly the subsequent runs wont go
rem sometimes start /wait wont work when using the commandline shim for oosu10
start "" /wait %programdata%\chocolatey\lib\shutup10\tools\oosu10.exe ooshutup10.cfg /quiet
@REM oosu10.exe ooshutup10.cfg /quiet
oosu10.exe ooshutup10tom.cfg /quiet
popd
exit /b 0