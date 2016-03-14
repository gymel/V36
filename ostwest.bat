rem OSTWEST.BAT  20021017
rem Tastatur und Zeichensatz auf erweiterte Codes umstellen
rem wird unter XP nicht mehr gebraucht!
@echo off
if %-P%x == x goto a1

%-P%\fontload < %-P%\ostwest.fon
%-P%\aw
goto ende

:a1
fontload <ostwest.fon
aw

:ende
echo Zeichensatz geladen, Tabelle aufrufen mit Alt+w
