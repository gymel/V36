@echo off
rem _RESTORE.BAT Zurueck-Kopieren einer Datenbank + Einspeisen der LOG-Datei
rem 2001-01-19 / 2011-01-25

rem Wird aufgerufen von _RESTORE.FLX mit folgenden Parametern:
rem %1 = Datenverzeichnis (DbDir) (ohne \ am Ende, sonst geht copy nicht)
rem %2 = Datenbankname
rem %3 = Sicherungsverzeichnis (mit \ am Ende)
rem %4 = Konfig-Name
rem %5 = Konfig-Buchstabe
rem %6 = Programmverz. (\ am Ende)
rem %7 = Name der AnzeigeParam
rem %8 = Name der INI-Datei
cls
echo 1Restaurieren der Datenbank ist im Gange > %1\%2.sgf
echo.
echo.
echo Sicherungskopie der Datenbank   %3%2
echo   soll kopiert werden nach   %1
echo.
echo (Bei Abbruch muss a99 von Hand neu gestartet werden,
echo  sonst kommt es nach der Restaurierung selbst zurck)
echo.
echo  === Start mit Leertaste, oder Abbruch mit Strg+c ===

rem Diese Zeile wegnehmen, wenn es ohne Pause anlaufen soll:
pause >nul

:start
echo.
echo Kopieren l„uft:
echo.
echo Datenbankdateien...
copy %3%2*.%5ld %1 >nul
echo Satztabelle...
copy %3%2.tbl %1 >nul
echo Indexdatei...
copy %3%2.%5dx %1 >nul
if exist %3%2.stl echo Kurztiteldatei...
if exist %3%2.stl copy %3%2.stl %1 >nul
if exist %3%2.res echo Restriktionendatei...
if exist %3%2.res copy %3%2.res %1 >nul

rem diese brauchen nicht zurueck:
:echo Formulardateien
:copy %3%2*.frm %1 >nul
:echo Hilfedateien  
:copy %3%2*.rtf %1 >nul
:echo Konfigurationsdateien
:if exist %3*.cfg copy %3*.cfg %1 >nul
:rem  Alle Parameter, FLEXe, RTF und H* kopieren
:copy %3*.%5p? %1 >nul
:copy %3*.rtf %1  >nul
:copy %3h*. %1 >nul
:copy %3*.flx %1 >nul

rem Pruefen: Ist Index kopiert?
rem (in _RESTORE.FLX wird das nochmal geprueft!)
if not exist %1\%2.%5dx goto error

:freigeben
rem  TBL wieder freigeben, damit update schreiben kann
%6free %1\%2.TBL
rem (denn Sicherungskopie war gesperrt!)
echo.
echo Kopieraktion beendet,
echo.
echo    Datenbank mit allem Zubeh”r ist auf %1 kopiert
echo    Jetzt muss noch die LOG-Datei eingespeist werden, 
echo    um den aktuellen Zustand wiederherzustellen!
echo.

rem echo Leertaste, dann geht es weiter
rem pause >nul
set -P=%6
rem %6upd -f9 -d%1 -k%4 -u%1\%2.log -n1 -m1 -F


%6acon -jupdate -b%2 -d%1 -u%1\%2.log -n1 -k%4 >protok
goto exit

:error
echo Kopieren nicht vollst„ndig gelungen, Indexdatei nicht vorhanden
dir %1\%2*.*
pause
goto ende

:exit
rem Signalfile wieder auf 0 - Totalsperre aufheben

echo ----
echo LOG-Datei ist eingemischt, evtl. wollen Sie jetzt noch
echo kontrollieren, bevor ich die Totalsperre aufhebe...
pause

echo 0Restaurieren erledigt > %1\%2.sgf
rem jetzt a99 wieder starten %8 = Name der INI-Datei
start %6a99 %8



:ende
