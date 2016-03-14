@echo off
rem Aufruf einer Command Shell
rem - %1 = Verzeichnis, auf dem gearbeitet werden soll
rem - %2 = Laufwerk

cls

%2
cd %1
prompt EXIT $p$g
if not %COMSPEC%x == x goto start
command.com /E:1536
goto ende

:start
%COMSPEC%

: Wenn EXIT gegeben wurde:
:ende
