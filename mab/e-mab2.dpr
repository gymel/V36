 E-MAB2.DPR : Ausgabe in MAB2-Struktur
 2000-01-28

pn="MAB2-Struktur"

  Allgemeine Vorschriften:
zl=0 	    Kein Zeilenumbruch
zm=0        kein Seitenumbruch
kb=2        Wiederholungszeichen weglassen. Alternative:
   1         durch Leerzeichen ersetzen
  
ae=13 10    Zeilenvorschub am Aufnahme-Ende
 
fl=0        Kein Kartenumbruch
 
ks=1	    Startpos. 1  (= Zeichen '#' weglassen) innerhalb jeder Kategorie
            (k2=1 setzen, wenn '#' wegfallen soll)
ke=C        Kategorie-Ende: Zeilenvorschub

 Code-Umwandlungen: p-Befehle bei Bedarf hier anfgen
                    oder mit Befehl t hinzuladen
  z.B. folgende Zeile aktivieren, wenn ANSI gewuenscht

  tasciansi  :  asciansi.dpt laden (ASCII=DOS -> ANSI=Windows)
               (Kopie von asciansi.apt machen!)

  Eigentliche Exportbefehle:

#00F b5 p"#### "
##        s„mtliche Kategorien ausgeben in interner Reihenfolge
#+#

/00F
 Weglassungen: Kategorienummern mit / hier anfgen, z.B.
 /543   dann wird #543 weggelassen
 oder: hier eine Liste der auszugebenden Kategorien eintragen (statt ##)
 z.B.
 #100
 #331
 ...
 dann werden nur diese Kategorien ausgegeben


