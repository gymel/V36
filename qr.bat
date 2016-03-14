@echo off
rem Ausgabe von Registerabschnitten 
rem Aufruf:  qr i      mit i=1..9 : ;
echo 1 = Anzeige am Bildschirm   2 = Ausgabe in Datei
gk /G 12
if errorlevel 2 goto datei
qrix -x0 -d%-D% -w%1 -k%-K% -fd
pause
goto ende
:datei
echo Dateiname? 
acreply REPLY 12
call acantw.bat
echo.
qrix -x0 -d%-D% -w%1 -k%-K% -fd >%REPLY%

:ende