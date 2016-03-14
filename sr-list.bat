rem Allgemeine Stapeldatei fÅr Listenproduktion, vom CockPit zu starten
rem nach Auswahl der Sortiervorbereitung und Druckaufbereitung
rem SR-LIST.BAT   950704

rem Volltextsuche, Sortieren, Aufbereiten
rem alle Dateien werden auf's aktuelle Verzeichnis geschrieben!
@echo off
if exist liste del liste
%-P%\srch -m0 -e SORT/uuu.%-K1%lg -f4

%-P%\asort uuu.%-K1%lg sss.%-K1%lg

del uuu.?lg

%-P%\srch -m0 -s0 -e PRINT/LISTE -f4 -dsss.%-K1%LG -v0 -b%-D%\%-B% 

del sss.?lg

echo Produktion beendet, Ergebnis = LISTE
echo Liste kann nach dem nÑchsten Tastendruck betrachtet werden
pause

%-P%\v LISTE
