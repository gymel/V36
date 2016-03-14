@echo off
rem Umwandlung PICA nach  A.CFG, Ausgangsdatei  ./pica.dat  oder auf A:
rem PICA.BAT 960609 / 2001-05-13

rem  Noch vorhandene Datei beseitigen
if exist pica.alg del pica.alg
if not exist pica.dat goto diskette
%-P%\import -dpica.dat -f5 -ipica -v0 -m0 -e i-pica/pica.alg -s0 -h0
goto einmisch

:diskette
%-P%\import -da: -f5 -ipica -v0 -m0 -e i-pica/pica.alg -s0 -h0

:einmisch
echo Jetzt werden die Daten in Ihre Datenbank %-D%\%-B% eingemischt
echo Strg+c drÅcken, wenn nicht gewuenscht
pause
rem Einzelplatz: dann auch dieses moeglich (schneller bei grossen Mengen)
rem index -f7 -d pica -m0 -v0 -h0 -e%-B%/%-D% -n1

rem Mehrplatz oder Einzelpl., wenn Datenbank nicht mehr ganz klein
rem      -fm41  wenn Ersetzung gewuenscht

%-P%\acon -jupdate -fm01 -d%-D%\%-B% -upica.ALG -n1 -m1

if exist pica.zzz del pica.zzz
ren oclc.alg oclc.zzz
if exist pica.dat del pica.yyy
ren pica.dat pica.yyy
