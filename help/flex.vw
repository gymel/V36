            0|FLEXikon : Thematische �bersicht der Befehle                          
h flex       |----------------------------------------------------------------      
h flex       |>>>   Das Eingabefeld unten kann zum Suchen benutzt werden!  <<<      
            0|----------------------------------------------------------------      
h xa         |         -->  Alphabetische Gesamt�bersicht                           
h xal        |         -->  Alphabetische Liste mit Kurzhinweisen z. Funktion       
h flexk      |         -->  Alphabetische Liste mit kurzen Beschreibungen           
X flexikon   |         -->  Liste der System- und FunktionsFLEXE                    
h flexw      |         -->  Einfache Beispiele zum Ausprobieren                     
h xcstring=hl i|         -->  Variablen f�r die Befehle "var" und "write"           
h xavanti    |         -->  Besonderheiten bei acon                                 
X uvar       |         -->  #u-Variablen eines FLEXes auflisten                     
            0|----------------------------------------------------------------      
h xask       |Abfrage                                    ask                        
h xask       |  Abfrage von Name und Password            ask @                      
h xselect    |  Abfrage mit Auswahlliste                 select                     
h xyes       |  Abfrage yes/no oder no/yes               yesno, noyes               
h xshow      |Abfrageliste im Auswahlfeld zeigen         show prompt                
h xflow      |Ablaufverfolgung (z.B. f. Fehlerdiagnose)  flow                       
h xactivat   |activate [1,2,3,4] : Fokus setzen          activate                   
h xaddform   |addform <dateiname> : Formular hinzuladen  addform <dateiname>        
h xget       |Adresse des Datensatzes N feststellen      get adr N                  
h aiaqs      |aiaqs : Internetdateien quer nutzen        X vks                      
h xcopy      |Aktuellen Satz in den Hintergrund kopieren copy reserve               
h xset=set h |Aktuellen Satz zur History List erg�nzen   set h                      
h xset=set b |Aktuellen Satz zu den Lesezeichen erg�nzen set b                      
h xset=find /|Aktuellen Satz zur Erg.Menge hinzuf�gen    find /                     
h xset=find -|Aktuellen Satz aus Erg.Menge entfernen     find -                     
h xexport    |Akzentvertauschung (wg. Unicode)           export a / A / ai / Ai     
h xansi      |ansi : iV-Inhalt wandeln, ANSI -> ASCII    ansi, ascii                
h xansi      |ANSI-ASCII Codewandlung des iV-Inhalts     ansi, ascii                
h xfile      |ANSI-ASCII Datei-Umwandlung                set c0\file                
            0|Anzeigebefehle (bezogen auf das Anzeigefeld)                          
h xprint     |  Anzeige ausdrucken                       print                      
h xfnam      |  Anzeige Dateiauswahlbox                  fnam <bez>|<typ>           
h xdisplay   |  Anzeige im Anzeigefeld aktualisieren     disp                       
h xshow      |  Anzeige im Auswahlfeld aktualisieren     show                       
h xfile      |  Anzeige speichern als txt oder rtf       file <dateiname>           
h xdisplay   |  Anzeige scrollen zu einer best. Zeile    dis f<num> / dis z<num>    
h xccopy     |  Anzeigefeld: Oben Text dr�bersetzen      cpaste d0                  
h xccopy     |  Anzeigefeld: Unten Text anh�ngen         help +name / cpaste d+     
h xshow      |  Anzeigefeld l�schen                      var ""\show IV             
h xread      |  Anzeigefeld zum Editieren benutzen       file x\read rx             
h xset=set d |  Anzeigefeld auf "big" setzen             set db                     
h xset=set d |                  normal setzen            set dn                     
h xset=set d |     umschalten in den anderen Zustand     set d                      
h xdisplay   |  Anzeigeparameterdatei/Abschnitt durchlaufen  display, deposit       
h xdisplay   |  Anzeigeparameter wechseln                display p <name>           
h xcstring   |Arbeitsverzeichnis-Name                    var W                      
h xset=set W |Arbeitsverzeichnis wechseln                set W <pfadname>           
h xeval      |Arithmetische Ausdr�cke auswerten          eval <rechenbefehl>        
h xarray     |Arrays : gez�hlte Variablen                h xarray                   
h xansi      |ascii : iV-Inhalt wandeln, ASCI -> ANSI    ascii                      
h xhelp      |ASCII- oder ANSI-Datei anzeigen lassen     help <name>                
h xfile      |ASCII-ANSI Datei-Umwandlung                set c1\file                
h xaresqa    |aresqa : Listenfenster                                                
h xaresqa    |  aresqa-Fenster �ffnen, Liste anzeigen      aresqa <dateiname>       
h xset       |  aresqa-Fenster : �berschrift setzen        set a <�berschrift>      
h xif=if A   |Artikelpr�fung (iV beginnt mit Artikel?)   if Art ...                 
h xask       |ask iprompt=Vorgabe  : Frage an Nutzer     ask                        
h xflex      |Aufruf anderer Datenbank (FLEX senden)     flex <name>                
h xexec      |Aufruf eines anderen FLEX                  exec X <dateiname>         
h xmenu      |Aufruf FLEX �ber eigenen Men�punkt         menu                       
h xdisplay   |Ausf�hren ab #-k in Anzeigeparametern      deposit k                  
h xaresqa    |Auswahlmen� anbieten mit aresqa            Aresqa                     
h xview      |Auswahlmen� anbieten mit ViewListe         View                       
h xselect    |Auswahlmen� anbieten mit select            select                     
h xavanti    |avanti-Server: Besonderheiten                                         
h xif        |Bedingungen pr�fen                         if <bedingung> <command>   
h xend       |Beenden des FLEXes                         end                        
h xstop      |Beenden des Programms (ohne R�ckfrage)     STOP                       
h xcstring=cl|Befehlszeile vom Start des Programms       var cl                     
h flex#150   |Beispiele                                  h flex=FLEX-Beispiele      
X gj tricks.htm#54|Berechtigungen des Nutzers pr�fen         Trick 54               
h xerase     |Besen-Funktionen per FLEX ausl�sen         erase ...                  
h xshow=back |Bl�ttern r�ckw�rts (Back-Button)           show <                     
h xshow=forw |Bl�ttern vorw�rts (Forward-Button)         show >                     
h xshow=bookm|Bookmarks anzeigen                         show bookm                 
h xset=set b |Bookmark f�r aktuellen Satz setzen         set b                      
h xundo      |Button [Wechseln]                          undo                       
X gj  tricks.htm#58|Byte f�r Byte Datei verarbeiten            Trick 58             
h xcall      |call programmname : Externprog. starten    call, cAll, Call, CAll     
h xcheck     |check : Datenfeld formal pr�fen            check                      
h xchoose    |choose :  Erg.menge bilden, anzeigen       choose <suchbefehl>        
h xccopy     |Clipboard --> iV / iV --> Clipboard u.a.   cpaste / ccopy             
h xclose     |close ... : Datei u.a. schlie�en           close res / r<num>         
h xansi      |Codeumwandlung ASCII ANSI der iV           ansi, ascii                
h xxcode     |Codeumwandlung mit Tabellen (Import o.a.)  xcode / y a b / p x abc ABC
h xcstring=cl|command line (vom Start des Programms)     var cl                     
h xccopy     |ccopy : iV-Inhalt -> Clipboard             ccopy                      
h xcopy      |copy : Kopie aktueller Satz -> Neusatz     copy                       
h xset=set C |Copy-Verzeichnis setzen (f�r Sicherung)    set C <ordnername>         
h xcpaste    |cpaste : Clipboard -> iV                   cpaste                     
h xcrypt     |crypt : iV-Inhalt verschl�sseln            crypt                      
h xcstring   |cstring = codierte Zeichenfolge            var / wri [cstring]        
h xdate      |date : Datum/Uhrzeit des Tages -> iV       date [4,6,8,17]            
            0|Datei-Befehle                                                         
