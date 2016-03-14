// optsget.inc fuer acon: Universelle Unterprogramme zur Aufbereitung von Aufrufoptionen
// $Id: getopts.jnc 23884 2011-06-05 13:11:30Z ThB $
// Originalversion von Th. Berger 2011, modif. B. Eversberg 2012-01

// $HeadURL: https://svn.allegro-c.de/svn/download/prog/optsget.inc $
// $HeadURL Orig.: https://svn.extra.gymel.com/repos/allegro/acxt/aconjob/trunk/getopts.jnc $


// Begriffe: "Option" == "Schalter"
// ACHTUNG  "NoUse" bedeutet: kann vermutlich weg

///////////////////////////////////////////////////////////////////
// In dieser Datei enthaltene Unterpgrogramme, Dokumentation in den jeweiligen Abschnitten:
// :OPGET - Optionen aus dem Aufruf nach $OP_... bringen
// :OPTPR - Einige $OP_... besonders praeparieren (reduziert)
///////////////////////////////////////////////////////////////////

// Aus Aufrufoption -xabc  wird  $OP_x = abc
//  x heisst Name der Option, abc ist das Argument
///////////////////////////////////////////////////////////////////
// Subroutine: :OPGET
// Aufruf aufbereiten nach $OP_...
//
// Properties:
// * $OP.accept - Liste von erlaubten Aufrufoptionen
//                  (-j, -b, -d, -k, -L, -P werden von acon bereits ausgewertet
//                   und sind automatisch erlaubt)
// NoUse * $OP.defaultflag  - Anzunehmende Option falls - fehlt
// * $OP.CHECK        - diagnostische Ausgabe speziell fuer OP aktivieren
//
// Ergebnis: $OP_...
// * wird fuer jede Option -x belegt, 
// * Wiederholungen werden dabei durch ^J getrennt
// * Leere Optionen (-L etwa) werden mit "^J" belegt
//
// Seiteneffekt: $TEST2
// von Option --check
//
// Seiteneffekt: $TEST1
// von Option --verbose, --quiet

// Seiteneffekt: $QUIET
// von Option --verbose, --quiet

// Seiteneffekt: $ASIF
// von Option --asif

// Seiteneffekt: #ucc
// wird zerstoert
//
///////////////////////////////////////////////////////////////////

// Status Codes (:OPGET) f. Fehlermeldungen
// 37 - Falsche Programmversion
// 38 - Unbekannte Option
// 39 - unbekanntes Element in Aufrufzeile

:OPGET
 // Welche Version von acon ist zumindest noetig?
var m
if "" var "32.4";jump ERRwrv
var $OP.reqV
if "" var "32.4"
ins $OP.reqV

var $OP.reqV
if "" var "32.4";jump ERRwrv

  // benoetigte Version
var $OP.reqV
ins _._.0_
if %.010% ins _.0_._
if %.011% ins _.0_._
if %.012% ins _.0_._
Z=
  // aktuelle Version
var m
var (T" ")
ins _._.0_
if %.010% ins _.0_._
if %.011% ins _.0_._
if %.012% ins _.0_._
ins $
if $OP.CHECK Write "[TEST] Vergleiche gewuenschte Version " Z " mit aktueller " $ n
var $
Z-
  // Vergleich der Versionsnummern
if Z>0 var $OP.reqV;jump ERRwrv


 // Vererbungen
if $OP.CHECK Write "[TEST] OPGET unter allegro-Version " m n
$OP.acon=-j -b -d -k -L -P

// $OP.cl wird hier belegt und von vorn um je 1 Option verkuerzt:
// Pfad des Executables (erster Teil von cl) entfernen
var cl
if ='"' var (1,0 b'"' f" ");jump OPfirst
var (b" " f" ")
:OPfirst
if "" jump OPEnd
ins $OP.cl

// bei UNIX ist erstes Arg. .../acon
var $OP.cl (B"/acon ")
ins $OP.cl

Wri "OP.cl=" $OP.cl n
  // Schleife zum Einsammeln der Komandozeile
:OPparse
if $OP.CHECK Write "[TEST] next option: >" $OP.cl "<" n
var $OP.cl 
if "/?" jump helpget
if "/h" jump helpget

if "./acon" jump OPnext

if not "-" jump OPnoflag

  // meta
var $OP.cl
if "-?" jump helpget
if "--" jump OPdopp

  // legal?
