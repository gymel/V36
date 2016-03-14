//  extact.inc : External Action on a result set
//  2014-09-11    z.B. Erg.Mengen Export mit Auflistung der Exemplare
//  Die Erg.Menge HM ("Hauptmenge") wurde vorher gebildet und evt. geordnet!
//      Zu jedem Satz aus HM ist eine Erg.Menge damit verknuepfter Saetze zu bilden
//      die Saetze aus HM und ZM sind sequentiell zu verarbeiten

//  Diese Datei per "include extact.inc" an einen anderen FLEX oder Job anhaengen!
//  Dann Aufruf mit  perform EXTACT, um die jeweils aktuelle Erg.Menge abzuarbeiten

// Tip:  Die Datei  extact.flx  ist ein Muster, in dem gezeigt wird, welche
//       Vorbereitungen man treffen muss.
//       Für eigenes Projekt so vorgehen, wie in  extact.flx  beschrieben!



:EXTACT
// Entweder $hF=1 oder unbesetzt, ebenso $mF! (if-Check dann leichter)
// if $hf : HM-Aktion zuerst   if $mF  aber nur, wenn ZM vorhanden
var $hF
if not "1" $hF=
var $mF
if not "1" $mF=

//  Die internen Nummern der HM in $hm ablegen, mit , getrennt
var i,
ins $hm
//  Diese Liste wird dann abgearbeitet von vorn nach hinten
//  ACHTUNG: die Erg.Menge kann fuer diese Methode nicht groesser als
//  8-10.000 Saetze sein.  Sonst muss man es per externer Datei loesen

// Wenn $gF besetzt, dann Gesamtbank abarbeiten
//  - falls $gF gesetzt, dann  first #

if not $gF jump HMloop
first #
if del jump HMgesamt

:HMloop
//  die erste (bzw. naechste) Nummer nehmen, # davorsetzen
//  ($hm beginnt mit dieser Nr.)
//  und den HM-Satz mit dieser Nr. laden
if not $gF var "#" $hm (e",");f1nd

//  Die HM-Aktion ausfuehren, wenn $hF und $mF 

$rF=1

if $hF if $mF jump HMact

:HMactRet1
//  Zu dem Satz nun die zusaetzliche Menge (ZM) bilden
// Vorher  Objekt 2 einschalten - damit dann  next #  klappt
// aber 1 in 2 kopieren, damit im UP zugaenglich
copy obj 1 2
set obj 2
// d.h. die ZM-Saetze werden in Obj.2 geladen
jump ZMfind
//  (von dort Ruecksprung mit  jump ZMfindRet)
:ZMfindRet
// "less than 1"?  d.h. ZM ist leer
if g0 jump zm

// Keine ZM-Saetze gefunden
set obj 1

jump HMnext

//  Die ZM ist nicht leer, also abarbeiten
:zm
set obj 1
//  Die HM-Aktion ausfuehren? Nur wenn $hF=1 
$rF=3
if $hF if not $mF jump HMact

:HMactRet3
set obj 2

first
:ZMloop
// die ZM-Aktion  :ZMact  ausfuehren (im HauptFLEX)
jump ZMact
// von dort zurueck mit  jump ZMactRet
:ZMactRet
// naechsten Satz der ZM
next
if yes jump ZMloop
// keiner mehr da - Die ZM schliessen und loeschen
close res
// ZM Ende, jetzt wieder Objekt 1
set obj 1

$rF=2
if not $hF if not $mF jump HMact

//  Hauptschleife geht weiter, momentan erste Nr. der HM wegnehmen
:HMnext
$rF=2
if not $hF if $mF jump HMact

:HMactRet2

// Wenn Gesamtbank zu verarbeiten:
if $gF jump HMgesamt

// Naechsten Satz der Erg.Menge
var $hm (b",")
//  verkuerzte Liste wieder in $hm
ins $hm
//  Ist noch was da? Dann weiter in Hauptschleife mit dem naechsten Satz
if $hm jump HMloop
jump HMend

// naechsten Satz der Gesamtbank, etwas schwierig wg. unbesetzter Nummern etc.
:HMgesamt
next #
// Ende? (a99: cancel, acon: no)
if no jump HMend
if cancel jump HMend

if del jump HMgesamt
jump HMloop

:HMend

return
end