h xfetch     |  Datei: ein Byte lesen / 2-4 Bytes        fetch b / fet b2, b3, b4   
h xfetch     |  Datei: eine Anzahl Bytes lesen           fetch <number> / ^<code>   
h xget       |  Datei: eine Zeile lesen                  get / get #xyz             
h xfetch=ch r|  Datei: einen Datensatz in iV einlesen    fetch rec                  
h xfetch=ch e|  Datei: Lesen bis zu best. Zeichenfolge   fetch eN                   
h xfsize     |  Datei: Gr��e in Bytes                    fsize <dateiname>          
h xfetch=fetch m|  Datei: Lesezeiger setzen                 fetch m                 
h xfetch=fetch p|  Datei: Lesezeiger-Position               fetch p                 
h endfile.flx|  Datei: Letzte Zeile / Letzte N Bytes     X endfile <name>           
h xftime     |  Datei: Letztes Aktualisierungsdatum      ftime <dateiname>          
h xread      |  Datei e.adt lesen (Erfassungshilfe)      read                       
h xfsize     |  Datei Existenz pr�fen                    fsize <name>\if no ...     
h xread      |  Datei extern.dat lesen                   read extern                
h xhelp      |  Datei ins Anzeigefeld holen              help <dateiname>           
h xfcopy     |  Datei kopieren                           fcopy <name1> <name2>      
h xdelete    |  Datei l�schen                            delete <dateiname>         
h xopen      |  Datei �ffnen zum Lesen mit get / fetch   open <dateiname>           
h xopen      |  Datei �ffnen zum Schreiben mit write     open x <dateiname>         
h xclose     |  Datei schliessen                         close / close x            
h xfile      |  Datei schreiben mit Anzeige als Inhalt   file <dateiname>           
h xrename    |  Datei umbenennen                         rename <name1> <name2>     
X gj  tricks.htm#58|  Datei Byte f�r Byte verarbeiten          Trick 58             
h file.flx   |  Datei zeilenweise verarbeiten            file.flx (Prototyp)        
h xfnam      |Dateiauswahlbox bringen                    fnam <bez>|<typ>           
X gj  tricks.htm#52|Dateien "abklappern" (einzeln bearbeiten)  Trick 52             
h xfnam      |Dateien eines Typs zur Auswahl             fnam |<typ> / fnam ><typ>  
h xdir       |Dateien eines Typs als Liste               dir <typ>                  
h xwrite     |Dateiinhalt in die Ausgabe kopieren        write Ffilename            
h xvar=ble ff|Dateiinhalt in die interne Var. kopieren   var Ffilename              
h xfnam      |Dateiname kurz<->lang umwandeln            fnam S ... / fnam L ...    
h xinput     |Dateinummer f�r Eingabe wechseln           input n                    
h xfetch     |Daten aus Datei einlesen (Text)            fetch / get                
h off        |Daten in Bearb. s.a. -> Offline-Datei                                 
h xshow      |Daten in Bearb. - anzeigen                 show offline               
h xerase     |Daten in Bearb. - l�schen                  erase off                  
h xopen=pipe |Daten lesen von der Ausgabe e. Programms   pipe <progname>            
h xfirst     |Datenbank erster / n�chster / letzter Satz first # / next # / last #  
h xif=if tbl |Datenbank gesperrt? dann ...               if tbl ...                 
h xif=if usr |Datenbank in Benutzung? dann ...           if use ...                 
h xnext=Beisp|Datenbank insgesamt durcharbeiten          first # / next #           
h xexport    |Datenbank insgesamt exportieren            export database            
h xcstring   |Datenbank: Name                            var B                      
            0|Datenfeld --> siehe Kategorie                                         
h xset=set DD|DatenFont und Zeichensatz �ndern           set D<DataFont>=<CharSet>  
h xfind      |Datensatz (erste/letzte Satznummer) laden  find #1 / find #0          
h xnext      |Datensatz (n�chste/vorige Satznummer) laden    next #, prev #         
h xfetch=ch r|Datensatz aus einer Datei in iV einlesen   fetch rec                  
h xread      | ... mit acon: Erster Satz  read filename, weitere mit  read          
X gj  tricks.htm#50|Datensatz in andere Datei "umtopfen"       Trick 50             
h xshow      |Datensatz in der Auswahlliste neu zeigen   sho rec                    
h xcstring   |Datensatz komplett als Text in iV kopieren var kn / var kr            
h xcopy      |Datensatz kopieren: aktueller Satz -> Neusatz   copy                  
h xcopy=py ob|Datensatz kopieren: Objekt 1 -> Objekt 2        copy obj 1 2 / 1>2    
h xfind=f1nd |Datensatz laden ohne Erg.Menge zu bilden   f1nd [<suchbefehl]         
h xload      |Datensatz laden (wechseln) nach choose     load                       
h xerase=e ma|Datensatz leeren (alle Felder l�schen)     erase main                 
h xerase     |Datensatz l�schen                          erase                      
h xnew       |Datensatz neu anlegen (ganz neuen Satz)    new                        
h xset=set re|Datensatz sperren/entsperren (freigeben)   set lock/free              
h xfind=nnn  |Datensatz �ber interne Satznr laden        find #N                    
h xcstring   |Datenverzeichnis: Name                     var D                      
h xdate      |Datum des Tages in iV kopieren             date b                     
h xcstring   |Datum und Uhrzeit;  als interne Variable:  var u / var #dts           
             | ... der Erfassung des aktuellen Satzes    var cn                     
             | ... der letzten �nderung d. akt. Satzes   var ce                     
