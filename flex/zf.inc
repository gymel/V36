  ZF.INC : UP 20stellige Zufallszahl ermitteln
  2008-05-13
  Einbinden mit include zf.inc
  Aufruf:       perf Z_zf
  Ergebnis ist  $ZFq
  Daraus greift man mit var $ZFq (x,y) eine Zahl der
  gewuenschten Laenge heraus, z.B.  $ZFq (18,2) fuer die
  letzten 2 Ziffern

:Z_zf
if $ZFb jump Z_zg
  init
var i
ins $ZFb

:Z_zg
  int. zhlr setzen
z=10
$ZFq
  Hauptschleife 10...1
:Z_lp
var k1
  Schleife Abarb. d. Datensatzes
:Z_lop
  Zahlenwerte der Felder in $ZFb addieren
var (4,6)
ins $ZFa
eval $ZFa + $ZFb
var (e".")
ins $ZFb
var k2
if not "" jump Z_lop
  Sekunden -> $ZFd
var #dts(b"/" b":" b":")
ins $ZFd
  Sekunden *10 -> $ZFe
eval $ZFd *10
ins $ZFe
  Drei Zwischenwerte addieren -> $ZFb
eval $ZFb + $ZFd + $ZFe
ins $ZFb

  letzte 2 Ziffern
var $ZFb (0,r20)
var (18,2)
ins $ZFa
  vorletzte 2 Ziffern
var $ZFb (0,r20)
var (16,2)
ins $ZFc
  auf $ZFb addieren, -1
eval $ZFb +$ZFa +$ZFc -1
var (e".")
ins $ZFb
  letzte 2 Ziffern von $ZFb sind die Zufallszahl
var $ZFb (0,r20)
var (18,2)
  in $ZF1 ablegen
ins $ZF1
var $ZFq $ZF1
ins $ZFq
  zhlr -1
z-1
if z>0 jump Z_lp
  Testmeldung
var $ZFq (18,2)
mes
  Zuf.Zhl ist in $ZFq
var $ZFb
  Wert in $ZFb ist fuer die naechste!
  wenn >1Mrd, dann nur 5 Ziff. ab Ziffer 5 aufbewahren
if >100000000 var $ZFb (5,0)
ins $ZFb
return
