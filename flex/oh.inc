  OH.INC : Datei im MARC-OHIO-Format umwandeln
           Name wird beim Aufruf uebergeben in iV
           (perf oh name)
:oh

  Datei oeffnen
open
if no mes Datei nicht gefunden;end
  6 Bytes lesen (LEADER)
fet 6

  Editor-Fehlermeldungen aus
set e0
#uzy
  In der Schleife wird jeweils bis LEADER eingelesen und dieser
  Text dann in einen Datensatz verwandelt
:loop
var "LEADER"
fet e6
  Zeichen aendern: (Feldende ist dann ` )
xcode y

  Die Zeichenfolge wurde nicht gefunden!
if "" jump exit
new 0
  Datei war zu Ende, Flag setzen
if can #uzy 1

ins _`   _ _
asci
ins #uzv
var #uzv(b"`245" 3,0 e"`" e"|c" F"/ " )
ins _|b_ _
ins #20
#uta
#utb
var #20(b" ")
ins #utb
var #20(e" ")
ins #uta
if Art var "ª" #uta "ª";ins #uta
var #uta " " #utb
ins #20
var #uzv(b"`245" b"|c" e"|" e"`")
ins #39
var #uzv(b"`260" e"`")
ins #74
var #74(b"|b" e"|" F", ")
ins #75
var #74(b"|c" e"|")
ins #76
var #74(e":")
ins _|a_ _
ins #74

var #uzv(b"`250" 3,0 e"`")
ins #71

var #uzv(b"`100" 3,0 e"`")
ins _|q_ _
ins _,|d_ ª[_
if % ª[% var +"]ª"
ins #40

var #uzv(b"`110" 3,0 e"`")
ins #61

var #uzv(b"`111" 3,0 e"`" F" )")
ins #83
if #83 var #83(e"|n") " ; " #83(b"|n(" e"|" F": rdths") " (" #83(b"|c" e"|") ") : " #83(b"|d" e"|" e":")
ins #83

var #uzv(b"`300" 3,0 e"`" e"|c" F"; ")
ins _|b_ _
ins #77
var #uzv(b"`020" e"`" f" " e" ")
hyphen
ins #87
var #uzv(b"`830" e"`" 3,0)
ins _|v_ _
ins _|p_ _
ins _|x_i_
ins #85

var #uzv(b"`440" e"`" 3,0)
ins _|v_ _
ins _|p_ _
ins _|x_i_
ins #85

var #uzv(b"`700" 3,0)
:700
ins #uzx
var #uzx(e"`")
ins _|q_ _
ins _,|d_ ª[_
if % ª[% var +"]ª"
ins #42~
var #uzx(b"`700" 3,0)
if not "" jump 700

var #uzv(b"`970" 6,0)
:970
ins #uzx
var #uzx(e"`")
ins _|f_ [_
ins _|p_], S._
if not %[% ins _]__
ins _ / _] , _
ins _|c_ / _

ins #u93
var #u93(b" / ")
if "" jump 970a
ins _ / _] ,_
ins #u94
var #u93(e" / ") " / " #u94
ins #93~
#u93
#u94
jump 970b
:970a
var #u93
ins #93~

:970b
#u93
#u94


var #uzx(b"`970" 6,0)
if not "" jump 970


if not #uzy jump loop
set e1
end

:ende
mes Das SatzEnde wurde nicht gefunden
end
:exit
return