h xdate      |day/Day +x/-x : Datumsrechnungen           day / Day / Wday           
h xdelete    |delete : Datei l�schen                     delete <dateiname>         
X gj  tricks.htm#65|Dezimal->Hexa Umrechnung (numcon.inc)      Trick 65             
h xdir       |dir : Liste aller Dateien eines Typs in iV dir <typ>                  
h xdisplay   |display ... : Anzeige aktualisieren        disp ...                   
h xiz=z %    |Divisionsrest ausrechnen                   z %N                       
h xdos       |DOS-Fenster �ffnen, Programm ausf�hren     Dos / dos <Befehl>         
h xexport    |Download  siehe -> Export                  export                     
h xprint     |Drucken des Anzeigefeld-Inhalts            print                      
h xshow      |Druckform des Satzes zeigen                show print                 
h xshow      |Druckform der Erg.Menge zeigen             show Print                 
h xprint     |Druckparameter wechseln                    print p <name>             
h xset=set P |Druckseite einrichten                      set P                      
h xacon=echo |echo off : acon Kontrollmeldungen aus      echo off                   
h xcstring   |Eigenschaften feststellen/auswerten        var ... (cstring)          
h help=FLEX-E|Einbettung eines FLEX in Hilfetexte        %=x flex...% oder %=X abc% 
h xask       |Eingabe vom Nutzer abfragen                ask ...                    
h xyes       |Eingabe yes/no oder no/yes                 yesno, noyes               
h xset=set c+|Eingebettete Variablen in RTF: \ verdopp.  set c+/c-                  
h xset=set c |Eingabedaten sind ASCII/ANSI               set c0/c1                  
h xset       |Einstellungen aller Art -> set-Befehle     set / switch               
h xend       |end : FLEX bzw. Job beenden                end                        
h xget=get en|Environment-Variable lesen                 get env <name>             
h xerase     |erase ... : aktuellen Satz etc. l�schen    erase ...                  
            0|Ergebnismengen-Befehle                                                
h xset=find /|  Aktuellen Satz zur Erg.Menge hinzuf�gen  find /                     
h xset=find -|  Aktuellen Satz aus Erg.Menge entfernen   find -                     
h xfind      |  Ergebnismenge bilden ohne Anzeige        find [<suchbefehl>]        
h xFind      |  Erg.menge bilden, anzeigen, FLEX beenden Find [<suchbefehl>]        
h xchoose    |  Erg.menge bilden, anzeigen, iV belegen   choose <suchbefehl>        
X gj  tricks.htm#24|  Erg.menge bilden, aus Satznummern        Trick 24             
h xfind      |  Erg.menge bilden, nur 1. Satz laden      f1nd [<suchbefehl>]        
h xnext=Beispiel 1|  Ergebnismenge durcharbeiten              next / prev           
h xfind=ind &|  Ergebnismenge expandieren (SR-Methode)   find &                     
X gj  tricks.htm#42|  Ergebnismenge dauerhaft aufbewahren      Trick 42             
h xshow      |  Ergebnismenge: Druckform anzeigen        show Print                 
h xfirst     |  Ergebnismenge: erster/letzter Satz       first / last               
h xfind=rnum |  Ergebnismenge: bestimmten Satz laden     find r<num>                
h xset=set Rn|  Ergebnismenge: den Namen �ndern          set R<name>                
h xif=if g   |  Ergebnismenge: Gr��e pr�fen              if gN ... / if lN ....     
h xdisplay   |  Ergebnismenge: Kurzliste in Anzeige kop. display list               
h xexport=d b|  Ergebnismenge: Kurzliste exportieren     export brief               
h xlist      |  Ergebnismenge: Kurzl. ausgeben (acon)    list                       
h xixadd#45  |  Ergebnismenge neu indexieren             ... ixadd ...              
h xfind=snum |  Ergebnismenge reaktivieren               find s<num> / :<name>      
h xclose     |  Ergebnismenge schlie�en/l�schen          close res / r<num>         
h xorder     |  Ergebnismenge sortieren auf-/absteigend  order aP / dP              
h xorder     |  Ergebnismenge sortieren nach Nummern     order n                    
h xsave      |  Ergebnismenge Speichern der �nderungen   save res                   
h xread      |  Ergebnismenge Speichern als Datei        write in / read set ...    
h xfind      |  Ergebnismenge verkn�pfen                 find /.. -.. *..           
h xfind=snum |  Ergebnismenge wieder �ffnen, �ltere      find s<num> / :<name>      
h xshow      |  Ergebnismenge zeigen, im Erg.Fenster     show list                  
h xshow      |  Ergebnismenge zeigen, in Druckform       show List                  
h xfamily    |  Ergebnismenge zur Familie bilden/anzeig. family / Family            
h xcstring=ix|  Satznummern der aktuellen E-Menge ausg.  wri ixk-j                  
h xfind=i,j,k|Ergebnismenge aus Satznummern bilden       find #i,j,k                
h xshow      |Ergebnismengen, Auswahlliste zeigen        show sets                  
h xdisplay   |  Liste der aktuellen E. in die Anzeige    display list               
h xdisplay   |  Liste aller Erg.Mengen in Anzeigefeld    display sets               
h xvar       |Ergibtanweisung f�r iV                     var, write                 
h xtransfe   |                       aus Hintergrundsp   transfer #nnn              
h xinsert    |                f�r #xyz                   insert #xyz                
h xxcode     |Ersetzungen im aktuellen Datensatz         xch _abc_xyz_              
h xxcode     |            in einem Datenfeld             xch *#nnn_abc_xyz_         
h xinsert=rsi|            in der internen Variablen      insert _abc_XYZ_           
X gj  tricks.htm#48|             an bestimmter Position        Trick 48             
h xfirst=t su|Erster hierarchischer Untersatz            first sub                  
h xfirst     |Erster Satz der aktuellen Erg.Menge        first                      
h xeval      |eval ... : Rechenbefehl auswerten          eval <rechenbefehl>        
h xexec      |exec ... : Anderen FLEX starten            exec X <dateiname>         
h xfsize     |Existenz einer Datei pr�fen                fsize <name>\if no ...     
h xfind=ind &|Expansion der aktuellen Erg.Mengef         find &                     
h xset=set Xc|Expansionsmodus f�r die Suchbefehle setzen set X0/1/2                 
h xexport    |export ... : Exportbefehle (Datenausgabe)  export ...                 
h xexport    |Export: Ausgabedatei festlegen oder �ndern export f <name>            
h xclose=se x|Export: Ausgabedatei schlie�en             close x                    
h xexport    |Export: Parameterdatei laden               export p <name>            
h xexport    |Export: Parametertabelle hinzuladen        export t <name>            
h sort=B. Exp|Exportieren einer Grund- oder Externdatei  h sort                     
h xexport    |Exportieren Ergebnismenge                  export set                 
h xexport    |Exportieren Gesamte Datenbank              export database            
h xexport    |Exportieren Satz (via Exportparameter)     export                     
h xexport    |                 (via PrintParameter)      Export                     
h xexport    |                 samt verkn�pften          export fam                 
h xexport=oo |Exportieren: Kopf-/Fussabschnitt ausf�hren export Head/Foot           
h xexport    |Exportieren der ViewListe                  export view                
h xextern    |extern : aktuellen Satzes extern editieren extern                     
h exflex.txt |Extern einen FLEX starten (ExFLEX)         flex.exe                   
h xread      |Externdatei einlesen (avanti) Typ .ADT     read <file> / read         
h xsrx=Beispiel 5|Externdatei verarbeiten und exportieren    perform expi           
h xread=ad se|Externe Ergebnismenge einlesen             read set <dateiname>       
h xextern    |Externes Editieren des aktuellen Satzes    extern                     
h xfind=f1nd |f1nd ... : Suchbefehl ohne Erg.Menge       f1nd [<suchbefehl]         
h xfamily    |family : Verkn�pfte S�tze als Erg.Menge    family / Family            
h xfcopy     |fcopy ... : Datei kopieren                 fcopy <name1> <name2>      
h xavanti=echo|Fehlermeldungen aus/ein (avanti)           echo off / echo on        
h xcstring   |Fehlermeldungstext ausgeben                var Err / wri Err          
h xset       |Fehlermeldungstext und -zustand r�cksetzen set Err                    
h xif        |Fehlerpr�fungen a99                        if ...                     
h xavanti#112|Fehlerpr�fungen avanti                     if error=...               
            0|Feld (Datenfeld) --> Kategorie                                        
