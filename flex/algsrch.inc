  ALGSRCH.INC : Volltextsuche mit RegEx
  20070108     in Grunddateien (Typ .xLG)
  Unterprogramm, das mit  include  eingebunden werden kann
  Beim Aufruf:
  1. In #u!! muss bereits der Suchbegriff stehen.
  2. Wenn ein Dateiname in #u!f - hat dieser den Vorrang. Name ohne .alg
  3. Sonst wird Auswahlliste der vorhandenen ALG-Dateien praesentiert
     Dazu Dateinamensmuster in #u!F uebergeben, z.B. c:\data\* (ohne .alg)
       Die so bezeichneten Dateien werden in #u!D gesammelt
       #u!D ist leer, wenn keine solche Datei gefunden.
  Die gefundenen Saetze sind am Ende als Offline-Saetze im Reservespeicher.
  ----------------------------------------------------------
  Einfachste Nutzung:
  #u!! suchbegriff (regex) / Wenn #, dann alle Saetze! (# kommt stets vor)
  #u!f dateiname ODER
  #u!F namensmuster (jeweils ohne .alg)
  perf algsrch
  if Z<1 mes nichts gefunden;end
  ...
  include algsrch.inc
  ----------------------------------------------------------

end
:algsrch
   Umcodierung per Indexparameter (ist default)
 set xiq   // tabelle q macht Umwandlung A -> a ...

  Zaehler
Z=0

if #u!f jump ftr:start
if #u!F jump ftr:start

var "Grunddateien|" W "\\*." K1 "lg"
fnam
if no var "Keine Datei gew„hlt";return
var (t".")
ins #u!f

:ftr:start
  Wenn Meldungen nicht gewuenscht, dann wegnehmen:
if #u!f var "Volltextsuche nach " #u!! n "in Datei " #u!f "." K1 "lg" n
if not #u!f var "Volltextsuche nach " #u!! n "in Dateien: " #u!F "." K1 "lg"
ins _\\_\\\\_    //  \ verdoppeln
ins #uIV
  Anzeige der Meldung im Anzeigefeld
ansi
sho IV
 yes Anfangen?
 if no end
  Korrektheit des RegEx checken mit beliebigem Text
var "abcxyz"
srx
if cancel jump ftr:erro
  Zahl im Statusfeld zeigen
var Z
sho Stat
var i
ins #u!i
if #u!f jump einzel
  Datendateien anzeigen, evtl. Auswahl
jump ftr:dir

:einzel
#u!D
var #u!f "." K1 "lg"
open
if yes jump ftr:proc
var #u!f 
open
if not yes jump ftr:fnix
jump ftr:proc

  Ruecksprung nach hier
:ftr:dat
  es wurde keine Datei gewaehlt?
if not #u!D var "Keine solche Datei";return

  In #u!D steht die Liste der Dateien, mit ; getrennt

  aeussere Schleife: Dateien einzeln abarbeiten
:ftr:auswert
var #u!F
if not %\\% var #u!D(e";");jump ftr:op
var #u!F(t"\\") "\\" #u!D(e";")
:ftr:op
open
if not yes jump ftr:nix

  Zwischenmeldung aktualisieren
var #u!D(b";")
if not "" var "momentan wird gesucht in " #u!D(e";") " (Abbruch mit Esc)" n "remaining: " #u!D(b";")
if "" var "momentan wird gesucht in " #u!D(e";") " (Abbruch mit Esc)"
  im Schreibfeld zeigen, welche gerade durchsucht wird
sho iV

:ftr:proc
  Editor-Fehlermeldungen ausblenden
set e0
  Zaehler fuer die Tastaturabfrage. Diese soll nur bei jedem
  500sten Satz erfolgen - aus Zeitgruenden
z=500

  innere Schleife: Durcharbeitung einer Datei
:ftr:loop
z-1
if z<0 jump ftr:kc
jump ftr:weiter

:ftr:kc
z=500
  Tastatur: wurde Esc gedrueckt? Dann beenden
keychk
if not yes jump ftr:weiter

yes Suchbegriff aendern? 
if no jump ftr:weiter
if can jump ftr:exit

:ftr:aendern
var "Bitte „ndern=#u!!"
  der Wert ist ASCII, deshalb konvertieren
ansi
ask
if "" end
  Eingabe ist ANSI, in ASCII wandeln und in #u!! setzen
asci
ins #u!!
  Korrektheit des regEx checken mit beliebigem Text
var "abcxyz"
srx
  Bedingung "cancel" zeigt Unkorrektheit, Meldung steht in iV
if can mes;jump ftr:aendern

:ftr:weiter
  Steuerbyte einlesen
fet b
  Datei zu ende?
if "-1" jump ftr:datend
ins #usb
   4 Byte Satznummer lesen, in #usn [nur bei .ALD]
 fet b4
 ins #usn
  Satz einlesen (0 wird dabei zu 2 Byte 10 und #)
fet r
  Dateiende erreicht? -> :datend
if cancel jump ftr:datend
  Den Satztext durchsuchen (Suchbegr. ist in #u!! )
   (hier srX, denn der Suchbegriff ist oben schon geprueft worden)
srX
  Treffer? -> :hit
if yes jump ftr:hit
jump ftr:loop

  Treffer. Hier koennte man Modifikationen einbauen zur
   Auswertung des gefundenen Satzes
:ftr:hit

  gueltig, zaehlen
Z+1
  und Satz (steht noch in iV!) als neuen Hintergrundsatz nehmen
new 0
ins

var Z
sho Stat    // Trefferzahl im Statusfeld zeigen
jump ftr:loop

:ftr:datend
  Datei zu
close

  Liste der schon ausgewerteten Dateien
var #uIV n #u!D(e";" 0,13) " ... " Z
ins #uIV
ansi
sho IV

  Liste der noch auszuwertenden Dateien
var #u!D(b";")
ins #u!D
  Falls noch eine geblieben, -> :auswert
if #u!D jump ftr:auswert
  sonst Ende der aeusseren Schleife

:ftr:exit
set e1
  Es gab keinen Treffer?
if Z<1 var "nichts gefunden"
  Satz zurueckholen, der am Anfang im Arb.Sp. war
var "#" #u!i
f1nd
return

  ------------------------

:ftr:nix
var "Datei " #u!D(e";") " kann nicht geöffnet werden" 
mes
set e1
end
:ftr:fnix
var "Datei " #u!f " kann nicht geöffnet werden" 
mes
set e1
end


  Unterprog zum Sammeln der auszuwertenden Dateien in #u!D
:ftr:dir
Z=0
  Dateinamensmuster in #u!F, z.B. c:\data\* : alle ALG-Dateien auf c:\data\
  (also Muster ohne .alg hinten! das wird jetzt angeh„ngt:)
var #u!F "." K1 "lg"
dir
ins _^T_^M^J_
ins $dl
open x dbdl
wri $dl
close x

:dir:abc
Z=1
#u!D
open dbdl

  Schleife
:dir:dirl
  Zeile lesen
get
if can jump dir:de
if " " jump dir:dirl
ins #u!d
var #u!D ";" #u!d

ins #u!D
Z+1
jump dir:dirl

:dir:de
close
  Dateinamensliste loeschen
del dbdl

  Zeichen ; vorn wegnehmen
var #u!D(f";")
ins #u!D
  Jetzt ist #u!D = Liste der zu verarbeitenden Dateien
var Z
ins #u!N   // Anzahl Dateien
Z=0
  Hilfsvariable weg
#u!d
  UP beenden
jump ftr:dat

:ftr:erro
var "Fehler im Suchausdruck: " #u!!
return
end