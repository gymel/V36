@echo off
rem BACKUP.BAT (Sicherungs-)Kopieren einer Datenbank + zugehoeriger Dateien
rem 2001-01-13 / 2011-01-25
rem Zielverzeichnis muss schon existieren (Anlage in _BACKUP.FLX)
rem Erzeugt auch eine ...rest.bat (z.B. catrest.bat) auf dem DbDir,
rem die bei Bedarf manuell gestartet werden kann, wenn a99 versagt

rem Wird aufgerufen von _BACKUP.FLX mit folgenden Parametern:
rem %1 = Datenverzeichnis (DbDir) (mit \ am Ende)
rem %2 = Datenbankname
rem %3 = Zielverzeichnis (ohne \ am Ende, sonst geht copy nicht)
rem %4 = Konfig-Name
rem %5 = Konfig-Buchstabe
rem %6 = Programmverz.
rem %7 = Name der AnzeigeParam
rem %8 = Y oder N: Wenn Y, dann LOG-Datei l”schen (Typ "Sicherungskopie")
rem %9 = Language (ger or eng ...)

echo.
echo.
echo Datenbank   %1%2
echo   soll kopiert werden nach   %3
echo.
echo Start mit Leertaste, oder Abbruch mit Strg+c

rem Diese Zeile wegnehmen, wenn es ohne Pause anlaufen soll:
pause >nul

rem Zur Sicherheit:
rem Nochmal pruefen, ob auf das Verz. geschrieben werden kann
echo TEST >%3\test.dat
if exist %3\test.dat goto start

echo Verzeichnis %3 funktioniert nicht, evtl. kein Schreibrecht
pause
goto exit

:start
echo.
echo Kopieren l„uft:
echo.
rem erst die Testdatei wieder loeschen
del %3\test.dat >nul
echo Datenbankdateien...
copy %1%2*.%5ld %3 >nul
echo Satztabelle...
copy %1%2.tbl %3 >nul
if exist %1%2.stl echo Kurztiteldatei...
if exist %1%2.stl copy %1%2.stl %3 >nul
if exist %1%2.res echo Restriktionendatei...
if exist %1%2.res copy %1%2.res %3 >nul
if exist %1%2.log echo LOG-Datei...
if exist %1%2.log copy %1%2.log %3\_%2.log >nul
echo Wenn hier eine LOG-Datei  _%2.log liegt, dann gehoert sie >%3\README
echo zu der vorherigen Sicherungskopie. Sie wird nur gebraucht, >>%3\README
echo wenn die hier liegende Sicherungskopie nicht in Ordnung ist! >>%3\README
echo Start der Wiederherstellung, auf Grundlage dieser Sicherungskopie: >>%3\README
echo Auf %6 diesen Befehl geben: >>%3\README
echo %3%2rest.bat >>%3\README

echo Formulardateien
copy %1%2*.frm %3 >nul
echo Hilfedateien  
copy %1%2*.rtf %3 >nul
echo Konfigurationsdateien
if exist %1*.cfg copy %1*.cfg %3 >nul
rem  Die CFG koennte noch fehlen. Evtl. liegt sie auf dem ProgDir
rem  zuerst den Namen mit $ versuchen
if not exist %1*.cfg copy %6$%4.cfg %3 >nul
rem  dann ohne $, falls noch keine CFG da ist
if not exist %3\*.cfg copy %6%4.cfg %3 >nul
rem  Alle Parameter, FLEXe, RTF und H* kopieren
copy %1*.%5p? %3 >nul
copy %1*.rtf %3  >nul
copy %1h*. %3 >nul
copy %1*.flx %3 >nul
rem  AnzeigeParam, falls nicht auf DbDir
if exist %7 copy %7 %3 >nul
rem  IndexParam, falls nicht auf DbDir
if not exist %1%2.%5pi copy %6%2.%5pi %3 >nul
echo Indexdatei...
copy %1%2.%5dx %3 >nul

goto ende

:ende
rem Pruefen: Ist Index kopiert?
if not exist %3\%2.%5dx goto error
rem Typ Sicherungskopie? Wenn Ja, dann LOG loeschen
if %8 == N goto copyfree
if not exist %1%2.log goto restore
del %1%2.LOG >nul
echo LOG-Datei geloescht

:restore
rem RESTORE-Batch fuer den Notfall anlegen (falls a99 nicht startet)
rem im Normalfall geht es aus a99 mit "h org" und dann "Datenbank restaurieren"

echo rem Kopie der Datenbank liegt auf %3 >%1%2rest.bat
echo rem Von dort wird zurckkopiert, dann der update-Befehl gegeben >>%1%2rest.bat
rem ald-Dateien auf DbDir zuerst loeschen, es koennten mehr sein als vorher
echo del %1%2_*.%5ld >>%1%2rest.bat
echo copy %3\%2*.%5ld %1. >>%1%2rest.bat
echo copy %3\%2.tbl %1. >>%1%2rest.bat
echo %6free %1%2.TBL >>%1%2rest.bat
echo copy %3\%2.%5dx %1. >>%1%2rest.bat
if exist %1%2.stl echo copy %3\%2.stl %1. >>%1%2rest.bat
if exist %1%2.res echo copy %3\%2.res %1. >>%1%2rest.bat
echo set -P=%6 >>%1%2rest.bat
echo set -K=%4 >>%1%2rest.bat
echo set -L=%9 >>%1%2rest.bat
rem echo %6upd -f9 -d%1 -u%1%2.log -n1 -m1 -F >>%1%2rest.bat
echo cd %6 >>%1%2rest.bat
echo acon -jupdate -b%1%2 -u%1%2.log -fp -n1 -m1 -F >>%1%2rest.bat

copy %1%2rest.bat %3

goto freigeben

rem kopierte Datenbank freigeben, weil keine Sicherungskopie
:copyfree
echo kopierte Datenbank wird freigegeben
free %3\%2.TBL
echo erledigt

:freigeben
rem  TBL der echten Datenbank wieder freigeben!
%6free %1%2.TBL
rem (zwar macht das der _BACKUP.FLX dann auch, aber der Systemverwalter
rem kann ja weggegangen sein...
echo.
echo Kopieraktion beendet,
echo.
echo    Datenbank mit allem Zubeh”r ist auf %3 kopiert
echo.

echo Leertaste, dann ist der Auftrag erledigt 
rem Anhalten, damit der user sehen kann, was alles passiert ist
pause >nul
goto exit

:error
echo Kopieren nicht vollst„ndig gelungen, Indexdatei nicht vorhanden
dir %3\%2*.*
pause

:exit
