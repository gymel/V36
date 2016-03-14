rem QUANT.BAT     Quantitative Auswertung           24.08.96 / 2004-02-25
rem               Haeufigkeit von Feldinhalten ermitteln
rem               Universell fuer alle Kategorien anwendbar,
rem               auch mit Mehrfacheintraegen innerhalb von Kategorien
rem Programme:    PRESTO, SRCH, ASORT
rem               Lauffaehig auch unter Win'95/98/NT

rem Erfordert:    C-FI.APR    Ausgabe der sortierfaehigen Zeilen (1. Durchlauf)
rem               COUNT2.APR  Nach Sortierung Liste erstellen (2. Durchlauf)
rem               C-TAGS.APR  Fuer Sonderfall Kategorien-Statistik
rem               C-SUBF.APR  Fuer Sonderfall Teilfeld-Statistik
rem               Q4.APT      Sortiertabelle (Zeichen-Umcodierung) mit i4=1

rem Ausgabe:      Datei "quant"    alphabetisch geordnet
rem                     "quants"   auf- oder absteigend nach Haeufigkeit
rem aktualisiert: 2000-01-08

@echo off

if %-K1%x == x goto noconfig              : -K1 muss gesetzt sein!
if %-D%x == x set -D=.
if %-P%x == x if not exist \ALLEGRO\PRESTO.EXE goto noprogdir
if %-P%x == x set -P=\ALLEGRO

if not exist %-P%\c-fi.%-K1%pr copy %-P%\c-fi.apr c-fi.%-K1%pr >nul

if not exist %-P%\c-fi.%-K1%pr goto noparam : Es muss c-fi.apr geben

rem ********* Abfrageteil ******************************************
rem Kann entfallen, wenn man geeignete set-Befehle gesetzt hat
:questions
set param=c-fi
cls
echo Datenbank:  %-D%\%-B%
echo =============================================================
echo.
echo Wollen Sie
echo.
echo 1 : Alle Angaben fÅr eine neue Auswertung eingeben?
if exist c-*.bat echo 2 : Eine frÅhere Auswertung erneut durchfÅhren?
echo 3 : Sonderfunktion: statistische Belegung der Kategorien
echo 4 : Sonderfunktion: statistische Belegung der Teilfelder
echo x : Vorgang abbrechen/beenden
echo.

%-P%\gk 1234x
if errorlevel 5 goto finish
if errorlevel 4 goto substat
if errorlevel 3 goto katstat
if errorlevel 2 goto repeat

cls
echo.
echo Datenbank:  %-D%\%-B%

rem **** Vorbesetzungen der Variablen ***************************
rem Wenn man feste Standardprozeduren einrichten will,
rem setzt man geeignete Werte in die set-Befehle und laesst den Abfrageteil weg

rem Minimalwert setzen
set MIN=1
rem Maximalwert setzen
set MAX=1000000

rem   c2   Trennzeichen (1 = keine Trennung)
set c2=1

rem   c3   Trennmodus : 1 = nur Anfangsteil VOR dem Zeichen c2
rem                     2 = c2 zum Zerlegen benutzen
rem                     3 = nur Teil HINTER dem Zeichen c2
set C3=1

rem   C5   Sortiermodus : Vorbearbeitung des Sortierbegriffs
rem        moeglich:      1,2,8,9
set C5=1

rem   C6   V14-Modus    : sind Stammsatz-Ersetzungen notwendig?
rem        moeglich:      j,n
set C6=j

set label=

rem Wenn man unterschiedliche Ausgabeformen anbieten will:
rem echo Welche Ausgabeform soll es sein? (Default: 2)
rem echo.
rem echo   1 : Text  Anzahl
rem echo.
rem echo   2 : Anzahl  Text
rem echo.
rem echo   (1 oder 2 druecken)

rem gk 12
rem if errorlevel 2 goto b
rem set UMD=1
rem goto kategorie

:b
rem Ausgabeform = 2 setzen
set UMD=2

:kategorie
echo.
echo Welche Kategorien sollen ausgewertet werden?
echo Geben Sie eine oder mehrere Kategorienummern an, durch Komma getrennt:
echo        z.B.    31,31s,31p,31k,33
echo   oder z.B.    260$c,700$d         wenn Teilfelder auszuwerten sind
echo (Jede auszuwertende Kategorie muss einzeln angegeben werden, es sind
echo keine Zusammenfassungen wie z.B.  31?  o.Ñ. mîglich.)
:kateg2
echo.

%-P%\acreply REPLY 100
call acantw.bat
echo.
if %REPLY%x == xx goto questions
if %REPLY%x == x goto kateg2
rem Antwort in Environment-Variable c1 schreiben
set C1=%REPLY%

