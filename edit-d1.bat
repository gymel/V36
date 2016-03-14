rem Bearbeiten der Anzeigeparameter (Aufruf per CockPit)
rem EDIT-D1.BAT   941226/2001-04-05

@echo off
if exist %-D%\D-1.%-K1%PR goto D
rem Datei ist auf Programmverz.:
rem zuerst kopieren auf DatenVerz
copy d-1.%-K1%PR %-D%
rem dann dort bearbeiten
x %-D%\D-1.%-K1%PR
goto ende

rem Datei ist auf Datenverz.:
:D
x %-D%\D-1.%-K1%PR

:ende
