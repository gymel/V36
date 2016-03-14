  Z39M.INC : Datei im MARC-Z39-Format umwandeln
  2013-09-10
           Name wird beim Aufruf uebergeben in iV
           (perf z39m name)
           Zum Testen Aufruf auch direkt:  X z39m.inc dateiname

  >>> Anpassung: unten bei MARC-Umwandlung u. Sonderfall DNB <<<
                           ---------------    --------------
      Daten kommen vom Programm  zc.exe
      Umwandlung von USMARC und UNIMARC (SWB) gemeinsam!
      Datensaetze getrennt durch 2x 13 10
      Beginn jeweils mit Kennung: LOC, GVK, MELVYL ...
        siehe zc.flx
  Hierher wird mit  jump z39m  gesprungen
:z39m
ins #uda
var #uda
  Datei oeffnen (Name steht in iV)
open
if no var "Die DATEI " #uda " wurde nicht gefunden";mes;jump z39mend

  Editor-Fehlermeldungen aus
set e0
#uzx
  In der Schleife wird jeweils bis 3xnewline eingelesen und dieser
  Text dann in einen Datensatz verwandelt
new 0
:loop
    13 10  = newline
var 13 10 13 10 13 10
  Lesen, bis diese 6 Codes auftreten
fet e6
  Die Zeichenfolge wurde nicht gefunden!
if "" jump exit
  Datei war zu Ende, Flag setzen
if can #uzx 1
  In iV steht jetzt der Originaltext eines ganzen Datensatzes
  Die y-Ersetzungen ausführen: (Definition in zc.flx)
xcode y

if not %GVK% if not %BNPOL% asci;ins #uzy;jump konv

  Nur bei GVK und BNPOL ist es Unicode, deshalb:
  Unicode Umwandlung machen
xcode u
ins #uzy

  Das Konvertieren beginnt
  ***************************************************************
  Datensatz ist umcodiert, Zeilenwechsel ist nun das Zeichen `
:konv
  nur noch wenige Byte? (keine Nutzdaten mehr)
var #uzy Jl
if <50 jump exit
  Form der IdNr setzen - bei Bedarf modifizieren!
#00 dw?6
  Schleife zum Bereinigen des Arb.Speichers
:ll
  wieviele Felder?
var k0
  nur noch 1, dann :ee
if <2 jump ee
  letztes wegnehmen, aber #00 nicht (geht nicht)
var "#" k_3
ins #uuk
if "#00" jump ee
  hier passiert das Wegnehmen
var #uuk
var (0,4)
ins
jump ll

:ee

  Ist der Satz von DNB? -> :dnb
var #uzy(0,15)
if %DNB% jump dnb

  ---------------
  MARC-Umwandlung
  ---------------
var #uzy(b"`245" 6,0 e"`" F"/ " )
if "" var #uzy(b"`200" 6,0 e"`" F"/ " )

ins _$b_ _
ins _$h_ _
ins _$n_ _
ins _$p_ _
ins #20

  Herkunft steht am Anfang
var #uzy(f"`" e"`")
ins #99m

  Titel
var #uzy(b"`245" e"`" b"$c" e"$" F".")
ins #39
var #20(e"$" F"/. ")
perf art
  Bei HEBIS relevant:
ins _<<_ª_
ins _>>_ª_

ins #20

var #uzy(b"`260" e"`")
if "" var #uzy(b"`210" e"`")
ins #74
var #74(b"$b" e"$" F", ")
if "" var #74(b"$c" e"$")
ins _{[_[_
ins #75
var #74(b"$c" e"$" F"." f"c")
ins #76
var #74(e":" b"$a" e"$")

ins #74
var #74(b"$d")
if not "" ins #76
var #74(e"$")
ins _{[_[_
ins #74

var #uzy(b"`300" B"$a" e"`" e"$c" F"; ")
if "" var #uzy(b"`215" B"$a" e"`" e"$c" F"; ")
ins _$b_ _
ins #77

var #uzy(b"`250" B"$a" e"`")
if "" var #uzy(b"`205" B"$a" e"`")
ins _.._._
ins #71

var #uzy(b"`100" B"$a" e"`")
  Wenn 100 mit Zahl beginnt, ist es Unimarc
if >0 jump 61
ins _$q_ _
ins _,$d_ [_
ins _$d _ [_
if % [% var +"]"
var (e"$d")
  wenn man die Lebensdaten nicht will:
var (e" [" F"., ")
ins #40

:61
var #uzy(b"`110" 6,0 e"`")
ins #61

var #uzy(b"`040" e"`" b"$b")
ins _ger_de_
ins _eng_en_
ins #37

var #uzy(b"`240" 6,0 e"`")
ins #83
if #83 jump 505
var #uzy(b"`711" 6,0 e"`")
ins #83
if #83 jump 505
var #uzy(b"`111" 6,0 e"`" F" )")
ins #83

:505
if #83 var #83(e"$n" e"$d") " ; " #83(b"$n(" e"$" F": rdths") " (" #83(b"$c" e"$" f" " e")") ") : " #83(b"$d" e"$" e":")
if #83 ins #83

var #uzy(b"`505" e"`5" e"`6" e"`7" e"`8" B"$a" f"01 " 0,10000)
ins _ -- __
ins _$r __
ins _$t __
ins #93

