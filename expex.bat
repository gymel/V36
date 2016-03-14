@echo off

ansi
set -L=GER

if %1x == x goto instruct

presto -a2 -ks -dexpex -sdesa -n1 -S -pdisplay%1

goto end

:instruct

presto -a2 -ks -dexpex -pinstruct -n1 -S -sdesa 

:end

echo Die n„chste Sitzung k”nnen Sie sofort mit einem h”heren 
echo Schwierigkeitsgrad beginnen, wenn Sie z.B. mit
echo.
echo expex 5
echo.
echo starten. Dann wird gleich DISPLAY5 verwendet.
