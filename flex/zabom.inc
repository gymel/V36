  ZABOM.INC : Lokale Setzungen fuer den Betrieb von ZAboM
  2008-02-28  Wird von  Z-INIT.FLX  einbezogen

     Diese Datei modifizieren und ins eigene Datenverz. speichern
     Dann neu starten


  Textvorlage fuer Bestellungen
$Best bestell.rtf

  Zugangsnummern-Register (wie in Indexparam. definiert)
$ZNr PPN
  ZgNr Praefix im Register   BEIM JAHRESWECHSEL AENDERN!!!
$ZNp Z2008
  ZgNr Praefix im Datenfeld  BEIM JAHRESWECHSEL AENDERN!!!
$ZNd 2008/

  DatenPfad f. externe Dateien (mit \ am Ende)
var D "extern\\"
ins $Exdat
  Dies waere bei der DemoBank:  c:\allegro\demo2\extern\
  Verzeichnis anlegen, wenn es noch nicht existiert
mkdir

  Dateityp der Externdateien
  (wird an den Namen gehaengt, falls der keine Dateiendung hat)
$Extyp .doc

  In welchem Feld soll der externe Dateiname stehen?
$Exkat #97w

  Code der Waehrungstabelle (Code des Systemsatzes) Default: WHRG
$Wcode WHRG

  Karenzzeit fuer das Mahnen, Tage
  d.h. soviele Tage nach dem zu erwartenden Termin
$Mahnk 5

  Mahntyp: k = nur Kaufzeitschriften
  hier z.B. x setzen, dann werden alle gemahnt
$Mahnt k

