@echo off
rem ZSMAHN.BAT  Mahnungen ueberfaelliger Zeitschriftenlieferungen
rem     980416  Beispiel von Winfried Goss
rem Voraussetzungrem Heftlieferungen stehen in Datei 249

rem Folgende Zeilen muessen angepasst werden:
rem allegro-Programmverzeichnis:
 set -P=C:\ALLEGRO
rem Datenbankverzeichnis:
 set -d=C:\ALLEGRO\DEMO2
rem Katalogname:
 set -b=CAT
rem Konfiguration:
 set -k=A

rem Wechsel ins Datenbankverzeichnis:
 cd %-d%
rem Ausgabe ueberfaelliger ZS-Lieferungen:
 %-P%\srch -f6 -d%-b%_249.ald -es-zsmahn/zsmahn.1 -m0 -v0
rem Sortierung nach Lieferanten:
 %-P%\asort zsmahn.1 zsmahn.alg
 del zsmahn.1
rem Zusammenfassung nach Lieferanten:
 %-P%\srch -f6 -dzsmahn.alg -ex-umlauf/x-zsmahn.alg -m0 -v0
 del zsmahn.alg
rem formatierte Ausgabe:
 %-P%\srch -f6 -dx-zsmahn.alg -ep-zsmahn/zsmahn.txt -b%-d%\%-b% -m0 -v0
 del x-zsmahn.alg
 %-P%\v zsmahn.txt
rem Ergebnis ausdrucken:
 echo Soll die Mahnliste jetzt ausgedruckt werden (j/n)?
 %-P%\acreply x 2 x.bat
 call x.bat
 del x.bat
 if not "%x%" == "j" goto ENDE
 copy zssmahn.txt %prn%
rem Seitenauswurfrem (evt. ueberfluessig, dann Zeile wegnehmen)
 echo  > zsmahn.txt

:ENDE
rem Bei Aufruf via CockPit: Wechsel ins Programmverzeichnis aktivieren
rem cd %-P%

rem Umgebungsvariablen loeschen:
 set x=
 set -k=
 set -b=
 set -d=
 set -P=