h xactivat   |Fenster in den Vordergrund bringen         activate                   
h xset=set w |Fenster auf Normal- / Maximalgr��e setzen  set wn / wm                
h xget=get I |Fernzugriff auf Dateien im Internet        get I <url>                
h xfetch     |fetch : Daten aus Datei einlesen           fetch                      
h xfile      |file ... : Anzeige als Datei speichern     file <dateiname>           
X gj  tricks.htm#57|Filtern: Datei verarbeiten ohne Umcodierung  Trick 57           
h xfind      |find ... : Erg.Menge bilden                find [<suchbefehl]         
h xfind=f1nd |Find-Befehl ohne Erg.Menge zu bilden       f1nd [<suchbefehl]         
h xbutton    |Find-Men� �ffnen                           button f                   
h xfirst     |first ... : Erster Satz ...                first ...                  
X gj  tricks.htm#51|Flags verwenden, Werte vorbesetzen         Trick 51             
h xflex      |flex ... : Befehl an andere Datenbank      flex <name>                
X gj  tricks.htm#64|FLEX als Programmiersprache ohne Datenbank?   Trick 64          
h xend       |FLEX beenden                               end                        
h xflex      |FLEX senden an anderes a99                 flex <dateiname>           
h xflip      |flip ... : Flip-Buttons belegen            flip ixyz                  
h onflips.flx|Flip-Buttons, rechte Maustaste             onflips.flx                
h help=Flip-E|Flip-Einbettung in Hilfetexte                                         
h xset=set f |Flips mit Einzel- bzw. Doppelklick aktiv.  set f1 / set f2            
X gj  tricks.htm#70|Flips per FLEX erzeugen (in der Anzeige)   Trick 70             
X gj  tricks.htm#35|Flips, gleichlautende, im Anzeigefeld      Trick 35             
h xflow      |flow : Ablaufverfolgung des FLEXes         flow                       
h xfnam      |fnam ... : Verzeichnisliste erzeugen       fnam >.<typ>               
h xactivat   |Fokus in ein bestimmtes Feld setzen        activate i (1,2,3,4)       
h xform      |form ... : Formular anzeigen               form i / form <name>       
h xaddform   |Formulare hinzuladen                       addform <dateiname>        
h xset=set F |Formularmodus direkt / indirekt            set F1 / set F0            
h xask       |Frage an den Nutzer stellen                ask ...                    
h xyes       |   Ja/Nein-Frage                           yesno ...                  
h xfreevar=Sup|Freie Variablen                            $-Variablen               
h fleximp    |Fremddaten per FLEX umwandeln              h fleximp / zc.flx         
h xfsize     |fsize ... : Existenz einer Datei pr�fen    fsize <name>\if no ...     
h xftime     |ftime ... : Datei-Aktualisierungsdatum     ftime <dateiname>          
h xcstring=JR|F�hrende Nullen (iV links auff�llen)       var JR0 (vorher z=i)       
h xset=set cf|F�llzeichen-Anzahl setzen                  set cf<anzahl>             
h flex=onf2  |Funktionstasten mit FLEXen belegen         onf2.flx usw.              
h xif=if diff|Ge�nderter Satz? dann ...                  if diff ...                
h xif=if dele|Gel�schter Satz? dann ...                  if deleted ...             
h xif=if Lock|Gesperrter Satz? dann ...                  if Lock ...                
h xnext=Beisp|Gesamte Datenbank durcharbeiten            first # / next #           
h xcstring   |Gesamtzahl der Datens�tze in der D.bank    var t                      
h xget       |get : Zeilenweise aus Datei lesen          get                        
h xget       |get Iurl : Datei per Internet holen        get Iurl                   
h xxcode     |Globale Ersetzungen in Datens�tzen         xchange _abc_xyz_          
h xxcode=xcode cl|Gro�buchstaben in kleine wandeln           xcode clower           
h xread      |Grunddatei einlesen (avanti)               read <file> / read         
h sort=B. Exp|Grunddatei sortieren und Exportieren       h sort                     
h xsrx=Beispiel 5|Grunddatei verarbeiten und exportieren     perform expi           
h xhelp      |help ... : Hilfetext anzeigen lassen       help <dateiname>           
X gj  tricks.htm#65|Hexa->Dezimal Umrechnung (numcon.inc)      Trick 65             
h xif=if hier|Hierarchischer Satz? dann ...              if hiera ...               
h xfirst=t su|Hierarchischer Satz, erster Untersatz      first sub                  
h xnext=t sub|Hierarchischer Satz, n�chster Untersatz    next sub                   
h xsub       |Hierarchischen Untersatz anw�hlen          sub #01 nnn                
h xerase     |Hierarchischen Untersatz l�schen           erase sub                  
h xhelp      |Hilfetext anzeigen lassen                  help <dateiname>           
h xshow      |Hintergrundspeicher im Auswahlfeld zeigen  sho reserve                
h xdisplay   |Hintergrundspeicher in die Anzeige kopier. display reserve            
h xinsert    |Hintergrundvariable #uxy l�schen           var ""\ins #uxy            
h xinsert    |                    alle #uxy l�schen      var ""\ins #ux~            
h xtransfe   |                    kopieren               transfer #nnn              
h xshow=vorhe|History List anzeigen                      show hist                  
h xjanas     |HTML-Datei zeigen (Zusatzprogr. JanaS)     janas <dateiname>          
h xisbn      |hyphen : ISBN/ISSN: Bindestriche einsetzen hyphen                     
h nummer     |Identnummern vergeben per FLEX             nextnum.flx                
h xif        |if ... : Bedingungspr�fungen               if ...                     
h xif        |if not ... : negative Bedingungspr�fung    if not ...                 
h fleximp    |Importieren mit FLEX                                                  
h xinclude   |include ... : Datei hinzuladen             include <dateiname>        
             |Index ... s.a. -> Register                                            
