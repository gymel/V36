rem Allgemeine Stapeldatei fÅr Listenproduktion, vom CockPit zu starten
rem nach Auswahl der Sortiervorbereitung und Druckaufbereitung
rem PR-LIST.BAT   950704/970721

rem Ergebnismengen-Export, Sortieren, Aufbereiten
rem alle Dateien werden auf's aktuelle Verzeichnis geschrieben!
@echo off
if exist liste del liste
if exist uuu.?lg del uuu.?lg

%-P%\presto -e SORT/uuu.%-K1%lg -f1 

if not exist uuu.%-K1%lg goto fehler

%-P%\asort uuu.%-K1%lg sss.%-K1%lg

del uuu.?lg

%-P%\srch -s0 -m0 -e PRINT/liste -f4 -dsss.%-K1%LG -v0 -b%-D%\%-B%

del sss.?lg

echo Produktion beendet, Ergebnis = LISTE
echo Liste kann nach dem nÑchsten Tastendruck betrachtet werden
pause

%-P%\v LISTE
goto ende

:fehler
cls
echo.
echo Sie hatten nichts exportiert, daher kann keine Liste erstellt werden
echo (siehe Handbuch Kap. 6 - Ergebnismengen mit F4 exportieren, bevor
echo Sie mit F8 das Programm verlassen!)

echo.

:ende
