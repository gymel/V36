rem COUNT99.BAT   Quantitative Auswertung           2001-02-28
rem               Haeufigkeit von Feldinhalten ermitteln
rem               Universell fuer alle Kategorien anwendbar,
rem               auch mit Mehrfacheintraegen innerhalb von Kategorien
rem Programme:    A99, ALCARTA 

rem Erfordert:
rem               COUNT2.APR  Nach Sortierung Liste erstellen (2. Durchlauf)
rem               C-TAGS.APR  Fuer Sonderfall Kategorien-Statistik
rem               C-SUBF.APR  Fuer Sonderfall Teilfeld-Statistik

rem Ausgabe:      Datei "counta"   alphabetisch geordnet
rem                     "counts"   auf- oder absteigend nach Haeufigkeit

@echo off


rem  quant.xpt als Kopie von s.apt oder q4.apt (je nach Inhalt von %C6%)

if not %C6%a == na copy %-P%\q4.apt quant.%-K1%pt >nul

if %C6%a == na copy %-P%\s.apt quant.%-K1%pt >nul
cls


rem Rest ist immer gleich, dabei wird immer A.CFG benutzt !!

:phase2
del counts.alg
rem Ergebnisse sortieren
%-P%\asort count.alg counts.alg

rem Liste produzieren per Export mit  COUNT2.APR
rem Environment-Variablen werden zu Uservariablen per Option -U :

rem UMD -> Option -Umd%UMD% -> #umd  :  1 oder 2
rem MIN ->        -Umi%min% -> #umi  :  Minimum
rem MAX ->        -Umx%max% -> #umx  :  Maximum

rem -ka durch -k%-K% ersetzt damit es allgemeingueltig ist
%-P%\srch -f6 -d counts -e count2/counta -m0 -v0 -ka -Uc5%C5% -Umd%UMD% -Umi%min% -Umx%max%

del counts >nul
del countu >nul
del count.alg >nul

:unsort
rem Liste in beiden Richtungen sortieren
sort <counta >counts 
sort /R <counta >countuu
echo Sie sehen jetzt die absteigend sortierte Liste, die Datei heiát countu >countt
echo Um die anderen beiden Listen zu sehen, geben Sie im Schreibfeld ein: >>countt
echo h counts   aufsteigend sortierte Liste >> countt
echo h counta   alphabetisch sortierte Liste >>countt
echo ------ >>countt
copy /b countt +countuu countu
del countt
del countuu
goto finish

:end
cls
echo.
echo Es gibt jetzt die Dateien
echo.
echo   COUNTA   :  Alphabetische Auswertungsliste
if exist counts echo   COUNTS  :  Nach Anzahl geordnete Auswertungsliste
if exist countu echo   COUNTU  :  Nach Anzahl, aber absteigend geordnet
echo.
echo Diese Dateien koennen Sie beliebig weiterverwenden.
echo Bei der naechsten Auswertungs-Aktion werden sie ueberschrieben, deshalb
echo kopieren oder umbenennen, wenn die Dateien aufbewahrt werden sollen!
echo.
echo In a99 geben Sie im Schreibfeld ein:
echo h countu   um die umgekehrt sortierte Liste zu sehen
echo h counta   fr die alphabetische Liste
echo.
echo Leertaste druecken...
pause >nul

:finish
set MIN=
set MAX=
set C1=
set C2=
set C3=
set C5=
set C6=