echo.
echo Sie kînnen vorgeben, ob bei der Auswertung eine untere oder
echo obere Grenze gelten soll (fÅr die HÑufigkeit):
echo.
echo Minimalwert?  ([Enter] wenn keine untere Grenze gewÅnscht)
echo (bedeutet: der Feldinhalt muss MINDESTENS so oft vorkommen)
echo.

%-P%\acreply REPLY 5
call acantw.bat
echo.
if not "%REPLY%" == "" set min=%REPLY%

echo.
echo Maximalwert?  ([Enter] wenn keine obere Grenze gewÅnscht)
echo (bedeutet: nur Feldinhalte berÅcksichtigen, die HôCHSTENS so oft vorkommen)
echo.

%-P%\acreply REPLY 5
call acantw.bat
if not "%REPLY%" == "" set max=%REPLY%
echo.

echo.
echo Sind Stammsatz-Ersetzungen notwendig (Methode V14)?  j/n
echo (Wenn nicht, geht es etwas schneller.)
echo (Wenn Sie nicht sicher sind: Antwort j, das klappt immer)

:stammsatz
echo.

%-P%\acreply REPLY 2
call acantw.bat
echo.
if %REPLY%x == x goto stammsatz

if not %REPLY%x == nx copy %-P%\q4.apt quant.%-K1%pt >nul

if %REPLY%x == nx copy %-P%\s.apt quant.%-K1%pt >nul
if %REPLY%x == nx set C6=n

