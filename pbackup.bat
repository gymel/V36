echo off
cls
echo.
echo.
echo          Jetzt erfolgt eine Gesamtsicherung
echo.
echo          Ihrer allegro-Datenbank  %2  im Verzeichnis:
echo.
echo          %1
echo.
echo.
echo          bitte best„tigen Sie 
echo.
echo          mit       j 
echo.
echo          die Richtigkeit dieser Angaben
echo          oder brechen Sie 
echo.
echo          mit       n
echo.
echo          an dieser Stelle ab
echo.

acreply si 2 sich.bat 
call sich.bat
if %si%/==j/ goto okay
if %si%/==n/ goto ende


:okay
cls
echo          bitte erste Sicherungsdiskette in Laufwerk a: schieben
echo          Wenn weitere gebraucht werden, fordert das Programm diese spaeter an
echo          (Abbruch:  Strg+c )
echo.
pause

copy  %1\%2.log %1\backlog >nul
del   %1\%2.log >nul
arj a a:\alleg -v1440  -u -r %1\%2*.*

:ende
