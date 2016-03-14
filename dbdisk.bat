@echo off
rem Umwandlung MAB2 nach A.CFG
rem DBDISK.BAT 950513 / 2001-05-13

rem  Noch vorhandene Datei beseitigen
if exist mab2.alg del mab2.alg
if not exist mab2.dat goto disk
%-P%\import -dmab2.dat -f5 -imab2 -v0 -m0 -e i-1/mab2.alg -s0 -h0
goto einmisch

:disk
%-P%\import -da: -f5 -imab2 -v0 -m0 -e i-1/mab2.alg -s0 -h0

:einmisch
echo Jetzt werden die Daten zu Ihrer Datenbank %-D%\%-B% ergÑnzt
echo Strg+c drÅcken, wenn nicht gewÅnscht
pause
rem Einzelplatz: dann auch dieses moeglich (schneller bei grossen Mengen)
rem index -f7 -d mab2 -m0 -v0 -h0 -e%-B%/%-D% -n1

rem Mehrplatz oder Einzelpl., wenn Datenbank nicht mehr ganz klein
rem      -fm41  wenn Ersetzung gewÅnscht

%-P%\acon -jupdate -fm01 -d%-D%\%-B% -umab2.ALG -n1 -m1

if exist mab2.zzz del mab2.zzz
ren oclc.alg oclc.zzz
if exist mab2.dat del mab2.yyy
ren mab2.dat mab2.yyy
