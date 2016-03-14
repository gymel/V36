  VIEWGRUP.APR : Gruppierte ViewListe mit Zwischensummen
  Einsetzbar fuer jedes Kategoriesystem
  2000-07-30
  Wird mit SRCH eingesetzt, um ViewListe vorzubearbeiten
  Aufruf aus VIEWFORM.FLX, VIEWPARA.FLX, VIEW2.FLX.
  Benutzt wird nur #u2 (Resultat einer View-Produktion nach der Sortierung)
  #u2 hat die Struktur  satznr|gruppe:text_zahl
      wenn satznr=0, ist es eine Zwischenzeile, kein Datensatz (s.u.)

  Ausgegeben wird generell mit Zeilenlaenge 72
  andere Laenge gewuenscht? Unten ueberall 62 und 72 aendern.
  Es muss hier mit festen Laengen gearbeitet werden, TAB-Zeichen gehen nicht!

zl=120     max. Zeilenlaenge (wird nicht ausgenutzt)
zm=0       kein Seitenumbruch

4=C        Zwischenteil fuer Zeilenvorschub

  ##########################################################


  Immer nur eine der 3 hier folgenden Anweisungszeilen aktivieren
  und in vvv.vw schauen, was passiert:


  Mit zwei Leerzeichen hinter #u2 wird immerhin etwas ausgegeben,
  wenn auch weder das PrÑ- noch das Postfix:
#u2. p"u2=" P"Ende von u2"


  Das funktioniert Åberhaupt nicht (Ausgabe von nix!):
  #u2 "u2=" P"Ende von u2"


  Das gibt zwar was aus, b"|" manipuliert aber nicht den Arbeitstext:
  #u2  b"|"
