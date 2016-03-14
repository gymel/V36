@echo off
rem Start von alcarta aus dem CockPit
echo Empfehlung:
echo -----------
echo Wenn Sie dauerhaft mit alcarta arbeiten m”chten, legen Sie sich
echo am besten eine eigene INI-Datei an (Muster: a99.ini).
echo Diese k”nnen Sie dann mit einem Icon auf dem Desktop verbinden,
echo der Befehl muss dann lauten:  c:\allegro\alcarta ini-dateiname
echo Ansonsten k”nnen Sie auch die Startdatei ALCSTART.BAT modifizieren
echo (das ist die, die Sie jetzt gerade sehen)
pause

rem Jetzt wird eine minimale INI-Datei XXX.INI zusammengesetzt:

echo [General] >xxx.ini
echo DbName=%-B% >>xxx.ini
echo DbDir=%-D% >>xxx.ini
echo Konfiguration=%-K% >>xxx.ini
echo Language=%-L% >>xxx.ini
echo setsize=1 >>xxx.ini
echo ProgDir=%-P% >>xxx.ini
alcarta xxx