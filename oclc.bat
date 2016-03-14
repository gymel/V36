@echo off
rem Umwandlung OCLC nach A.CFG
rem OCLC.BAT 950513

rem  Noch vorhandene Datei beseitigen
if exist marc.alg del marc.alg
if not exist marc.dat goto disk
%-P%\import -dmarc.dat -f5 -ioclc -v0 -m0 -e i-1/marc.alg -s0 -h0
goto einmisch

:disk
%-P%\import -da: -f5 -ioclc -v0 -m0 -e i-1/marc.alg -s0 -h0
if not exist marc.alg goto nix

:einmisch
echo Jetzt werden die Daten zu Ihrer Datenbank %-D%\%-B% ergÑnzt
echo Strg+c drÅcken, wenn nicht gewÅnscht
pause
rem Einzelplatz:
rem %-P%\index -f7 -d oclc -m0 -v0 -h0 -e%-B%/%-D% -n1

rem Mehrplatz oder Einzelpl., wenn Datenbank nicht mehr ganz klein
rem      -fm41  wenn Ersetzung gewÅnscht

%-P%\acon -jupdate -fm01 -d%-D%\%-B% -umarc.ALG -n1 -m1
goto ende

:nix
echo Konvertierung nicht gelungen. Datei MARC.ALG existiert nicht
goto exit

:ende
if exist marc.zzz del marc.zzz
ren marc.alg marc.zzz
if exist marc.yyy del marc.yyy
ren marc.dat marc.yyy
:exit
