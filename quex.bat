rem QUEX.BAT        QUick and Easy eXport                              960319
rem                   Universell fuer alle Konfigurationen anwendbar
rem ACHTUNG: Ab Win'7 nicht mehr funktionsfaehig. Exportmenue von a99 benutzen.
rem Programm:         PRESTO oder SRCH
rem Erfordert:        s-quex.apr, p-quex.apr, quexdb.apt (nur fuer dBase-output)
rem                   fÅr andere: Kopien machen, z.B. 
rem                     s-quex.ppr, p-quex.ppr
rem Ausgabe:        Datei "liste",
rem aktualisiert:   960606
rem Handlungsbedarf:
rem                 --  die copy-Befehle koennen nur funktionieren, wenn man
rem                     auf dem Programmverzeichnis startet
rem                 --  Wenn man eine andere als D-1.?PR zur Anzeige benutzt,
rem                     muss der PRESTO-Aufruf ergaenzt werden durch -p<name>

@echo off

cls
rem Notwendige Dateien pruefen, wenn nicht da: als Kopie erstellen

rem -K1 muss gesetzt sein!
if %-K1%x == x goto noconfig
rem Es muss s-quex.apr geben
if not exist s-quex.apr goto noparam
if not exist s-quex.%-K1%pr copy s-quex.apr s-quex.%-K1%pr >nul
if not exist p-quex.%-K1%pr copy p-quex.apr p-quex.%-K1%pr >nul
if not exist s.%-K1%pt copy s.apt s.%-K1%pt >nul

:begin
rem **** Vorbesetzungen der Variablen ***************************
rem Wenn man feste Standardprozeduren einrichten will, 
rem setzt man geeignete Werte in die set-Befehle und laesst den Abfrageteil weg

rem   c1   Sortierkategorien ( , als Trennung, wenn mehrere)
set c1=

rem   c2   Trennzeichen (1 = keine Trennung) 
set c2=1

rem   c3   Trennmodus : 1 = nur Anfangsteil,  2 = C2 zum Zerlegen benutzen
set c3=2 

rem   c4   Mehrfachmodus : Anzahl Ausgabesaetze je Datensatz
set c4=1 

rem   c5   Sortiermodus : Vorbearbeitung des Sortierbegriffs
set c5=1 

rem   c7   Wiederholungsmodus: wenn gesetzt, dann bei Wiederholung des
rem          Sortierbegriffs C7 einsetzen
set c7= 

rem   c8   Negativmodus : "0!!!"  oder  "z~z~"  oder  unbesetzt
set c8=

rem   c9   Auszugebende Kategorien, zusÑtzlich zur Sortierkategorie
set c9=

rem ********* Abfrageteil ******************************************
rem Kann entfallen, wenn man geeignete set-Befehle gesetzt hat

echo Datenbank:  %-D%\%-B%
echo.
if not exist q-*.bat goto kategorie
echo Wollen Sie 
echo.
echo 1 : Alles mit der Hand eingeben?
echo 2 : FrÅhere Einstellungen Åbernehmen?
echo x : Vorgang beenden
gk 12x
if errorlevel 3 goto finish
if errorlevel 2 goto frueher

