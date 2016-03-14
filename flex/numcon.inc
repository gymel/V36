  NUMCON.INC : Number Converter, mit Zahlenbasis von 2 bis 20
  2008-01-11   z.B. HEXadezimal <-> DEZimal

  Nutzung:
    Zuerst die umzurechnende Zahl in die iV bringen:
  var ...
    dann aufrufen
  perf hexdez   bzw.   perf dezhex
     nun ist der umgerechnete Wert in der iV
  oder allgemeiner:
  var <zahl> " basis ziel",  z.B.
  perform numcon
    z.B.
  var "123456 10 12"   Die Dez.Zahl 123456 sedezimal machen
  perf numcon

  Variablen
  $nz         naechste Ziffer dezimal (0-15)
  $ze bzw. Z  Zwischenergebnis
  $vz         verbliebene Ziffern
  $ba         Basis des Zahlsystems: 2 - 20
  $bz         Zielbasis der Umrechnung: 2-20

  Bei Direktaufruf (mit X numcon.inc) beginnt's hier:
:numcon:start
ask Basis - Ziel? (jeweils zwischen 2 und 20)
if "" end
ins $ba
var $ba (B"-" B" " f"- ")
ins $bz
var $ba (e"-" e" ")
ins $ba
jump hexdez:zahl

  Aufruf von aussen mit Argumenten  A B Z
    A->$eingabe, B->$ba (default 16), Z->$bz (def.10)
:numcon
ins $aufgabe
var $aufgabe (e" ")
ins $eingabe
var $aufgabe (b" " e" ")
if "" var "16"
ins $ba
if <2 jump gna
if >21 jump gna
var $aufgabe (b" " b" ")
ins $bz
if "" var "10"
if <2 jump gnb
if >21 jump gnb
    Testmeldung
  var "Eingabe: " $eingabe ", aus Basis " $ba " zu wandeln in " $bz
  mes
var $eingabe
jump hexdez

:hexdez:zahl
ask Zahl
if "" jump numcon:start
ins $e
perf hexdez
ins $u

var $e " auf Basis " $ba " ist " $u " auf Basis " $bz
mes
jump hexdez:zahl

  Unterprog. hexa -> dezimal
:hexdez
  interne Zahl  Z  als Zwischenergebnis
   (grosses Z, weil nur damit Z=<ausdruck> moeglich)
ins $vz
var $ba
if "" $ba 16
Z=0
  Schleife
:hexdez:loop
  erste Ziffer nehmen und dezimal machen
var $vz (0,1)
  Buchstabe kann klein oder gross sein:
if "~a" var "10"
if "~b" var "11"
if "~c" var "12"
if "~d" var "13"
if "~e" var "14"
if "~f" var "15"
if "~g" var "16"
if "~h" var "17"
if "~i" var "18"
if "~j" var "19"
if "~k" var "20"
ins $nz
  die Ziffer zum Zwischenerg. addieren
  eval Z+ $nz
Z=Z +$nz
  vorn eine Ziffer wegnehmen
var $vz (1,0)
ins $vz
  Wenn noch mehr Ziffern, dann
  Zwischenerg. mit 16 multipl., Schleife
if $vz Z=Z*$ba;jump hexdez:loop

Z=Z+$vz
var $bz
if "10" var Z;return
if "" var Z;return
  Zielbasis ist nicht 10, dann den neuen iV-Inhalt noch umrechnen
var Z

  Unterprog. dezimal -> hexa
:dezhex
ins $vz
if not $bz $bz 16
var ""
ins $ze
  Schleife
:dezhex:loop
var $vz
  Z als Zahl zum Rechnen, (Achtung: kleines z!)
  weil nur damit Operator % moeglich (modulo)
Z=
  Div.Rest bei Div. durch $b ergibt naechste HexZiffer

eval Z/$bz
ins #urr
  Nachkommastellen nehmen und wieder mit $b malnehmen
    ergibt den Divisionsrest
var "0." #urr(b".")
ins #urr
  Der Nachkommateil kann geringfgig zu klein sein!
  bei der Multiplikation kommt dann evtl. zuwenig raus,
      deshalb +0.001
eval #urr*$bz +0.001
var (e".")
Z=

var Z
  Ziffern >9 in Buchstaben wandeln
if ="20" var "K"
if ="19" var "J"
if ="18" var "I"
if ="17" var "H"
if ="16" var "G"
if ="15" var "F"
if ="14" var "E"
if ="13" var "D"
if ="12" var "C"
if ="11" var "B"
if ="10" var "A"
ins $nz
  ErgebnisZahl ergaenzen, d.h. neue Ziffer vorn anfuegen
var $nz $ze
ins $ze
  erneut durch $bz teilen, am . abschneiden
eval $vz /$bz
var (e".")
ins $vz
  falls noch >0, dann schleife
if >0 jump dezhex:loop
  sonst Ergebnis in iV bereitstellen
var $ze
return

:gna
var "Sorry, Basis " $ba " auáerhalb des zul„ssigen Bereichs"
ansi
mes
var ""
return
:gnb
var "Sorry, Basis " $bz " auáerhalb des zul„ssigen Bereichs"
ansi
mes
var ""
return

