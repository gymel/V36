rem CockPit-Start fuer Mehrplatzbetrieb oder unter Win'95/98/NT/2000
rem 2001-04-05
rem Starten Sie das System immer mit diesem Programm!
rem Wenn Einzelplatzbetrieb ausdruecklich gewuenscht:  CP -S
@echo off
cls
rem if not exist ccc.bat if exist ccc.alt del ccc.alt
if exist ccc.bat goto einsprung
if exist ccc.alt del ccc.alt
rem if "%-P%" == "" set -P=c:\allegro
rem Startprogramm fr CockPit
rem Umgebungswerte l”schen:

set -L=
set -K=

set -B=
set -C=

:einsprung
rem PROGRAMM starten
if %-P%x == x goto ohne

rem ANSI.SYS aktivieren, falls noch nicht geladen
%-P%\ansi.com /q >nul
rem Zeichensatz laden
call %-P%\ostwest.bat

rem  Hier wird das CockPit-Programm acp.exe gestartet:
rem     wenn beim Aufruf die Option -P angegeben wurde
%-P%\acp %1 %2 %3 %4 %5 %6 %7 %8 %9 -a3 -x
rem  -M anh„ngen, wenn Monochrom gewuenscht
goto weiter

:ohne
rem  Hier wird das CockPit-Programm acp.exe gestartet:
rem     wenn beim Aufruf keine Option -P angegeben wurde
rem ANSI.SYS aktivieren, falls noch nicht geladen
ansi.com /q
rem Zeichensatz laden
call ostwest.bat
acp %1 %2 %3 %4 %5 %6 %7 %8 %9 -a3 -x 
rem  -M anh„ngen, wenn Monochrom

:weiter

if errorlevel 10 goto end

echo *** Alte CCC.BAT *** >>ccc.alt
type ccc.bat>>ccc.alt
ccc
:end
if exist ccc.bat del ccc.bat
cls