:trenn
echo.
echo Welches Zeichen ist das Trennzeichen (innerhalb der Kategorie)?
echo Mîglichkeiten:  eines dieser Zeichen:     - / . , ( * ' : $ =
echo           oder  b = Leerzeichen  s = Semikolon (Vorsicht: ; geht nicht!)
echo           oder  x = keine Trennung, d.h. Feldinhalt als Ganzes behandeln
echo (Wenn Eingabe nicht klappt, t davorsetzen, z.B. t, )
echo.

%-P%\acreply REPLY 3
call acantw.bat
echo.
if %REPLY%x == x goto trenn
set C2=%REPLY%
if %REPLY%x == xx set C2=1
rem Environment Var. C2 enthaelt jetzt das Trennzeichen
if %C2%==1 goto sortmod

:modus
echo.
echo Auswertungsmodus: (Welche Teile des Feldes sollen ausgewertet werden)
echo WÑhlen Sie:  1 = nur den Anfangsteil auswerten (Ende beim Zeichen %C2%)
echo              2 = jeden Teil auswerten (%C2% ist Trennsymbol)
echo              3 = nur Teil HINTER dem Zeichen %C2% auswerten
echo.

%-P%\acreply REPLY 3
call acantw.bat
echo.

if %REPLY%x == 1x goto setmod
if %REPLY%x == 2x goto setmod
if %REPLY%x == 3x goto setmod
goto modus
:setmod
set C3=%REPLY%

:sortmod
rem Erweiterung moeglich: C-FI.APR entsprechend ausbauen
echo.
echo Sortiermodus:
echo 1 = Normal (Umlaute auflîsen, Nichtsortierwîrter beseitigen)
echo 2 = Pica-Namensmodus (Vorname@Nachname)
echo 8 = Numerisch sortieren
echo 9 = Keine Umcodierung - unverÑndert sortieren
echo.

%-P%\acreply REPLY 3
call acantw.bat
echo.

if %REPLY%x == 1x goto setsort
if %REPLY%x == 2x goto setsort
if %REPLY%x == 8x goto setsort
if %REPLY%x == 9x goto setsort
goto sortmod

:setsort
rem Antwort in Environment-Variable c5 schreiben
set C5=%REPLY%
cls
set label=chck1
goto check
:chck1

echo Alles richtig?  j/n

echo.

%-P%\acreply REPLY 3
call acantw.bat
echo.

if %REPLY%x == nx goto questions

rem ************* Ende des Abfrageteils ***********************************

echo.
echo Sollen diese Einstellungen aufbewahrt werden? j/n
echo (Dann kînnen Sie solche Auswertungen spÑter leicht wiederholen)
%-P%\gk jn
if errorlevel 2 goto start

rem BAT-Datei mit set-Befehlen wird erstellt

echo set MIN=%MIN% > QUANT2.BAT
echo set MAX=%MAX% >> QUANT2.BAT
echo rem Auszuwertende Kategorien: >> QUANT2.BAT
echo set C1=%C1% >> QUANT2.BAT
echo rem Trennzeichen: >> QUANT2.BAT
echo set C2=%C2% >> QUANT2.BAT
echo rem Auswertungsmodus: >> QUANT2.BAT
echo set C3=%C3% >> QUANT2.BAT
echo rem Sortiermodus: >> QUANT2.BAT
echo set C5=%C5% >> QUANT2.BAT
echo rem V14-Modus: >> QUANT2.BAT
echo set C6=%C6% >> QUANT2.BAT
echo Geben Sie einen Namen dafÅr ein (6 Zeichen)
echo Diese Namen gibt es schon:
echo.

dir c-*.bat /B | more
echo.

pause
echo Geben Sie jetzt einen neuen Namen ein, und zwar
echo ohne C- am Anfang, bis zu 6 Zeichen lang
echo (Lange Dateinamen kînnen Probleme machen!)
echo Wenn der Name schon existiert, wird die Datei Åberschrieben.
:newname
echo.

%-P%\acreply reply 7
call acantw.bat
echo.
if %REPLY%x == x goto newname
copy QUANT2.bat c-%REPLY%.bat >nul
del QUANT2.BAT
echo.
goto start

:repeat
cls
echo.
if not exist c-*.bat goto questions

echo Es gibt fÅr quantitative Auswertungen bisher diese Dateien:

dir c-*.bat /B | more
echo.

echo Welche Datei soll es sein?
echo Geben Sie den Namen ohne C- ein. (x geben, wenn keine geeignete dabei)
echo.

%-P%\acreply reply 7
call acantw.bat
echo.
if %REPLY% == x goto questions
if not exist C-%REPLY%.BAT goto repeat

rem Ausgewaehlte C-*.BAT starten

call C-%REPLY%.BAT

if not %C6% == n copy %-P%\q4.apt quant.%-K1%pt >nul

if %C6% == n copy %-P%\s.apt quant.%-K1%pt >nul
cls
echo Datei C-%REPLY%.BAT 

set label=chck2
goto check
:chck2

rem ************* Eigentliche Prozedur: ***********************************
rem (Was oben steht, kann auch durch geeignete set-Befehle ersetzt werden
rem wenn man feste Standardprozeduren einrichtet

:start
set label=start
if %label%x == x goto enviro

echo.
echo Wie soll die Auswertung erfolgen?   (1 oder 2 wÑhlen)
echo.
echo   0 : Gesamte Datenbank auswerten
echo   1 : Mit Volltextsuche die Daten selektieren
echo   2 : Als Ergebnismenge (Åber die Register, Export mit F4)
echo   x : Irrtum, zurÅck zur Auswahl
:start2

%-P%\acreply REPLY 3
call acantw.bat
echo.

if %REPLY%x== 2x goto prstart
if %REPLY%x== xx goto repeat
if %REPLY%x== 0x goto start0
if not %REPLY% == 1 goto start2

rem Volltextsuche wird gestartet, mit %PARAM%.apr fuer Export

%-P%\srch -f4 -e %PARAM%/quant -m0 -v0 -Uc1%C1% -Uc2%C2% -Uc3%C3% -Uc5%C5% -k%-K%
goto phase2

:start0
%-P%\srch -f6 -e %PARAM%/quant -m0 -v0 -Uc1%C1% -Uc2%C2% -Uc3%C3% -Uc5%C5% -k%-K% -d*%-D%\%-B%_*
goto phase2

:prstart
rem PRESTO wird gestartet mit  %PARAM%.cpr  fuer Export
%-P%\presto -e %PARAM%/quant -a1 -n1 -Uc1%C1% -Uc2%C2% -Uc3%C3% -Uc5%C5% -k%-K%


rem Rest ist immer gleich, dabei wird immer A.CFG benutzt !!

:phase2
rem Ergebnisse sortieren

%-P%\asort quant quant.alg
del quant
del quants

rem Liste produzieren per Export mit  COUNT2.APR
rem Environment-Variablen werden zu Uservariablen per Option -U :

rem UMD -> Option -Umd%UMD% -> #umd  :  1 oder 2
rem MIN ->        -Umi%min% -> #umi  :  Minimum
rem MAX ->        -Umx%max% -> #umx  :  Maximum

rem -ka durch -k%-K% ersetzt damit es allgemeingueltig ist
%-P%\srch -f6 -d quant -e count2/quant -m0 -v0 -k%-K% -Uc5%C5% -Umd%UMD% -Umi%min% -Umx%max%

del quant.alg

:unsort

%-P%\v quant
:sort
echo.
echo Nach Anzahl sortieren?  a = aufsteigend
echo                         b = absteigend
echo                         u = unsortierte Liste nochmals anzeigen
echo                         x = Ende

%-P%\gk abxu
if errorlevel 4 goto unsort
if errorlevel 3 goto end
if errorlevel 2 goto ab

%-P%\asort quant quants >nul

%-P%\v quants

goto sort

:ab
sort /R <quant >quants

%-P%\v quants

goto sort


:katstat
set param=c-tags

if not exist %-P%\c-tags.%-K1%pr copy %-P%\c-tags.apr c-tags.%-K1%pr
goto start

:substat
set param=c-subf
if not exist %-P%\c-subf.%-K1%pr goto csubf
goto start

:csubf

copy %-P%\c-subf.apr c-subf.%-K1%pr

goto start

:noparam
echo Parameterdatei  c-fi.apr  nicht gefunden;
echo Kopieren Sie diese Datei in Ihr Startverzeichnis
echo.

pause
goto finish
rem -------------------------------

:noconfig
echo Starten Sie dieses Programm vom CockPit,
echo ODER setzen Sie zuerst diese Variablen:
echo.
echo -K1 : Konfigurationsbuchstabe
echo       z.B.  set -K1=a
echo -K  : Name der .CFG Datei (meistens derselbe wie K1 )
echo       z.B.  set -K=a
echo -D  : Datenbankverzeichnis
echo       z.B.  set -D=c:\allegro\katalog
echo -B  : Datenbankname
echo       z.B.,  set -B=cat
echo.
echo Ausserdem muss es die Parameterdatei  C-FI.APR  geben
echo (Wenn Sie nicht mit A.CFG arbeiten, sondern z.B. mit P.CFG,
echo  dann kopieren Sie C-FI.APR auf C-FI.PPR)
echo.
echo Leertaste druecken...
pause >nul
goto finish

:end
cls
echo.
echo Es gibt jetzt die Dateien
echo.
echo   QUANT   :  Alphabetische Ergebnisliste
if exist quants echo   QUANTS  :  Nach Anzahl geordnete Ergebnisliste
echo.
echo Diese Dateien koennen Sie beliebig weiterverwenden.
echo Bei der naechsten Auswertungs-Aktion werden sie ueberschrieben, deshalb
echo kopieren oder umbenennen, wenn die Dateien aufbewahrt werden sollen!
echo.
echo Leertaste druecken...
pause >nul
goto finish

:check

echo.
echo Datenbank:  %-D%\%-B%
echo =============================================================
echo.
echo Auszuwertende Kategorien: %C1%
if %C2% == b echo             Trennzeichen: blank (Leerzeichen)
if not %C2% == b echo             Trennzeichen: %C2%
echo.
if %C6% == n echo Keine Stammsatz-Ersetzungen
if not %C6% == n echo Stammsatz-Ersetzungen (V14) werden ausgefÅhrt

echo.
echo Auswertungsmodus:
if %C3% == 1 echo    Nur Anfangsteil auswerten (bis zum Zeichen %C2%)
if %C3% == 2 if %C2% == b echo    Kategorien am Leerzeichen zerlegen, alles auswerten
if %C3% == 2 if not %C2% == b echo    Kategorien am Zeichen %C2% zerlegen, alles auswerten
if %C3% == 3 echo    Nur Teil hinter dem Zeichen %C2% auswerten
echo.
echo Sortiermodus:
if %C5% == 1 echo    Normal (Umlaute auflîsen, Nichtsortierwîrter beseitigen)
if %C5% == 2 echo    Pica-Namensmodus (Vorname@Nachname)
if %C5% == 8 echo    Numerisch sortieren
if %C5% == 9 echo    Keine Umcodierung - unverÑndert sortieren
echo.

echo Auszugeben sind Werte, die
echo    mindestens  %MIN% mal und hoechstens %MAX% mal vorkommen
echo.
goto %label%

:noprogdir
echo Wo liegen die Programme?
echo Setzen Sie die Variable -P !
echo z.B. set -P=C:\ALLEGRO  wenn die Programme auf C:\ALLEGRO liegen
echo oder starten Sie vom CockPit
goto lastline

:enviro
cls
echo Nicht genuegend Raum fuer Umgebungsvariablen
echo Vergroessern Sie den Wert in Ihrer Datei CONFIG.SYS
echo z.B. diese Zeile einbauen:
echo      SHELL=C:\COMMAND.COM C:\ /E:1000 /P
echo Dann neuer Warmstart, und los geht's
goto lastline
:finish
echo.
cls
:lastline
echo.

set MIN=
set MAX=
set C1=
set C2=
set C3=
set C5=
set C6=


