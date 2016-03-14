rem Allgemeine Stapeldatei fÅr Listenproduktion, vom CockPit zu starten
rem nach Auswahl der Sortiervorbereitung und Druckaufbereitung
rem S-LIST.BAT   941220
rem Voraussetzung: selektierte Datei DOWNLOAD.ALG existiert
rem                geeignete SORT.APR und PRINT.APR vorhanden

rem Sortiervorbereitung, Sortieren, Aufbereiten
rem alle Dateien werden auf's aktuelle Verzeichnis geschrieben!
@echo off
if exist liste del liste

%-P%\srch -m0 -s0 -e SORT/sss -f4 -ddownload.%-K1%LG -v0 -b%-D%\%-B% 

%-P%\asort sss sss.%-K1%LG
del sss

%-P%\srch -m0 -s0 -e PRINT/LISTE -f4 -dSSS.%-K1%LG -v0 -b%-D%\%-B% 

del sss.?lg

echo Produktion beendet, Ergebnis = LISTE
echo Liste kann nach dem nÑchsten Tastendruck betrachtet werden
pause

v LISTE
