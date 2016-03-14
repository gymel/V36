@echo off
rem DOOR.BAT : Wenn _door.flx fehlt
rem 2003-11-13 / 2004-12-07
rem Dieses Programm bekommt folgende Aufruf-Parameter:
rem This program is called with the following parameters:

rem %1 : "letzter Suchbefehl"         "last search statement"
rem %2 : Konfigurationsname    -k     configuration name
rem %3 : Datenverzeichnis      -d     data directory
rem %4 : Datenbankname         -b     database name
rem %5 : Konfig.Buchstabe      -k1    konfiguration letter
rem %6 : Programmverzeichnis   -P     program directory (C:\ALLEGRO)

rem Wenn es aber einen _DOOR.FLX gibt, wird dieser gestartet!
rem Die Voreinstellung darin ist, dass JanaS aufgerufen wird,
rem doch der Systemverwalter kann etwas ganz anderes einrichten.

echo.

echo TÅr zur Welt momentan geschlossen.
echo Door to the World momentarily locked.
echo.
echo Sie kînnen diese Stapeldatei, DOOR.BAT, mit einem eigenen
echo Programmaufruf fÅllen. Wenn dieses Programm dann eine Datei
echo EXTERN.DAT im "allegro"-Externformat erzeugt, kann "a99/alcarta"
echo diese anschliessend Åber das MenÅ "Datei / Externe Ergebnismenge laden"
echo anzeigen.
echo.
echo You can install your own program call in DOOR.BAT.
echo If your program then produces a file EXTERN.DAT in the
echo "allegro" external format, you can subsequently get this
echo file displayed using "File / External result set".

pause
exit
