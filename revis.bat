rem Revision : AufspÅren von LÅcken in der SatzzÑhlung einer Datenbank
rem REVIS.BAT   941220
rem Ergebnis:   Datei REVIS.
rem Datei REVIS1.APR muss individuell angepasst werden!
@ECHO off

srch -f6 -erevis1/rrr -m0 
if not exist rrr goto ende
asort rrr rrr.alg
del rrr
srch -f6 -drrr -erevis2/REVIS -m0 
del rrr.alg
echo Ergebnisdatei REVIS wird gleich angezeigt
pause

v REVIS

:ende
