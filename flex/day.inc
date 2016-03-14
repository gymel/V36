  DAY.INC  : Datumsberechnungen
  20090217   Mit  "include day.inc"  einbinden (s. vb214)
     Korr. #u1 -> #u4  20090504

  Direkter Aufruf so : X day.inc D
  1.  D = JJJJMMTT              >16010101  and <24000229
  2.  D = JJJJMMTT+n oder -n    n<291887
  3.  D = JJJJMMTT-jjjjmmtt     zweites Datum kleiner als erstes!
  4.  D = num                   0 < num < 291888   

    Aufruf innerhalb eines FLEX:
  var "D"    // D hat eine der o.a. Formen
  perf Day   // danach Erg. in iV, dann:

  Erg.:  0.  In iV steht z.B.  20120225/12:36:44 = Sa, 25. Feb 2012
         1.  T-nummer in #uWn, Wochentag in #uWo und iV
         2.  Datum in #uWe und iV, Wochentag in #uWo
         3.  Differenz in #uWD und iV
         4.  Datum in #uWe und iV, Wochentag in #uWo
  Eingebaut z.B. in  kalender.flx  und  weekday.flx, welche damit
    ab 1601 bis 2399 arbeiten

  Zum Testen aufrufen mit   X day.inc test

if not "test" jump D:day
var "20120221"
perf Day
ins #u|T
var "20120221 = " #u|T
mes
var "20160221+8"
perf Day
ins #u|T
var "20160221+8 = " #u|T
mes
var "20080323-2"
perf Day
ins #u|T
var "20080301-2 = " #u|T
mes
var "20090101-20080101"
perf Day
ins #u|T
var "20090101-20080101 = " #u|T
mes
var "148000"
perf Day
ins #u|T
var "TagesNr (nach 1.1.1601) = 148000" n "#uWo=" #uWo n "#uWe=" #uWe
mes
end

:Day
ins #u|T
if #u|T jump D:uda

  Aufruf ohne Argument - fragen
ask JJJJMMTT (+-...) oder T-Nummer
if "" end
ins #u|T
jump D:uda

end

:D:uda
var #u|T
  input ist eine T-Nr
if <291888 ins #uWN;jump D:nr
if <16010101 jump D:err
if >24000228 jump D:err

  ist Datum im gueltigen Bereich

var #u|T(f"0123456789")
ins #udb
var #u|T(e"[+-]")
ins #uWe

#u-- NULL
var ""
jump WeWoTa

  kommt dann hierher zurueck, weil #u-- damit besetzt
:NULL
  es war nur ein Datum, nichts weiter?
if not #udb var #uWo;return;mes;end

  #uWn ist T-Nr von JJJJMMTT
var #udb
  Datumsdiff gewuenscht?
if "-" var #udb(f"-");if >16000000 jump diff

  nein, Addition/Subtr von Tagen
eval #uWn +#udb
ins #uWN
jump D:nr

:diff
var #uWn
ins #uWS
var #udb(f"-")
ins #uWe
#u-- VIER
var ""
jump WeWoTa

:VIER
eval #uWS -#uWn
ins #uWD
  falls Datum2 > Datum1, ist Erg. negativ!
  Soll das - weg, dann diese Zeile nach links ruecken:
 var #uWD(f"-")

return
mes
end


  T-Nr in #uWN umrechnen in JJJJMMTT
:D:nr
eval #uWN /365 +1601
var (e".")
ins #uWJ

  Diese Jahreszahl ist manchmal 1 zu gross
var #uWJ "0101"
ins #uWe
  Nummer des 1.1. des Jahrs #uWJ ausrechnen
#u-- EINS
var ""
jump WeWoTa

:EINS
var #uWn

eval #uWn -#uWN
  Wenn #uWJ zu gross, dann liegt Nummer des 1.1. hoeher als #uWN
if >0 eval #uWJ -1;ins #uWJ

var #uWJ "0101"
ins #uWe
  Nummer des 1.1. des Jahrs #uWJ nochmal ausrechnen
  (da Jahreszahl jetzt evtl. 1 kleiner)
#u-- ZWEI
var ""
jump WeWoTa
:ZWEI
#u--

  wievielte Tag des Jahres ist unser Tag?
