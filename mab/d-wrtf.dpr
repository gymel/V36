  D-A99.DPR : Anzeigeparameter fuer MAB
  2001-01-26


  Allgemeine Angaben
zm=0
zl=80
fl=0
dx=1

  Zwischenteile (Textkonstanten)
4=C

  Zusatztabellen laden
td         ASCII -> ANSI
td-rtf     Attribute, Farben
to         ASCII <-> ANSI 
      

#544 { &45 "Signatur: " t71 t99 } P{ t98 t76 C }

#100 p99 P{ ":" t98 } #300 0 #900 4

#300 "  [" P{ "]" C }

#310 p"[" P"]" P4
#331
#333 p" / "
#335 p" : "
#359 p" / "

#410 C "   "
#412 p": "
#425 p", "
#433 p". - "

#451 C p"(" P")"

#540 ++ C m" = "

#501 C
#700 ++ p{ C "Sachgruppen: " } m"; "

#104 C "NE: "

#+#

  Alternative Anzeige (bei F5)

#-(
#t{ s0 &0 #4 }   oder 5 statt 4 wenn 3stelliges Schema!
  Aktivieren, wenn Anzeige mit Feldnummern gewuenscht
#L         alternativ statt ##: Anzeige mit Labels aus der CFG
#t{ C }
#t{ "Und so sehen die Datenfelder aus: " C }
##                oder
#t{ C }
#+#




p ª 1
p Î "/ "
dx=1
