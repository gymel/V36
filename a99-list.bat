rem a99-LIST.BAT   2002-03-21
rem Allgemeine Stapeldatei fÅr Listenproduktion, vom a99 zu starten
rem nach Auswahl der Sortiervorbereitung und Druckaufbereitung
@echo off
rem a99 setzt noch einige set-Befehle davor und bildet daraus
rem die Datei  a99l.bat, die dann gestartet wird

rem Ergebnismengen-Export, Sortieren, Aufbereiten
rem alle Dateien werden auf's aktuelle Verzeichnis geschrieben!
if exist liste del liste

if not exist uuu.%-K1%lg goto fehler

%-P%\asort uuu.%-K1%lg sss.%-K1%lg

del uuu.?lg

%-P%\srch -s0 -m0 -e PRINT/liste -f4 -dsss.%-K1%LG -v0 -b%-D%\%-B%

del sss.?lg

echo Produktion beendet, Ergebnis = LISTE
pause

# %-P%\v LISTE
goto ende

:fehler
cls
echo.
echo Sie hatten nichts exportiert, daher kann keine Liste erstellt werden
echo (es fehlt die Datei uuu.alg, die von a99 erstellt werden muesste)

echo.
pause
:ende
