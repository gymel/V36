 Ausgabe im Original-"allegro"-Format

pn="allegro-Format"
   Diese Parameterdatei erzeugt Daten im allegro-Format,
   also eine identische Reproduktion der Daten
   wobei einige Zusatzmîglichkeiten existieren (siehe unten)

  !!! diese Datei funktioniert fÅr alle Konfigurationen !!!
      wenn Sie sie fÅr P.CFG benîtigen:
      mit  COPY PA.APR PA.PPR  eine Kopie machen

   -------- Konstanten ----------------------------------------------------
                                          dieser Teil muss bleiben
zl=0        ZeilenlÑnge unbegrenzt (kein Umbruch)

ks=1        Beginn des Ausgabetextes beim ersten Zeichen hinter #

ke=0        Kategorie-Ende = Code 0

as=h0       Aufnahme-Start: Hierarchiekennung + 0
                    Hauptaufnahme        : Code 01  als Startzeichen
                    Unteraufnahme Stufe 1:      02  ...
ae=13 10    Aufnahme-Ende: Carriage Return / Line Feed

   -------- Anweisungsteil --------------------------------------------------

##          Pauschalexport : alle Kategorien hintereinander ausgeben
                             jeweils mit  ke  abschlie·en

   -------- evtl. ZusÑtze : -------------------------------------------------

  >> Weglassung bestimmter Kategorien steuert man so:
   /99    #99 weglassen
   /9 oder /9.  alle #9.. Kategorien weglassen
   /9.a  alle #90er mit Folgecode a weglassen (90a, 91a, 92a ...)

  >>  Hier kînnten auch noch Zeichenumwandlungen stehen
      z.B.
   p ™ 94    (ersetze ™ durch ^ )

  >>  Globale Ersetzungen:

  _string1_string2_         ersetze Åberall string1 durch string2

  *kk_string1_string2_      ersetze string1 durch string2 nur in #kk
