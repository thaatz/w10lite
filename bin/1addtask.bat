@echo off
REM schtasks usage info at https://technet.microsoft.com/en-us/library/bb490996.aspx
cd /d "%~dp0"
choco upgrade wget -y
choco upgrade shutup10 -y
:: http://superuser.com/questions/243605/how-do-i-specify-run-with-highest-privileges-in-schtasks
setlocal
SchTasks /Create /SC ONLOGON /TN "OOSU10" /TR "'%cd%\test.bat'" /RU SYSTEM
pause