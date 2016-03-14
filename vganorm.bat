rem Tastatur und Zeichensatz auf erweiterte Codes umstellen
rem VGANORM.BAT  950513
rem Keyboard:
@echo off
echo [0;48;0;48p
echo [0;46;0;46p
echo [0;32;0;32p
echo [0;18;0;18p
echo [0;33;0;33p
echo [0;34;0;34p
echo [0;35;0;35p
echo [0;23;0;23p
echo [0;36;0;36p
echo [0;37;0;37p
echo [0;38;0;38p
echo [0;50;0;50p
echo [0;49;0;49p
echo [0;24;0;24p
echo [0;25;0;25p
echo [0;16;0;16p
echo [0;19;0;19p
echo [0;31;0;31p
echo [0;20;0;20p
echo [0;22;0;22p
echo [0;47;0;47p
rem echo [0;17;0;17p   Alt+W=¸
echo [0;44;0;44p
echo [0;21;0;21p
echo [0;105;0;105p
echo [0;106;0;106p
echo [0;107;0;107p
echo [0;108;0;108p
echo [0;109;0;109p
echo [0;111;0;111p
echo [0;112;0;112p
rem echo [0;113;0;113p   Alt+F10=â
rem load font:
fontload <vgan.fon
echo VGA Zeichensatz geladen, Tabelle aufrufen mit Alt+w