h xindex     |index ... : Indexfenster �ffnen            index i abc                
X gj  tricks.htm#63|Index sofort beim Start erscheinen lassen  Trick 63             
h xixadd     |Indexeintr�ge einf�gen/l�schen             ixadd / ixdel              
h xqrix      |Indexeintr�ge einlesen/pr�fen              qrix n |1 xyz              
X gj  tricks.htm#67|Indexeintr�ge schnell z�hlen (Bereich)     Trick 67             
h xindex     |Indexfenster �ffnen                        index i abc                
h xactivat   |Indexfenster schlie�en                     act 1                      
h xindex     |Indexparameterdatei laden                  index p name               
h xcstring   |INI-Datei: Name                            var V                      
h xinput     |input : Dateinummer f�r Eingabe wechseln   input n                    
h xinsert    |insert ... : iV-Inhalt in ... kopieren     insert #nnn/$xyz/&abc ...  
h xvar       |Interne Variable (iV) anlegen              var <cstring>              
h xinsert    |   iV in #nnn kopieren                     insert #nnn                
h xshow      |   iV ins Anzeigefeld schreiben/anh�ngen   show IV/show +IV           
h xshow      |   iV im Schreibfeld anzeigen              show iV                    
h xshow      |   iV in der Befehlszeile anzeigen         show cmd                   
h xshow      |   iV bin�r anzeigen (Steuerzeichen rot)   show Bin                   
h xvar=M-Befe|   Inhalt manipulieren                     var (M-Befehle)            
h xcstring=Jd|   Inhalt in dezimale Codes wandeln        var ... Jd                 
h xcstring=Jl|   L�nge feststellen                       var ... Jl                 
h xinsert=Lokale|   Lokale Ersetzung in der iV              insert _abc_XYZ_        
h xcstring   |   Sondervariablen, Liste                  h xcstring                 
h xcstring   |   Sondervariablen, Liste                  h xcstring                 
h vb223      |   Zweite interne Variable $  (iV2)        Vb.223                     
h xiz        |Interne Zahl (iZ) f�r Berechnungen         Z= + - / X  /  var Z       
h xiz        |Interner Z�hler, z.B. f�r Schleifen        z= + -  / var z            
h xget       |Internetdatei komplett in iV holen         get I <url>                
h xopen      |Internetdatei �ffnen zum Lesen als Datei   open <url>                 
h xfetch     |   ... blockweise Daten daraus lesen       fetch <number>             
h xisbn      |ISBN/ISSN: Bindestriche einsetzen          hyphen                     
h xisbn      |      Ist der iV-Inhalt eine ISBN/ISSN?    if b <befehl>              
h xvar       |iV : siehe interne Variable                var <cstring>              
h xixadd     |ixadd/ixdel : Indexeintr. einf�gen/l�schen ixadd / ixdel              
h xyes       |Ja/Nein/Abbruch-Frage an den Nutzer        yesno, noyes               
h xjanas     |JanaS-Zusatzprogramm starten (Browser)     janas <dateiname>          
h xjanas     |                     stoppen               janas 0                    
h xjump      |jump ... : Sprung zu einer Marke :label    jump label                 
X gj  tricks.htm#25|Kalenderfunktion im FLEX nutzen            Trick 25             
h xsonder=tzu|Kategorie bearbeiten (lokale Ersetzung)    *#nnn_abc_xyz_             
h xinsert    |Kategorie einf�gen                         ins #nnn                   
h xsonder    |Kategorie direkt einf�gen                  #nnn Text                  
h xcheck     |Kategorie formal pr�fen                    check                      
X gj  tricks.htm#56|Kategorie intern sortieren                 Trick 56             
X gj  tricks.htm#69|Kategorie manuell sinnvoll mit Maus ordnen Trick 69             
h xinsert    |Kategorie l�schen                          var ""\ins #nnn            
h xtransfe   |Kategorie aus Hintergrund holen            transfer #nnn              
h xkatlist   |Kategorieliste (CFG) -> katlist.asy        katlist                    
h xshow      |Kategorieliste (erlaubte Felder) zeigen    show cfg                   
X gj  tricks.htm#43|Kategorien #nnx alle durcharbeiten         Trick 46             
h xcheck     |Kategorinummer zul�ssig?                   check                      
h xkeychk    |keycheck ... : Schleife manuell abbrechen  keychk \ if yes ...        
h xxcode=xcode cl|Kleinbuchstaben in gro�e wandeln           xcode cupper           
h xzzz       |Kommentar (in FLEX-Datei)                  Leerzeichen am Zeilenanfang
h xshow      |Kurzliste Erg.Menge ins Anzeigefenster     show list                  
h xexport    |Kurzliste Erg.Menge in die Ausgabedatei    exp brief                  
h xlist      |Kurzliste mit Satznummern ausgeben (acon)  list int / list recnum     
h xnext      |Kurzzeile des n�chsten Satzes holen        next r                     
h xcstring   |Label zu einer Feldnummer feststellen      var J                      
h xcstring=jb|L�nge des aktuellen Datensatzes in Byte    var jb / jf                
h xcstring=Jl|L�nge der aktuellen iV feststellen         var Jl                     
X gj  tricks.htm#47|L�ngsten/k�rzesten Satz finden             Trick 47             
h xlast      |last ... : Letzter Satz ...                last ...                   
X gj  tricks.htm#68|Laufwerk K: vorhanden?                     Trick 68             
h xspaces    |Leerzeichen, mehrfache in der iV l�schen   spaces                     
h xshow=bookm|Lesezeichen alle anzeigen                  show bookm                 
h xerase     |Lesezeichen alle l�schen (wie mit Besen)   erase bookm                
h xset=set b |Lesezeichen f�r aktuellen Satz setzen      set b                      
X gj  tricks.htm#72|Letzte Zeile einer Datei holen             Trick 72             
h xdir       |Liste aller Dateien eines Typs in iV       dir <typ>                  
h xdisplay   |Liste aller Erg.Mengen in Anzeige kopieren display sets               
h xaresqa    |Listendatei anzeigen+bearbeiten            aresqa <dateiname>         
h xfind      |LOG-Datei: letzte nnn Bytes als Erg.Menge  find $nnn\sho list         
h xset=set S0|LOG-Datei: spezielle, zum Testen           set S0/S1                  
h xerase     |L�schen des aktuellen Satzes               erase                      
h xdelete    |L�schen einer Datei                        del <dateiname>            
h xerase     |L�schen der "Daten in Bearb."              erase off                  
h xclose     |L�schen einer Ergebnismenge                close res / r<num>         
h xset=set Lo|Logging ein-/ausschalten                   set Logging on/off         
h xinsert=Lokale|Lokale Ersetzung in der int. Variablen     insert _abc_XYZ_        
h xcstring   |Manipulationsbefehle f�r die int.Variable  var #xyz(...)              
h mbtest     |   Beispiele zum Ausprobieren              h mbtest                   
h xset=set Z |Maximal abzuarbeitende Anzahl Befehlszeilen   set Z<anzahl>           
h xmenu      |menu ... : eigener Hauptmen�punkt          menu ...                   
h xset=set Bi-|Men�punkt unwirksam (grau) machen          set Bi-                   
h xmessage   |message ... : Botschaft an den Nutzer      message botschaft          
h xmessage   |Mitteilung anzeigen (mit [OK]-Button)      message botschaft          
h xmessage   |   mit Warndreieck                         message !botschaft         
h xmessage   |   fuer n Sekunden (ohne OK)               Message n,botschaft        
h xmessage   |   2- oder mehrzeilige Meldung             var "abc" n "xyz"\mes      
h xmkdir     |mkdir ... : Ordner neu anlegen             mkdir <pfadname>           
h xnext=t sub|N�chster hierarchischer Untersatz          next sub                   
h xnext      |N�chster Satz der aktuellen Erg.Menge      next                       
h xyes       |Nein/Ja/Abbruch-Frage an den Nutzer        noyes                      
h xcstring   |Nichtsortierw�rter beseitigen              var #xyz(u)                
h xif=if Arti|Nichtsortierzeichen pr�fen / setzen        if Artic / if ARtic        
h xnew       |new : Neuen Satz anlegen                   new                        
h xnext      |next : Datensatz (n�chste Nr.) laden       next / next #              
h xyes       |No/Yes/Cancel-Frage an den Nutzer          noyes / yesno              
h xset       |nop (no operation)                         set  [ohne Argument]       
h xextern    |Notepad zum Bearbeiten von Daten nehmen    notepad.flx                
h nummer     |Nummernvergabe                             nextnum.flx                
h xcopy=py ob|Objekt 1 / 2: S�tze ineinander kopieren    copy obj 1 2 / 1>2         
X gj  tricks.htm#43|Objekt 2: zweiter Datensatz nebenbei       Trick 43             
h xshow      |Offline-Datei anzeigen                     show offline               
h xcstring=oq|Offline-Datei: lfd. Nr. des akt. Satzes    var oq                     
h xset=get q |Offline-Datei: Satz n hervorholen          get qn                     
h xfirst=off |Offline-Datei: erster/letzter Satz         first off/last off         
h xerase     |Offline-Datei l�schen                      erase off                  
X gj  tricks.htm#66|Offline-Speicher genau untersuchen         Trick 66             
h flex=On-FLEX|On-FLEXe (Ausl�sung bei bestimmten Buttons und Funktionen)           
h xopen      |open [x] ... :  Datei �ffnen               open [x] <dateiname>       
h xorder     |order ... Ordnen der Ergebnismenge         order aP / dP              
h xorder     |Ordnen der Ergebnismenge nach Satznummern  order n                    
             |Ordner  siehe -> Verzeichnis                                          
