@echo off
rem  Wird aus PRONTO.BAT 20mal aufgerufen
rem  Zweck: Definition eines Datenfeldes
rem  Aufruf: pronto2  n k s
rem                   n = lfd. Nr. des Feldes
rem                     k = Kategorienummer
rem                       s = Sprungmarkenbuchstabe f. Abfrageliste
:
rem  Diese Environment-Variablen werden angelegt:
rem  Var  Bedeutung    Inhalt                                        fuer
rem ---------------------------------------------------------------------------
rem  SN   Short name   Kurzbezeichnung fuer Kategorieliste           pronto.cf2
rem  LN   Long name    Langbezeichnung fuer Abfrage                  pronto.cf3
rem  CK   Check        Pruefbuchstabe                                pronto.cf2
rem  MF   Mult.Field   Mehrfachfeld (Abfrageschleife)                pronto.cf3
rem  MA   Mandatory    Pflichtfeld ("!..." in Abfrage)               pronto.cf3
rem  IX   Index        Ziffer fuer Register / 0: nicht indexieren    pronto.ix2
rem  FS   FieldSepar   Trennzeichen (b fuer blank)                   pronto.ix2
rem  DI   Display      Anzeige gewuenscht? j/n                       pronto.di2

rem  Die Angaben werden in die Dateien PRONTO.CF1 und .CF2 sowie in
rem  PRONTO.IX2 und PRONTO.DI2 geschrieben.

rem Vorbesetzungen:
set SN=
set LN=
set CK=a
set MA=j
set MF=n
set IX=0
set FS=";"
set DI=j

:start
cls
echo.
echo Datenfeld %1  der Datenbank  %-B% 
:kurzname
echo.
if not %1_ == 1_ echo Kurzbezeichnung (bis zu 10 Zeichen, x fuer Ende) [%SN%]
if %1_ == 1_ echo Kurzbezeichnung  (bis zu 10 Zeichen) [%SN%]
echo xxxxxxxx
acreply REPLY 11
call acantw.bat
echo.
if %REPLY%x == x if not %SN%x == x goto eingab
if %REPLY%x == x goto kurzname
if %REPLY%x == xx goto ende
set SN=%REPLY%
echo.
:eingab
echo Bezeichnung in der Eingabemaske (bis zu 20 Zeichen) [%LN%]
echo (Guenstig ist, eine konstante Laenge zu waehlen, etwa mit einem
echo  Doppelpunkt auf der letzten Stelle. Vorsicht: Statt Leerzeichen _ benutzen!)
echo xxxxxxxxxxxxxxxxxxx:
acreply REPLY 21
call acantw.bat
echo.
if %REPLY%x == x if not %LN%x == x goto valid
if %REPLY%x == x if %LN%x == x goto eingab
if %REPLY%x == xx goto ende
if not %REPLY%x == x set LN=%REPLY%

:valid
echo.
echo.
echo Eingabepruefung? [%CK%]
echo (a: nichts, c: Artikel am Anfang, d: Personenname, e: Jahreszahl)
acreply REPLY 2
call acantw.bat
echo.
if %REPLY%_ == a_ set CK=a
if %REPLY%_ == d_ set CK=d
if %REPLY%_ == c_ set CK=c
if %REPLY%_ == e_ set CK=e

echo.
echo.
echo Soll "%SN%" ein Pflichtfeld sein? j / n [%MA%]
acreply REPLY 2
call acantw.bat
echo.
if not %REPLY%x == x set MA=%REPLY%

echo.
echo.
echo Ist Mehrfachabfrage gewuenscht? j / n [%MF%]
acreply REPLY 2
call acantw.bat
echo.
if not %REPLY%x == x set MF=%REPLY%


echo.
echo.
echo In welches Register soll das Feld 1...9 (0 : keines) [%IX%]
acreply REPLY 2
call acantw.bat
echo.
if not %REPLY%x == x set IX=%REPLY%
if %REPLY%Z == 0Z goto displ

echo.
echo.
echo Zerlegung im Index gewuenscht? Dann Trennzeichen eingeben:
echo b: Leerzeichen, n: keine Zerlegung  z.B. ; fuer Trennung am Semikolon [%FS%]
acreply REPLY 2
call acantw.bat
echo.
if not %REPLY%x == x set FS="%REPLY%"
if %REPLY%Z == bZ set FS=" "

:displ
echo.
echo.
echo Soll "%SN%" in der Anzeige erscheinen (als "%LN%")? j / n
echo (D.h. soll dieses Feld beim Zugriff normalerweise angezeigt werden?) (%DI%)
acreply REPLY 2
call acantw.bat
echo.
if not %REPLY%x == x set di=%REPLY%

echo.
echo Einstellungen fuer Datenfeld %1:
echo.
echo Kurzname:    %SN%
echo Eingabe:     %LN%
echo Check:       %CK%
echo Pflicht:     %MA%
echo Mehrfach:    %MF%
echo Register:    %IX%
echo Zerlegung:   %FS%
echo Anzeige:     %DI%

echo.
echo Alles in Ordnung? j/n
gk jyn
echo.
if errorlevel 3 goto start

if %IX%_ == 1_ set IX=A
if %IX%_ == 2_ set IX=B
if %IX%_ == 3_ set IX=C
if %IX%_ == 4_ set IX=D
if %IX%_ == 5_ set IX=E
if %IX%_ == 6_ set IX=F
if %IX%_ == 7_ set IX=G
if %IX%_ == 8_ set IX=H
if %IX%_ == 9_ set IX=I

if not %CK%_ == a_ echo #%2"%SN%"C %CK% >> pronto.cf2
if %CK%_ == a_ echo #%2"%SN%" >> pronto.cf2

if %MF%_ == n_ if not %MA%_ == n_ echo %2 "!%LN% " >> pronto.cf3
if %MF%_ == n_ if %MA%_ == n_ echo %2 "%LN% " >> pronto.cf3

if %MF%_ == n_ goto reg
echo -%3 >> pronto.cf3
echo %2 "%LN%"+%3 >> pronto.cf3

:reg
if not %FS%_ == "n"_ echo ak=%2.%FS%+%IX% >>pronto.ix2
if %FS%_ == "n"_ echo ak=%2.+%IX% >>pronto.ix2

if not %DI%_ == n_ echo #%2. ++ p{ t4 t73 "%LN% : " t76 } m{ C } >>pronto.di2


echo.

:ende
echo.
echo Dateien werden angelegt...