eval #uWN -#uWn
ins #uWO

  Jetzt ist #uWf gesetzt, falls Schaltjahr!
  in welchem Monat liegt der Tag?
eval #uWO -#uWf
if >333 #uWM 12;#uWH 334;jump D:day
if >303 #uWM 11;#uWH 304;jump D:day
if >272 #uWM 10;#uWH 273;jump D:day
if >242 #uWM 09;#uWH 243;jump D:day
if >211 #uWM 08;#uWH 212;jump D:day
if >180 #uWM 07;#uWH 181;jump D:day
if >150 #uWM 06;#uWH 151;jump D:day
if >119 #uWM 05;#uWH 120;jump D:day
if >89 #uWM 04;#uWH 90;jump D:day
if >58 #uWM 03;#uWH 59;jump D:day
  weg mit #uWf
#uWf
var #uWO
if >30 #uWM 02;#uWH 31;jump D:day

#uWM 01
#uWH 0


:D:day
 
eval #uWO -#uWH -#uWf +1
var (0,r2)
ins _ _0_
ins #uWT

  Datum zusammensetzen zu JJJJMMTT
var #uWJ #uWM #uWT
ins #uWe

#u-- DREI
var ""
  Wochentag auch noch eben ausrechnen
jump WeWoTa
:DREI
  #u3 statt #u0 und #u4 statt #u1!
    (denn #u1 ist eine Datenkategorie, keine #u-Variable)
#u31 Jan
#u32 Feb
#u33 Mrz
#u34 Apr
#u35 Mai
#u36 Jun
#u37 Jul
#u38 Aug
#u39 Sep
#u40 Okt
#u41 Nov
#u42 Dez
  aus 01 wird 31, aus 10 wird 40 (um #u1 zu vermeiden)
eval #uWM +30
ins #uWN

var "#u" #uWN
var
ins #uWM
var #uWe "/00:00:00 = " #uWo ", " #uWT ". " #uWM " " #uWJ
ins #uWe
#u3~
#u4~
var #uWe

return    // Ende von :tnr
  Wenn nicht mit perf aufgerufen, dann anzeigen
mes
end    // from :tnummer, if called by perform

  **********************************************
  UPRO f. Wochentagsberechnung + Nr. des Tages
  Eingabe: iV oder #uWe = JJJJMMTT
  Rckgabe: iV und #uWo = Wochentag,  #uWn = T-Nummer
  Rckkehr: falls nicht mit perform aufgerufen, dann zur
           Sprungmarke, die in #u-- steht
:WeWoTa
if not "" ins #uWe
var #uWe (0,4)
ins #uWj       // JJJJ
var #uWe (4,2)
ins #uWm       // MM 
var #uWe (6,2)
ins #uWt       // TT
var #uWt


  #uWj ist das Jahr, um das es geht
  Flag #uWf wird gesetzt, wenn #uWj ein SchaltJahr (SJ) ist.
#uWf
  Flag #uWk = Ausgleichswert fuer MM = 03-12 in Schaltjahren
#uWk 1
eval #uWj /4
  Jahr durch 4 teilbar, d.h. Ergebnis ist Ganzzahl
if not %.% #uWf 1
var #uWj (2,0)
 JahrhundertZahl ist normalerweise kein SJ
if ="00" #uWf
var #uWj
  aber 2000 ist SJ.
if "2000" #uWf 1


var #uWj (0,2)
ins #uWh
  wieviele Jh. seit 1601 vergangen? = #uWv
eval #uWh -16
ins #uWv

  Wenn  JJ00, sind noch keine 100 vorbei!
var #uWj (2,0)
if "00" eval #uWv -1;ins #uWv

  Und 2000 ist kein normales Jh
var #uWj (0,4)
if >2000 eval #uWv -1;ins #uWv

  #uWv ist nun die Zahl der als SJ nicht zaehlenden Jahrhunderte!
            bis zum fraglichen Datum

  Wieviele Schalttage sind vorgekommen seit 31.12.1600 bis #uWe
  (#uWj = Jahreszahl, um die es geht)

eval #uWj -1601 /4 -#uWv
  Anzahl SJ. seit 1601, incl. Jahr #uWj
ins #uWl
var #uWl(e".")
ins #uWl


  Flag #uWf fuer Tagesberechn. nur beruecks., wenn Monat > Febr
var #uWm
if #uWf if <3 #uWk
if not #uWf #uWk

 var "sj: " #uWl ", uWf=" #uWf ", jv=" #uWv ", uWk=" #uWk
 mes

  #uWk gesetzt; wir haben SJ. UND es ist 1.3. oder spaeter

  Array anlegen fuer Basistage der Monate
  #u3 statt #u0 und #u4 statt #u1!
    (denn #u1 ist eine Datenkategorie, keine #u-Variable)
#u31 0
#u32 31
#u33 59
#u34 90
#u35 120
#u36 151
#u37 181
#u38 212
#u39 243
#u40 273
#u41 304
#u42 334

 Jahre seit 1601
eval #uWj -1601
ins #uWs


eval #uWs *365 -1 +#uWt +#uWl +#uWk
ins #uWu
  aus 01 wird 31, aus 10 wird 40 (um #u1 zu vermeiden)
eval #uWm +30
ins #uWn

  Zahl aus Array #uWm entnehmen
var "#u" #uWn
var
ins #uWb
var z
ins #uWz
eval #uWu +#uWb
ins #uWn
  #uWn ist Zahl der Tage seit 1.1.1601
z=
z%7
var z
ins #uWr

var #uWz
z=
  Array f. Wochentagsnamen
#uW0 Mo
#uW1 Di
#uW2 Mi
#uW3 Do
#uW4 Fr
#uW5 Sa
#uW6 So

var "#uW" #uWr
var
ins #uWo

var #u--
jump
end

:D:err
var "Datum " #u|T " nicht im Bereich 16010101 - 24000228"
mes
end

  Referenz:
  http://www.adoption.de/init_kalender.htm "Immerwaehrender Kalender"


 u-VARIABLEN
  Array f. Anfangstage der Monate
 #u01 (1)   0
 #u02 (1)   31
 #u03 (1)   ...
 #u04 (1)
 #u05 (1)
 #u06 (1)
 #u07 (1)
 #u08 (1)
 #u09 (1)
 #u10 (1)
 #u11 (1)
 #u12 (1)
      Array f. Namen der Wochentage 
 #uW0 (1)  Mo
 #uW1 (1)  Di
 #uW2 (1)  ...
 #uW3 (1)
 #uW4 (1)
 #uW5 (1)
 #uW6 (1)

 #uWb (1)  Zahl aus Array #u0... f.d. aktuellen Monat
 #uWe (6)  eingegebener Tag  JJJJMMTT / ausgerechnetes Datum
 #uWf (6)  Flag: Gesetzt, wenn JJJJ ein Schaltjahr ist
 #uWh (2)  Hilfsvar  
 #uWk (3)  Korrekturwert, wenn JJJJ Schaltj. und MM>02
 #uWj (9)  Jahreszahl JJJJ der Eingabe
 #uWl (1)  Anzahl SJ. seit 1601, incl. Jahr #uWj
 #uWm (3)  Monatszahl MM der Eingabe
 #uWn (2)  errechnete T-Nummer = Anzahl Tage seit 1.1.1601 bis #uWe
 #uWo (2)  ausgerechneter Wochentag
 #uWr (2)  Hilfsvar. v. Divisionsrest
 #uWs (2)  Anzahl Jahre seit 1601
 #uWt (1)  Tageszahl TT der Eingabe
 #uWu (2)  Zwischenwert bei Berechnung von #uWn
 #uWv (5)  Zahl der Jahrhunderte seit 1601
 #uWz      Hilfsvar. Zwischenspeicher f. z

 #uWN      Umzurechnende T-Nr
 #uWJ      Jahr zu #uWN 
 #uWM      Monat zu #uWN
 #uWT      Tag zu #uWN
 #uWO      Differenz der Tage #uWN - 1.1. desselben Jahres
 #uWH      Hilfsvar 
 #uWD      Differenz zwischen 2 Daten
 #uWS      erstes Datum bei Differenzfunktion

