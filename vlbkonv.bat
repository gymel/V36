@echo off
rem VLB-Datenumwandlung und Einspeisung
rem  fÅr Einzelplatz, umstellbar auf Mehrplatz
rem VLBKONV.BAT  950704 / 2001-05-13

rem  Noch vorhandene Datei beseitigen
if exist vlb.alg del vlb.alg
if not exist vlb.dat goto disk
%-P%\import -dvlb.dat -f5 -ivlb -v0 -m0 -e i-1/vlb.alg -s0 -h0
goto einmisch

:disk
%-P%\import -da: -f5 -ivlb -v0 -m0 -e i-1/vlb.alg -s0 -h0

:einmisch
echo Jetzt werden die Daten zu Ihrer Datenbank %-D%\%-B% ergÑnzt
echo Strg+c drÅcken, wenn nicht gewÅnscht
pause
rem Einzelplatz: dann auch dieses moeglich (schneller bei grossen Mengen)
rem index -f7 -d vlb -m0 -v0 -h0 -e%-B%/%-D% -n1

rem Mehrplatz oder Einzelpl., wenn Datenbank nicht mehr ganz klein
rem      -fm41  wenn Ersetzung gewÅnscht

%-P%\acon -jupdate -fm01 -d%-D%\%-B% -uvlb.ALG -n1 -m1

if exist vlb.zzz del vlb.zzz
ren oclc.alg oclc.zzz
if exist vlb.dat del vlb.yyy
ren vlb.dat vlb.yyy
