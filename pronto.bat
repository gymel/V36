@echo off
rem PRONTO.BAT      Fertigmixtur fuer 'allegro'-Datenbanken            960420
rem                 Automatische Erstellung einer Konfiguration mit
rem                 Index- und Anzeigeparametern und Sofortstart
rem Programm      PRESTO
rem Erfordert:      pronto2.bat   Zusammenstellung der CFG
rem                 pronto.cf1, pronto.cf4  Fertigteile fuer die .CFG
rem                 pronto.ix1, pronto.ix3  Fertigteile fuer die .cPI
rem                 pronto.di1, pronto.di3  Fertigteile fuer die D-1.cPR
rem Ausgabe:        Dateien c.CFG, name.cPI, D-1.cPR
rem aktualisiert:   960422 / 010506   geeignet fuer Win'NT

:bank
echo.
cls

if not exist pronto.cf1 goto nopronto : Es muss die Datei pronto.cf1 geben
echo.
echo Anlegen einer neuen 'allegro'-Datenbank
echo ---------------------------------------
echo.

echo 1. Wie soll Ihre Datenbank heissen?
echo    Geben Sie einen Namen ein  (hoechstens 4 Buchstaben)
echo    Ausstieg: Strg+c
echo.
:getname
acreply reply 5
call acantw.bat
if %REPLY%x == x goto getname
echo.
set -B=%REPLY%
echo.
echo  Ausserdem wird ein Kennbuchstabe fuer die KONFIGURATION gebraucht.
echo    (Das ist die Liste der Datenfelder, die zu einem Datensatz geh”ren)
echo.
echo Es gibt schon die folgenden Konfigurationen:
dir ??.cfg /w
:konfigu
echo.
echo Geben Sie einen KENNBUCHSTABEN fuer Ihre Konfiguration ein, und zwar einen,
echo der noch nicht vorkommt, wenn Sie eine ganz neue Datenbank machen wollen
echo.
:getkonf
acreply reply 2
call acantw.bat
if %REPLY%x == x goto getkonf
echo.
set -K1=%REPLY%

if exist %-B%\%-K1%.CFG goto existiert
if exist %-B%\$%-K1%.CFG goto existiert
if exist %-K1%.CFG goto existiert
if exist $%-K1%.CFG goto existiert

if exist pronto.cf2 del pronto.cf2
if exist pronto.cf3 del pronto.cf3
if exist pronto.ix2 del pronto.ix2
if exist pronto.di2 del pronto.di2

:construct
echo #99"Datumsfelder" > pronto.cf3
echo. >>pronto.cf3
echo. >>pronto.cf3
echo  --- Abfrageliste : (PRONTO.CF3) ----------------------- >> pronto.cf3
echo  --- Empfehlungen:                                ------ >> pronto.cf3
echo  --- o Ersetzen Sie das Zeichen _ durch Leerzeichen ---- >> pronto.cf3
echo  --- o Bringen Sie die Abfragetexte auf gleiche Laenge - >> pronto.cf3
echo. >>pronto.cf3

echo.
echo Jetzt kommt die Aufstellung der Feldliste. Nehmen Sie sich hier etwas Zeit:
echo Schreiben Sie zuerst auf, welche Felder Ihre Datensaetze haben sollen.
echo Fuer jedes Feld werden folgende Einzelheiten gebraucht:
echo.
echo 1.  Kurzbezeichnung des Feldes (fuer interne Zwecke)   (bis zu 10 Zeichen)
echo 2.  Bezeichnung fuer die Eingabemaske                  (bis zu 20 Zeichen)
echo 3.  Pruefbuchstabe     (c=Artikel am Anfang, d=Personenname, e=Jahreszahl)
echo 4.  Mehrfachabfrage gewuenscht? j/n   (j, wenn Feld oft mehrfach auftritt)
echo 5.  Pflichtfeld? j/n                  (j heisst, Feld MUSS besetzt werden)
echo 6.  Indexierung?         (1...9 fuer Register 1 - 9, 0 = Nicht indexieren)
echo 7.  Trennzeichen fuer Indexierung     (b fuer blank, d.h. Wortindexierung)
echo 8.  Anzeige gewuenscht? j/n     (n, wenn Feld nicht angezeigt werden soll)
echo.
echo   Das ist alles. Angaben ueber die maximale Laenge, den Typ (numerisch,
echo   alphanumerisch), die Wiederholbarkeit etc. sind nicht notwendig.
echo   Jedes Feld kann 2000 Zeichen lang werden und 50 mal belegt sein.
echo   (Platz verbrauchen aber nur die wirklich eingegebenen Zeichen!)
echo.
echo  Strg+c, um hier noch abzubrechen!
pause
call pronto2 1 10 A
call pronto2 2 15 B
if %REPLY%_ == x_ goto finish
call pronto2 3 20 C
if %REPLY%_ == x_ goto finish
call pronto2 4 25 D
if %REPLY%_ == x_ goto finish
call pronto2 5 30 E
if %REPLY%_ == x_ goto finish
call pronto2 6 35 F
if %REPLY%_ == x_ goto finish
call pronto2 7 40 G
if %REPLY%_ == x_ goto finish
call pronto2 8 45 H
if %REPLY%_ == x_ goto finish
call pronto2 9 50 I
if %REPLY%_ == x_ goto finish
call pronto2 10 60 J
if %REPLY%_ == x_ goto finish
call pronto2 10 65 K
if %REPLY%_ == x_ goto finish
call pronto2 10 70 L
if %REPLY%_ == x_ goto finish
call pronto2 10 75 M
if %REPLY%_ == x_ goto finish
call pronto2 10 80 N
if %REPLY%_ == x_ goto finish
call pronto2 10 85 O
if %REPLY%_ == x_ goto finish
call pronto2 10 90 P
if %REPLY%_ == x_ goto finish
call pronto2 10 95 Q
if %REPLY%_ == x_ goto finish
call pronto2 10 9a R
if %REPLY%_ == x_ goto finish
call pronto2 10 9d S
if %REPLY%_ == x_ goto finish

