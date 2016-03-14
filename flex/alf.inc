  alf.inc : Setzungen fuer den Betrieb von aLF
  2007-10-29   Wird von  a-init.flx  einbezogen
     Diese Datei modifizieren und ins eigene Datenverz. speichern
     Dann neu starten

   Allgemeine Leihbedingungen (treten in Kraft, wenn sich aus den
   Medientypsaetzen und Leserklassensaetzen nichts ergibt)
$Aintv=5
     // Intervall 5 Tage (f. Verzugsgebuehr)
$Aklnz=5
     // Kulanz 5 Tage
$Avgeb=2.00
  // Verzugsgebuehr 2 EUR pro Intervall
  // Hier 0 setzen, wenn keine Verzugsgeb. erhoben werden soll!

  Verzeichnis f. die Statistikdaten setzen (auf Wunsch aendern)
var D "stat\\"
ins $Astd

  Textdatei fuer Mahn-Export und -kopf/-fuss
$Mahn=mahn.rtf
var P "\\help\\mahnkopf.rtf"
ins $Mahnkopf
var P "\\help\\mahnfuss.rtf"
ins $Mahnfuss

  Mahnzyklus in Tagen
$Mahnz=5

   Aktivieren, wenn bei Praesenzbestand auch Ausl. mit Ausnahmefrist gehen soll:
 $Uaf=28


