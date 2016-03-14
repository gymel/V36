@echo off
rem al.bat : acon  mit al.job starten
rem Hilfe:  al help  eingeben

:start
cls

rem mit al new ... wird Neuanlage verlangt
if :%1: == :new: goto N

rem Diese Aufrufe rufen die Hilfe hervor
if :%1: == :help: goto H
if :%1: == :-help: goto H
if :%1: == :/?: goto H
if :%1: == :h: goto H
if :%1: == :-h: goto H
if :%1: == :: goto demo

rem Aufrufe mit 2 bzw. 3 Argumenten
if :%2: == :: goto C
if :%3: == :: goto B

acon -jal -d%1 -b%2 -k%3 
goto ENDE

:demo
acon -jal -ddemo2 -bcat -ka
goto ENDE

rem konfig ist default a
:B
acon -jal -d%1 -b%2 -ka
goto ENDE

rem Ohne Argumente wird demobase benutzt
:C
acon -jal %1
goto ENDE


rem  Neue Datenbank anlegen
:N

if :%2: == :: goto ko
rem Ordner anlegen, falls nicht vorhanden
if not exist %2 mkdir %2
rem wenn "cat", dann aus demo2 nehmen!
if :%3: == :cat: copy demo2\cat.api %2

if :%3: == :: goto NC
if :%4: == :: goto NB
acon -jnewdb -d%2 -b%3 -k%4 
pause
acon -jal -d%2 -b%3 -k%4
goto ENDE

rem default konfig a
:NB
acon -jnewdb -d%2 -b%3 -ka
pause
acon -jal -d%2 -b%3 -ka
goto ENDE

rem Defaults Dbn=cat und konfig=a
:NC
rem wenn "cat", dann aus demo2 nehmen!
if :%3: == :cat: copy demo2\cat.api %2
rem zuerst Datenbank anlegen
acon -jnewdb -d%2 -bcat -ka
pause
rem dann dieses Skript mit DbDir nochmals aufrufen
al %2

jump ENDE

:ko
echo.
echo Es fehlt der Ordnername!
echo.

:H
echo al : Hilfsprogramm fuer das allegro-System
echo -----------------------------------------
echo Vorhandene Datenbank benutzen oder neue anlegen:
echo al [new] [dbdir [dbname [konfig]]]
echo.
echo    dbdir  = Datenbankordner; Default: demo2
echo    dbname = Datenbankname; Default: cat  (f. cat.api)
echo    konfig = Konfiguration; Default: a  (f. $a.cfg)
echo    new    = Datenbank soll mit den weiteren Argumenten neu angelegt werden 
echo.
echo Mit "new" wird auch der Ordner, falls noch nicht vorhanden, neu angelegt.
echo Die Parameter und die CFG muessen dann auf dem Startverzeichnis von acon 
echo liegen, sonst k”nnen sie auch im Datenordner liegen und werden dann von 
echo dort genommen.
echo Die notwendigen Dateien werden erzeugt und ein Testsatz geschrieben, den man
echo gleich anschlieáend l”schen kann.
echo.
echo Wenn eine  xyz.ini  oder  xyz.ina vorhanden ist, kann man so starten:
echo    al xyz
echo.

:ENDE

