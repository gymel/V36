@echo off

ansi
if %1x == x goto instruct

presto -a2 -ks -dexpex -pdisplay%1 -n1 -S -sdesa -lger

goto end

:instruct
cls
if %-L% == ENG goto english
:german

echo [1;33;40m                       EXPEX - "Learning by Doing"
echo     Einstieg in die Parametrierung am Beispiel einer MARC-Datenbank
echo [0;37;40m
echo  [32;40mBildschirmanzeige-Parameter[37;40m
echo      Es gibt 11 Stufen: (Dateien DISPLAY0.SPR ... DISPLAY9.SPR)
echo  [1m0[0m : Das Einfachste: nur eine einzelne Kategorie anzeigen
echo  [1m1[0m : Mehrere Kategorien hintereinander
echo  [1m2[0m : ZeilenlÑnge; Interpunktion ("PrÑfixe" und "Postfixe" einbauen)
echo  [1m3[0m : Teilfelder ausgeben
echo  [1m4[0m : öberflÅssige Zeichen beseitigen
echo  [1m5[0m : Zwischenteile (Textelemente) einbauen
echo  [1m6[0m : Daten gezielt positionieren
echo  [1m7[0m : Ersetzungen innerhalb von Datenfeldern ausfÅhren
echo  [1m8[0m : Unterprogramme
echo  [1m9[0m : Rechenbefehle
echo  [1ma[0m : Komplette Standardanzeige (Datei D-1.SPR)
echo.
echo  [1mc[0m : [32;40mKonfiguration[37;40m   (Datei S.CFG)
echo.
echo  [1mi[0m : [32;40mIndex-Parameter[37;40m (Datei BASE.SPI)
echo. 
echo  [1mx[0m : Ausstieg                        [1ms[0m : Sprache umschalten
echo.
echo  WÑhlen Sie eine der Funktionen: (Beim ersten Mal: nur [Enter] drÅcken)
acreply REPLY 2  
call acantw.bat

:function

if %REPLY%x == x presto -a2 -ks -dexpex -pinstruct -n1 -S -sdesa 

if %REPLY% == a goto standard

if %REPLY% == i goto indexpar

if %REPLY% == c goto konfig

if %REPLY% == x goto :end

if %REPLY% == s goto :language
if %REPLY% == l goto :language

if not %REPLY%x == x presto -a2 -ks -dexpex -pdisplay%REPLY% -n1 -S -sdesa 

goto instruct

:standard
presto -a2 -ks -dexpex -n1 -S -sdesa -lger
goto instruct

:indexpar
x expex\base.spi
goto instruct

:konfig
x expex\s.cfg
goto instruct

:language
if %-L% == ENG goto ger
set -l=ENG
goto instruct

:ger
set -l=GER
goto instruct

:english
echo [1;33;40m                       EXPEX - "Learning by Doing"
echo     Using a simple MARC database to learn allegro parametrization
echo [0;37;40m
echo  [32;40mScreen display parameters[37;40m
echo      There are 11 levels: (files DISPLAY0.SPR ... DISPLAY9.SPR)
echo  [1m0[0m : Most simple: display just one field
echo  [1m1[0m : Several fields in a row
echo  [1m2[0m : Line length; Punctuation (insert "prefixes" and "postfixes")
echo  [1m3[0m : Pick out subfields
echo  [1m4[0m : Remove redundant punctuation
echo  [1m5[0m : Insert text elements
echo  [1m6[0m : Positioning of field contents
echo  [1m7[0m : Substitutions within fields
echo  [1m8[0m : Subroutines
echo  [1m9[0m : Calculations
echo  [1ma[0m : Complete ISBD standard display (file D-1.SPR)
echo.
echo  [1mc[0m : [32;40mConfiguration[37;40m   (file S.CFG)
echo.
echo  [1mi[0m : [32;40mIndex parameters[37;40m (file BASE.SPI)
echo. 
echo  [1mx[0m : Exit                            [1ml[0m : Change language
echo.
echo  WÑhlen Sie eine der Funktionen: (Beim ersten Mal: nur [Enter] drÅcken)
acreply REPLY 2  
call acantw.bat

goto function

:end
