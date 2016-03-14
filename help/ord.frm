[ZGen]
$$-#9A "Code"
$N-#9A "Name"
$R-#9A "Registername"
$P-#9A "Reg.Pr„fix"
$F-#9A "FeldPr„fix (opt)"

[SGen]
$$-#9A "Code"
$N-#9A "Name"
$R-#9A "Registernr/name"
$P-#9A "Reg.Pr„fix"
$F-#9A "FeldPr„fix (opt)"

[Abschluss]
$R-#9DB"Anweis.Datum"
$N-#9DB"Rechn.Nr."
$i-#9DB"Rechn.Betrag"
$K-#9DB"Rechn.Komment".
$A-#9DA"Abschl.Datum"

[Abonnement]
$w-#9DC"ErschWeise (Anzahl/Jahr)"12
$j-#9DB"Lieferant"|Vlief
$a-#9DB"Kontingent"|Vkont
$k-#9DC"ErwArt  k t g p"k
$p-#9DB"W„hrung Preis"|Vwhrg
$Y-#9DG"ab Jahrgg/Band"
  pak  #9DC$K    Paket (Konsortium)
  stg  #9DC$S    Statistikgruppe
  bgn  #9DC$z    Beginn bzw. Zeitraum des Abo Jahr/Bd/Heft
  end  #9DC$Z    Ende des Abo letztes Jahr/Bd/Heft
#9DU"Umlauf-Verteiler"|Vvert
#8e "Eingangs-URL"
  ura  #8ea      Archiv-URL
  urf  #8ef      Freie URL
  uri  #8ei      Info-URL
  kom  #81       Kommentar
#81 "Kommentar"
$s-#9DG"Signatur"
$L-#9DG"Standort"
$L-#9DA"RefNr d. Lief."
#97w"Ext.Datei"
$n-#9DB"Exemplare"

[ZsBand]
$T-#9DA"Titel-IdNr"
$J-#9DA"Abo-IdNr"
$Y-#9DG"Jahr/BandNr"
$w-#9DC"Anz.Hefte/Jahr"
$e-#9DG"Exemplar"1
$k-#9DC"ErwArt  k t g p"k
#9DU"Umlauf-Verteiler"|Vvert
#9DN"Heftdaten"
#81 "Kommentar"
#97w"Ext.Datei"
$z-#9DG"ZugangsNr"
$$-#9DB"BandStatus"
$j-#9DB"LieferantCode"|Vlief
$t-#9DC"nchst. Mahntermin"

[Rechnung]
<00 zrec?6
<9C rec
$a-#9R "Tit.Id:Abo/Bestell.Id"
$D-#9R "EingDatum"
$d-#9R "RechnDatum"
$l-#9R "Lieferant"
$n-#9R "RechnNr d. Lief."
$p-#9R "GesamtBetrag"
$t-#9R "TeilBetrag"
$x-#9R "ExtraKosten"
$c-#9R "W„hrung"|Vwhrg
$Y-#9R "Jahr/BandNr"
$k-#9R "Kontingent"|Vkont
$s-#9R "Statistikgruppe"

[Teilbetrag]
$a-#uzR"Abo-IdNr/BestNr"
$t-#uzR"Teilbetrag"
$Y-#uzR"Jahr/BandNr"
$k-#uzR"Kontingent"|Vkont
$s-#uzR"Statistikgruppe"
$c-#9R "W„hrung"|Vwhrg

[Verteiler]
<00 -
$$-#9A V"Code"
$n-#9A "Name"
$e-#9A "Liste"
$k-#9A "Kommentar"
#9C "Kennung"
#97w"Ext.Datei"

[Heftumlauf]
#00 "IdNr,Heft"
$Y-#9DG"Jg./Bd."
$$-#9DU"momentan: "
$m-#9DU"wartend: "
$p-#9DU"erledigt: "
#97w"Ext.Datei"

