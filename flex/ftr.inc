  FTR.INC : Full Text search with Regular expression
  20070108/20110429  Unterprogramm, das mit  include  eingebunden werden kann
  Siehe Trick 33: http://www.allegro-c.de/flex/tricks.htm#33

  Einbindung in eigenen Flex mit  include ftr.inc

  Aufruf:   perform ftr
              in #u!! muss dann schon der Suchbegriff stehen!

  Ergebnis: Erg.Menge der gefundenen Saetze, fertig geladen
            (Datei ftr.set enthaelt die Satznummern)
 
  Minimalbeispiel:
    var "1"     // Diese 2 Zeilen nur dann,
    ins $flag    // wenn V14-Ersetzungen gemacht werden sollen
  #u!!goethe
  perf ftr
  if %FEHLER% mes;end
  sho list
  end
  include ftr.inc

end

  Unterprogramm (weitgehend wie in ftr.flx, davon aber unabhaengig)
:ftr

   Bei Bedarf aktivieren:
   Umcodierung der Suchbegr. soll erfolgen per Indexparameter p (iq ist default)
 set xip   // Tabelle p macht Umandlung A -> a ...


  Korrektheit des regEx checken mit beliebigem Text
var "abcxyz"
srx
  Syntaxfehler, Meldung steht in iV, FEHLER anhaengen, ende
if cancel var +" -- FEHLER";return


  Datendateien ermitteln und in #u!D auflisten
  (falls #u!D nicht vorher belegt wurde mit einer Liste von 
   erwuenschten Dateien, ; als Trennung, oder nur einer solchen!)
if not #u!D jump ftr:dir
  Ruecksprung nach hier
:ftr:dat
  es wurde keine Datei gefunden?
if not #u!D end
  In #u!D steht die Liste der Dateien, mit ; getrennt

  Datei fuer "externe Erg.Menge" oeffnen
open x ftr.set
  und den Suchgebriff als erste Zeile reinschreiben
wri "ftr " #u!! n
  Zaehler
Z=0
  Zahl im Statusfeld zeigen
var Z
sho Stat

  Wenn Meldungen nicht gewuenscht, dann wegnehmen:
var "Volltextsuche nach " #u!! n "Datei          Summe" n
ins #uIV
  Anzeige der Meldung im Anzeigefeld
ansi
sho IV

set e0
  aeussere Schleife: Dateien einzeln abarbeiten
:ftr:auswert
var D #u!D(e";")
open
if not yes jump ftr:nix

  Zwischenmeldung aktualisieren
var #u!D(b";")
if not "" var "momentan wird gesucht in " #u!D(e";") " (Abbruch mit Esc)" n "remaining: " #u!D(b";")
if "" var "momentan wird gesucht in " #u!D(e";") " (Abbruch mit Esc)"
  im Schreibfeld zeigen, welche gerade durchsucht wird
sho iV

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
  4 Byte Satznummer lesen, in #usn
fet b4
ins #usn
  Satz einlesen (0 wird dabei zu 2 Byte 10 und #)
fet r
  Dateiende erreicht? -> :datend
if cancel jump ftr:datend
  Den Satztext durchsuchen (Suchbegr. ist in #u!! )
   (hier srX, denn der Suchbegriff ist oben schon geprueft worden)

  V14-Ersetzungen durchfuehren, falls gewuenscht:
    (dadurch wird's aber langsamer!)
  Folgende if-Zeile greift, wenn im aufrufenden FLEX $flag besetzt ist
    Achtung: wenn nicht _ das Steuerzeichen ist, dann hier aendern!
if $flag if v14 if %_% set obj 2;new 0;ins;dow R;var kn;erase;set obj 1
  Jetzt ist in iV alles ersetzt! Suche kann stattfinden

srX
  Treffer? -> :hit
if yes jump ftr:hit
jump ftr:loop

  Treffer. Hier koennte man Modifikationen einbauen zur
   Auswertung des gefundenen Satzes
:ftr:hit
var #usb
if "9" jump ftr:loop   // ungueltiger Satz (geloescht)

  gueltig, zaehlen
Z+1
  und Satznummer in die Datei
wri #usn n
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

  Ende der aeusseren Schleife
:ftr:exit
set e1
  Schreibdatei schliessen
close x

  Es gab keinen Treffer?
if Z<1 mes nichts gefunden;return

  Trefferliste als externe Erg.Menge einlesen
read set ftr.set
  den Namen setzen
var "R ftr " #u!!
ansi
set
return

  ------------------------

:ftr:nix
var "Datei " D #u!D(e";") " kann nicht geöffnet werden" 
mes
end


  Unterprog zum Sammeln der auszuwertenden Dateien in #u!D
:ftr:dir

var D "*." K1 "ld"
dir
ins _^T_;_
ins #u!D

  Jetzt ist #u!D = Liste der zu verarbeitenden Dateien
  UP beenden
jump ftr:dat

