rem Umstellung einer Datenbank von V12 oder frher auf V13/14
rem vom CockPit zu starten (Menue MAKROS)
rem KONSOL.BAT   950704 / 970627
@echo off

rem es wird ein neues Verzeichnis CATALOG angelegt

cls
echo.
echo Wenn Sie eigene Kategorien in Ihre A.CFG eingefgt haben, mssen
echo Sie zuerst diese auch in die Datei PREPARE.APR einbauen, sonst
echo gehen sie verloren!
echo Wenn Ihre Indexparameter (KAT.API o.„.) ver„ndert wurden, mssen
echo die neuen CAT.API gleichfalls vorher angepasst werden.
echo (Mit Strg+c unterbrechen, wenn das der Fall ist)
pause

if not exist catalog\cat.tbl md catalog >nul

if exist %-D%\a.cfg copy %-d%\a.cfg %-D%\alt.cfg
if exist a.cfg copy a.cfg alt.cfg
if exist %-d%\alt.cfg goto beginn
if exist alt.cfg goto beginn
goto fehler

:beginn
srch -d%-D% -eprepare/ZWISCHEN -f6 -m0 -v0 -kalt

rename $ax.cfg $a.cfg
rename $aneu.cfg $a.cfg

import -f5 -dzwischen -e i-1/neudata.alg -icat -v0 -m0 -s0

index -f71 -dneudata -ecat/catalog -m0 -n1 -z8000000

del neudata.alg
del alt.cfg
del %-D%\alt.cfg
goto ende
:fehler
echo Es muss eine CFG namens ALT.CFG geben, eine Kopie der alten A.CFG
echo Darin muss der Befehl  n0  stehen!
echo Wenn Sie diese Datei erstellt haben, versuchen Sie es nochmal.

:ende