:kategorie
echo.
echo Nach welcher Kategorie soll sortiert werden?
echo   (Geben Sie eine oder mehrere Kategorien an, getrennt durch Kommas:
echo    z.B.    40,60,20
echo   (genommen wird dann zum Sortieren die erste, die vorkommt)
echo.
acreply REPLY 24
call acantw.bat
if %REPLY%x == x goto kategorie
if %REPLY%x == xx goto begin
echo.
rem Antwort in Environment-Variable c1 schreiben
set C1=%REPLY%

echo.
echo Wenn keine Kategorie %C1% vorkommt, was dann?
echo 0 : Satz nicht ausgeben
echo a : Satz am Anfang der Liste ausgeben
echo e : Satz an das Ende der Liste setzen
acreply REPLY 2
call acantw.bat
echo.
rem gk 0aex
if %REPLY%x == x goto kategorie
if %REPLY%x == xx goto kategorie
if %REPLY%x == ex set c8=z~z~
if %REPLY%x == ax set c8=0!!!

:sortiermod
rem Erweiterung moeglich:   S-QUEX.APR entsprechend ausbauen
echo.
echo Sortiermodus:
echo 1 = Normal (Umlaute aufloesen, Nichtsortierwoerter beseitigen)
echo 2 = Pica-Namensmodus (Vorname@Nachname)
echo 8 = Numerisch sortieren
echo 9 = Keine Umcodierung - unveraendert sortieren

acreply REPLY 2
call acantw.bat
if %REPLY%x == x goto sortiermod
if %REPLY%x == xx goto kategorie

rem Antwort in Environment-Variable c5 schreiben
set C5=%REPLY%

:trenn
echo.
echo.
echo Welches Zeichen ist das Trenn- oder Endezeichen des Sortierfeldes?
echo   moegliche Zeichen:  ;    - / . , ( * ' : =  oder  b=Leerzeichen 
echo (Wenn Eingabe nicht klappt, ein t davor eingeben, z.B. t; )
echo.
acreply REPLY 3
call acantw.bat
if %REPLY%x == x goto trenn
set C2=%REPLY%
rem Env.Var. c2 enthaelt jetzt das Trennzeichen

:modus
echo.
echo.
echo Welche Teile des Sortierfeldes sind auszuwerten:
echo Waehlen Sie: 1 = nur der Anfangsteil (Ende beim Trennzeichen)
echo              2 = jeder Teil (auch Teile zwischen den Trennzeichen)
echo.
acreply REPLY 3
call acantw.bat
if %REPLY%x == 1x goto setmod
if %REPLY%x == 2x goto setmod
goto modus
:setmod
set C3=%REPLY%

:mehrfach
echo.
echo.
echo Wieviele AusgabesÑtze maximal je Datensatz?
echo    (Geben Sie eine positive Zahl ein, oder 0 fuer unbegrenzt)
echo    (wenn Sie [Enter] druecken, wird 1 angenommen)
echo.
acreply reply 5
call acantw.bat
if %REPLY%x == x goto art
echo.
rem Antwort in Environment-Variable c4 schreiben
set C4=%REPLY%


:art
echo.
if exist export.%-K1%pt del export.%-K1%pt 

rem Das folgende kann erweitert werden:
rem (mit eigenen quexXY.apt Steuerdateien)

echo Welche Art der Ausgabe-Aufbereitung ?
echo 1 = nach Art von dBase (Komma als Trennzeichen)
echo 9 = nach eigenen Vorgaben
:ausgart
acreply REPLY 3
call acantw.bat
if %REPLY%x == 1x goto dbase
if %REPLY%x == 9x goto vorgaben
goto ausgart

:dbase
rem  wenn dBase-Export: quexdb.apt auf export.cpt kopieren
copy quexdb.apt export.%-K1%pt >nul
:katego
echo.
echo.
echo Welche Kategorien sollen exportiert werden   (au·er der Sortierkategorie)?
echo (Geben Sie eine oder mehrere Kategorien an, getrennt durch Kommas:
echo   z.B.    20,74,75,76,77,90
echo.
acreply reply 125
call acantw.bat
if %REPLY%x == x goto katego
echo.
set C9=%REPLY%
goto check

:vorgaben
copy q-export.apt export.%-K1%pt >nul
echo.
echo.
echo Wiederholungszeichen (beim Ausdrucken):
echo [Enter], wenn Sortierbegriff jedesmal mit auszugeben ist
echo 0      , wenn der Sortierbegriff nicht mit auszugeben ist
echo Sonst geben Sie hier die Zeichen ein, z.B. **** oder ---, die gesetzt 
echo          werden sollen, wenn der Sortierbegriff sich wiederholt
echo          (dabei statt Leerzeichen den Unterstrich _ benutzen)
echo.
acreply REPLY 12
call acantw.bat
if %REPLY%x == x goto vorgab2
set C7=%REPLY%

:vorgab2
echo.
echo Gleich koennen Sie alle Kategorien angeben, die in der Liste erscheinen sollen!
echo (Nehmen Sie die Liste der Kategorien zur Hand!)
echo Leertaste, dann geht's weiter (jedes Feld wird einzeln abgefragt)...
pause > nul
:f1
call quex2 1
if %REPLY%x == yx goto :f1
call quex2 2
if %REPLY%x == yx goto setc9
call quex2 3
if %REPLY%x == yx goto setc9
call quex2 4
if %REPLY%x == yx goto setc9
call quex2 5
if %REPLY%x == yx goto setc9
call quex2 6
if %REPLY%x == yx goto setc9
call quex2 7
if %REPLY%x == yx goto setc9
call quex2 8
if %REPLY%x == yx goto setc9
call quex2 9
if %REPLY%x == yx goto setc9
call quex3 0
if %REPLY%x == yx goto setc9
call quex3 1
if %REPLY%x == yx goto setc9
call quex3 2
if %REPLY%x == yx goto setc9
call quex3 3
if %REPLY%x == yx goto setc9
call quex3 4
if %REPLY%x == yx goto setc9
call quex3 5
if %REPLY%x == yx goto setc9
call quex3 6
if %REPLY%x == yx goto setc9
call quex3 7
if %REPLY%x == yx goto setc9
call quex3 8
if %REPLY%x == yx goto setc9
call quex3 9
if %REPLY%x == yx goto setc9

:setc9
rem Kategorieliste steht jetzt in C9

:laenge
echo.
echo Zeilenlaenge der Ausgabeliste?  (0 = ohne Zeilenumbruch)
acreply reply 4
call acantw.bat
if %REPLY%x == x goto laenge
echo zl=%REPLY% >> export.%-K1%pt

echo.
echo Steuerzeichen am ANFANG eines Satzes? (Geben Sie in folgender Form ein:)
echo    -  Textzeichen in "..."
echo    -  Steuerzeichen als Dezimalzahlen
echo    -  C = Neue Zeile
acreply reply 32
call acantw.bat
echo 80=%REPLY% >> export.%-K1%pt
  if %REPLY%x == Cx echo 80=%REPLY% >> export.%-K1%pt
  if not %REPLY%x == Cx echo 80=%REPLY% >> export.%-K1%pt


echo.
echo Steuerzeichen am ENDE eines Satzes?
echo    -  Textzeichen in "..."
echo    -  Steuerzeichen als Dezimalzahlen
echo    -  C = Neue Zeile
acreply reply 32
call acantw.bat
echo 82=%REPLY% >> export.%-K1%pt

:check

rem Kontrollanzeige
cls
echo.
echo Sortierkategorien: %C1%
echo.
echo Trennzeichen     : %C2%
echo.
echo Modus:
if %C3%x == 1x echo    Nur Anfangsteil nehmen (bis zum Trennzeichen)
if %C3%x == 2x echo    Kategorien am Trennzeichen zerlegen, alle Teile nehmen
echo.
echo Ausgabesaetze je Datensatz: %C4%
echo.
echo Sortiermodus: %C5%
echo.

rem echo Wenn keine Sortierkategorie vorkommt:
rem if %C8%x == z~z~x echo    Dann Satz am Ende ausgeben
rem if %C8%x == 0!!!x echo    Dann Satz am Anfang der Liste
rem if %C8%x == x echo    Dann Satz nicht ausgeben
rem echo.

if %C7%x == x goto n1

echo Wiederholungszeichen fuer Sortierkategorie:  %C7%

:n1
rem echo Auszugeben sind diese Kategorien:  %C9%
rem echo.
rem type export.%-K1%pt
rem echo.
echo Alles richtig?  j/n

gk njy
if errorlevel 2 goto ausw

echo.
echo 1 : Alles nochmal eingeben
echo 2 : Parameterdatei nachbearbeiten
echo 3 : Alles ok
echo x : Vorgang abbrechen
gk 123x
if errorlevel 4 goto finish
if errorlevel 3 goto ausw
if errorlevel 2 goto param
goto kategorie

:param
x export.%-K1%pr


:ausw

rem ************* Ende des Abfrageteils ***********************************

echo Sollen diese Einstellungen aufbewahrt werden?   j/n
gk jn
if errorlevel 2 goto start

echo set C1=%C1% > Q-QQQ.BAT
echo set C2=%C2% >> Q-QQQ.BAT
echo set C3=%C3% >> Q-QQQ.BAT
echo set C4=%C4% >> Q-QQQ.BAT
echo set C5=%C5% >> Q-QQQ.BAT
if not %C7%x == x echo set C7=%C7% >> Q-QQQ.BAT
echo set C8=%C8% >> Q-QQQ.BAT
echo set C9=%C9% >> Q-QQQ.BAT
echo Geben Sie einen Namen dafuer ein   (bis zu 6 Zeichen)
echo Diese Namen gibt es schon:
echo.
dir q-*.bat
echo.
echo Geben Sie jetzt einen neuen Namen ein   (Ohne Q- am Anfang)
:newname
acreply reply 16
call acantw.bat
if %REPLY%x == x goto newname
copy Q-QQQ.bat q-%REPLY%.bat >nul
copy export.%-K1%pt q-%REPLY%.xpt >nul
goto start

:frueher
dir q-*.bat
echo.
echo Welche Datei soll es sein?  (Eingabe des Namens ohne Q- )
acreply reply 16
call acantw.bat
if not exist Q-%REPLY%.BAT goto frueher
call Q-%REPLY%.BAT
copy q-%REPLY%.xpt export.%-K1%pt >nul

rem ************* Eigentliche Prozedur: ***********************************
rem (Was oben steht, kann auch durch geeignete set-Befehle ersetzt werden
rem wenn man feste Standardprozeduren einrichtet

rem Volltextsuche wird gestartet, mit c-fi.apr fuer Export
rem    -f6 einsetzen, wenn keine Suche, sondern Gesamtausgabe gewuenscht

:start
cls
if %C9%x == x goto enviro

rem S-QUEX.APT wird erzeugt: (wird geladen in S-QUEX.APR)

rem $$011011 : Q statt ^ (sonst Fehler)

echo #nr p'%C1%Q' e'Q' ac1 >  ssss
echo #nr p'%C2%Q' e'Q' ac2 >> ssss
echo #nr p'%C3%Q' e'Q' ac3 >> ssss
echo #nr p'%C4%Q' e'Q' ac4 >> ssss
echo #nr p'%C5%Q' e'Q' ac5 >> ssss
echo #nr p'%C6%Q' e'Q' ac6 >> ssss
echo #nr p'%C7%Q' e'Q' ac7 >> ssss
echo #nr p'%C8%Q' e'Q' ac8 >> ssss
echo #nr p'%C9%Q' e'Q' ac9 >> ssss

copy ssss s-quex.%-K1%pt

echo.
echo.
echo Wie wollen Sie die Daten herausziehen?
echo.
echo   1 : mit Volltextsuche  
echo   2 : als Ergebnismenge (ueber die Register, Export mit F4)
echo   x : Irrtum, zurueck zur Auswahl
:start2
echo
acreply REPLY 3
call acantw.bat
echo.

if %REPLY%x == 2x goto prstart
if %REPLY%x == xx goto begin
if not %REPLY%x == 1x goto start2

rem Volltextsuche
srch -f4 -e s-quex/qx.%-K1%lg -m0 -v0 -k%-K% -b%-D%\%-B%
goto phase2

:prstart
rem PRESTO wird gestartet mit  s-quex.cpr  fuer den F4-Export
presto -e s-quex/qx.%-K1%lg -a1 -n1 -k%-K%


:phase2
echo Sortierung...
asort qx.%-K1%lg quex.%-K1%lg
del qx.%-K1%lg

srch -k%-K% -ep-quex/liste -dquex -b%-D%\%-B% -f6 -m0 -v0

rem del quex.%-K1%lg

rem ***************** Ende der eigentlichen Prozedur ************************

goto end
rem -------------------------------
:noparam
echo Parameterdatei  s-quex.%-K1%pr  nicht gefunden
echo.
dir c-*.%-K1%pr
pause
goto end
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
echo Ausserdem muss es die Parameterdateien  S-QUEX.APR + P-QUEX.APR  geben
echo.
pause
goto finish

:end
cls
echo.
echo Die Datei LISTE ist jetzt fertig.
:anzeigen
echo.
echo Was nun?
echo.
echo 1 = Liste betrachten
echo p = Liste drucken (nur sinnvoll, wenn dafuer geeignet)
echo x = Ende
echo.
gk 1px
if errorlevel 3 goto schluss
if errorlevel 2 goto drucken
v liste
goto anzeigen

:drucken
copy liste prn >nul
goto anzeigen




:schluss
echo.
echo Sie koennen die Datei LISTE jetzt z.B. mit einem Textsystem einlesen.
echo Bei der naechsten QUEX-Produktion wird sie ueberschrieben! Deshalb
echo lieber umbenennen, wenn die Liste aufbewahrt werden soll.
pause
goto finish

:enviro
cls
echo.
echo Leider nicht genuegend Platz fuer Umgebungsvariablen
echo Vergroessern Sie den Wert in Ihrer Datei CONFIG.SYS,
echo z.B. diese Zeile einbauen: (um 1000 Bytes zu reservieren)
echo.
echo      SHELL=C:\COMMAND.COM C:\ /E:1000 /P
echo.
echo Dann neuer Warmstart, und los geht's
pause

:finish
set -c1=
set -c2=
set -c3=
set -c4=
set -c5=
set -c7=
set -c8=
set -c9=