var #uzy(b"`020 " B"$a" e"`" f" " e" ")
if "" var #uzy(b"`010" B"$a" e"`" f" " e" ")
ins #87

#u87
if not #87 jump 33
var #87
if %-% jump 33
if "978" var (0,3) "-";ins #u87
if "979" var (0,3) "-";ins #u87
if #u87 var #87(3,0);ins #87
var #87
hyphen
ins #87
var #u87 #87
ins #87

:33

 #u33
 var #uzy(b"`650")
 if "" jump 330
 :u33
 ins #usw
 var (B"$a" e"`")
 ins _ $v _ -- _
 ins _ $x _ -- _
 ins #u32
 var #u33 " ; " #u32
 ins #u33
 var #usw(b"`650")
 if not "" jump u33
 var #u33(f" ;")
 ins #33L

:330
var #uzy(b"`950" e"`" b"$a ")
ins #330

:830
var #uzy(b"`830" e"`" B"$a")
ins _$v_ _
ins _$p_ _
ins _$x_i_
ins #85
if #85 var #85(e";" e"i") " ; " #85(b";");var (F"; ");ins #85


var #uzy(b"`502" e"`" B"$a")
ins #818

var #uzy(b"Zugl.: " e"`")
if not "" ins #818

if #818 var "Zugl.: " #818;ins #818

var ""
if #818 var #818(B"Zugl.: " B"--" e",") ":" #818(e"`" T" " F".")
ins #819

// Abstract
var #uzy(b"`520" e"`" b"$a" e"$" 0,10000)
ins #98

// EST
var #uzy(b"`730 " e"`" B"$a")
perf art
ins #22

 var #uzy(b"`600" e"`" B"$a")
 ins _ $b _, _
 ins #31p

 var #31p(b"$x")
 ins _ $x _; _
 ins #31s

 var #31p(e"$")
 ins #31p

 var #uzy(b"`650" e"`" B"$a")
 ins _ $x _ -- _
 var (e"$")
 if not "" ins #31s

 var #uzy(b"`651" e"`" B"$a")
 ins _ $x _ -- _
 var (e"$")
 if not "" ins #31g

   440  0 $a Biblioteka Narodowa $a Seria 1 ; $v 59

var #uzy(b"`440" e"`" B"$a")
ins _$v_ _
ins _ $a_._
ins _$p_ _
ins _$x_i_
ins #85
if #85 var #85(e";" e"i") " ; " #85(b";");var (F"; ");ins #85
if #85 jump a85

var #uzy(b"`830" e"`" B"$a")
ins _$v_ _
ins _ $a_._
ins _$p_ _
ins _$x_i_
ins #85
if #85 var #85(e";" e"i") " ; " #85(b";");var (F"; ");ins #85
if #85 jump a85

var #uzy(b"`490" e"`" B"$a")
ins _$v_ _
ins _ $a_._
ins _$p_ _
ins _$x_i_
ins #85
if #85 var #85(e";" e"i") " ; " #85(b";");var (F"; ");ins #85

:a85
var #85
perf art
ins #85


