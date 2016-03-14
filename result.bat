rem Rechnerische Auswertung einer Datenbank (Volltextsuche mit Export)
rem RESULT.BAT   950513
rem Ergebnis: Datei RESULT.
@echo off
if not exist RESULT.%-K1%PR goto ENDE
srch -d%-D% -f4 -e result/RESULT -m0 -v0 
goto x
:ende
echo RESULT.%-K1%PR fehlt (Prototyp: R-0.APR)
goto fehl
:x
v RESULT
:fehl