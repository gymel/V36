  RANDOM.INC : UPro 22stellige Zufallszahl ermitteln
  2008-05-14   Unabhaengig von der Konfiguration
  Aufruf:  perf random
  Ergebnis steht in iV und in  $ZFq
  Daraus greift man mit  var $ZFq (x,y)  eine Zahl der
  gewuenschten Laenge heraus, z.B.  var $ZFq (19,3) fuer die
  letzten 3 Ziffern

:random
  ab 2. Aufruf ist $ZFb belegt
if $ZFb jump Z_zg
  init mit der aktuellen Satznummer und Uhrzeit
var i #dts(T":") i #dts(b":" e":") i
ins $ZFb

  zuaetzlicher Summand, wird jedesmal erhoeht
$ZFz 137


  Start hier ab 2. Aufruf
:Z_zg
  Vorbesetzungen aus $ZFb entnehmen
var $ZFb (0,r20)
var (17,2)
ins $ZFq

  und noch Minuten+Sekunden+satznr dranhaengen

var #dts(T":") " +" #dts(b":" e":") " +" i 
eval
ins $v
  zu $ZFb addieren, Zusatzsummand auch
eval $ZFb +$v +$ZFz
ins $ZFb

  und kopieren nach $ZFg
var $ZFb
ins $ZFg

  Zusatzsummand erhoehen bis 1 Mio, dann neuer Beginn mit 273
eval $ZFz +157
if >1000000 var "273"
ins $ZFz

var k1
  ****  Schleife Abarbeitung d. Datensatzes  ****
  Hinzugenommen wird die Summe der Feldinhalte
:Z_lop
  Zahlenwerte der Felder in $ZFb addieren
var (4,6)
ins $ZFa
eval $ZFa +$ZFg
var (e".")
ins $ZFg
var k2
if not "" jump Z_lop

  Stunden -> $ZFs
var #dts(b"/" e":") 
ins $ZFs
  internen zaehler setzen
z=10

  ****  Kernschleife z=10...1  ****
   Jeder Durchlauf erzeugt 2 Ziffern
:Z_lp
z-1

  Jetzt ist $ZFg die "Summe" der Felder d. aktuellen Satzes
  plus der vom letzten Mal gemerkte Wert $ZFb
  Nun kommt die Zeit noch ins Spiel
  Minuten -> $ZFc
var #dts(b":" e":") 
ins $ZFc
  Sekunden -> $ZFd
var z #dts(T":") 
ins $ZFd
  Sekunden +7 -> $ZFe
if z>1 eval $ZFd +7 *z
if z=1 eval $ZFd +13 *7
if z=0 eval $ZFd +29 *7
ins $ZFe
  Die Zwischenwerte addieren -> $ZFb
eval $ZFg + $ZFd + $ZFe +$ZFc + $ZFs +$ZFz
ins $ZFb

  $ZFg auch mal wieder aendern
eval $ZFg +$ZFg -1
ins $ZFg

  Zwei Abschnitte auswerten
  letzte 2 Ziffern
var $ZFb (0,r22)
var (18,4)
ins $ZFa
  vorletzte 2 Ziffern
var $ZFb (0,r22)
var (13,4)
ins $ZFc

  und auf $ZFb addieren, mit weiteren Massnahmen
if z>1 eval $ZFb *z +$ZFa +$ZFc +$ZFz +z 
if z<2 eval $ZFb *13 +$ZFa +$ZFc +$ZFz +z 
var (e".")
ins $ZFb

  letzte 2 Ziffern von $ZFb nehmen
var $ZFb (0,r22)
var (20,2)
  und in $ZF1 ablegen
ins $ZF1 

  an $ZFq anhaengen
var $ZFq $ZF1
ins $ZFq

  Zusatzsummand erhoehen
var $ZFb (0,5)
ins $r
eval $ZFz +$r
  wenn zu gross, dann erste 5 Ziffern von $ZFq
if >10000000 var $ZFq (0,5)
ins $ZFz


  zaehler -1, schleife
if z>0 jump Z_lp

  gesamte Zuf.Zahl jetzt in $ZFq
var $ZFq
ins _ _0_
ins $ZFq

eval $ZFb -1E14
  Wert in $ZFb vorbereiten fuer die naechste Zahl!
  (darf nicht grenzenlos wachsen!)
if <0 var $ZFq;return

  wenn >1E14, dann nur 7 Stellen ab Ziffer 5 nehmen und
  7 Stellen der aktuellen Zufallszahl ab Ziffer 3
  und die Sekunden auch nochmal hinzunehmen
var #dts(b"/" e":") " +" #dts(T":") " +" #dts(b":" e":")
eval
ins $s
var $ZFb (5,7)
ins $t
var $ZFq (3,7)
ins $u
  Addieren und mal 7
eval $t +$u +$s +17 *7
ins $ZFb
  Zahl in iV bereitstellen
var $ZFq
return