var $OP.cl (1,1)
ins $OP.name
var " " $OP.cl (0,3)
ins #ucc
if $OP.CHECK Write "Teste '** " $OP.accept " " $OP.acon  " **' gegen '" #ucc "'" n
var "** " $OP.accept " " $OP.acon " **"
var (b"#ucc")
if "" jump ERRnoa

   // get content
var ""
ins $OP.arg
var $OP.cl (e" " 2,0)
if "" jump OPseparate
   // Fall 1: Wert direkt angeklebt
var $OP.cl (2,0)
   // Fall 1a: quotiert
if '"' jump OPreduce1q

// -x ohne Argument
:OPreduce1
var (e" -" e" ")
if "" var 10
ins $OP.arg
var $OP.cl (b" " f" ")
ins $OP.cl
jump OPadd

:OPreduce1q
var (1,0 e'"');
if "" var 10
ins $OP.arg
var $OP.cl (3,0 b'" ')
ins $OP.cl
jump OPadd

   // Fall 2: Wert der Option ist naechstes Argument: -x abc
:OPseparate
var $OP.cl (b" " f" ")
if "" jump OPreduce1
if "-" jump OPreduce1
ins $OP.cl
if '"' jump OPreduce2q

var (e" ")
ins $OP.arg
var $OP.cl (b" " f" ")
ins $OP.cl
jump OPadd

:OPreduce2q
var (1,0 e'"');
if "" var 10
ins $OP.arg
var $OP.cl (1,0 b'" ')
ins $OP.cl
jump OPadd

  // Option ohne - oder --
:OPnoflag
var $OP.defaultflag (f"-")
if "" jump ERRseq
ins $OP.name

var $OP.cl
if '"' jump OPreduce2q
var (e" ")
ins $OP.arg
var $OP.cl (b" " f" ")
ins $OP.cl
jump OPadd

// Option wurde isoliert, zu $OP. zufuegen
:OPadd
if $OP.CHECK Write "remainder: >" $OP.cl "<" n
var "$OP_" $OP.name
var
if "" jump OPset

// es ist eine mehrfach-Option, $OP_x schon besetzt!
// dann den neuen Wert mit 10 anhaengen
var + 10 $OP.arg
ins $OP.arg


// ZENTRALE STELLE
// Hier wird $OP_x belegt mit dem ermittelten Wert

:OPset
var "$OP_" $OP.name "=" $OP.arg
ins
//  Aus -uabc.alg ist jetzt geworden:  $OP_u abc.alg

var $OP_F (f"^J" B"^J")
ins $OP_F

if $OP.CHECK var "";ins $OP.temp
if $OP.CHECK var "$OP_" $OP.name
if $OP.CHECK ins $temp
if $OP.CHECK var
if $OP.CHECK ins $OP.temp
if $OP.CHECK Write "[TEST] erkannt " $temp ": >" $OP.temp "<" n

   // next option
:OPnext
var $OP.cl
if not "" jump OPparse

:OPEnd
return   // :OPGET

:OPchk
var $TEST2;z=;if >1 $OP.CHECK=1
if $OP.CHECK Write "[TEST] OPTPR Optionen praeparieren " m n

if $TEST2 var "1";ins $TEST1
if $TEST1 var "";ins $QUIET

// chop off first OPtion from cl
:OPchop
var $OP.cl (f" " b" " f" ")
ins $OP.cl
if "" jump OPEnd
jump OPparse

// eine -- Option  in Name und Argument zerlegen
:OPdopp
if "--help" jump helpget
var (b"-" e"=")
ins $OP.name
  // TODO: quoted args
var $OP.cl (b"=")
if "" var "1"
ins $OP.arg
var "$OP_" $OP.name "=" $OP.arg
ins

var $OP.cl
if "~--check=" var (b"=" f"0");ins $TEST2;jump OPchk
if "~--check" var "1";ins $TEST2;jump OPchop
if "~--verbose" var "1";ins $TEST1;var "";ins $QUIET;jump OPchop
if "~--quiet" var "1";ins $QUIET;var "";ins $TEST1;echo off;jump OPchop
if "~--asif" var "$ASIF=ASIF";ins;jump OPchop
if "~--dry-run" var "$ASIF=ASIF";ins;jump OPchop
if "~--dry_run" var "$ASIF=ASIF";ins;jump OPchop
if "~--ans" var "$F.ANSI=1";ins;jump OPchop
if "~--uni" var "$F.UNIC=1";ins;jump OPchop
jump OPchop

// einige Fehlerbehandlungen

