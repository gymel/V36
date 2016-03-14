rem  FREMD.BAT : Umwandlung und Einspeisung von Fremddaten
rem  2001-05-13 / 2006-04-24 Anpassung fuer N.CFG: Umweg ueber .ALG
rem   wird angehaengt an eine IMPRT.BAT, die von FREMD.FLX erstellt wird!

@echo off

%-P%\ansi.com
rem  Noch evtl. vorhandene Datei beseitigen
if exist %-F%.%-K1%lg del %-F%.%-K1%lg

rem Ist CFG zugaenglich?
rem  Wenn sie auf ProgDir oder Lokal nicht existiert: 
rem  dann vom DbDir kopieren! Name faengt evtl. mit $ an.
if exist %-P%\%-K%.cfg goto go
if exist %-P%\$%-K%.cfg goto go
if exist %-K%.cfg goto go
if exist $%-K%.cfg goto go

copy %-D%\$%-K%.CFG $%-K%.CFG >nul
copy %-D%\%-K%.CFG %-K%.CFG >nul

:go
set KN=%-K%
if %-K% == N set -K1=A
if %-K% == n set -K1=A
if %-K% == N set KN=A
if %-K% == n set KN=A
if not exist %-F%.dat goto disk
%-P%\import -k%KN% -d%-F%.dat -f5 -i%-F% -v0 -m0 -e %-I%/%-F%.%-K1%lg -s0 -h0
goto einmisch

:disk
%-P%\import -k%KN% -da: -f5 -i%-F% -v0 -m0 -e %-I%/%-F%.%-K1%lg -s0 -h0
if not exist marc.alg goto nix

:einmisch
if %-K% == N goto aton
if %-K% == n goto aton

:fertig
echo Jetzt k馬nen die Daten zu Ihrer Datenbank %-D%\%-B% erg�nzt werden
echo (Die Datei hei疸 %-F%.%-K1%lg)
echo Strg+c dr…ken, wenn nicht gew］scht - dann wird hier abgebrochen.
echo (Nach Abbruch k馬nen Sie die Daten im Programm als Offline-Datei laden,
echo  besichtigen und evtl. immer noch speichern!)
pause
rem Einzelplatz: Folgendes ist auch moeglich:
rem %-P%\index -f7 -d %-F% -m0 -v0 -h0 -e%-B%/%-D% -n2
rem     -n2 heisst: Einspeisung in Datei 2. Kann man aendern!
rem Mehrplatz oder Einzelpl., wenn Datenbank nicht mehr ganz klein
rem      -fm41  wenn Ersetzung gew］scht
%-P%\acon -jupdate -fm01 -d%-D%\%-B% -m1 -n2 -u%-F%.%-K1%lg 
goto ende

:nix
echo Konvertierung nicht gelungen. Datei %-F%.%-K1%LG existiert nicht
goto exit

:ende
if exist %-F%.zzz del %-F%.zzz
ren %-F%.%-K1%lg %-F%.zzz
if exist %-F%.yyy del %-F%.yyy
ren %-F%.dat %-F%.yyy
goto exit

rem Umwandlung N -> A
:aton
echo aton
pause
srch -f6 -ka -d%-F%.alg -ei-neut/%-F%.nlg -m0 -v0 
set -K1=N
goto fertig

:exit
