rem Statistische Auswertung von Kategorieinhalten
rem COUNT.BAT   950513
@echo off
rem COUNT.APR muss die zu verwendende Parameterdatei sein, z.B. C-0.APR
if not exist COUNT.APR goto ENDE
srch -f6 -d%-D% -e COUNT/zzz -m0 -v0
if not exist zzz goto ende
asort zzz zzz.alg
del zzz

srch -f6 -dzzz -e count2/count -m0 -v0
del zzz.alg

echo Ergebnisdatei heiát COUNT
echo beim n„chsten Tastendruck erscheint sie
pause
v COUNT
goto x
:ende
echo COUNT.%-K1%PR fehlt (Prototyp: C-0.APR)
:x