:ERRwrv
if not #ucc ins #ucc
Write "ERROR: acon Version " #ucc " oder neuer benoetigt. Dies ist Version " m n
z=37


// Hier $OP.CHECK evtl.anders belegen oder nicht
// Produziert voluminoese Meldungen beim Auswerten der Optionen
:OPexit
var $TEST2 $OP.CHECK
ins $OP.CHECK
if not "" Write "[Exit " z "]" n
end

:ERRnoa
var $OP.cl (e" ")
ins #ucc
Write "ERROR: Option '" #ucc "' nicht bekannt" n
z=38
jump OPexit

:ERRseq
var $OP.cl (e" ")
ins #ucc
Write "VORSICHT: Option '" #ucc "' im Aufruf nicht verarbeitbar" n
z=39
jump OPexit


:helpget
  // :HELP ist im aufrufenden Prog. und erstellt den Text $help
jump HELP
  // kehrt hierher zurueck
:helpback
Write n "Notwendige Optionen beim Aufruf: " n 
Write $help

:helpend
z=254
jump OPexit

// Ende von :OP
/////////////////////////////////////////////////////////////////////


/////////////////////////////////////////////////////////////////////
// Subroutine: :OPTPR
// Einige der Werte $OP_* vorverarbeiten, bevor es losgeht
//
// Properties:
// * $OP_... Optionen aus dem Aufruf
// *   Nicht f. update: (da wird -d intern ausgewertet)
// * $OPTS.d_is_pattern   - -d/-b als Dateimuster fuer .cLD-Dateien auffassen
// *               sonst: - -d/-b als Teilpfad auffassen (+ .adx/.tbl/...)
// * $OPTS.CHECK
// * $OPTS.* - ggfls. vorbelegt mit Default-Werten
//
// Array: $OPTS.*
// * $OPTS.InputFiles          - Liste der konkreten Eingabedateien (Trenner ^J)

// Option -e Sonderfall
// * $OP_e1,2 - Ausgabeparameter
// * $OP_E1,2      - Ausgabedatei
// * $OP_exm1,2      - Ausgabedateimodus ('+' fuer append)
//
// Seiteneffekte:
// * #u!! - Suchmuster
// * #uxy ('xy' entsprechend $OP_U)
// * #ucc - ist am Ende weg
/////////////////////////////////////////////////////////////////////

// Status Codes (:OPTPR) f. Fehlermeldungen
// 11 - Keine Eingabedateien
// 21 - Keine Datenbank
// 22 - Syntaxfehler im Suchbegriff (srch)

// Pre-process some of the options
:OPTPR

var $OP_T

if "" jump OPch
if "2" ins $TEST2;jump OPch
if "1" ins $TEST1;jump OPch

Wri "Option -T" $OP_T " ohne Wirkung, nur 1 oder 2 wirken" n

:OPch

if $TEST2 Write "[T2] Optionen-Praeparierung :OPTPR" n

// *******************************************************
// Obsolet: (Bergers Original)
// allgemeine Optionen aus $OP_x nach $OPTS... bringen

// $OP_x  ->  $OPTS.xyz  mit laengerem Namen xyz

// Zusaetzliche, mehr "sprechende" VarNamen   (redundant, ausgebaut von ev.)
// (Erfordern zusaetzliche Kenntnis, die aber in update.job nicht vermittelt wird,
// d.h. diese Datei, die eigentl. transparent sein sollte, muss man doch kennen,
// waehrend man die Optionsbuchstaben sowieso kennen muss.
//   NAME                                 Auswertung bzw. Ersatz
//  $OPTS.AccessLevel - $OP_a          // keine var-Var. in acon, var A in a99
//  $OPTS.DbDir - $OP_d or $ENV{-d}    // avanti.cpp  var D
//  $OPTS.DbName - $OP_b or $ENV{-b}   // avanti.cpp  var B
//  $OPTS.ExportParam  - $OP_ei/$OP_Ei // -eparam/datei   2fach moeglich
//  $OPTS.Fast - $OP_F                 // keine var-Var.
//  $OPTS.InputFileMax - $OP_z         // keine var-Var.
//  $OPTS.InputFileNr - $OP_n          // Im Job setzen mit  set nk, k=1...255
//  $OPTS.InxName - $OP_y              // Standort Indexdatei, falls anderswo
//  $OPTS.InxParam - $OP_I             // Name Indexparam, falls nicht normal
//  $OPTS.JobName - $OP_j              // wird nicht gebraucht
//  $OPTS.Konfiguration - $OP_k        // avanti.cpp  var K und K1
//  $OPTS.Language - $OP_l             // avanti.cpp  var L  def. ger
//  $OPTS.LogName - $OP_L              // avanti.cpp  var G  def.  var B ".log"
//  $OPTS.Manual - $OP_m               // ungenutzt (DOS: manuell anhalten)
//  $OPTS.Mode - $OP_f                 // Funktionsweise
//  $OPTS.NewMode - $OP_N              // geloeschte Saetze fuer neue nutzen?
//  $OPTS.Operator - $OP_O             // avanti.cpp  var #op
//  $OPTS.ProgDir - $OP_P or $ENV{-P}  // avanti.cpp  var P
//  $OPTS.Protoc - $OP_x               // Name der Protokolldatei
//  $OPTS.UpdateFile - $OP_u           // Einzuspeisende Datei


 //////////////// 
 // a) 1. Export
 // belegt $OP_e1, $OP_E1, $OP_exm1 anhand $OP_e
