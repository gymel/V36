  FSORT.INC : Feldinhalt manuell oder automatisch ordnen
  2008-03-03  Zwei Unterprogramme
  Zu uebergeben ist $fu, Inhalt wird geordnet in $fs zurueckgegeben
  Elemente in $fu muessen durch "%%%" getrennt sein. Auf Leerzeichen achten!
  Also vorher eine entspr. Ersetzung machen, z.B. so:
  var #nnn 
  ins _; _%%%_
  ins $fu
  perf feld-asort

  Ergebnis steht dann in $fs mit %%% zwischen den Elementen
  Wenn also wieder "; " die Trennung sein soll, dann z.B.
  ...
  perf feld-mord
  var $fs
  ins _%%%_; _
  ins #nnn

end
  ------Feldinhalt manuell ordnen-------------------------------
:feld-mord
mes Zeilen mit Maus verschieben, dann Liste mit OK speichern
var $fu
ins _%%%_^M^J_
aresqa
if "" var $fu;ins $fs;return
var Faresqa.lst
ins _^M^J_%%%_
var (F"% ")
ins $fs
del aresqa.lst
return

  ------Feldinhalt automatisch sortieren---------------------
:feld-asort 
var $fu
ins _%%%_^M^J_
sort a0
ins _^M_%%%_
ins _^J__
var (F"% ")
ins $fs
del aresqa.lst
return
