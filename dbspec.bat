@echo off
cls
echo Geben Sie den Namen fr ein neues Verzeichnis ein, wo Ihre 
echo Datenbank angelegt werden soll:
acreply reply 64
call acantw.bat

set -d=%REPLY%
if %REPLY%x == x goto fehler
md %REPLY% >NUL
if errorlevel 1 goto fehler
copy %-P%\demo2\*.ap? %REPLY%

%-P%\presto -f1 -a3 -icat -n1 -l%-L%
goto ende
:fehler
echo Verzeichnis kann nicht angelegt werden

:ende
