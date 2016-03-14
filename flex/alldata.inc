  ALLDATA.INC : Alle Datendateien schnell durcharbeiten
  20070108/20101221  Unterprogramm, das mit  include  eingebunden werden kann
  Dies ist ein Muster!
  **************
    Zwischen solche markierungen gehoeren die eigenen Zutaten
    Vorgesehen zum Einbau beliebiger Aktionen
  **************

  Einbindung in eigenen Flex mit  include alldata.inc

  Aufruf:   perform all
              Vorher die evtl. benoetigten Variablen belegen

  Ergebnis: z.B. Erg.Menge der gefundenen Saetze, fertig geladen
            (Datei all.set enthaelt die Satznummern)
 
  Minimalbeispiel:

  perf all
       UP :all macht dann irgendwas mit jedem einzelnen Satz und der Variablen
  sho list
  end
  include alldata.inc

end

  Hier ist das Unterprogramm (angelehnt an ftr.inc)
:all

  Interne Nummer des aktuellen Satzes sichern
var i
ins $intnr

  **************************
  Hier evtl. Vorbereitungen, z.B. Laden von Exportparametern
  **************************


  Datendateien einsammeln, Namen in #u!D
jump all:dir
  Ruecksprung nach hier
:all:dat
  es wurde keine Datei gefunden?
  evtl. hier Fehlermeldung einbauen
if not #u!D end

  In #u!D steht die Liste der Dateien, mit ; getrennt

  Datei fuer "externe Erg.Menge" oeffnen
  (Oder was sonst in die Datei geschrieben werden soll!)
open x all.set
  und den Suchgebriff als erste Zeile reinschreiben
wri "all " "Ergebnisse" n
  Zaehler
Z=0
  Zahl im Statusfeld zeigen
var Z
sho Stat

  Wenn Meldungen nicht gewuenscht, dann wegnehmen:
var "Datei          Summe" n
ins #uIV
  Anzeige der Meldung im Anzeigefeld
ansi
sho IV

set e0
  aeussere Schleife: Dateien einzeln abarbeiten
:all:auswert
var D #u!D(e";")
open
if not yes jump all:nix

  Zwischenmeldung im Schreibfeld aktualisieren
var #u!D(b";")
if not "" var "momentan wird gesucht in " #u!D(e";") " (Abbruch mit Esc)" n "remaining: " #u!D(b";")
if "" var "momentan wird gesucht in " #u!D(e";") " (Abbruch mit Esc)"
  im Schreibfeld zeigen, welche gerade durchsucht wird
sho iV

  Zaehler fuer die Tastaturabfrage. Diese soll nur bei jedem
  500sten Satz erfolgen - aus Zeitgruenden
z=500

  innere Schleife: Durcharbeitung einer Datei
:all:loop
z-1
if z<0 jump all:kc
jump all:weiter

:all:kc
z=500
  Tastatur: wurde Esc gedrueckt? Dann beenden
keychk

if yes jump all:exit


:all:weiter
  Satz leeren
erase main
  Steuerbyte einlesen
fet b
  Datei zu ende?
if "-1" jump all:datend
ins #usb
  4 Byte Satznummer lesen, in #usn
fet b4
ins #usn
  Satz einlesen (0 wird dabei zu 2 Byte 10 und #)
fet r
  Dateiende erreicht? -> :datend
if cancel jump all:datend
  Den Satz in den Arb.Speicher uebernehmen
insert

  ****************************
  Jetzt mit dem Satz machen, was immer zu machen ist, z.B. export
  Am Ende irgendeine Pruefung, und wenn positiv, dann
if #9R jump all:hit
  if yes jump all:hit

  ****************************
  Wenn negativ, dann naechster Satz
jump all:loop

  Positiv. Hier koennte man Modifikationen einbauen zur
   Auswertung des gefundenen Satzes
:all:hit
var #usb
if "9" jump all:loop   // ungueltiger Satz (geloescht)

  gueltig, zaehlen
Z+1
  ***************
  und Satznummer in die Datei schreiben
  Hier evtl. was anderes schreiben, wenn keine Erg.Menge rauskommen soll
wri #usn n
  ***************

var Z
sho Stat    // Trefferzahl im Statusfeld zeigen
jump all:loop

:all:datend
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
if #u!D jump all:auswert

  Ende der aeusseren Schleife
:all:exit
set e1
  Schreibdatei schliessen
close x

  Es gab keinen Treffer?
if Z<1 jump all:nor

  restore the original record
var "#" $intnr
find
undo

  ***********************
  Trefferliste als externe Erg.Menge einlesen
  (Hier evtl. was ganz anderes mit der Datei all.set machen
read set all.set
  den Namen setzen
var "R   Ergebnisdatei"
ansi
set
  ***********************

return

  ------------------------

:all:nix
var "Datei " D #u!D(e";") " kann nicht geöffnet werden" 
mes
end


  Unterprog zum Sammeln der auszuwertenden Dateien in #u!D
:all:dir

var D "*." K1 "ld"
dir
ins _^T_;_
ins #u!D

  Sprung hierher aus eigenem FLEX (s. ftr.flx)
:dir:de
  Jetzt ist #u!D = Liste der zu verarbeitenden Dateien
  UP beenden
jump all:dat

:all:nor
mes Kein Satz verarbeitet
var "#" $intnr
find
sho rec
disp
return


