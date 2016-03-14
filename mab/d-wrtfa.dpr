 MAB2  -->> ISBD-Karten mit RAK-WB Kîpfen

 Parameterdatei fÅr Druckgestaltung von Katalogkarten nach ISBD
 --------------------------------------------------------------
 mit MAB1 als Kategorienschema  (P.CFG)

pn="MAB-PC RAK-WB Kartendruck"

zl=78     ZeilenlÑnge


ab=18      Drucker-Initialisierung am Aufnahme-Anfang

fl=14     Anzahl Zeilen je Karte
fb=13 10 13 10 13 10    3 ZeilenvorschÅbe zwischen zwei Karten
                        (muss evtl. angepasst werden!)
ks=5     Startpos. 6 innerhalb jeder Kategorie
ke=". "     Kategorie-Ende: wird benutzt, wenn kein geeignetes Postfix

pb=94 96 126 248

 Und jetzt die Zwischenteile:
1=". "
2=", "
3=" ; "
4=13
5=" : "
6=13 13
7=" = "
8=". - "
9=" / "
10=". - ("
11=")"
12=13 13 13
13=13 "   "
14=". - ("
15="." 13 "   "

29=13 "ISBN "
30=13 "Kongr.: "
31=13 "   " %85 #5 15

33=13 "NE: " %85 #7 15
34=13 "Abstract: " %85 #17 15
35=13 13
36=13 &0 "("
37=&1
38=&18
39=13 "EST: "
40=27 70
41=18
42=%52 #0 18
43=":" 27 70 13
44=": "
45=27 70 13
46=" ("
47=" + "
48="["
49="] "
50=":" 13
51=13 "Einheitssacht.: "
60=27 69
61=":" 27 70 13
62="["
63="] "
64=27 69 "["
65="]" 27 70 " "
66=27 70
68=27 70 ". - "
73=13 "SW: " #250
74=13 &0 #1
75=%76 "Kîrperschaft: " #250
76=%76 "  norm. Form: " #250
77=13 "s. "
78=&0 "GKD: "
79=13 &1 "        auch: "

80=" [Begr.]"
81=" [Adressat]"
82=" [Hrsg.]"
83=" [Ill.]"
84=" [Komment.]"
85=" [Angebl. Verf.]"
86=" [Mitarb.]"
87=" [Forts.]"
88=" [Bearb.]"
89=" [Mutma·l. Verf.]"
90=" [Vorr.]"
91=" [Red.]"
92=" [Sammler]"
93=" [Interpret]"
94=" [öbers.]"
95=" [Korresp.]"
96=" [Nachr.]"
97=" [Komp.]"
98=" Festschrift"



      KATEGORIELISTE  (= Hauptteil der Parameterdatei)

#-H    Beginn des Einheitszettels

#080 R 0 #zz 4   Signatur: oben rechts

#cn 4 #zz 4    Kartennummer bei Fortsetzungskarten
#hi +A 37       Hierarchie-Angabe
#>O            Ordn.Blîcke der HE generieren
#-A
#335 5 #400 0 #zz 8   Text der bibliogr. Beschreibung
#341 7 #400 0 #zz 8
#342 9 #400 0 #zz 8
#343 5 #400 0 #zz 8
#346 7 #400 0 #zz 8
#347 9 #400 0 #zz 8
#348 5 #400 0 #zz 8
#359 #360 9 #400 0 #zz 8
#200 p9 >K #202 3 #399 0 #zz 8
#201 >K #202 3 #399 0 #zz 8
#202 >K #399 0 #zz 8
#360 1 #400 0 #zz 8
#361 1 #400 0 #zz 8
#365 1 #400 0 #zz 8
#369 1 #400 0 #zz 8
#403 0 #zz 8
#410 0 #44 0 #442 8 #zz 0
#412 5 #44 0 #442 8 #zz 0
#415 3 #44 0 #442 8 #zz 0
#417 5 #44 0 #442 8 #zz 0
#425 2 #zz 0

#427 5 #zz 11
#433 8 #zz 0
#540 29 #zz 0
#730 ++ 73 #74 4 #999 74
#751 ++ 73 #75 4 #999 74
#+#             Ende (sonst wÅrde das folgende Unterprogramm auch noch gemacht)

  Internformat-Anzeige:
#-(
#t{ "{ \f1 " C }   Schrift 1
#nr p"x" e2 =dm
#t{ s0 &0 #4 }       oder 5 statt 4 wenn 3stelliges Schema!
##                oder
 #L            alternativ: Anzeige mit Labels aus der CFG
#t{ C "}" }
#+#


#(P             Unterprogramm: Drucke Personenname mit Funktionsbezeichnung
#i4 f 80        Ausgabe der Funktionsbezeichnung
#i4 g 81
#i4 h 82
#i4 i 83
#i4 k 84
#i4 l 85
#i4 m 86
#i4 n 87
#i4 o 88
#i4 p 89
#i4 q 90
#i4 r 91
#i4 s 92
#i4 t 93
#i4 u 94
#i4 w 95
#i4 x 96
#i4 y 97
#i4 c 98
#t4       Zeilenvorschub
#)P

#(O       Unterprogramm: drucke die Ordnungsblîcke der HE
#200 +h e"" 60 #zz 61

         HE unter Urh.?
#200 +k e"" 60 #zz 61
#+c   wenn #240 nicht vorkommt: ST
#-k
#+h      weiter mit Hauptsachtitel

#-c
#310 +i 64 #zz 65     wenn EST vorkommt: weiter bei #-i

#-u           HE unter HST, wenn nichts anderes geht!
#+D
#-h      Beginn des eigentlichen RAK-Korpus
#310 48 #zz 49
#-i
#331 +D  0 #400 0 #zz 8
#-D
#wh            wiederhole die Kopfzeilen bis hierher
#333 9 #400 0 #zz 8
#)O

#(S
#u1 0 #zz 0
#t4
#)S

#(W             NE unter Person 200* mit PST
#200 b"xxx"
#i4 * +w
#+-
#-w
#200 0 #zz 44
#u1 0 #zz 0
#t4
#)W


#-Y             Personen-Namenssatz
#+#

#(K
#cc b", " e", " #zz 0
#cc e", " p" " #zz 0
#)K


td
td-rtf
to

p  255