var #uzy(b"`700" B"$a")
:700
ins #uzX
var #uzX(e"`")
ins _$q_ _
ins _,$d_ [_
if % [% var +"]"
var (e"$" F"., ")
ins #42~
var #uzX(b"`700" B"$a")
if not "" jump 700
  #uzX loeschen
#uzX

var #uzy(b"`710" B"$a" e"`")
ins #61

var #61
if "" jump 971
var #61
if not %$c% jump 971

var #61(e"$c") " <" #61(b"$c" f" (" e")") ">"
ins #61


  970 kommt potentiell sehr oft vor. Abschneiden auf 10000 Byte!
var #uzy(b"`970" 6,10000)
:970
ins #uzX
var #uzX(e"`")
ins _$c_ / _
ins _$f_ [_
ins _$p_, S._

ins #95~

:971
var #uzX(b"`970" B"$a")
if not "" jump 970

 var #uzy(0,10)
 if not %GVK% jump 8e
 var #uzy(b"001 " e"`")
 ins #89P

:8e
#uzX
var #uzy(b"`856" B"$u" e"`")
ins _¤_$_
ins _Ø_$_

ins #8e

  #uzy loeschen
#uzy

:tail
exp
sho rec
if #uzx jump exit
jump loop

  ***************************************************
  Sonderfall DNB
  --------------
:dnb
  DNB-Daten sind leider ganz anders (ISBD-Struktur)
  erste Zeile aufbereiten, X ans Ende
var #uzy(f"`" b"`" e"`") "X"

  Erste Zeile endet mit  Space :
if % :X% jump titel
  ist es eine zeile mit Verfassername? Dann : am Ende
if %:X% var (F":X");ins #40;jump vz

:titel
  Erste Zeile ist Titel
var #uzy(f"`" b"`" e". -")
ins _`_ _
var (e" / " e". -")
  Nichtsort.Zeichen setzen
perf art
ins #20

var #uzy(f"`" b"`" e". -")
ins _`_ _
var (b" /" e". -")
ins #39
jump 39

:vz
  Zweite Zeile ist Titel
var #uzy(f"`" b"`" B":`" e". -")
ins _`_ _
var (e" / " e". -")
perf art
ins #20

var #uzy(f"`" b"`" B":`" e". -")
ins _`_ _
var (b" /" e". -")
ins #39

:39
var #uzy(b"Einheitssacht.: " e"`")
ins #22

var #uzy(b" Hrsg." e";" e". -" e" und" B" von")
ins _`_ _
if not "" ins #41
var #uzy(b" Hrsg. " b" und" e";" e". -")
ins _`_ _
if not "" ins #412

var #41(T" ") ", " #41(t" ")
if not "," ins #41
var #412(T" ") ", " #412(t" ")
if not "," ins #412

if #41 jump 818

var #39
if not %Hrsg% jump 818
var #39(e" (" e" ;" F". " T" ") ", " #39(e" (" e" ;" F". " t" ")
ins #41


:818
var #uzy(b"Zugl.: " e"` ")
if not "" ins #818; var "Zugl.: " #818;ins #818

var #uzy
ins _`_ _
var (b". -" b". -" e" (" e" ISBN")
if not %. -% jump 74b

var #uzy
ins _`_ _
var (b". -" e". -")
ins #71

var #uzy
ins _`_ _
var (b". -" b". -" e". -")
:74a
ins #74
var #74(b":" e",")
ins #75
var #74(b"," B",")
ins #76
var #74(e":")
ins #74
jump 85

:74b
var #uzy
ins _`_ _
var (b". - " e". - " e" (" e" ISBN")
if %:% jump 74a
var #uzy
ins _`_ _
var (b". - " b". - " e" (" e" ISBN")
jump 74a


:85
var #uzy(b"` (" e")")
ins _`_ _
ins #85

var ""
if #85 var #85(e";" e"/") " ; " #85(b" ; ")
var (F"; ")
ins #85
if not #85 jump d87

var #85
perf art
ins #85

var #uzy(b"`SP: " e" " e";")
ins _ger_de_
ins _eng_en_
ins #37

var #uzy(b"`SG: " e"`")
ins #30d

:d87
var #uzy(b" ISBN" f" " e"`" e":" e" ")
ins #87

 Falls zweite ISBN auch gewuenscht:
 var #uzy(b" ISBN" b" ISBN" f" " e"`" e":" e" ")
 ins #87~

var #uzy
ins _`_ _
var (b". - " b". -")
if %. - % var (b". - ")
  Zusaetze zum Kollationsvermerk?
  var (e";")
   Ende ist dann etwas schwierig
var (e" (" e" ISBN" e" Sys" e" SW" e" Einh" e" Zugl")
ins #77

var #77(b"Literaturverz. ")

if "" jump 81
var "Literaturverz. " #77(b"Literaturverz. ")

ins #81
var #77(e"Literaturverz. ")
ins #77

:81
var #uzy
ins _`_ _
var (b" Systemvoraussetzungen" e" ISBN" e" SW")
ins #81~

var #uzy(b"g|" e";" e"`")
ins #31g
var #uzy(b"s|" e";" e"`")
ins #31s
var #uzy(b"p|" e";" e"`")
ins #31p

#99m DNB

jump tail

:exit
sho rec
set e1
  Zurueck zum aufrufenden Programm, label :z39mend
jump z39mend

  Unterprog. f. Artikel am Anfang
:art
  falls Steuerzeichen schon da, nichts tun
if "ª" return
ins #uzw
#uta
#utb
var #uzw(b" ")
ins #utb
var #uzw(e" ")
ins #uta
if Artik var "ª" #uta "ª";ins #uta
var #uta " " #utb
return

  Hierher gehts nur, wenn z39m.inc direkt aufgerufen oder im
  aufrufenden FLEX keine Sprungmarke :z39mend

:z39mend
help zilist
