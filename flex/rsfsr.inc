  RSFSR.INC : Result Set Fulltext Search with RegEx
  20070118    Unterprogramm

  Aufruf :
     #u!!  <suchbegriff>
     perf rsfsr
     if %FEHLER% mes;end
     if Z<1 mes Nichts gefunden;end
     sho list
       weitere Verarbeitung der neuen Erg.Menge
     ...
     include rsfsr.inc

  Das Unterprogramm erledigt alles, incl. Setzung eines sinnvollen
  Namens der neuen Erg.Menge, aber auch die komplizierte V14-Behandlung

:rsfsr
  Zaehler
Z=0
  Suchbegriff auf Korrektheit checken
var "xyzabc"
srx
  Syntaxfehler, Meldung steht in iV, FEHLER anhaengen, ende
if cancel var +" -- FEHLER";return

  Hilfsdatei fuer Ergebnisse oeffnen
open x res.set
  Ueberschrift reinschreiben: Name der Erg.Menge + Suchbegriff
var U
  Die Zahl vorne und : muss weg
var (f"01234567890 :")
ins #u!n
  Das ist die Ueberschrift
wri #u!n " + " #u!! n

#u!n
  Satznummer sichern (wg. V14-Aktion sonst evtl. unsicher)
var i
ins #uzi
  Ersten Satz holen
first
  Schleife
:rsfsr:loop
  Satznummer in #uzt sichern
var i
ins #uzt
  Satz in iV kopieren, damit er durchsucht werden kann
var kn
  suchen (nach dem bereits mit srx geprueften Ausdruck)
  V14-Ersetzungen, wenn noetig (s.a. ftr.flx)
set e0
if v14 if %_% set obj 2;new 0;ins;dow R;var kn;erase;set obj 1
set e1
srX
  Treffer?
if not yes jump rsfsr:nxt
  Treffer: Zaehler erhoehen, Satznummer in Hilfsdatei schreiben
Z+1
wri #uzt n

:rsfsr:nxt
  Naechsten Satz, Schleife oder Ende
next
if yes jump rsfsr:loop
  Hilfsdatei schliessen und als Erg.Menge einlesen
close x
  Den Satz zurueckholen, der vorher in der Anzeige war
var "#" #uzi
f1nd
if Z<1 jump rsfsr:exit
read set res.set
  den Namen der Erg.Menge aendern
var U
var (f"01234567890 :")
ins #u!n
var "R" #u!n
ins _(Ext)_(ftr)_
  Name in den externen Code wandeln
ANSI
set

:rsfsr:exit
  Variablen wegnehmen
#u!n
#uzi
#uzt
del res.set
return


