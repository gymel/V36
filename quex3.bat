@echo off
:f1
cls
echo Die 1%1. Kategorie bitte: (Ende: x)
acreply reply 8
call acantw.bat
echo.
if %REPLY%x == x goto f1
if %REPLY%x == xx goto nichts
set F1=%REPLY%
echo.
echo Welches Textelement soll  VOR  diese Kategorie? (C = Neue Zeile)
echo   0=keins       1='. '        2=', '        3='; '       4=C 
echo   5=' : '       6=C C         7=' = '       8='. - '     9=' / '
echo  10=' ('       11=')'        12=' ['       13=']'       14='   '
echo Geben Sie nur die Nummer ein!
acreply reply 8
call acantw.bat
echo.
set rep=%REPLY%
if %REPLY%x == x goto f2
if %REPLY%x == 0x goto f1a
echo.
echo Das Textelement soll erscheinen:
echo 1 = In jedem Fall     2 = Nur wenn die Kategorie belegt ist
:cond
acreply reply 2
call acantw.bat
echo.
if %REPLY%x == 2x goto f1a
if not %REPLY%x == 1x goto cond

echo 2%1=t%REP%    vor #%F1% >> export.%-K1%pt
echo 4%1="" >> export.%-K1%pt
goto f1b
:f1a

echo 4%1=t%REP%    vor #%F1% (nur wenn belegt) >> export.%-K1%pt
echo 2%1="" >> export.%-K1%pt

:f1b
echo.
echo .. und welches Textelement soll  DAHINTER?
echo (Nummer eingeben, [Enter] wenn nichts)
acreply reply 8
call acantw.bat
echo.
if %REPLY%x == x goto f2
echo 7%1=t%REPLY%    hinter #%F1% >> export.%-K1%pt 
goto f2

:nichts
echo.
echo War's das?  j/n
gk jn
if errorlevel 2 goto f1
set REPLY=y
goto ende

:f2
echo.
echo Sind alle Angaben richtig? j/n
gk jn
if errorlevel 2 goto f1
rem Ist C9 schon belegt?
if %C9%x == x goto C9
rem dann F1 anhaengen
set C9=%C9%,%F1%
goto ende
:c9
rem sonst c9 = F1 setzen
set C9=%F1%
:ende
set f1=

