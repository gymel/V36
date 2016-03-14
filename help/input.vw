  Eingabe                                                                    
X dnx |Datensatz per ISBN oder Stichw”rtern von DNB holen                    
x new \set i7\set i9\sho rec|Neuer, ganz leerer Datensatz                    
x copy\set i7\set i9\disp    |Kopie des Satzes, der gerade angezeigt wird    
x copy\set i7\set i9\h oncopy|Dasselbe, aber mit Hilfetext                   
X srugbv|Datensatz direkt aus GBV abrufen (per ISBN oder Wortsuche)          
X zc|Mit ISBN einen Datensatz Per Z39.50 abrufen und zu bernehmen           
------------------------------------------------------------------------     
X input Buch|Normaler Satz (Buch)                                            
X input Zeit|Zeitschrift                                                     
X input Verk|Verknpfter Untersatz (selbst„ndig gespeichert)                 
X input Hier|Hierarchischer Untersatz (mit #01)                              
X input Aufs|Aufsatz (unselbst„ndige Ver”ffentlichung)                       
X input Them|Themenheft (Zeitschrift)                                        
X input Simp|Simpler Satz (z.B. fr provisorische Erfassung)                 
X input Inve|Inventarsatz                                                    
X input Pers|Personen-Stammsatz                                              
X input Koer|K”rperschafts-Stammsatz                                         
X input Klas|Klassifikations-Stammsatz                                       
X input Thes|Thesaurus-Stammsatz                                             
X input Verw|Verweisungs-Satz                                                
X input Benu|Benutzersatz                                                    
X input DC-M|DC-Metadaten                                                    
------------------------------------------------------------------------     
x new\set i7\set i9\h onnew|Neuer Datensatz ohne Formular (Abfrageliste)     
h onnew|Hilfetext zum Erfassen neuer Datens„tze                              
x var N\ins #uvN\ask Dateinnr?=#uvN\inp\var N\mes|Dateinummer fr neue S„tze?