:finish
echo   %REPLY% : Konfiguration fuer 'allegro'-Datenbanken > konfigu.$$$

copy konfigu.$$$ +pronto.cf1 +pronto.cf2 +pronto.cf3 +pronto.cf4 %-K1%.cfg > nul

copy pronto.ix1 +pronto.ix2 +pronto.ix3 %-B%.%-K1%pi  > nul

copy pronto.di1 +pronto.di2 +pronto.di3 d-1.%-K1%pr > nul

copy pronto.wi1 +pronto.di2 +pronto.wi3 d-wrtf.%-K1%pr > nul

copy d.apt %-B%\d.%-K1%pt
copy o.apt %-B%\o.%-K1%pt
copy d-rtf.apt %-B%\d-rtf.%-K1%pt

echo Datenbank %-B% >%-B%.ini
echo [General] >>%-B%.ini
echo Konfiguration=%-K1% >>%-B%.ini
echo access=9 >>%-B%.ini
echo DbName=%-B% >>%-B%.ini

cls
echo.
echo Alle Vorbereitungen sind erledigt.
echo Waehlen Sie:

:bearb
cls.
echo.
echo 1 : Konfiguration nochmal bearbeiten (z.B. Abfrageliste!)
echo 2 : Indexparameter bearbeiten
echo 3 : Anzeigeparameter bearbeiten
echo 8 : CockPit aufrufen
echo 9 : Mit der Dateneingabe beginnen
echo.
echo c : Alles wieder loeschen
echo.
echo n : Neues Projekt
echo.
echo x : EXIT

gk 12389cnx
if errorlevel 8 goto end
if errorlevel 7 goto bank
if errorlevel 6 goto wipeout
if errorlevel 5 goto create
if errorlevel 4 goto cockpit
if errorlevel 3 goto disp
if errorlevel 2 goto indx

if exist %-B%\%-K1%.cfg  x %-B%\%-K1%.cfg
if not exist %-B%\%-K1%.cfg  x %-K1%.cfg
cls
goto bearb

:indx
if exist %-B%\%-B%.%-K1%pi  x %-B%\%-B%.%-K1%pi
if not exist %-B%\%-B%.%-K1%pi  x %-B%.%-K1%pi
cls
goto bearb

:disp
if exist %-B%\d-1.%-k1%pr  x %-B%\d-1.%-k1%pr
if not exist %-B%\d-1.%-k1%pr  x d-1.%-k1%pr
cls
goto bearb

:cockpit
echo d %-B% >> cp.pre
echo b %-B% >> cp.pre
echo k %-k1% >> cp.pre
call cp.bat
goto bearb

:wipeout
echo.
echo Sind Sie sicher? j/n
gk jyn
if errorlevel 3 goto bearb
del %-K1%.CFG
del %-B%\*.?ld
del %-B%\*.?dx
del %-B%\*.tbl
del %-B%\*.stl
rd %-B%
del d-1.%-K1%pr
del %-B%.%-K1%pi
goto bearb

:create
if exist %-B%\%-B%.tbl goto vorhanden

rem Hilfstabellen kopieren
echo.
echo Gleich koennen Sie den ersten Datensatz eingeben...

copy i.apt i.%-K1%pt > nul
copy swl1.apt stoplist.%-K1%pt > nul

rem Das eigentliche Anlegen der Datenbank:
md %-B%
move %-B%.ini %-B%\.
presto -a3 -i%-B% -k%-K1% -d%-B% -n1
goto bearb

:vorhanden
echo Die Datenbank existiert schon.
echo Druecken Sie eine Taste, dann koennen Sie darin arbeiten.
pause
presto -a3 -n1 -k%-K1% -d%-B%
goto bearb

:nopronto
echo Die Datei  PRONTO.CF1 ist nicht vorhanden.
echo Die PRONTO-Methode funktioniert nur mit den Dateien
echo PRONTO.CF1, PRONTO.CF4, PRONTO.IX1, PRONTO.IX3, PRONTO.DI1, PRONTO.DI3
echo Diese sollten auf dem Programmverzeichnis oder Startverzeichnis
echo liegen, dann koennen Sie anfangen.
echo.
pause
goto end

:existiert
echo Die Konfiguration %REPLY%.CFG existiert schon:
echo.
if exist $%REPLY%.CFG rdwr 1 2 $%REPLY%.CFG con >nul
if not exist $%REPLY%.CFG rdwr 1 2 %REPLY%.CFG con >nul
echo.
echo Wollen Sie diese benutzen? j/n
gk yjn
if errorlevel 3 goto konfigu

echo.
goto construct


:end
