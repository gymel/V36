@echo off
rem XT.BAT : Satznummern per QRIX exportieren, dann Saetze per SRCH
rem 2001-04-05  Beispiel f. Zugriff auf Register und Daten mit Batch

rem Abfrage nach Suchbegriff:
echo 1 = Name
echo 2 = Stichwort

rem -P nicht gesetzt? dann default setzen
if %-P%x == x set -P=c:\allegro

%-P%\gk 12
if errorlevel 2 goto stich
set REG=1
echo geben Sie einen Namen ein (klein geschrieben):
%-P%\acreply REPLY 50
call %-P%\acantw.bat
goto search

:stich
set REG=3
echo geben Sie ein Wort ein (klein geschrieben):
%-P%\acreply REPLY 50 
call %-P%\acantw.bat

:search
echo.
rem Satznummern ermitteln und in xxxnum.alg schreiben:
%-P%\qrix -w%REG% -ddemo2 -x0 -M20 -Exxxnum.alg -fd -s%REPLY% -S%REPLY%zz >nul

rem z.B. bei P.CFG:
rem qrix -w%REG% -dpica -x0 -M20 -Exxxnum.PLG -kp -fd -s%REPLY% -S%REPLY%zz >nul -t0100,4000

rem Datens„tze holen und per E-XT.APR nach XT.TXT exportieren:
%-P%\srch -f6 -dxxxnum.alg -bc:\allegro\demo2\cat -eE-XT/xt.txt -m0 -s0 -v0 >nul
rem z.B. bei P.CFG:
rem srch -kp -f6 -dxxxnum -bc:\allegro\pica\pica -eE-XT/xt.txt -m0 -s0 -v0 >nul

rem Datei anzeigen:
v xt.txt