X gj  tricks.htm#56|Ordnung schaffen im Datenfeld              Trick 56             
h xperform   |Osterdatum ausrechnen                      perform gauss              
h xget=get x |Param.datei Zeile lesen, Komm. kennzeichn. get x                      
h xask       |Passwort abfragen (Eingabe nicht sichtbar) ask @                      
h xperform   |perform ... : Unterprogramm aufrufen       perform <label>            
h xsleep=slic|Periodische Aktion programmieren           slice n=mFLEX              
h vb258#288  |Persistente (sitzungs�bergreifende) Daten  &-Variablen                
h xphrase    |phrase ... : Phrase belegen / verwenden    phrase i text              
h xget       |Phrasendatei einlesen                      get phr <name>             
h xsave      |Phrasendatei speichern                     save phr <name>            
h xcstring   |Phrasendatei: Name                         var v                      
h xshow      |Phrasenliste anzeigen                      show phras                 
h xget=get pi|PID = Process Identifier in iV kopieren    get pid  oder  var pid     
h xopen=pipe |pipe : Programm starten u. Ausgabe lesen   pipe <progname>            
h xcstring=jp|Position des Datensatzes in der Datei      var jp                     
X gj  tricks.htm#48|Positionsabh�ngige Ersetzung von Zeichen   Trick 48             
h xprev      |prev : Datensatz (vorige Nr.) laden        prev / prev #              
x var p\mes  |Prim�rschl�ssel des Satzes anzeigen        x var p\mes                
h xset       |Prim�rschl�ssel f�r update �ndern          set pX                     
h xprint     |print : Anzeige-Inhalt ausdrucken          print                      
h xcall      |Programm starten (anderes)                 call, cAll, Call, CAll     
h xcall      |   call: Hauptprogramm wartet auf Beendung                            
h xcall      |   Call: unabh�ngiges Fenster              auch: Dos                  
h xcall      |   cAll: l�uft nur in der Taskleiste (nicht sichtbar) auch: dos       
h xstop      |Programm stoppen (abrupt ohne Frage)       STOP                       
h xcstring   |Programmverzeichnis: Name                  var P                      
h xxcode=p x |Protypen-Ersetzung beim Import             p x abc ABC / xcode y      
h xcstring   |Prozessnummer ermitteln                    var pid  oder  get pid     
h xput       |put : Speichern mit R�ckfrage              Put, Put new               
h flex=G.  PV|PV-FLEX: Validierung des Datensatzes vor dem Speichern                
h xqrix      |qrix ... : Indexzeilen einlesen/pr�fen     qrix n |1 xyz              
h xread      |read : Datensatz aus Datei einlesen        read                       
h xeval      |Rechnen: arithmetische Ausdr�cke berechnen eval <rechenbefehl>        
h xiz        |Rechnen: interne Zahl bzw. Z�hler          Z=+-/*  /  z=+-/*%         
X gj  tricks.htm#54|Rechte des Nutzers pr�fen                  Trick 54             
h xcstring=rechtsb|rechtsb�ndiges Feld fester L�nge           var #nnn(0,r20)       
             |Register : Der "Index" enth�lt mehrere Register                       
h xindex     |Register aufbl�ttern                       ?, index |i abc            
h xqrix      |Registerabschnitt einlesen/exportieren     qrix, Qrix                 
X gj  tricks.htm#77|Register-Abschnitts-Kopie (RAK)            Trick 77             
h xshow= keys|Registereintr�ge d.aktuellen Satzes zeigen show keys                  
h xcstring=sk|              -- in die iV kopieren        var sK                     
h xixadd     |Registereintr�ge einf�gen/l�schen          ixadd / ixdel              
h xqrix      |Registereintr�ge einlesen/pr�fen           qrix n |1 xyz              
h xsrx       |Regul�ren Ausdruck im iV-Text suchen       srx / srX                  
h xrename    |rename ... :  Datei umbenennen             rename <name1> <name2>     
             |Reservespeicher: siehe -> Hintergrundspeicher                         
h xreturn    |return : Unterprogramm beenden             return                     
h xnew       |Satz  siehe --> Datensatz                                             
h xset=set recn|Satznummer �ndern [nur avanti]             set recn                 
h xcstring=ix|Satznummern der aktuellen E-Menge ausgeben wri ixk-j                  
h xread=ad se|Satznummernliste als Erg.Menge einlesen    read set <name>            
h xsave      |save ... : Speichern bestimmter S�tze      save edit                  
h xfind=ind &|Schiller-R�uber-Expansion der Erg.Menge    find &                     
h xrepeat    |Schleife                                   if ... jump / repeat       
h xiz=Beispiel 4|Schleife mit Z�hler                        if z<...                
h xkeychk    |Schleife abbrechen durch Taste [Esc]       keychk \ if yes ...        
X gj  tricks.htm#60|Schleifen, alles �ber ... in FLEX          Trick 60             
h xshow      |Schl�ssel des aktuellen Satzes zeigen      show keys                  
h xwrite     |Schreiben in Export-Ausgabedatei           write <cstring>            
h xvar       |Schreiben in iV  (interne Variable)        var <cstring>              
X gj  tricks.htm#54|Schreibrecht des Nutzers pr�fen            Trick 54             
h xselect    |select : Auswahlliste anbieten             select                     
h xset       |set ... : Eigenschaften/Einstellungen      set ...                    
h xset=set d | Anzeigefeld-Gr��e                         set d/dn/db                
h xset=set W | Arbeitsverzeichnis-Name setzen            set W <pfadname>           
h xset=set a | aresqa-�berschrift                        set a<titel>               
h xset=set b | Bookmark                                  set b                      
h xset=set c | Eingabedaten sind ASCII/ANSI              set c0/c1                  
h xset=set n | Dateinummer f�r neue S�tze                set n                      
h xset=set DD| DatenFont und Zeichensatz �ndern          set D<DataFont>=<CharSet>  
h xset=set P | Druckseite einrichten                     set P                      
h xset=set e0| Editor-Fehlermeldungen aus/ein            set e0/e1                  
h xset=set en| Environmentvariable setzen                set env name=value         
h xset=set Rn| Ergebnismenge: den Namen �ndern           set R<name>                
h xset=set wm| Fenster auf maximale/normale Gr��e setzen set wm/wn                  
h xset=set h | History List: aktuellen Satz anh�ngen     set h                      
h xset=set i | Kopfzeilen des Kurzanzeigefensters        set iZtext                 
h xset=set L | Kopiermodus Index->Eingabe (1=klein->gro�)set L0/L1                  
h xset=set Bi-| Men�punkt unwirksam (grau) machen         set Bi- (i=UIF-Nr.)       
h xset=set pX| Prim�rschl�ssel f�r Update ist bei #-X    set pX                     
h xset=set o | Sortier-Modus und -Position �ndern        set oMP                    
h xset=set re| Satz blockieren (sperren) / freigeben     set rec loc/fre            
h xset=set d | Schriftgr��en�nderung im Anzeigefeld      set d+/d-                  
h xset=set I0| Selektiermodus in Eingabefeldern          set I0/I1                  
h xset=set C | Sicherungskopie: Name des Ordners         set C <ordnername>         
h xset=set N0| Speichermodus fi�r neue Datens�tze        set N0/N1/N2               
h xset=set t | TBL blockieren (sperren) / freigeben      set tbl loc/fre            
h xset=set M | Temp-Verzeichnis                          set M <name>               
h xset=set u | UpdateModus setzen                        set uxyz                   
h xset=set Ti| Zeitstempelung ein/aus  (beim Speichern)  set Timestamp on/off       
h xshow      |show ... : Anzeigen bestimmter Dinge       show ...                   
h xfreevar=Sup|Sitzungs�bergreifende Variablen            $-Variablen               
h xsleep=slic|sleep ... : Timerfunktionen                sleep / slice n=mFLEX      
h xsonder    |Sonderbefehle                              h xsonder                  
h xcstring   |Sondervariablen f�r 'var' und 'write'      h xcstring                 
h xsort      |Sortieren im Arbeitsspeicher (iV-Inhalt)   sort a/d<pos>              
X gj  tricks.htm#56|Sortieren im Datenfeld                     Trick 56             
h sort       |Sortieren von Dateien                      h sort                     
h xorder     |Sortieren der Ergebnismenge                order a/d<pos>             
h xspaces    |spaces : Mehrfach-Leerzeichen beseitigen   spaces                     
X gj  tricks.htm#41|Spaltenrichtiges Ausgeben von Daten        Trick 41             
h xset=set S0|Special Logging, zum Testen beim Speichern set S0/S1                  
h xput       |Speichern mit R�ckfrage                    Put, Put new               
h xput       |Speichern ohne R�ckfrage                   put, put new               
h xput=put un|Speichern, auch wenn Satz gesperrt         put unlock                 
h xput=put fr|Speichern, auch wenn .TBL gesperrt         put free                   
h xsave      |Speichern aller neuen/ge�nderten S�tze     save edit                  
h xsave      |Speichern aller ge�nd.S�tze der Erg.Menge  save result                
h xsave      |Speichern aller Offline-S�tze              save off                   
h xset=set t |Sperren der ges. Datenb. gegen Schreiben   set tbl loc/fre            
h xset=set re|Sperren/Entsperren eines Datensatzes       set rec loc/fre            
h xjump      |Sprung zu einer Marke :label               jump label                 
h xsrx       |srx ... : Regul�ren Ausdruck in iV suchen  srx / srX                  
h xset=set ai|Stammsatznummern durch Klartext ersetzen   set ai                     
h flex=_start|Start-FLEX: Sofort beim Start auszuf�hren  _start.flx                 
h xshow=h  st|Status anzeigen (iV im Statusfeld)         show Stat                  
h xcstring   |Statusfeld-Inhalt in iV kopieren           var st                     
h xstop      |STOP : Abrupten Programmabbruch erzwingen  STOP                       
h xif=if Stop|Stoppwortpr�fung (iV = Stoppwort)          if Stop ...                
h xsub       |sub ... : Hierarchischen Untersatz finden  sub #01 nnn                
h xhelp=suchw|Suchen im Anzeigefeld                      help =abc / help >abc      
h xxcode     |Suchen und Ersetzen im Datensatz           xchange _abc_xyz_          
h summe.flx  |Summierung von Feldinhalten einer Erg.Menge: summe.flx                
h flex=flexe f|System-FLEXe, z.B. _door.flx, _start.flx                             
h xaresqa    |Tabellendatei anzeigen+bearbeiten          aresqa <dateiname>         
h xxcode     |Tabellengesteuerte Umwandlung von Zeichen  xcode / y a b / p x abc ABC
h xkeychk    |Taste gedr�ckt? Esc-Taste                  keychk \ if yes ...        
h xkeychk    |Taste gedr�ckt? (irgendein Buchstabe)      keychk x \ if "a" ...      
h xinsert    |Teilfeld einf�gen                          ins $s-#nnn / ins $s+#nnn  
h xsonder    |Teilfeld direkt einf�gen                   $s-#nnn / $s+#nnn          
h xfetch     |Text einlesen ohne Steuerzeichen           fetch ^T / ^A              
h xsleep=slic|Timer setzen (regelm��ige autom. Aktion)   slice n=mFLEX              
h xkeychk    |Tastatur abfragen: wurde [Esc] gedr�ckt?   keychk \ if yes ...        
h xkeychk    |Tastatur abfragen: wurde a/b/c... gedr.?   keychk x\if "a" ...        
h xinsert    |Teilfeld einf�gen / l�schen                insert $a-#xyz             
h xcstring=M |TEMP-Verzeichnis: Name                     var M                      
h set=set M  |TEMP-Verzeichnis: den Namen �ndern         set M <name>               
h xcstring   |Titel der Datenbank (Kopfzeile)            var T                      
h xtransfe   |transfer ... : Hintergrund-Feld kopieren   transfer #nnn              
h xset=set i |�berschriften der Kurzanzeige setzen       set iZtext                 
h xcstring=ui|UIF-Zeile ausgeben                         var ci (0<i<500)           
h xset=set Bp|UIF-Zeile ver�ndern                        set BiText (0<i<500)       
h xget=get en|Umgebungsvariable lesen/setzen             get env <name> / set env ..
h xansi      |Umcodieren des iV-Textes ASCI<->ANSI       xansi                      
h xxcode     |Umcodieren des iV-Textes mit Codetabellen  xcode a b / xcode y        
h xxcode=B2. |Umcodieren des iV-Textes UTF-8 -> ASCII    xcode u                    
h xset=set xa|Umcodiermodus f�r die Suche mit srx setzen set xab                    
X gj  tricks.htm#36|Umcodierung testen                         Trick 36             
h umindex.flx|Umindexieren im laufenden Betrieb          umindex.flx                
X gj  tricks.htm#65|Umrechnungen zwischen Zahlsystemen         Trick 65             
h xset       |Umschalten der Ausgabe-Codierung (avanti)  switch coding 1 / 2        
h xset       |Umschalten zw. Erg.Menge/Familie (avanti)  switch fam / res           
h xset=ch dow|Umschalten zw. Exp. 1 und Exp. 2 (avanti)  switch dow 1 / 2           
h xset=object|Umschalten zw. Satz 1 und Satz 2           switch object 1 / 2        
h xundo      |undo : Button [Wechseln] ausl�sen          undo                       
h xset=set U1|Unicode-Modus f�r insert ein/aus           set U1 / U2 / U0           
h xexport    |Unicode-Modus f�r write ein/aus            exp wX / exp w0            
h xxcode=B2. |Unicode->Interncode Umcodierung der iV     xcode u                    
h xxcode=B2. |       ->Entit�tencode f. RTF oder HTML    xcode U<vor nach>          
X utf8edit   |Unicode-Notepad [falls intern UTF-8!]      X utf8edit                 
h xsleep     |Unterbrechung der Bearbeitung f�r 1 Sek.   sleep 1000                 
             |Unterfeld  siehe -> Teilfeld                                          
h xperform   |Unterprogramm aufrufen                     perform <label>            
h xreturn    |              beenden                      return                     
h xsub       |Untersatz: siehe -> Hierarchischer U.      sub #01 nnn                
h xif=if sub |           siehe -> Verkn�pfter U.         if sub                     
h xupdate    |Upload (neue Daten einspeisen)             upload <dateiname>         
h xset=set u |Update-Modus setzen                        set u<xyz>                 
h xset=set p |        Prim�rschl�ssel bei #-X bilden     set pX                     
h xupdate    |update ... : Update-Vorgang starten        update <dateiname>         
h update     |        �bersicht zum Thema Update         h update                   
             |UTF-8 -> Unicode                                                      
h xvar       |var ... : iV-Inhalt setzen                 var [cstring]              
h xiv        |Variable, interne                          h xiv / h xiz              
h xset=set ai|V14-Ersetzung (Stammsatznr. durch Text)    set ai                     
h xif=if v14 |V14-Ersetzungen: hat diese Db welche?      if v14 ...                 
h xif=if fam |Verkn�pfter Satz? dann ...                 if fam ...                 
h xif=if main|  ...  Hauptsatz? dann ...                 if main...                 
h xif=if sub |  ...  Untersatz? dann ...                 if sub ...                 
X gj  tricks.htm#31|Verschachtelung (FLEX aus FLEX aufrufen)   Trick 31             
h xcrypt     |Verschl�sseln des iV-Inhalts               crypt                      
h xshow=about|Version anzeigen                           sho ab / var m             
X gj  tricks.htm#45|Versionskontrolle (ist es die richtige?)   Trick 45             
h xmkdir     |Verzeichnis (Pfadname) neu anlegen         mkdir <pfadname>           
h xset=set C |Verzeichnis setzen f�r Datenbank-Kopie     set C                      
X gj  tricks.htm#68|Verzeichnis xyz vorhanden?                 Trick 68             
h xfnam      |Verzeichnisliste erzeugen                  fnam >.<typ>               
h xfnam=Sonde|Verzeichnisse zur Auswahl anbieten         fnam |.<typ>               
h xview      |view ... : Viewliste �ffnen / +anzeigen    view / View                
h xfirst=first view|Viewliste per FLEX durcharbeiten           first view/next view 
h xclose     |Viewliste schlie�en                        close view                 
h xset=set v |Viewliste: L�schen von Zeilen erlauben     set v1                     
h xset=save v|Viewliste: Zeilen �ndern                   save view <zeilennr>       
h xset=set i |Viewlisten-�berschriftszeilen setzen       set iZtext                 
h xset=set wm /|Vollbildmodus ein-/ausschalten             set wm / set wn          
h xif=if _   |Volltextvergleich im aktuellen Datensatz   if _xyz_ ...               
h xfind=_xyz_|Volltextsuche im akt. Satz mit Umcodierung find _xyz_                 
h xfind=find +|Volltextsuche in der akt. Ergebnismenge    find +xyz                 
h xfind=find +|   feldspezifische Suche in der Erg.Menge  find +#nnn,xyz            
h xsrx       |Volltextsuche mit regul�ren Ausdr�cken     srx <sucbegriff>           
h commd=Von/Bis|Von/Bis-Suche mit find-Befehl              find key A---B           
h xqrix=qrix db|Von/Bis-Registerliste mit qrix-Befehl      qrix key A---B           
X gj  tricks.htm#51|Vorbesetzung von Variablen, Flags          Trick 51             
h xshow=vorhe|Vorher angezeigte Daten neu anzeigen       show hist                  
X gj  tricks.htm#71|W�hrungen umrechnen                        Trick 71             
h xsleep     |Warten 1 sec                               sleep 1000                 
h xdate=Wday |Wday : Arbeitstage-Datumsrechnungen        Wday +x/-x                 
h xjanas     |Web-Browser starten (Programm JanaS)       janas 1                    
h xget=get I u|Web-Service nutzen                         get I url                 
h xvar       |Wertzuweisung f�r interne Variable         var [cstring]              
h xtransfe   |                     aus Hintergrundsp.    transfer #nnn              
h xinsert    |              f�r #xyz                     insert #xyz                
h flexw      |Wichtigste Befehle zum Ausprobieren        h flexw                    
h xdate=day  |Wochentage ausrechnen                      Day                        
h xwrite     |write ... : Schreiben in die Ausgabedatei  h write <cstring>          
h xxcode     |xchange ... : Ersetzungen im Satz          xch _abc_xyz_              
h xxcode     |xcode ... : Umcodierung via Tabellen       xcode ab / xcode y         
h xxml       |xml ... : XML-Ausgabe eines Datensatzes    xml 0/1/2/3                
h vb212      |XML-Daten einlesen                         fetch e                    
h xyes       |Yes/No/Cancel-Frage an den Nutzer          yesno, noyes               
h fleximp    |Z39.50-Client-Funktion: Fremddaten holen   zc.flx                     
h xiz        |Zahl setzen  (iV -> interne Zahl)          =                          
h xiz        |Zahl berechnen (iZ  +-/*  iV)              + - / X                    
h xcstring=Jd|Zeichen in iV durch Dezimalzahlen ersetzen var ... Jd                 
h xset=set DD|Zeichensatz in Index u. Kurzliste �ndern   set D<DataFont>=<CharSet>  
h xxcode     |Zeichenumcodierung mit Tabellen            xcode ab / xcode y         
h xread      |Zeile aus der "open"-Datei lesen           get  #xyz / get iV         
h xcstring=ue |Zeitstempel des aktuellen Satzes           var ue                    
h xsleep=slic|Zeit�berwachung ein/aus                    slice n=mFLEX              
h random.inc |Zufallszahl errechnen                      UP :random in random.inc   
h xmessage   |Zwei- oder mehrzeilige Meldung             var "abc" n "xyz"\mes      
h xccopy     |Zwischenablage-Funktionen                  ccopy / cpaste ...         
