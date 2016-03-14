rem Bearbeiten der Konfigurationsdatei
rem EDIT-CFG.BAT   $$941226 / 2001-04-05
 
@echo off
if exist %-D%\$%-K%.CFG goto D
rem Wenn es eine mit $ gibt, wird die genommen
if exist $%-K%.CFG goto E
if exist %-D%\%-K%.CFG goto F

rem Datei ist auf Programmverz.: Kopiere nach %-D%
copy %-K%.CFG %-D%
x %-D%\%-K%.CFG
goto ende
:E
copy $%-K%.CFG %-D%
x %-D%\$%-K%.CFG
goto ende

rem $Datei ist auf Datenverz.:
:D
x %-D%\$%-K%.CFG
goto ende
rem Datei ist auf Datenverz.:
:F
x %-D%\%-K%.CFG

:ende
