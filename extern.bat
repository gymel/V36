@echo off
:start
cls
echo Was darf's sein?
echo. 
echo 0  -Eine alte Datei wieder aktivieren (Vorversion)
echo. 
echo 1  -Eine neue Datei wieder aktivieren (V21)
echo. 
if not exist cp1.opt echo 2  -CockPit mit den neuen Programmen (a99, alcarta)
if not exist cp1.opt echo     (Es gibt dann einen MenÅpunkt dafÅr unter "Eigene Routinen")
if exist cp1.opt echo 2  -ZurÅck zum eigenen CockPit 
if exist cp1.opt echo     (Ihr CockPit wird in den alten Zustand versetzt)

echo.
echo x  -Exit (Dieses MenÅ verlassen)
gk 012x

if errorlevel 4 goto ende
if errorlevel 3 goto cockpit
if errorlevel 2 goto neu

cls
if not exist v21 md v21
dir v20 /w
echo Welche Datei? (x fÅr Irrtum)
acreply REPLY 21
call acantw.bat
if %REPLY% == x goto start
copy %REPLY% v21
copy v20\%REPLY%
pause
goto start

:neu
cls
dir v21 /w
echo Welche Datei? (x fÅr Irrtum)
acreply REPLY 21
call acantw.bat
if %REPLY% == x goto start
 
copy v21\%REPLY% .
pause
goto start

:cockpit
set -d=
set -b=
if not exist cp1.opt goto qq
ren cp.opt cp20.opt
ren cp1.opt cp.opt
if exist cp.pre del cp.pre
goto ende

:qq
ren cp.opt cp1.opt
ren cp20.opt cp.opt
if exist cp.pre del cp.pre
rem Jetzt wird automatisch CockPit mit CP.OPT wieder gestartet
rem jetzt ist das aber  CP20.OPT! (s.o.)
echo.
echo Wenn Sie die neue Demo-Datenbank sehen wollen: 
echo Zuerst Åber MenÅ "Optionen" das Verz. DEMO2 auswÑhlen
echo.
pause

:ende
