  STRI.INC : Zeichen an fester Position in eine Zeichenfolge einfuegen
  2007-07-17   u.U. mit Ersetzung vorhandener Zeichen
             (Trick 48)
  Aufruf :  Man besetzt zuerst folgende Variable:
          #usT  : die Ausgangs-Zeichenfolge

          iV    : zahl1,zeichenfolge,zahl2  oder  / statt ,
                  die beiden Zahlen muessen positive ganze sein oder 0
                  zahl2 mit dem vorangehenden Komma darf fehlen
          
          Bedeutung:  zahl1 Zeichen vom Anfang von #usT belassen
                      dann die  zeichenfolge  anhaengen
                      vom Rest von #usT  zahl2  Zeichen wegnehmen, 
                      und was noch von #usT uebrig ist, anhaengen
          Beispiele:
                 Das vierte Zeichen durch x ersetzen
          var "3,x,1"
                 In #upo steht Position, in #uez die einzufueg. Zeichen
                      in #uaz ANz. der zu ersetzenden Zeichen
          var #upo "," #uez "," #uaz
                 Hinter dem 10. Zeichen  Inhalt von #uab  zwischenfügen
          var "10," #uab ",0"   oder   var "10," #uab
                 Vorn 2 Zeichen durch abcdeg  ersetzen, Rest belassen
          var "0,abcdeg,2"
                   (einfacher mit  var "abc" #usT(2,0) )
                 Hinter dem 2. Zeichen  abcdeg  einsetzen, Rest weg
          var "2,abcdeg,1000"
                   (einfacher mit  var #usT(0,2) "abcdeg" !)

       Dann der Aufruf:

          perf stri

       Ergebnis steht danach in der iV

  UPro beginnt hier
end
  Setze
         #uS1 = zahl1 , #uS2=zahl2 , #uSB = Zeichenfolge bei Beginn
:stri
  Kontrolle beim Testen
 mes
ins #uSB
var #uSB(f"0123456789")
if "/" jump stri:s
if not "," return
  Komma ist Trennung:
var #uSB(e",")
ins #uS1
var #uSB(b"," b",")
ins #uS2
  Trennsymbol ,
#uST,
jump stri:w

  / ist Trennung:
:stri:s
var #uSB(e"/")
ins #uS1
var #uSB(b"/" b"/")
ins #uS2
  Trennsymbol /
#uST/

:stri:w
eval #uS1 + #uS2
  Position, wo der Rest beginnt
ins #uS3
  Manipulations-Ausdruck in die iV schreiben: 
       (beachte den Nebentrick mit dem Trennsymbol #uST)
var #uS1
if not "0" var "#usT(0," #uS1 " F' ') #uSB(b'#uST' e'#uST') #usT(" #uS3 ",0)"
if "0" var "#uSB(b'#uST' e'#uST') #usT(" #uS3 ",0)"

  zur Kontrolle beim Testen den Ausdruck zeigen:
 mes
  Ausdruck auswerten   (das ist der eigentliche Trick!)
var
  Nun steht das Erg. in der iV
  Hilfsvar. loeschen
#uST
#uSB
#uS1
#uS2
#uS3
return

