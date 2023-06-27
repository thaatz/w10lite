@echo off
REM cd /d "%~dp0\bin"
pushd "%~dp0" 2>NUL

REM legacy boot mode stuff
bcdedit /set {default} bootmenupolicy legacy

curl.exe -s --insecure "https://raw.githubusercontent.com/ChrisTitusTech/winutil/main/ooshutup10_winutil_settings.cfg" -o ooshutup10.cfg
rem curl.exe -s --insecure "https://dl5.oo-software.com/files/ooshutup10/OOSU10.exe" -o OOSU10.exe
choco upgrade shutup10 -y
oosu10.exe ooshutup10.cfg /quiet
oosu10.exe ooshutup10tom.cfg /quiet
popd
exit /b 0