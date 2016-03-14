rem Bearbeiten der Indexparameter
rem EDIT-IXP.BAT   $$950417 / 2001-04-05

@echo off
if exist %-D%\%-B%.%-K1%PI goto D
rem Datei ist auf Programmverz.:
copy %-B%.%-K1%PI %-D%
x %-D%\%-B%.%-K1%PI
goto ende

rem Datei ist auf Datenverz.:
:D
x %-D%\%-B%.%-K1%PI

:ende
