
  Input form for database CAT
  Zeilen mit Leerzeichen am Anfang sind Kommentare
  Keine Komm. innerhalb von Zeilen

  Formular-Ueberschrift  [...
[Buch: Teil 1]
#20 "TITEL:"|4
#40 "Verf.Name:"|1
#74 "Ersch.Ort:"|6
#75 "Verlag:"|6
#76 "Jahr:"|6
#77 "Umfang"

#71 "Auflage:"
#85 "Serie:"|5

#87 "ISBN:"|9i
#90 "Signatur:"|8a
#30a"Sachgruppe:"|7a
#37 "Sprache:"

[Buch: Teil 2]
#41 "Hrsg.: "|1
#42 "Mitarb.: "|1
#43 "Bearb.: " |1
#61 "beteil.  Kîrp.: "|2
#91 " Zug.Nr.: "|9Z
#31 "Schlagwort: "|3


[Aufsatz]
#40 "  Verfasser: "|1
#20 "  Aufs.titel: "|4
#70 "Zeitschr./ _KÅrzel:"|5
#84 "enth. in (_Id.Nr.):"
#704"BandNr: "
#76 "Jahr: "
#706"Heft: "
#708"Seiten: "


[DC-Metadaten]
#20 "Title: "|4
#40 "Creator: "|1
#31 "Subject: "|3
#98 "Description:"
#75 "Publisher:"|6
#42 "Contributor:"|1
#84S"Source: "
#84R"Relation:"
#77c"Coverage:"
#81r"Rights:"
#76 "Date: "|6
#770"Type:"
#77 "Format:"
#37 "Language:"


[Hierarchischer Untersatz]
#01 "  Band: "
#41 " Hrsg.: "|1
#19 " Bandbezeichnung"
#20 " Titel: "|4
#76 "  Jahr: "
#77 "Umfang: "


[Verkn. Untersatz]
#00 "  IdNr+BandNr: ".
#41 " Hrsg.: "|1
#20 " Titel: "|4
#90 "?Signatur: "
#40 "   Verf.: "|1
#41 "   Hrsg.: "|1
#43 "  Bearb.: "|1
#71 " Auflage: "
#85 "   Serie: "|5
#87 "    ISBN: "|9i
#76 "  Jahr: "
#77 "Umfang: "


[Zeitschriften-Stammsatz]
<00 z?5
#8n "Stammtitel"|5
#20 "Ansetz.titel (RAK)"|5
#8na"KÅrzel"
#23 "Verw.Formen: "|5
#60 "Urheber: "|2
#76p"Ersch.Verlauf: "
#90 "Signatur: "
#92 "Bestand:"
#74 "Ersch.Ort: "
#75 "Verlag: "
#88 "ISSN"


[Zeitschriften-Stamm, 2.Teil]
#97 "Lieferant"|Vlief.vw
#97b"Erstbestellung am"
#97n"Vorgangsnummer"
#97s"Lieferfrist"
#97f"Mahnfrist"
#23f"frÅherer Titel: "|5
#23s"spÑterer Titel: "|5
#26 "Beigaben: "
#97e"Erwerb.Art"K
#97z"Anz.Exemplare"1


[Bestand, Inventarsatz]
<00 e?5
#9DF"IdNr.".
$L-#9DG"Sigel"
$s-#9DG"Signatur"
$z-#9DG"Zugangsnummer"|9Z
$b-#9DG"Band"
$B-#9DG"Bandbez. (sort)"
$a-#9DG"Barcode"
$E-#9DG"Ausgabe"
$l-#9DG"Standort"
$n-#9DG"Kommentar"
$H-#9DG"Bestand"
$d-#9DG"Datum"
$v-#9DG"Verf.(a,k,p)"
$Y-#9DG"Jahr"

[Zeitschriftenband]
<00 e?5
#00 "ZS-Identnummer+Jahr[+Ex.]: "
#90 "Signatur                 : "
#92j"Jahrgang                 : "
#92a"Anz. Ausgaben f. d. Jahr : "
#92 "Bestand (zB 1-4, 6/7, 8) : "
#92l"BestandslÅcken (Heftnr.) : "
#92s"Sonderhefte (n. Vorlage) : "
#92J"Jahresregister           : "
#92p"Abonnement-Preis         : "
#92r"Rechnungsdatum           : "
#91 "Inventarnr.              : "
#92k"Kommentar                : "
#95v"Verteilerliste (KÅrzel)  : "V


[Personenstammsatz]

<00 p?4
#4n " Personenname Ansetzung: "
#3n sp" SWD-Form:"
#4na" Verweisungsformen:"
#4nr" siehe auch:"
#4np" Pseudonyme:"
#4nt" wirklicher Name:"
#4nd" Lebensdaten:"
#4nz" Kommentar:"

[Kîrperschaftsstammsatz]

<00 k?4
#6n " Personenname Ansetzung: "
#6na" Verweisungsformen:"
#6nr" siehe auch:"
#6nd" 'Lebensdaten':"
#6nz" Kommentar:"

[Signatur]
$$-#90 "Signatur"
$a-#90 "Barcode"
$d-#90 "ZgDatum"
  10
[Klassifikations-Stammsatz]
<00 y?4
#3n c"Notation Hauptbegriff: "
#3na"Synonyme (durch ; getrennt) : "
#3nr"Siehe-auch-Referenzen: "
#3nt"Drucktext: "
#3ny"Definition, Abgrenzung: "
#3nz"Hinweise zur Benutzung: "

[Bestellung]
<00 e?5
$A-#9DB"Auftr.Geber"|Vauft.vw
$j-#9DB"Lieferant"|VLIEF.vw
$p-#9DB"Preis"
$T-#9DB"Anmerk.f.Lieferant"
$C-#9DB"Anmerk.(intern)"
$c-#9DB"WÑhrung"|Vwhrg.vw
$a-#9DB"Kontingent"|Vkont.vw

[Inventarisierung]
$q-#9DB"EndPreis (EURO)"
$e-#9DB"Eing.datum"
$Q-#9DB"ODER EndPreis (DM)"
$z-#9DB"Zugangsnr."|9Z

[Lieferant]
<00 l?4
$$-#9A L"Code"
$n-#9A "Name"
$a-#9A "Adresse"
$t-#9A "Telefon"
$F-#9A "FAX"
$b-#9A "Bank"
$z-#9A "BLZ"
$K-#9A "Konto"
$s-#9A "Lieferfrist (Tage)"
$f-#9A "Mahnfrist (Tage)"
$p-#9A "Sprache"

[Auftraggeber]
<00 y?4
$$-#9A A"Code"
$n-#9A "Name"
$a-#9A "Adresse"
$t-#9A "Telefon"
$L-#9A "Sigel"

[Textbaustein]
<00 y?4
$$-#9A X"Code"
$A-#9A "öberschrift"
$B-#9A "Best.Nr."
$C-#9A "AuftrGeber"
$G-#9A "Exemplare:"
$O-#9A "Preis:"
$L-#9A "Liefermodus:"
$S-#9A "Bestelltext:"
$W-#9A "Zusatztext:"

[Kontingent]
<00 y?4
$$-#9A K"Code"
$K-#9A "Bezeichnung"
$V-#9A "Vorgabesumme"
$B-#9A "Bestellungen"0.00
$E-#9A "Vorakzession"0.00
$R-#9A "Vorauswahl"0.00

$A-#9A "Schon ausgegeben"0.00
$c-#9A "WÑhrung"EUR

