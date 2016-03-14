            0|----------------------------------------------------------            
h flex       |>>>   Enter a search command into the Nr/Find field !  <<<            
            0|----------------------------------------------------------            
h xa         |         -->  Alphabetic Index                                        
h xask       |Ask the user a question                    ask                        
h xyes       |  Ask a Yes/No/Cancel question             yesno, noyes               
h xask       |  Ask for name and password                ask @                      
h xselect    |  Present possible answers for selection   select                     
h xansi      |ASCII-ANSI code conversion                 ascii / ansi               
h xshow      |Brief result set list -> display field     show list                  
h xundo      |Button [Old/New]                           undo                       
h xiz        |Calculation commands for internal number   + - / X =                  
h xif        |Check conditions                           if <bedingung> <command>   
h xvar       |Copy something into internal variable      var, write                 
h xansi      |Code conversion of iV text                 ansi, ascii                
h xzzz       |Comment   (in FLEX File)                   Space in first text pos.   
h xerase     |Delete current rec from database           erase                      
h xdelete    |Delete a file                              delete                     
h xmkdir     |Directory: make a new one                  mkdir <pfadname>           
            0|Display commands                                                      
h xprint     |  Print the display                        print                      
h xdisplay   |  Update the record display                disp                       
h xshow      |  Update the list box (left hand side)     show                       
h xfile      |  Save display contents as txt or rtf      file <Dateiname>           
h xdisplay   |  Execute a section in the display params  display, deposit           
h xdisplay   |  Change display parameters                display p <name>           
            0|    Wichtig bei vergrî·ertem Anzeigefeld:                             
h xset=set d |  Set display field to "big" mode          set db                     
h xset=set d |                       "normal" mode       set dn                     
h xset=set d |     toggle the display mode               set d                      
h xset=set b |     bookmark the current record           set b                      
h xshow=bookm|     show bookmarks                        show b                     
h xshow=back |     Back button                           show <                     
h xshow=forw |     Forward button                        show >                     
h xexec      |Execute another FLEX (terminate this one)  exec X filename            
h xdisplay   |Execute section #-k in display parameters  deposit k                  
            0|File commands                                                         
h xfsize     |  Check for existence of file              fsize <name>\if no ...     
h xclose     |  Close current file                       close                      
h xfcopy     |  Copy a file                              fcopy <name1> <name2>      
h xdelete    |  Delete a file                            delete <dateiname>         
h xhelp      |  Display a TXT or RTF file                h, help                    
h xfsize     |  File size in bytes                       fsize <dateiname>          
h xftime     |  File date (last updated)                 ftime <dateiname>          
h xopen      |  Open file for reading (get / fetch)      open <dateiname>           
h xopen      |  Open file for writing (write / download) open x <dateiname>         
h xget       |  read a line from file opened with open   get / get #xyz             
h xfetch     |  read a number of bytes from file         fetch <number> / ^<code>   
h xread      |  Read e.adt  (into current record)        read                       
h xread      |  Read file extern.dat                     read extern                
h xrename    |  Rename a file                            rename <name1> <name2>     
h xend       |Finish the current FLEX                    end                        
h xfirst     |Get 1st / next / last rec of database      first # / next # / last #  
            0|Category --> Field                                                    
