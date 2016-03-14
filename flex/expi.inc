  EXPI.INC : Grund- oder Externdatei exportieren (Unterprog.)
  20070430     ersetzt  SRCH -f6 -dfilename -eparam+datei
  Mit  include  einzubinden
  Beim Aufruf vorher die Argumente in iV bereitstellen:
     -d dateiname -e expparam -E expdatei -s suchbegriff
        bis auf -d alles optional
  Ergebnis : in iV steht evtl. eine Fehlermeldung
             in iZ steht Zahl der verarb. Saetze
  ----------------------------------------------------------
    Beispiel: Aus ergeb.adt die Grunddatei daten.alg machen

  var "-d ergeb.adt -e i-1 -E daten.alg"
  perf expi
  if Z<1 mes;end
    weitere Befehle...  am Ende dann:
  include expi.inc
  ----------------------------------------------------------
  Tip: Eigene Version hiervon erstellen, wenn mit dem Satz noch andere
  Dinge zu tun sind. Kommentar unten zwischen *******

end
:expi
  Argumente in  #u!A  speichern
ins #u!A
  und auswerten
var #u!A(b"-d" f" " e" ")
ins #u!d
var #u!A(b"-E" f" " e" ")
ins #u!E
var #u!A(b"-e" f" " e" ")
ins #u!e
  Suchbegriff muss in #u!!
var #u!A(b"-s" f" " e" ")
ins #u!!
  ADT-flag loeschen
#u!t

  Wenn -e und -E fehlen:
if not #u!E if not #u!e jump expi:go
  sonst zweites Download-objekt aufmachen
set dow 2
  Ausgabedatei zum Schreiben oeffnen
if #u!E var #u!E;open x
  Ausgabeparameter laden
if #u!e var #u!e;exp p

:expi:go
  Zaehler der ausgegebenen Saetze
Z=0

  ist es eine ADT-Datei? dann flag setzen
var #u!d "xxx"
if %~dtxxx% #u!t 1

  zu verarbeitende Datei zum Lesen oeffnen
var #u!d
open
if yes jump expi:proc
  Name hat kein .alg am Ende? Anhaengen und versuchen
var #u!d "." K1 "lg"
open
if yes jump expi:proc
  is it a ADT?
var #u!d "." K1 "dt"
if not yes jump expi:fnix
  set flag for ADT
#u!t 1

:expi:proc
  Editor-Fehlermeldungen ausblenden
set e0
  Zaehler fuer die Tastaturabfrage. Diese soll nur bei jedem
  500sten Satz erfolgen - aus Zeitgruenden
z=500
  zweiten Internsatz einschalten, normaler Arb.Speicher dann unberuehrt
set obj 2

  Schleife: Durcharbeitung der Datei
:expi:loop
  Leeren Neusatz anlegen
new 0
:expi:l2
z-1
if z<0 jump expi:kc
jump expi:weiter

:expi:kc
z=500
  Tastatur: wurde Esc gedrueckt? Dann beenden
keychk
if not yes jump expi:weiter

yes Abbruch?
if not no jump expi:exit

:expi:weiter
  Steuerbyte einlesen (Code 1)
if #u!t jump adt
fet b
  Datei zu ende?
if "-1" jump expi:datend
ins #usb
   4 Byte Satznummer lesen, in #usn [nur bei .ALD]
   aber hier geht es um ALG!
 fet b4
 ins #usn
  Satz einlesen (0 wird dabei zu 2 Byte: 10 und #)
fetch r
   Dateiende erreicht? -> :datend
if "" jump expi:datend
  Satz in Arb.Speicher einstellen
ins
jump srch

  Modus ADT (etwas trickreich)
:adt
  Satzende ist Leerzeile (= Codefolge 13 10 13 10)
var 13 10 13 10
  Lesen bis zu dieser Codefolge
fet e4
  es war nix mehr da?
if "" jump expi:datend
  in den Arb.Speicher damit
ins
  Zeilenbrueche innerhalb Feldern beseitigen (sonst unnoetige )
var kn
ins _ _ _
new 0
ins
:srch
  falls hierchischer Satz, dann zur Sicherheit dies:
first sub
  (sonst ist der interne Zeiger auf dem letzten Untersatz!)

  Text ist noch in iV und kann durchsucht werden, wenn -s angegeben
  (dann ist jetzt #u!! besetzt mit dem Suchbegriff)
  Wenn also Suche gewuenscht, ausfuehren. Kein Treffer: -> :expi:nos
if #u!! srx;if not yes jump expi:l2
  Zaehler erhoehen
Z+1

  **********************
  Jetzt ist der Satz im Arb.Speicher. Vor dem Exportieren koennte man
  an dieser Stelle noch andere Dinge damit anstellen! Befehle dann
  hier einfuegen:
  ...
  **********************
  Nun den Satz exportieren (er ist im Arb.Speicher!)
export
  und ihn wieder leeren
:expi:nos
  dadurch wird zugleich der vorher geladene Satz wieder aktiv
erase
jump expi:loop

:expi:datend
  Datei zu
close x
close

:expi:exit
  Editor-Fehlermeldungen wieder einschalten
set e1
  Es gab keinen Treffer?
if Z<1 var "nichts gefunden"
jump expi:ende

:expi:fnix
var #u!d
if not "" var "Datei " #u!d " kann nicht geöffnet werden"
if "" var "Kein Dateiname angegeben"

:expi:ende
  erstes Exp.Objekt und ersten Internsatz wieder einschalten
set dow 1
set obj 1
return