var $OP_e (e"^J" e"[/+=]")
if "" jump OP_eEnd
ins $OP_e1

var ""
var $OP_e (e"^J" b"[/+=]")
ins _\_/_
if not "" ins $OP_E1
var $OP_e (e"^J" b"[+]")
if not "" var "$OP_exm1=+";ins

if $TEST2 Write "[srch] Export 1:" 9 "Parameter >" $OP_e1 "<" 9 "Datei >" $OP_E1 "<" n


 //////////////// 
 // b) 2. Export (in $OP_e steht evtl. zweites -e hinter ^J )
 // belegt $OP_e2, $OP_E2, $OP_exm2
var $OP_e (b"^J" e"^J" e"[/+=]")
ins $OP_e2
 // 2. Exportdatei
var $OP_e (b"^J" e"^J" b"[/+=]")
ins _\_/_
ins $OP_E2
var $OP_e (b"^J" e"^J" b"[+]")
if not "" var "$OP_exm2=+";ins

if $TEST2 if $OP_e2 Write "[srch] Export 2:" 9 "Parameter >" $OP_e2 "<" 9 "Datei >" $OP_E2 "<" n

:OP_eEnd

 //////////////// 
 // Fuer srch.job
 // c) Suchbegriff fuer Befehl srx
 // #u!!
var $OP_s
if "" jump OP_sEnd

 // Aus SRCH- in srx-Syntax umwandeln
if % % jump srxsyntax
ins _X_ _
ins ,Y,_,
ins _,_.*_
ins _P_\._
ins _K_.*_
:srxsyntax
// srx braucht den Suchbegr. in #u!!
ins #u!!
// Wenn nur -s0, dann nicht suchen, d.h. #u!! loeschen! (wie bei SRCH.EXE)
// (100 Jahre a99 und immer noch kein Test auf Gleichheit)
var + "#impossible#"
if "0#impossible" var "";ins #u!!

if not #u!! jump OP_sEnd
if $TEST2 Write "Suchbegriff '" #u!! "'" 
if $TEST2 if $OPTS.Fast Write " (ohne Expansion)"
if $TEST2 Write n
var "egal"
srx
if cancel jump srxerr

:OP_sEnd

 //////////////// 
 // d) Datenbankname, Eingabedatei(en), Option -d<namensmuster>

var $OP_k
if "" get env -k
if "" var "a"
ins $OP_k

var $OP_b
ins _\_/_
var (T"/")
if "" get env -b
ins $OPTS.DbName

if $OPTS.d_is_pattern jump OPTPRpattern

// -b und -d behandeln und DbDir draus machen
// fuer update nicht wichtig, denn  var D  entsteht von selbst
var $OP_b
ins _\_/_
var (t"/")
ins $OPTS.DbTemp

var $OP_d (f"*")
ins _\_/_
var (F"/")
if "" var $OPTS.DbTemp
if "" get env -d
ins $OPTS.DbDir

// ueberfluessig, wenn .tbl nicht exist., bricht acon sofort ab
//var $OPTS.DbDir "/" $OPTS.DbName ".tbl"
//fsize
//if no jump OPTPRnodb

jump OPTPRdend

// Auswertung eines Dateinamensmusters, Findung aller passenden Dateien

:OPTPRpattern
 // $OPTS.InputPattern, $OPTS.InputFiles
var $OP_d (f"*")
ins _\_/_
ins $OPTS.InputPattern
if not "" jump OPTPRpatternset

