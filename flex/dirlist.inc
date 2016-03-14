  DIRLIST.INC : Dateiliste erstellen, zur Bearbeitung vorlegen
  20070809      Namen der ersten bzw. naechsten Datei in iV kopieren

  Unterprogramme zur Verarbeitung einer Liste von Dateien
  -------------------------------------------------------
  dirlist     : Hauptfunktion: Liste der Dateien erstellen (s.u.)
                  Namensmuster dafuer steht bei Aufruf in iV
  firstname   : Namen der ersten Datei in iV bereitstellen
  nextname    : naechste, liefert "" wenn keine mehr

  Liste der Dateien erstellen
  Namensmuster steht in iV. z.B. c:\allegro\*.apr
  Ergebnis: Liste in $DL
:dirlist
ins $nam
  Uvz. mit beruecks.? Dann ist #udS gesetzt
if #udS jump dl:sub
  z.B.    dir *.apr >liste
var 'dir /on "' $nam '" >liste'
dos
jump dl:liste

:dl:sub
  z.B.    dir /s *.apr >liste
var 'dir /on /s "' $nam '" >liste'
dos

:dl:liste
  Bei Misserfolg oder Abbruch ist $DL leer, sonst steht die Liste drin
var ""
ins $DL
  Liste liste mit aresqa zeigen. Mit Bearb., wenn #udE gesetzt
if #udE aresqa liste
if not #udE Aresqa liste
  Nichts gewaehlt? Dann iV leer
if "" return

  Die Dateiliste einlesen, 
  Namen mit // getrennt in $DL schreiben
open aresqa.lst
if no open liste
if no return
:dl:dloop
get
if cancel close;return
if "" jump dl:dloop
  Ein Verz.Name: mit * kennzeichnen
if %:\\% var (f" " b" " b" ");ins #udO;var $DL "//*" #udO;ins $DL;jump dl:dloop
if " " jump dl:dloop
  Ein Dateiname
var (b" " f" " b" " f" " b" ")

ins #udD
var $DL
if not "" var +"//"
var +#udD
ins $DL
jump dl:dloop

  Ersten Namen auf der Liste in iV kopieren

:firstname
var ""
ins #udO
if not $DL return;
  Inhalt von $DL in $dl kopieren, // vorn beseitigen
var $DL
var (f"/")
ins $dl
if "" return

  Naechsten Namen aus $dl entnehmen
  Dabei wird $dl vorn verkuerzt, bis nichts mehr da ist
:nextname
:dl:nn
var $dl
var (e"//")
  nichts mehr da (dann iV leer)
if "" return
  der naechste Name ist ein Verzeichnis, in #udO schreiben
if "*" var (f"*");ins #udO;var $dl;var (b"//");ins $dl;jump dl:nn
  Dateiname in #udD
ins #udD
  $dl verkuerzen
var $dl
var (b"//")
ins $dl
  Pfadnamen und Dateiname in iV kopieren
var #udO "\\" #udD
return


