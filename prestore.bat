echo off
cls
echo.
echo           Restore-Funktion bei allegro
echo           ============================
echo           ACHTUNG: Wenn Ihre Datenbank nicht auf Laufwerk C: ist,
echo           m�ssen Sie diese Datei (PRESTORE.BAT) vorher �ndern.
echo.
echo            Jetzt wird die Datenbank
echo.
echo            %2 
echo.
echo            auf %1
echo.
echo            von Diskette  A:  wieder hergestellt
echo.
echo            bitte best�tigen Sie 
echo.
echo            mit      j
echo.
echo            die Richtigkeit der Angaben
echo.
echo            mit      n      k�nnen Sie hier abbrechen

acreply zh 2 sich.bat
call sich.bat

if %zh%/==j/ goto zuruck
if %zh%/==n/ goto ende

:zuruck
cls
echo      Legen Sie bitte die Sicherungsdiskette 
echo.
echo                ins Laufwerk A:
echo.
echo      (wenn es mehrere sind, die erste)
echo.
pause

rem Hier evtl. Laufwerk �ndern:
arj x -v a:\alleg c:\

:ende