get env -d
ins _\_/_
ins $OPTS.InputPattern
var $OP_b (t"/") 10 $OPTS.InputPattern
var (f"^J" e"^J")
ins $OPTS.InputPattern

get env -b
ins $OPTS.temp
var $OP_b
ins _\_/_
var (T"/" f"/")
var +10 $OPTS.temp
var (f"^J" e"^J")
ins $OPTS.temp

var $OPTS.InputPattern "/" $OPTS.temp "*." K1 "ld"
ins $OPTS.InputPattern
if "" jump OPTPRnofiles

:OPTPRpatternset
var "/" $OPTS.InputPattern
var (T"/")
if not %.% if not %*% var $OPTS.InputPattern "*";ins $OPTS.InputPattern
if not %.% var $OPTS.InputPattern "." K1 "l?";ins $OPTS.InputPattern

var ""
ins $OPTS.InputFiles

// falls ein Pfadname, dann diesen nach #uoD
var $OPTS.InputPattern
if not %/% jump OPTPRexpand
var $OPTS.InputPattern (t"/" F"/") "/"
ins $OPTS.InputDir

:OPTPRexpand
if $OPTS.CHECK Write "[TEST] Expandiere: >" $OPTS.InputPattern "<" n
var $OPTS.InputPattern
ins _/_\_
dir
var (F" ")
ins _\_/_
// if z=0 jump OPTPRnofiles
// Liste steht in iV, in $OPTS.InputFiles speichern
ins _  _^J_
ins $OPTS.InputFiles

if not $OPTS.InputFiles jump OPTPRnofiles

:OPTPRdend


 //////////////// 
 // e) Anwendervariablen #uxy setzen (Optionen -Uxy)
var $OP_U
if "" jump OP_UEnd

:OPTPRsetu
ins $OPTS.temp 
if $OPTS.CHECK Write "[TEST] Setze #u" $OPTS.temp (e"^J") n
var "#u" $OPTS.temp (e"^J" 0,4)
ins $u1
  // Fuell-"y" hinter #uxy, damit legale Kategorie, dann Fuell-Spatien bis Kategorieanfang
var Kk (e"/")
z=
z+1
var $u1 JRy
ins $u1
var Kk (b"/")
z=
var $u1 JR.
ins _._ _
ins $u1
var $OPTS.temp (e"^J" 2,0)
ins $u2
var $u1 $u2
insert

if $TEST2 var $OPTS.temp (0,2)
if $TEST2 ins #ucc
if $OPTS.CHECK Write "[TEST] #u" #ucc " wird gesetzt" n
if $TEST2 var "#u" #ucc
if $TEST2 var
if $TEST2 ins #ucd
if $TEST2 Write "[OPTPR] #u" #ucc " gesetzt auf: >" #ucd "<" n

var $OPTS.temp (b"^J")
if not "" jump OPTPRsetu

:OP_UEnd

//////////// 
// Fast-Zahl (Sek. Verzoegerung nach dem Speichern)
// $OP_F wurde mit -F belegt, das steht dann hinter ^J
//       -F ohne Zahl wirkt wie -F0
var $OP_F (f"^J" B"^J")
ins $OP_F

var $OP_x (f"^J" B"^J")
ins $OP_x


if $OPTS.CHECK Write "[TEST] Betrachte: -v >" $OP_v "<" n
var $OP_v
if "0" var "";ins $TEST1;jump OPTPRvd
if not "" var "1";ins $TEST1

:OPTPRvd
if $TEST2 $TEST1=1

var $TEST1
if "" var "1";ins $QUIET
if not "" var "";ins $QUIET

if $QUIET var "";ins $TEST1
if $QUIET echo off

if $OPTS.CHECK Write "[TEST] final options QUIET: >" $QUIET "<, VERBOSE: >" $TEST1 "<, CHECK: >" $TEST2 "<" n

 //////////////// 
 // g) manual intervention and Single-user have no effect
var $OP_m
if not "" if not "0" write "HINWEIS: Option -m" $OP_m " veraltet und wirkungslos" n

var $OP_S
if not "" if not "0" write "HINWEIS: Option -S ist veraltet und wirkungslos" n

:OPTPREnd
return  // from :OPTPR

/////////////////////////////////////////////////////////////////////

// Fehlerbehandlung srx (srch.job)

:srxerr
Write "ERROR: Suchbefehlsfehler mit dem Ausdruck '" #u!! "'" n
z=22

Write "[Exit " z "]" n
end


