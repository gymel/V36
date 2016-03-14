rem ALPHA.BAT  941220
rem Produktion einer Liste mit alphabetischem Register
@echo off
rem  1.Schritt: Export mit SORT.APR in sortierfÑhiger Form
rem             (SORT.APR ist die gewÑhlte Param.Datei vom Typ SORT)
rem  SRCH durch PRESTO ersetzen, wenn Anwendung auf Ergebnismengen
del hhh1.alg
srch -f6 -e SORT/hhh1.alg -m0 -v0
if not exist hhh1.alg goto ende
rem  2.Schritt: Sortieren
asort hhh1.alg hhh2.alg
del hhh1.alg
rem  3. Schritt: a) Druckformatierung, und parallel dazu
rem              b) sortierfÑhiges Registerdatei
rem                 (PRINT.APR und ALPHA.APR Ñndern, wenn lfd.Nr. gewÅnscht)
srch -f6 -d hhh2.alg -e PRINT/liste -e ALPHA/hhh -m0 -b%-D%\%-B% -v0

rem  der Rest bleibt gleich (bei Seitenz. bzw. Nummern):
rem     und kann auch fÅr andere Konfigurationen Åbernommen werden!
del hhh2.alg
rem  4.Schritt: Sortieren der Registerdatei
asort hhh hhh.alg
del hhh
rem  5.Schritt: Zusammenfassen der identischen EintrÑge (Export mit ALPHA2.APR)
srch -f6 -d hhh -e alpha2/rng.alg -m0 -v0
del hhh.alg
rem  6.Schritt: Druckformatierung als Register mit Seitenumbruch (ALPHA3.APR)
srch -f6 -d rng -e alpha3/REG.TXT -m0 -v0
del rng.alg
echo LISTE = alphabetisches Verzeichnis
echo REG.TXT   = Register
:ende