h xdate      |Date YYYYMMDD/hh:mm:ss                     date b                     
h xfnam      |File selection box                         fnam <bez>|<typ>           
h xprint     |Print display contents                     print                      
h xask       |Collect input from user                    ask ...                    
h xcrypt     |Encryption of iV text                      crypt                      
h xget       |Environment variable --> iV                get env <name>             
h xxport     |Export: Set output file name               xport f <name>             
h xclose     |Export: Close output file                  close xport                
h xxport     |Export: Load parameters for export         xport p <name>             
h xdownloa   |Export current result set                  download set               
h xdownloa   |Export curr. rec (via Export parameters)   download                   
h xdownloa   |                 (via Print parameters)    Download                   
h xdownloa   |       "family" of current record          download fam               
h xdownloa   |Export the current ViewList                download view              
h xextern    |External editor invoke for current rec     extern                     
h xsonder=tzu|Field: Find/Replace in a field             *#nnn_abc_xyz_             
h xinsert    |Field insertion into current rec           ins #nnn                   
h xinsert    |Field deletion in current rec              var ""\ins #nnn            
h xtransfe   |Field copy from reserve store -> iV        transfer #nnn              
h xkatlist   |Field list from CFG --> katlist.asy        katlist                    
h xfnam      |File selection box                         fnam <bez>|<typ>           
h xsonder    |Find/Replace in current record             _abc_xyz_                  
h xsonder=tzu|             in a field of current rec     *#nnn_abc_xyz_             
h xend       |FLEX termination                           end                        
h xflex      |FLEX transmission to another a99           flex <dateiname>           
h xflip      |Flip button labeling                       flip ixyz                  
h xactivat   |Foreground the a99 window                  activate                   
h xform      |Forms invocation                           form i / form <name>       
h xaddform   |Forms : add another form file              addform <dateiname>        
h xindex     |Index display                              ?, index                   
h xindex     |Index parameters : load another set        index p name               
h xiv        |Internal variable (iV)                     var cstring / write cstring
h xinsert    |   iV -> #nnn copy                         insert #nnn                
h xshow      |   iV -> Display field / append            show IV/show +IV           
h xiz        |Internal number for calculations (iZ)      = + - / X  /  var Z        
h xindex     |Index display                              ?, index                   
h xqrix      |Index section -> display field / export    qrix, Qrix                 
h xiz        |Internal Number setting                    =                          
h xiz        |    calculation (iZ  +-/*  iV)             + - / X                    
h xjump      |Jump to a :label                           jump label                 
h xkeychk    |Keyboard check: was Esc pressed?           keychk \ if yes ...        
h xmessage   |Message to user ([OK ] button)             message                    
h xfind      |Offline file brief display                 show Q                     
h xfirst=off |Offline file: get 1st / last rec           first off/last off         
h xphrase    |Phrase setting                             phrase i text              
h xset       |Primary key for update setting             set                        
h xcall      |Program invocation                         call, cAll, Call, CAll     
h xcall      |   Call: independent window                                           
h xcall      |   cAll: only as symbol in task bar, no window                        
h xstop      |Program abortion (abruptly)                STOP                       
h xyes       |Question to user : Yes/No/Cancel           yesno, noyes               
h xread      |Read a line from "open" file               get  #xyz / get iV         
            0|Record-related commands                                               
h xnew       |       Create a new rec (empty)            new                        
h xcopy      |       Make a copy of current rec          copy                       
h xfind      |       Load a rec by internal number       find #N                    
h xfind      |       First/last rec of database          find #1 / find #0          
h xnext      |       Next/Previous                       next #, prev #             
h xerase     |       Delete current rec from database    erase                      
h xload      |       Load record (after "choose")        load                       
h xrepeat    |Repetition of a FLEX as a whole            repeat                     
            0|Result set commands                                                   
h xfamily    |  Collect all "family" members of rec      family / Family            
h xfind      |  Execute find command without display     find [<suchbefehl>]        
h xFind      |                       with display        Find [<suchbefehl>]        
h xchoose    |    same, brief line of selected rec -> iV choose <suchbefehl>        
h xfirst     |  Load first / last rec of result set      first / last               
h xnext      |  Load next / previous rec of command set  next / prev                
h xsave      |  Save all changed records in result set   save res                   
h xorder     |  Sort the result set                      order MP                   
h xtransfe   |                  ... from reserve store   transfer #nnn              
h xinsert    |                fÅr #xyz                   insert #xyz                
h xput       |Save current record with confirmation      Put, Put new               
h xput       |                    without conf.          put, put new               
h xsave      |Save all new or changed records            save edit                  
h xsave      |Save all changed recs in result set        save result                
h xsave      |Save all offline records                   save off                   
h xflex      |Send a flex to another database            flex <name>                
h xset       |Set commands (properties etc.)                                        
h xset=set b | Bookmark                                  set b                      
h xinput     | File number for record input              input n                    
h xset=set c | Input data is ASCII / ANSI                set c0/c1                  
h xset=set e | Environment variable                      set env                    
h xset=set p | Primary key for update                    set pX                     
h xmenu      | Private menu item                         menu                       
h xset=set t | TBL lock / release                        set tbl loc/fre            
h xset=set r | Record lock / release                     set rec loc/fre            
h xset=set d | Size of font in display                   set d/dn/db/d+/d-          
h xset=set u | Update mode                               set uxyz                   
h xorder     |Sort the result set                        order a/d<pos>             
h xhelp=suchw|Suchen im Anzeigefeld                      help =abc / help >abc      
h xspaces    |Spaces: remove mult spaces from iV         spaces                     
h xperform   |Subroutine call                            perform <label>            
h xreturn    |           end (return from)               return                     
h flex=flexe f|System FLEXes, e.g. _door.flx, _start.flx                            
h xupdate    |Upload (add new data)                      upload <dateiname>         
h xset=set u |Update: set mode                           set u<xyz>                 
h xupdate    |        start process                      update <dateiname>         
h xview      |Viewliste îffnen / +anzeigen               view / View                
h xclose     |Viewliste schlie·en                        close view                 
h xsleep     |Wait a second                              sleep 1000                 
h xwrite     |Write something to export output file      write [cstring]            
h xvar       |Write into the iV  (internal Variable)     var cstring                
h xyes       |Yes/No/Cancel question to user             yesno, noyes               
