 Ausgabe als ASCII-Datei mit Kategorie-Nummern und Zeilenumbruch
 ---------------------------------------------------------------

pn="Kategorie-Modus" 

zl=66	    Zeilenl„nge
zi=4	    4 Zeichen Einrckung bei Folgezeilen
zm=0        kein Seitenumbruch
  
ae=13 10    Zeilenvorschub am Aufnahme-Ende
 
fl=0        Anzahl Zeilen je Karte unbegr.
 
ks=0	    Startpos. 0  (= Zeichen '#') innerhalb jeder Kategorie
            (k2=1 setzen, wenn '#' wegfallen soll)
ke=13       Kategorie-Ende: Zeilenvorschub


##          s„mtliche Kategorien ausgeben in interner Reihenfolge

 Weglassungen: Kategorienummern mit / hier anfgen, z.B.
 /98   dann wird #98 weggelassen
 oder: hier eine Liste der auszugebenden Kategorien eintragen (statt ##)
 z.B.
 #20
 #40
 #74
 #75
 #87
 #90
 dann werden nur diese Kategorien ausgegeben


 Code-Umwandlungen: p-Befehle bei Bedarf hier anfgen
                    oder mit Befehl t hinzuladen
