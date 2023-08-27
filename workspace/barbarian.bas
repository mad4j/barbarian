' BARBARIAN
' Daniele Olmisani, 2023
'
' BARBARIAN Palace Software, 1988
'
' Remake of AMIGA 500 version by FL, 2012
' original code http://barbarian.1987.free.fr
'
' Source code complied with QB64 https://qb64.com


Screen _NewImage(640, 480, 32)
_ScreenMove _Middle
_Title "BARBARIAN"
_Icon _LoadImage("media/menu/icon.gif")


scoreA = 0
scoreB = 0

init:

' load sound files

epee = _SndOpen("media/sound/epee.ogg", "sync")
tombe = _SndOpen("media/sound/tombe.ogg", "sync")
roule = _SndOpen("media/sound/roule.ogg", "sync")
touche = _SndOpen("media/sound/touche.ogg", "sync")
touche2 = _SndOpen("media/sound/touche2.ogg", "sync")
touche3 = _SndOpen("media/sound/touche3.ogg", "sync")
attente = _SndOpen("media/sound/attente.ogg", "sync")
tete = _SndOpen("media/sound/tete.ogg", "sync")
teteX = _SndOpen("media/sound/tete2.ogg", "sync")
decapite = _SndOpen("media/sound/decapite.ogg", "sync")
cling = _SndOpen("media/sound/block1.ogg", "sync")
cling2 = _SndOpen("media/sound/block2.ogg", "sync")
cling3 = _SndOpen("media/sound/block3.ogg", "sync")
coupdetete = _SndOpen("media/sound/coupdetete.ogg", "sync")
coupdepied = _SndOpen("media/sound/coupdepied.ogg", "sync")
feu = _SndOpen("media/sound/feu.ogg", "sync")
mortdecap = _SndOpen("media/sound/mortdecap.ogg", "sync")
mortKO = _SndOpen("media/sound/mortKO.ogg", "sync")
prepare = _SndOpen("media/sound/prepare.ogg", "sync")
protege = _SndOpen("media/sound/protege.ogg", "sync")
grogne1 = _SndOpen("media/sound/grogne1.ogg", "sync")
grogne2 = _SndOpen("media/sound/grogne2.ogg", "sync")



' chargement sprites joueur A

deboutA = _LoadImage("media/spritesA/debout.gif")
assis1A = _LoadImage("media/spritesA/assis1.gif")
assis2A = _LoadImage("media/spritesA/assis2.gif")
attente1A = _LoadImage("media/spritesA/attente1.gif")
attente2A = _LoadImage("media/spritesA/attente2.gif")
attente3A = _LoadImage("media/spritesA/attente3.gif")
protegeHA = _LoadImage("media/spritesA/protegeH.gif")
cou2A = _LoadImage("media/spritesA/cou2.gif")
cou3A = _LoadImage("media/spritesA/cou3.gif")
devant1A = _LoadImage("media/spritesA/devant1.gif")
devant2A = _LoadImage("media/spritesA/devant2.gif")
devant3A = _LoadImage("media/spritesA/devant3.gif")
genou1A = _LoadImage("media/spritesA/genou1.gif")
genou3A = _LoadImage("media/spritesA/genou3.gif")
marche1A = _LoadImage("media/spritesA/marche1.gif")
marche2A = _LoadImage("media/spritesA/marche2.gif")
marche3A = _LoadImage("media/spritesA/marche3.gif")
saut1A = _LoadImage("media/spritesA/saut1.gif")
saut2A = _LoadImage("media/spritesA/saut2.gif")
vainqueur1A = _LoadImage("media/spritesA/vainqueur1.gif")
vainqueur2A = _LoadImage("media/spritesA/vainqueur2.gif")
vainqueur3A = _LoadImage("media/spritesA/vainqueur3.gif")
retourne1A = _LoadImage("media/spritesA/retourne1.gif")
retourne2A = _LoadImage("media/spritesA/retourne2.gif")
retourne3A = _LoadImage("media/spritesA/retourne3.gif")
front1A = _LoadImage("media/spritesA/front1.gif")
front2A = _LoadImage("media/spritesA/front2.gif")
front3A = _LoadImage("media/spritesA/front3.gif")
toile1A = _LoadImage("media/spritesA/toile1.gif")
toile2A = _LoadImage("media/spritesA/toile2.gif")
toile3A = _LoadImage("media/spritesA/toile3.gif")
toile4A = _LoadImage("media/spritesA/toile4.gif")
tombe1A = _LoadImage("media/spritesA/tombe1.gif")
tombe2A = _LoadImage("media/spritesA/tombe2.gif")
tombe3A = _LoadImage("media/spritesA/tombe3.gif")
protegeDA = _LoadImage("media/spritesA/protegeD.gif")
protegeHA = _LoadImage("media/spritesA/protegeH.gif")
couptete1A = _LoadImage("media/spritesA/tete1.gif")
couptete2A = _LoadImage("media/spritesA/tete2.gif")
touche1A = _LoadImage("media/spritesA/touche2.gif")
touche2A = _LoadImage("media/spritesA/touche1.gif")
touche3A = _LoadImage("media/spritesA/touche2.gif")

pied1A = _LoadImage("media/spritesA/pied1.gif")
pied2A = _LoadImage("media/spritesA/pied2.gif")
decap1A = _LoadImage("media/spritesA/decap1.gif")
decap2A = _LoadImage("media/spritesA/decap2.gif")
decap3A = _LoadImage("media/spritesA/decap3.gif")
decap4A = _LoadImage("media/spritesA/decap4.gif")
mort1A = _LoadImage("media/spritesA/assis1.gif")
mort2A = _LoadImage("media/spritesA/mort2.gif")
mort3A = _LoadImage("media/spritesA/mort3.gif")
mort4A = _LoadImage("media/spritesA/mort4.gif")

roulade1A = _LoadImage("media/spritesA/roulade1.gif")
roulade2A = _LoadImage("media/spritesA/roulade2.gif")
roulade3A = _LoadImage("media/spritesA/roulade3.gif")
roulade5A = _LoadImage("media/spritesA/roulade5.gif")


drax1B = _LoadImage("media/sprites/drax1.gif")
drax2B = _LoadImage("media/sprites/drax2.gif")
mariannaB = _LoadImage("media/sprites/marianna.gif")

' gnome

gnome1 = _LoadImage("media/sprites/gnome1.gif")
gnome2 = _LoadImage("media/sprites/gnome2.gif")
gnome3 = _LoadImage("media/sprites/gnome3.gif")
gnome4 = _LoadImage("media/sprites/gnome4.gif")


' divers
tachesang = _LoadImage("media/sprites/sang.gif")
spriteombre = _LoadImage("media/spritesA/teteombre.gif")

tete1A = _LoadImage("media/spritesA/tetedecap1.gif")
tete2A = _LoadImage("media/spritesA/tetedecap2.gif")
tete3A = _LoadImage("media/spritesA/tetedecap3.gif")
tete4A = _LoadImage("media/spritesA/tetedecap4.gif")
tete5A = _LoadImage("media/spritesA/tetedecap5.gif")
tete6A = _LoadImage("media/spritesA/tetedecap6.gif")

feu1 = _LoadImage("media/sprites/feu1.gif"): _ClearColor _RGB(255, 0, 255), feu1
feu2 = _LoadImage("media/sprites/feu2.gif"): _ClearColor _RGB(255, 0, 255), feu2
feu3 = _LoadImage("media/sprites/feu3.gif"): _ClearColor _RGB(255, 0, 255), feu3

gicle1 = _LoadImage("media/sprites/gicle1.gif")
gicle2 = _LoadImage("media/sprites/gicle2.gif")
gicle3 = _LoadImage("media/sprites/gicle3.gif")

serpent1 = _LoadImage("media/stage/serpent1.gif")
serpent2 = _LoadImage("media/stage/serpent2.gif")
serpent3 = _LoadImage("media/stage/serpent3.gif")


' logo
logo:

' add splash screen here

'If country$ = "USA" Then
'    decor = _LoadImage("media/menu/titreDS.png")
'_PutImage , decor
'_Display
'Sleep 4
'End If

decor = _LoadImage("media/menu/titre.png")
_PutImage , decor
_Display


If fullscreen Then Sleep 4 Else Sleep 2



'                           menu, choix du decor

menu:
demo$ = "non"

Do: Loop Until InKey$ = ""

Screen _NewImage(640, 480, 32)
Cls
decor = _LoadImage("media/menu/menu.png")
_PutImage , decor
_Display

Sleep

If _KeyDown(48) Then decor$ = "foret": demo$ = "oui": IA = 4: partie$ = "solo": sorcier$ = "non": GoTo variables
If _KeyDown(49) Then decor$ = "foret": IA = 0: partie$ = "solo": sorcier$ = "non": GoTo variables
If _KeyDown(50) Then IA = 0: partie$ = "vs": chronometre = 60: sorcier$ = "non": GoTo selectstage
If _KeyDown(51) Then GoTo options
If _KeyDown(52) Then GoTo controls
If _KeyDown(53) Then GoTo histoire
If _KeyDown(54) Then GoTo credits
If _KeyDown(55) Then System Else GoTo menu



' selection du d‚cor
selectstage:

decor = _LoadImage("media/menu/stage.png")
_PutImage , decor
_Display

Sleep


If _KeyDown(49) Then decor$ = "plaine": GoTo variables
If _KeyDown(50) Then decor$ = "foret": GoTo variables
If _KeyDown(51) Then decor$ = "trone": GoTo variables
If _KeyDown(52) Then decor$ = "arene": GoTo variables

If _KeyDown(54) Then GoTo menu Else GoTo selectstage


' menu options
options:

decor = _LoadImage("media/menu/display.png")
_PutImage , decor

_Display
Sleep

If _KeyDown(49) Then
    _FullScreen
    GoTo logo
End If

If _KeyDown(50) Then
    _FullScreen _Off
    GoTo logo
End If

GoTo options

credits:

Screen _NewImage(640, 480, 32)
Cls
decor = _LoadImage("media/menu/team.png"): _PutImage (0, 0), decor
_Font 8

Locate 2, 21: Print "     BARBARIAN      "
Locate 3, 21: Print "the ultimate warrior"
Locate 4, 21: Print "                    "
Locate 5, 21: Print "  Palace Software  "
Locate 6, 21: Print "         1987      "
Locate 7, 21: Print " AMIGA 500 version "
Locate 8, 21: Print "                    "
Locate 9, 21: Print "created and designed"
Locate 10, 21: Print "  by STEVE BROWN    "
Locate 11, 21: Print "                    "
Locate 12, 21: Print "     programmer     "
Locate 13, 21: Print " Richard Leinfellner"
Locate 14, 21: Print "                    "
Locate 15, 21: Print "  assistant artist  "
Locate 16, 21: Print "                    "
Locate 17, 21: Print "     GARY CARR      "
Locate 18, 21: Print "                    "
Locate 19, 21: Print "     JO WALKER      "
Locate 20, 21: Print "                    "
Locate 21, 21: Print "       music        "
Locate 22, 21: Print "   RICHARD JOSEPH "
Locate 23, 21: Print "                    "
Locate 24, 1: Print "FL clone http://barbarian.1987.free.fr";

_Display
Sleep

If _KeyDown(13) Or _KeyDown(27) Then
    GoTo menu
Else
    GoTo credits
End If


controls:

Screen _NewImage(640, 480, 32)
Cls
_Font 8

decor = _LoadImage("media/menu/titre2.png")
_PutImage , decor

decor = _LoadImage("media/menu/playerA.png")
_PutImage (0, 0), decor

decor = _LoadImage("media/menu/playerB.png")
_PutImage (280, 0), decor

Color _RGB(255, 238, 0): Locate 10, 14: Print "CONTROLS KEYS"

Color _RGB(255, 255, 255)
Locate 10, 1: Print "PLAYER A"
Locate 12, 1: Print "UP............"; Chr$(24)
Locate 13, 1: Print "DOWN.........."; Chr$(25)
Locate 14, 1: Print "LEFT.........."; Chr$(27)
Locate 15, 1: Print "RIGHT........."; Chr$(26)
Locate 17, 1: Print "ATTACK...SHIFT"
Color _RGB(255, 0, 0): Locate 18, 1: Print "   or GAMEPAD 1"

Color _RGB(255, 255, 255)
Locate 10, 27: Print "      PLAYER B"
Locate 12, 25: Print "UP.............I"
Locate 13, 25: Print "DOWN...........J"
Locate 14, 25: Print "LEFT...........K"
Locate 15, 25: Print "RIGHT..........L"
Locate 17, 25: Print "ATTACK.....SPACE"

Color _RGB(255, 0, 0): Locate 18, 27: Print " or GAMEPAD 2"

Color _RGB(255, 255, 255)
Locate 20, 10: Print "ABORT GAME...........ESC"
Locate 22, 10: Print "GOTO MENU..........ENTER"

_Display
Sleep
If _KeyDown(13) Or _KeyDown(27) Then GoTo controls2 Else GoTo controls

controls2:
Cls
Color _RGB(255, 238, 0): Locate 2, 13: Print "MOVING CONTROLS"

decor = _LoadImage("media/menu/controls1.gif")
_PutImage (100, 40), decor

Color _RGB(255, 255, 255)
Locate 5, 19: Print "jump";
Locate 7, 8: Print "protect";
Locate 8, 11: Print "head";
Locate 7, 27: Print "protect";
Locate 8, 27: Print "body";
Locate 12, 9: Print "move";
Locate 13, 9: Print "back"
Locate 12, 29: Print "move";
Locate 13, 29: Print "forward"
Locate 18, 11: Print "roll";
Locate 19, 11: Print "back";
Locate 18, 27: Print "roll";
Locate 19, 27: Print "front";
Locate 21, 18: Print "crouch"

_Display
Sleep
If _KeyDown(13) Or _KeyDown(27) Then GoTo controls3 Else GoTo controls2


controls3:

Cls
Color _RGB(255, 238, 0): Locate 2, 13: Print "FIGHTING CONTROLS"
Locate 3, 13: Print "(with attack key)"

decor = _LoadImage("media/menu/controls2.gif")
_PutImage (100, 40), decor

Color _RGB(255, 255, 255)
Locate 5, 16: Print "neck chop";
Locate 7, 9: Print "web of";
Locate 8, 9: Print "death";
Locate 7, 27: Print "head";
Locate 8, 27: Print "butt";
Locate 12, 7: Print "flying";
Locate 13, 9: Print "neck";
Locate 14, 9: Print "chop";
Locate 12, 29: Print "body";
Locate 13, 29: Print "chop";
Locate 18, 7: Print "overhead";
Locate 19, 11: Print "chop";
Locate 19, 27: Print "kick ";
Locate 21, 17: Print "leg chop";


_Display
Sleep
If _KeyDown(13) Or _KeyDown(27) Then GoTo menu Else GoTo controls3


' histoire du jeu

histoire:
Screen 7
Cls
Locate 2, 1: Print "The evil sorcerer Drax desires "
Locate 3, 1: Print "Princess Marianna and has sworn "
Locate 4, 1: Print "to wreak an unspeakable doom on the"
Locate 5, 1: Print "people of the Jewelled City, unless"
Locate 6, 1: Print "she is delivred to him."
Locate 7, 1: Print "However, he has agreed that if a"
Locate 8, 1: Print "champion can be found who is able to "
Locate 9, 1: Print "defeat his 7 demonic guardians, the"
Locate 10, 1: Print "princess will be allowed to go free."
Locate 12, 1: Print "All seems lost as champion after "
Locate 13, 1: Print "champion is defeated."
Locate 15, 1: Print "Then, from the forgotten wastelands of"
Locate 16, 1: Print "the North, comes an unknown barbarian,"
Locate 17, 1: Print "a mighty warrior, wielding broadsword"
Locate 18, 1: Print "with deadly skill."
Locate 20, 1: Print "Can he vanquish the forces of Darkness "
Locate 21, 1: Print "and free the princess ?"
Locate 23, 1: Print "Only you can say ...";

_Display
Sleep
If _KeyDown(13) Or _KeyDown(27) Then GoTo menu Else GoTo histoire




'                       entree des variables
variables:

yAttA = 17: xAttA = 15
yAttB = 17: xAttB = 27
yFA = 15: yFB = 15: ' front
yTA = 16: yTB = 16: ' tete
yMA = 18: yMB = 18: ' corps
yGA = 20: yGB = 20: ' genou
xFA = xA + 4: xTA = xA + 4: xMA = xA + 4: xGA = xA + 4
xFB = xB: xTB = xB: xMB = xB: xGB = xB
sens$ = "normal"
joueurA$ = "debout"
joueurB$ = "debout"
decapiteA$ = "oui"
decapiteB$ = "oui"
vieA = 12
vieB = 12
temps = 1
reftemps = 1
attenteA = 1
attenteB = 1
entree$ = "oui":
xA = 1: xB = 36 'xA = 14 : xB=23  positions du milieu
sensimageA$ = "normal"
sensimageB$ = "normal"
Aoccupe$ = "non"
Boccupe$ = "non"
spriteavanceA = 0
spritereculeA = 0
spriteavanceB = 0
spritereculeB = 0
sangA$ = "non"
sangB$ = "non"
serpentA$ = "oui"
serpentB$ = "oui"
sangdecapA = 0
sangdecapB = 0
lancerintro$ = "oui"
lancerfin$ = "oui"
chrono = 1
ySPRt = 111
xSPRt = 0
xSPRt2 = 0
gnome$ = "non"
xGNOME = 1
numerotete = 1
numerognome = 1
football$ = "non"
sortieA$ = "non"
sortieB$ = "non"
protegeDA$ = "non"
protegeDB$ = "non"
protegeHA$ = "non"
protegeHB$ = "non"
tempsfini$ = "non"
gnometire$ = "oui"
bonusA$ = "non"
bonusB$ = "non"
infocoupB = 0
infoBdegatF = 0
infoBdegatT = 0
infoBdegatG = 0
infocoupA = 0
infoAdegatF = 0
infoAdegatT = 0
infoAdegatG = 0
jeu$ = "encours"
entreesorcier$ = "non"
sonrigole$ = "non"
gnomerigole$ = "non"
finiderigoler$ = "non"
transition$ = "non"
transitionfinie$ = "non"
attaqueA$ = "non"
attaqueB$ = "non"
sontouche = 0
soncling = 0
songrogne = 0


'                   ************************************
'                   *******AFFICHAGE DU DECOR **********
'                   ************************************
decor:

Screen _NewImage(640, 480, 32)
Cls

If decor$ = "plaine" Then
    decor = _LoadImage("media/stage/plaine.gif")
    _PutImage , decor
    fond = _LoadImage("media/stage/plaineFOND.gif")
    arbreG = _LoadImage("media/stage/plaineARBREG.gif")
    arbreD = _LoadImage("media/stage/plaineARBRED.gif")
End If

If decor$ = "foret" Then
    decor = _LoadImage("media/stage/foret.gif")
    _PutImage , decor
    fond = _LoadImage("media/stage/foretFOND.gif")
    arbreG = _LoadImage("media/stage/foretARBREG.gif")
    arbreD = _LoadImage("media/stage/foretARBRED.gif")
End If

If decor$ = "trone" Then
    decor = _LoadImage("media/stage/trone.gif")
    _PutImage , decor
    fond = _LoadImage("media/stage/troneFOND.gif")
    arbreG = _LoadImage("media/stage/troneARBREG.gif")
    arbreD = _LoadImage("media/stage/troneARBRED.gif")
End If

If decor$ = "arene" Then
    decor = _LoadImage("media/stage/arene.gif")
    _PutImage , decor
    fond = _LoadImage("media/stage/areneFOND.gif")
    arbreG = _LoadImage("media/stage/areneARBREG.gif")
    arbreD = _LoadImage("media/stage/areneARBRED.gif")
End If


' premier affichages

Color _RGB(0, 0, 0)
_Font 8
_PrintMode _KeepBackground

If partie$ = "solo" And demo$ = "non" Then Locate 25, 16: Print "ONE  PLAYER";
If partie$ = "vs" Then Locate 25, 16: Print "TWO PLAYER";
If demo$ = "oui" Then Locate 25, 14: Print "DEMONSTRATION";

' pr‚-affichage du score
If scoreA = 0 Then Locate 8, 13: Print "00000"
If scoreB = 0 Then Locate 8, 24: Print "00000"

If scoreA > 99999 Then scoreA = 0: If scoreB > 99999 Then scoreB = 0

If scoreA > 99 And scoreA < 999 Then
    Locate 8, 13: Print "00": Locate 8, 14: Print scoreA
End If
If scoreA > 999 And scoreA < 9999 Then
    Locate 8, 13: Print "0": Locate 8, 13: Print scoreA
End If
If scoreA > 9999 And scoreA < 99999 Then
    Locate 8, 12: Print scoreA
End If

If scoreB > 99 And scoreB < 999 Then
    Locate 8, 24: Print "00": Locate 8, 25: Print scoreB
End If
If scoreB > 999 And scoreB < 9999 Then
    Locate 8, 24: Print "0": Locate 8, 24: Print scoreB
End If
If scoreB > 9999 And scoreB < 99999 Then
    Locate 8, 23: Print scoreB
End If

If partie$ = "vs" Then Locate 8, 19: Print chronometre
If partie$ = "solo" Then Locate 8, 20: Print "0": Locate 8, 20: Print IA
_PrintMode _FillBackground


_Display

'                   ******************************************
'                   *******   CHARGEMENT SPRITES B  **********
'                   ******************************************

If IA = 0 Then AI$ = "0"
If IA = 1 Then AI$ = "1"
If IA = 2 Then AI$ = "2"
If IA = 3 Then AI$ = "3"
If IA = 4 Then AI$ = "4"
If IA = 5 Then AI$ = "5"
If IA = 6 Then AI$ = "6"
If IA = 7 Then AI$ = "7"

'spritesB" + AI$ + "/

deboutB = _LoadImage("media/spritesB/spritesB" + AI$ + "/debout.gif")
assis1B = _LoadImage("media/spritesB/spritesB" + AI$ + "/assis1.gif")
assis2B = _LoadImage("media/spritesB/spritesB" + AI$ + "/assis2.gif")
attente1B = _LoadImage("media/spritesB/spritesB" + AI$ + "/attente1.gif")
attente2B = _LoadImage("media/spritesB/spritesB" + AI$ + "/attente2.gif")
attente3B = _LoadImage("media/spritesB/spritesB" + AI$ + "/attente3.gif")
protegeHB = _LoadImage("media/spritesB/spritesB" + AI$ + "/protegeH.gif")
cou2B = _LoadImage("media/spritesB/spritesB" + AI$ + "/cou2.gif")
cou3B = _LoadImage("media/spritesB/spritesB" + AI$ + "/cou3.gif")
devant1B = _LoadImage("media/spritesB/spritesB" + AI$ + "/devant1.gif")
devant2B = _LoadImage("media/spritesB/spritesB" + AI$ + "/devant2.gif")
devant3B = _LoadImage("media/spritesB/spritesB" + AI$ + "/devant3.gif")
genou1B = _LoadImage("media/spritesB/spritesB" + AI$ + "/genou1.gif")
genou3B = _LoadImage("media/spritesB/spritesB" + AI$ + "/genou3.gif")
marche1B = _LoadImage("media/spritesB/spritesB" + AI$ + "/marche1.gif")
marche2B = _LoadImage("media/spritesB/spritesB" + AI$ + "/marche2.gif")
marche3B = _LoadImage("media/spritesB/spritesB" + AI$ + "/marche3.gif")
saut1B = _LoadImage("media/spritesB/spritesB" + AI$ + "/saut1.gif")
saut2B = _LoadImage("media/spritesB/spritesB" + AI$ + "/saut2.gif")
vainqueur1B = _LoadImage("media/spritesB/spritesB" + AI$ + "/vainqueur1.gif")
vainqueur2B = _LoadImage("media/spritesB/spritesB" + AI$ + "/vainqueur2.gif")
vainqueur3B = _LoadImage("media/spritesB/spritesB" + AI$ + "/vainqueur3.gif")
retourne1B = _LoadImage("media/spritesB/spritesB" + AI$ + "/retourne1.gif")
retourne2B = _LoadImage("media/spritesB/spritesB" + AI$ + "/retourne2.gif")
retourne3B = _LoadImage("media/spritesB/spritesB" + AI$ + "/retourne3.gif")
front1B = _LoadImage("media/spritesB/spritesB" + AI$ + "/front1.gif")
front2B = _LoadImage("media/spritesB/spritesB" + AI$ + "/front2.gif")
front3B = _LoadImage("media/spritesB/spritesB" + AI$ + "/front3.gif")
toile1B = _LoadImage("media/spritesB/spritesB" + AI$ + "/toile1.gif")
toile2B = _LoadImage("media/spritesB/spritesB" + AI$ + "/toile2.gif")
toile3B = _LoadImage("media/spritesB/spritesB" + AI$ + "/toile3.gif")
toile4B = _LoadImage("media/spritesB/spritesB" + AI$ + "/toile4.gif")
tombe1B = _LoadImage("media/spritesB/spritesB" + AI$ + "/tombe1.gif")
tombe2B = _LoadImage("media/spritesB/spritesB" + AI$ + "/tombe2.gif")
tombe3B = _LoadImage("media/spritesB/spritesB" + AI$ + "/tombe3.gif")
protegeDB = _LoadImage("media/spritesB/spritesB" + AI$ + "/protegeD.gif")
protegeHB = _LoadImage("media/spritesB/spritesB" + AI$ + "/protegeH.gif")
couptete1B = _LoadImage("media/spritesB/spritesB" + AI$ + "/tete1.gif")
couptete2B = _LoadImage("media/spritesB/spritesB" + AI$ + "/tete2.gif")
touche1B = _LoadImage("media/spritesB/spritesB" + AI$ + "/touche2.gif")
touche2B = _LoadImage("media/spritesB/spritesB" + AI$ + "/touche1.gif")
touche3B = _LoadImage("media/spritesB/spritesB" + AI$ + "/touche2.gif")
pied1B = _LoadImage("media/spritesB/spritesB" + AI$ + "/pied1.gif")
pied2B = _LoadImage("media/spritesB/spritesB" + AI$ + "/pied2.gif")
decap1B = _LoadImage("media/spritesB/spritesB" + AI$ + "/decap1.gif")
decap2B = _LoadImage("media/spritesB/spritesB" + AI$ + "/decap2.gif")
decap3B = _LoadImage("media/spritesB/spritesB" + AI$ + "/decap3.gif")
decap4B = _LoadImage("media/spritesB/spritesB" + AI$ + "/decap4.gif")
mort1B = _LoadImage("media/spritesB/spritesB" + AI$ + "/assis1.gif")
mort2B = _LoadImage("media/spritesB/spritesB" + AI$ + "/mort2.gif")
mort3B = _LoadImage("media/spritesB/spritesB" + AI$ + "/mort3.gif")
mort4B = _LoadImage("media/spritesB/spritesB" + AI$ + "/mort4.gif")
roulade1B = _LoadImage("media/spritesB/spritesB" + AI$ + "/roulade1.gif")
roulade2B = _LoadImage("media/spritesB/spritesB" + AI$ + "/roulade2.gif")
roulade3B = _LoadImage("media/spritesB/spritesB" + AI$ + "/roulade3.gif")
roulade5B = _LoadImage("media/spritesB/spritesB" + AI$ + "/roulade5.gif")
tete1B = _LoadImage("media/spritesB/spritesB" + AI$ + "/tetedecap1.gif")
tete2B = _LoadImage("media/spritesB/spritesB" + AI$ + "/tetedecap2.gif")
tete3B = _LoadImage("media/spritesB/spritesB" + AI$ + "/tetedecap3.gif")
tete4B = _LoadImage("media/spritesB/spritesB" + AI$ + "/tetedecap4.gif")
tete5B = _LoadImage("media/spritesB/spritesB" + AI$ + "/tetedecap5.gif")
tete6B = _LoadImage("media/spritesB/spritesB" + AI$ + "/tetedecap6.gif")


'                   ************************************
'                   *******   DEBUT DU JEU    **********
'                   ************************************



Do
    debut:

    If _KeyDown(27) Then arret$ = "oui" Else arret$ = "non"

    temps = temps + 1


    '                    ************* scenes d'animation************

    If sorcier$ = "oui" Then GoTo degats


    If bonusA$ = "oui" Then
        scoreA = scoreA + 10: chronometre = chronometre - 1
        If chronometre <= 0 Then
            chronometre = 0: scoreA = scoreA - 10
            If xB >= 37 Then sortieA$ = "oui": Aoccupe$ = "non"
        End If
    End If

    If bonusB$ = "oui" Then
        scoreB = scoreB + 10: chronometre = chronometre - 1
        If chronometre <= 0 Then
            chronometre = 0: scoreB = scoreB - 10
            If xA >= 37 Then sortieB$ = "oui": Boccupe$ = "non"
        End If
    End If

    If entree$ = "oui" Then
        If xA >= 13 Or xB <= 22 Then entree$ = "non"
    End If

    If sortieA$ = "oui" Then
        If tempsfini$ = "non" Then
            If xA < 2 And xB >= 37 Then
                Sleep 1
                If partie$ = "solo" Then '******* round solo gagn‚
                    If demo$ = "oui" Then
                        _SndStop mortKO: _SndStop mortdecap: GoTo menu
                        IA = 0: scoreA = 0: scoreB = 0
                    End If
                    IA = IA + 1
                    If IA > 7 Then
                        IA = 7: sorcier$ = "oui"
                        sens$ = "inverse"
                        joueurB$ = "sorcier": joueurA$ = "deboutR"
                        xB = 8: xA = 36
                        entree$ = "non": sortieA$ = "non"
                        entreesorcier$ = "oui"
                        Boccupe$ = "oui":
                        reftempsB = temps:
                        GoTo debut
                    End If
                    If IA = 1 Then decor$ = "plaine"
                    If IA = 2 Then decor$ = "foret"
                    If IA = 3 Then decor$ = "plaine"
                    If IA = 4 Then decor$ = "trone"
                    If IA = 5 Then decor$ = "arene"
                    If IA = 6 Then decor$ = "trone"
                    If IA = 7 Then decor$ = "arene"

                    GoTo variables
                End If
                If partie$ = "vs" Then
                    chronometre = 60
                    If decor$ = "plaine" Then decor$ = "foret": GoTo variables
                    If decor$ = "foret" Then decor$ = "plaine": GoTo variables
                    If decor$ = "trone" Then decor$ = "arene": GoTo variables
                    If decor$ = "arene" Then decor$ = "trone": GoTo variables
                End If
            End If
        End If

        If tempsfini$ = "oui" Then
            If sens$ = "normal" Then
                If xA < 2 And xB >= 37 Then
                    Sleep 1
                    chronometre = 60
                    GoTo variables
                End If
            End If
            If sens$ = "inverse" Then
                If xB < 2 And xA >= 37 Then
                    Sleep 1
                    chronometre = 60
                    GoTo variables
                End If
            End If

        End If

        GoTo clavier
    End If

    If sortieB$ = "oui" Then
        If tempsfini$ = "non" Then
            If xA >= 37 And xB >= 37 Then
                Sleep 1
                If partie$ = "solo" Then '********** partie solo finie
                    If demo$ = "oui" Then _SndStop mortKO: _SndStop mortdecap: GoTo menu
                    IA = 0: scoreA = 0: scoreB = 0
                    decor$ = "foret": GoTo variables
                End If
                If partie$ = "vs" Then
                    chronometre = 60
                    If decor$ = "plaine" Then decor$ = "foret": GoTo variables
                    If decor$ = "foret" Then decor$ = "plaine": GoTo variables
                    If decor$ = "trone" Then decor$ = "arene": GoTo variables
                    If decor$ = "arene" Then decor$ = "trone": GoTo variables
                End If
            End If
        End If
        GoTo clavierB
    End If

    If gnome$ = "oui" Then GoTo gnome


    '                   ************************************
    '                   *******GESTION DES DEGATS***********
    '                   ************************************

    degats:

    'degats sur joueurA

    If sorcier$ = "oui" Then

        If xA < 29 Then
            If xAttB > xTA And xAttB <= xTA + 2 Then
                If yAttB = yTA Then
                    gnome$ = "non"
                    If jeu$ = "perdu" Then GoTo gestion
                    joueurA$ = "mortSORCIER": Aoccupe$ = "oui": reftemps = temps: sangA$ = "non"
                    joueurB$ = "sorcierFINI": Boccupe$ = "oui": reftempsB = temps: sangB$ = "non"
                    jeu$ = "perdu"
                    GoTo gestion
                End If
            End If

            If xAttB >= xGA And xAttB <= xGA + 2 Then
                If yAttB = yGA Then
                    gnome$ = "non"
                    If jeu$ = "perdu" Then GoTo gestion
                    joueurA$ = "mortSORCIER": Aoccupe$ = "oui": reftemps = temps: sangA$ = "non"
                    joueurB$ = "sorcierFINI": Boccupe$ = "oui": reftempsB = temps: sangB$ = "non"
                    jeu$ = "perdu"
                    GoTo gestion
                End If
            End If
        End If

        If Aoccupe$ = "oui" Then GoTo gestion
        sangA$ = "non"

        GoTo clavier

    End If


    If sens$ = "normal" Then
        If xA < xB Then
            If xAttB <= xFA And yAttB = yFA Then
                If joueurA$ = "protegeH" Then joueurA$ = "clingH": GoTo gestion
                joueurA$ = "tombe": infoAdegatF = infoAdegatF + 1: GoTo gestion
            End If

            If xAttB <= xTA And yAttB = yTA Then
                If joueurB$ = "coupdetete" Then joueurA$ = "tombe": GoTo gestion
                joueurA$ = "touche": scoreB = scoreB + 250: infoAdegatT = infoAdegatT + 1: GoTo gestion
            End If

            If xAttB <= xMA And yAttB = yMA Then
                If joueurA$ = "protegeD" Then joueurA$ = "clingD": GoTo gestion
                joueurA$ = "touche": scoreB = scoreB + 250: GoTo gestion
            End If

            If xAttB <= xGA And yAttB = yGA Then
                If joueurB$ = "araignee" Then joueurA$ = "tombe": GoTo gestion
                If joueurB$ = "rouladeAV" Then joueurA$ = "tombe": GoTo gestion
                If joueurA$ = "protegeD" Then joueurA$ = "clingD": GoTo gestion
                If joueurB$ = "coupdepied" Then joueurA$ = "tombe": infoAdegatG = infoAdegatG + 1: GoTo gestion
                joueurA$ = "touche": scoreB = scoreB + 100: infoAdegatG = infoAdegatG + 1: GoTo gestion
            End If
        End If
    End If

    If sens$ = "inverse" Then
        If xA > xB Then
            If xAttB >= xFA And yAttB = yFA Then
                If joueurA$ = "protegeHR" Then joueurA$ = "clingH": GoTo gestion
                joueurA$ = "tombeR": GoTo gestion
            End If

            If xAttB >= xTA And yAttB = yTA Then
                If joueurB$ = "coupdeteteR" Then joueurA$ = "tombeR": GoTo gestion
                joueurA$ = "toucheR": scoreB = scoreB + 250: GoTo gestion
            End If
            If xAttB >= xMA And yAttB = yMA Then
                If joueurA$ = "protegeDR" Then joueurA$ = "clingD": GoTo gestion
                joueurA$ = "toucheR": scoreB = scoreB + 250: GoTo gestion
            End If
            If xAttB >= xGA And yAttB = yGA Then
                If joueurB$ = "araigneeR" Then joueurA$ = "tombeR": GoTo gestion
                If joueurB$ = "rouladeAVR" Then joueurA$ = "tombeR": GoTo gestion
                If joueurA$ = "protegeDR" Then joueurA$ = "clingD": GoTo gestion
                If joueurB$ = "coupdepiedR" Then joueurA$ = "tombeR": GoTo gestion
                joueurA$ = "toucheR": scoreB = scoreB + 100: GoTo gestion
            End If
        End If
    End If


    If Aoccupe$ = "oui" Then GoTo gestion
    sangA$ = "non"


    '               *********************************************************
    '               ***************** evenements clavier ********************
    '               *********************************************************


    clavier:

    '                       remise a zero  du pav‚ virtuel

    x1 = 7: y1 = 7
    levier1$ = "neutre"


    If demo$ = "non" Then
        '                       ENTREE DES TOUCHES

        If _KeyDown(18432) Or Stick(1) < 65 Then y1 = y1 - 1
        If _KeyDown(20480) Or Stick(1) > 190 Then y1 = y1 + 1
        If _KeyDown(19712) Or Stick(0) > 190 Then x1 = x1 + 1
        If _KeyDown(19200) Or Stick(0) < 65 Then x1 = x1 - 1

        If _KeyDown(100303) Or Strig(1) = -1 Then attaqueA$ = "oui" Else attaqueA$ = "non"


        If _KeyDown(118) Then version$ = "oui" Else version$ = "non"





        '                       amplitude du pave virtuel
        If y1 > 9 Then y1 = 9
        If y1 < 5 Then y1 = 5
        If x1 > 9 Then x1 = 9
        If x1 < 5 Then x1 = 5


        '                        position du "levier"  virtuel

        If sens$ = "normal" Then
            If (x1 <= 6 And y1 <= 6) Then levier1$ = "hautG"
            If (x1 >= 8 And y1 <= 6) Then levier1$ = "hautD"
            If (x1 <= 6 And y1 >= 8) Then levier1$ = "basG"
            If (x1 >= 8 And y1 >= 8) Then levier1$ = "basD"
            If (x1 <= 6 And y1 = 7) Then levier1$ = "gauche"
            If (x1 >= 8 And y1 = 7) Then levier1$ = "droite"
            If (x1 = 7 And y1 >= 8) Then levier1$ = "bas"
            If (x1 = 7 And y1 <= 6) Then levier1$ = "haut"
        End If

        If sens$ = "inverse" Then
            If (x1 <= 6 And y1 <= 6) Then levier1$ = "hautD"
            If (x1 >= 8 And y1 <= 6) Then levier1$ = "hautG"
            If (x1 <= 6 And y1 >= 8) Then levier1$ = "basD"
            If (x1 >= 8 And y1 >= 8) Then levier1$ = "basG"
            If (x1 <= 6 And y1 = 7) Then levier1$ = "gauche"
            If (x1 >= 8 And y1 = 7) Then levier1$ = "droite"
            If (x1 = 7 And y1 >= 8) Then levier1$ = "bas"
            If (x1 = 7 And y1 <= 6) Then levier1$ = "haut"
        End If
    End If
    '                       **********************************
    '                       ******* animations  auto *********
    '                       **********************************

    If entree$ = "oui" Then
        If lancerintro$ = "oui" Then _SndPlay prepare: lancerintro$ = "non"
        levier1$ = "droite": GoTo action
    End If

    If sortieA$ = "oui" Then
        If tempsfini$ = "oui" Then
            If sens$ = "inverse" Then levier1$ = "droite": GoTo action
        End If

        sens$ = "normal": levier1$ = "gauche": GoTo action
    End If

    If entreesorcier$ = "oui" Then
        If xA <= 33 Then entreesorcier$ = "non": GoTo gestion
        levier1$ = "gauche": GoTo action
    End If

    '                   ************************************
    '                   **********   MODE DEMO   ***********
    '                   ************************************



    If demo$ = "oui" Then

        If sens$ = "normal" Then
            distance = xB - xA

            If distance >= 15 Then '  quand trop loin
                joueurA$ = "rouladeAV": reftemps = temps: Aoccupe$ = "oui": GoTo gestion
            End If


            If distance = 12 And joueurB$ = "debout" Then joueurA$ = "decapite": reftemps = temps: Aoccupe$ = "oui": GoTo gestion

            If distance = 9 Then
                If attenteB > 100 Then joueurA$ = "decapite": reftemps = temps: Aoccupe$ = "oui": GoTo gestion
                If joueurB$ = "rouladeAR" Then joueurA$ = "genou": reftemps = temps: Aoccupe$ = "oui": GoTo gestion
                If Boccupe$ = "oui" Then joueurA$ = "rouladeAV": reftemps = temps: Aoccupe$ = "oui": GoTo gestion
            End If

            If distance < 9 And distance > 6 Then ' distance de combat 1

                ' pour se rapprocher
                If joueurB$ = "rouladeAR" Then joueurA$ = "genou": reftemps = temps: Aoccupe$ = "oui": GoTo gestion
                If levier2$ = "gauche" Then joueurA$ = "araignee": reftemps = temps: Aoccupe$ = "oui": GoTo gestion

                If joueurB$ = "front" Then joueurA$ = "protegeH": reftemps = temps: GoTo gestion


                'pour eviter les degats repetitifs
                If infoAdegatG > 4 Then
                    If joueurB$ = "assis2" Or joueurB$ = "genou" Then joueurA$ = "genou": reftemps = temps: Aoccupe$ = "oui": GoTo gestion
                End If
                If infoAdegatG > 2 Then
                    If joueurB$ = "assis2" Or joueurB$ = "genou" Then joueurA$ = "rouladeAV": reftemps = temps: Aoccupe$ = "oui": GoTo gestion
                End If

                If infoAdegatT > 2 Then
                    If joueurB$ = "cou" Then joueurA$ = "genou": reftemps = temps: Aoccupe$ = "oui": GoTo gestion
                End If

                If infoAdegatF > 2 Then
                    If joueurB$ = "front" Then joueurA$ = "rouladeAV": reftemps = temps: Aoccupe$ = "oui": GoTo gestion
                End If

                'pour alterner les attaques

                If infocoupA = 0 Then joueurA$ = "devant": infocoupA = infocoupA + 1: reftemps = temps: Aoccupe$ = "oui": GoTo gestion
                If infocoupA = 1 Then joueurA$ = "front": infocoupA = infocoupA + 1: reftemps = temps: Aoccupe$ = "oui": GoTo gestion
                If infocoupA = 2 Then joueurA$ = "araignee": infocoupA = infocoupA + 1: reftemps = temps: Aoccupe$ = "oui": GoTo gestion
                If infocoupA = 3 Then joueurA$ = "araignee": infocoupA = infocoupA + 1: reftemps = temps: Aoccupe$ = "oui": GoTo gestion
                If infocoupA = 4 Then joueurA$ = "cou": infocoupA = infocoupA + 1: reftemps = temps: Aoccupe$ = "oui": GoTo gestion
                If infocoupA = 5 Then levier1$ = "gauche": infocoupA = 0: GoTo action


            End If
            If distance <= 6 Then

                If joueurB$ = "devant" Then joueurA$ = "protegeD": reftemps = temps: GoTo gestion

                If infoAdegatG > 4 Then
                    If joueurB$ = "assis2" Or joueurB$ = "genou" Then joueurA$ = "genou": reftemps = temps: Aoccupe$ = "oui": GoTo gestion
                End If
                If infoAdegatG > 2 Then
                    If joueurB$ = "coupdepied" Then joueurA$ = "rouladeAV": reftemps = temps: Aoccupe$ = "oui": GoTo gestion
                    If joueurB$ = "assis2" Or joueurB$ = "genou" Then joueurA$ = "rouladeAV": reftemps = temps: Aoccupe$ = "oui": GoTo gestion
                End If

                If infocoupA = 0 Then joueurA$ = "coupdepied": infocoupA = infocoupA + 1: reftemps = temps: Aoccupe$ = "oui": GoTo gestion
                If infocoupA = 1 Then joueurA$ = "coupdetete": infocoupA = infocoupA + 1: reftemps = temps: Aoccupe$ = "oui": GoTo gestion
                If infocoupA = 2 Then joueurA$ = "araignee": infocoupA = infocoupA + 1: reftemps = temps: Aoccupe$ = "oui": GoTo gestion
                If infocoupA = 3 Then joueurA$ = "genou": infocoupA = infocoupA + 1: reftemps = temps: Aoccupe$ = "oui": GoTo gestion
                If infocoupA = 4 Then joueurA$ = "genou": infocoupA = infocoupA + 1: reftemps = temps: Aoccupe$ = "oui": GoTo gestion
                If infocoupA = 5 Then levier1$ = "gauche": infocoupA = 0: GoTo action


            End If

        End If


        If sens$ = "inverse" Then GoTo menu

    End If





    '                       redirection suivant les touches

    If levier1$ = "hautG" GoTo action
    If levier1$ = "hautD" GoTo action

    If levier1$ = "basG" GoTo action
    If levier1$ = "basD" GoTo action
    If levier1$ = "bas" GoTo action
    If levier1$ = "haut" GoTo action
    If levier1$ = "gauche" GoTo action
    If levier1$ = "droite" GoTo action


    '                       action si aucune touche n'a ete touch‚e

    spriteavanceA = 0
    spritereculeA = 0

    protegeDA$ = "non": protegeHA$ = "non"

    attenteA = attenteA + 1
    levier1$ = "neutre":

    ' pour se relever
    assisA$ = "non"
    If joueurA$ = "assis2" Then joueurA$ = "releve": Aoccupe$ = "oui": reftemps = temps: GoTo gestion
    If joueurA$ = "assis2R" Then joueurA$ = "releveR": Aoccupe$ = "oui": reftemps = temps: GoTo gestion


    'attente des 5 secondes
    If sens$ = "normal" Then
        If attenteA > 250 Then joueurA$ = "attente": Aoccupe$ = "oui": reftemps = temps: GoTo gestion
    End If
    If sens$ = "inverse" Then
        If attenteA > 250 Then joueurA$ = "attenteR": Aoccupe$ = "oui": reftemps = temps: GoTo gestion
    End If

    ' etat debout
    If sens$ = "normal" Then joueurA$ = "debout"
    If sens$ = "inverse" Then joueurA$ = "deboutR"


    GoTo gestion


    action:

    attenteA = 1 ' remise a zero de l'attente

    '               *********************************************************
    '               ***************** ACTIONS suivant clavier ***************
    '               *********************************************************



    '                       droite,gauche, decapite, devant (normal)


    If sens$ = "normal" Then
        If levier1$ = "droite" Then
            protegeDA$ = "non"
            If spriteavanceA = 1 Then joueurA$ = "avance1": GoTo gestion
            If spriteavanceA = 2 Then joueurA$ = "avance2": GoTo gestion
            If spriteavanceA = 3 Then joueurA$ = "avance3": GoTo gestion
            If spriteavanceA = 4 Then joueurA$ = "avance4": GoTo gestion
            joueurA$ = "avance": reftemps = temps
            If attaqueA$ = "oui" And demo$ = "non" And entree$ = "non" Then joueurA$ = "devant": Aoccupe$ = "oui": reftemps = temps
        End If

        If levier1$ = "gauche" Then
            protegeHA$ = "non"
            If spritereculeA = 1 Then joueurA$ = "recule1": GoTo gestion
            If spritereculeA = 2 Then joueurA$ = "recule2": GoTo gestion
            If spritereculeA = 3 Then joueurA$ = "recule3": GoTo gestion
            If spritereculeA = 4 Then joueurA$ = "recule4": GoTo gestion
            joueurA$ = "recule": reftemps = temps
            If attaqueA$ = "oui" And demo$ = "non" And sortieA$ = "non" Then joueurA$ = "decapite": Aoccupe$ = "oui": reftemps = temps
        End If
    End If

    '                       droite, gauche, decapite, devant (inverse)

    If sens$ = "inverse" Then
        If levier1$ = "droite" Then
            protegeHA$ = "non"
            If spritereculeA = 1 Then joueurA$ = "recule1R": GoTo gestion
            If spritereculeA = 2 Then joueurA$ = "recule2R": GoTo gestion
            If spritereculeA = 3 Then joueurA$ = "recule3R": GoTo gestion
            If spritereculeA = 4 Then joueurA$ = "recule4R": GoTo gestion
            joueurA$ = "reculeR": reftemps = temps
            If attaqueA$ = "oui" And demo$ = "non" Then joueurA$ = "decapiteR": Aoccupe$ = "oui": reftemps = temps:
        End If

        If levier1$ = "gauche" Then
            protegeDA$ = "non"
            If spriteavanceA = 1 Then joueurA$ = "avance1R": GoTo gestion
            If spriteavanceA = 2 Then joueurA$ = "avance2R": GoTo gestion
            If spriteavanceA = 3 Then joueurA$ = "avance3R": GoTo gestion
            If spriteavanceA = 4 Then joueurA$ = "avance4R": GoTo gestion
            joueurA$ = "avanceR": reftemps = temps
            If attaqueA$ = "oui" And demo$ = "non" Then joueurA$ = "devantR": Aoccupe$ = "oui": reftemps = temps
        End If
    End If

    '                           saute, attaque cou

    If sens$ = "normal" Then

        If levier1$ = "haut" Then
            protegeDA$ = "non": protegeHA$ = "non"
            joueurA$ = "saute": Aoccupe$ = "oui": reftemps = temps: GoTo gestion
        End If
    End If

    If sens$ = "inverse" Then
        If levier1$ = "haut" Then
            protegeDA$ = "non": protegeHA$ = "non"
            joueurA$ = "sauteR": Aoccupe$ = "oui": reftemps = temps: GoTo gestion
        End If
    End If



    '                               assis, attaque genou
    If sens$ = "normal" Then
        If levier1$ = "bas" Then
            If assisA$ = "oui" Then joueurA$ = "assis2": GoTo gestion
            joueurA$ = "assis": Aoccupe$ = "oui": reftemps = temps: GoTo gestion
        End If
    End If
    If sens$ = "inverse" Then
        If levier1$ = "bas" Then
            If assisA$ = "oui" Then joueurA$ = "assis2R": GoTo gestion
            joueurA$ = "assisR": Aoccupe$ = "oui": reftemps = temps: GoTo gestion
        End If
    End If


    '                               roulade AV, coup de pied
    If sens$ = "normal" Then
        If levier1$ = "basD" Then
            joueurA$ = "rouladeAV": Aoccupe$ = "oui": reftemps = temps
            If attaqueA$ = "oui" And demo$ = "non" Then joueurA$ = "coupdepied": Aoccupe$ = "oui": reftemps = temps
        End If
    End If
    If sens$ = "inverse" Then
        If levier1$ = "basD" Then
            joueurA$ = "rouladeAVR": Aoccupe$ = "oui": reftemps = temps
            If attaqueA$ = "oui" And demo$ = "non" Then joueurA$ = "coupdepiedR": Aoccupe$ = "oui": reftemps = temps
        End If
    End If



    '                               roulade AR, coup sur front
    If sens$ = "normal" Then
        If levier1$ = "basG" Then
            joueurA$ = "rouladeAR": Aoccupe$ = "oui": reftemps = temps
            If attaqueA$ = "oui" And demo$ = "non" Then joueurA$ = "front": Aoccupe$ = "oui": reftemps = temps
        End If
    End If
    If sens$ = "inverse" Then
        If levier1$ = "basG" Then
            joueurA$ = "rouladeARR": Aoccupe$ = "oui": reftemps = temps
            If attaqueA$ = "oui" And demo$ = "non" Then joueurA$ = "frontR": Aoccupe$ = "oui": reftemps = temps
        End If
    End If

    '                                   protection Haute, araignee
    If sens$ = "normal" Then
        If levier1$ = "hautG" Then
            If protegeHA$ = "oui" Then joueurA$ = "protegeH": GoTo gestion
            joueurA$ = "protegeH1": Aoccupe$ = "oui": reftemps = temps
            If attaqueA$ = "oui" And demo$ = "non" Then joueurA$ = "araignee": Aoccupe$ = "oui": reftemps = temps
        End If
    End If

    If sens$ = "inverse" Then
        If levier1$ = "hautG" Then
            If protegeHA$ = "oui" Then joueurA$ = "protegeHR": GoTo gestion
            joueurA$ = "protegeHR1": Aoccupe$ = "oui": reftemps = temps
            If attaqueA$ = "oui" And demo$ = "non" Then joueurA$ = "araigneeR": Aoccupe$ = "oui": reftemps = temps
        End If
    End If


    '                                   protection devant, coup de tete
    If sens$ = "normal" Then
        If levier1$ = "hautD" Then
            If protegeDA$ = "oui" Then joueurA$ = "protegeD": GoTo gestion
            joueurA$ = "protegeD1": Aoccupe$ = "oui": reftemps = temps
            If attaqueA$ = "oui" And demo$ = "non" Then joueurA$ = "coupdetete": Aoccupe$ = "oui": reftemps = temps
        End If
    End If
    If sens$ = "inverse" Then
        If levier1$ = "hautD" Then
            If protegeDA$ = "oui" Then joueurA$ = "protegeDR": GoTo gestion
            joueurA$ = "protegeDR1": Aoccupe$ = "oui": reftemps = temps
            If attaqueA$ = "oui" And demo$ = "non" Then joueurA$ = "coupdeteteR": Aoccupe$ = "oui": reftemps = temps
        End If
    End If


    '               ********************************************
    '               *************GESTION DES ETATS**************
    '               ********************************************
    gestion:


    If joueurA$ = "attente" Then
        xFA = xA + 4: xTA = xA + 4: xMA = xA + 4: xGA = xA + 4
        If temps > reftemps + 50 Then Aoccupe$ = "non": attenteA = 1: joueurA$ = "debout": GoTo joueur2
        If temps > reftemps + 37 Then spriteA$ = "attente1": GoTo joueur2
        If temps > reftemps + 30 Then spriteA$ = "attente2": GoTo joueur2
        If temps > reftemps + 23 Then spriteA$ = "attente3": GoTo joueur2
        If temps > reftemps + 15 Then spriteA$ = "attente2": GoTo joueur2
        If temps > reftemps + 8 Then GoTo joueur2
        If temps > reftemps + 7 Then _SndPlay attente: spriteA$ = "attente1": GoTo joueur2
    End If

    If joueurA$ = "attenteR" Then
        xFA = xA: xTA = xA: xMA = xA: xGA = xA
        If temps > reftemps + 50 Then Aoccupe$ = "non": attenteA = 1: joueurA$ = "deboutR": GoTo joueur2
        If temps > reftemps + 37 Then spriteA$ = "attente1R": GoTo joueur2
        If temps > reftemps + 30 Then spriteA$ = "attente2R": GoTo joueur2
        If temps > reftemps + 23 Then spriteA$ = "attente3R": GoTo joueur2
        If temps > reftemps + 15 Then spriteA$ = "attente2R": GoTo joueur2
        If temps > reftemps + 8 Then GoTo joueur2
        If temps > reftemps + 7 Then _SndPlay attente: spriteA$ = "attente1R": GoTo joueur2
    End If


    If joueurA$ = "debout" Then
        spriteA$ = "debout"
        decapiteA$ = "oui"
        sangA$ = "non"
        xAttA = xA:: yAttA = 14
        yFA = 15: yTA = 16: yMA = 18: yGA = 20
        xFA = xA + 4: xTA = xA + 4: xMA = xA + 4: xGA = xA + 4
        If demo$ = "oui" Then
            If temps > reftemps + 20 Then Aoccupe$ = "non"
        End If
    End If

    If joueurA$ = "deboutR" Then
        spriteA$ = "deboutR"
        decapiteA$ = "oui"
        sangA$ = "non"
        xAttA = xFA + 4: yAttA = 14
        yFA = 15: yTA = 16: yMA = 18: yGA = 20
        xFA = xA: xTA = xA: xMA = xA: xGA = xA
    End If

    '                               avance

    If joueurA$ = "avance" Then
        xFA = xA + 4: xTA = xA + 4: xMA = xA + 4: xGA = xA + 4
        xAttA = xA
        If attaqueA$ = "oui" And demo$ = "non" And entree$ = "non" Then joueurA$ = "devant": Aoccupe$ = "oui": reftemps = temps: GoTo gestion
        spriteA$ = "marche1": spriteavanceA = 1: xA = xA + 1
    End If

    If joueurA$ = "avance1" Then
        xFA = xA + 4: xTA = xA + 4: xMA = xA + 4: xGA = xA + 4
        xAttA = xA
        If attaqueA$ = "oui" And demo$ = "non" And entree$ = "non" Then joueurA$ = "devant": Aoccupe$ = "oui": reftemps = temps: GoTo gestion
        If temps > reftemps + 9 Then xA = xA + 1: spriteA$ = "marche2": spriteavanceA = 2
    End If


    If joueurA$ = "avance2" Then
        xFA = xA + 4: xTA = xA + 4: xMA = xA + 4: xGA = xA + 4
        xAttA = xA
        spriteA$ = "marche2"
        If attaqueA$ = "oui" And demo$ = "non" And entree$ = "non" Then joueurA$ = "devant": Aoccupe$ = "oui": reftemps = temps: GoTo gestion
        If temps > reftemps + 18 Then xA = xA + 1: spriteA$ = "marche3": spriteavanceA = 3
    End If

    If joueurA$ = "avance3" Then
        xFA = xA + 4: xTA = xA + 4: xMA = xA + 4: xGA = xA + 4
        xAttA = xA
        spriteA$ = "marche3"
        If attaqueA$ = "oui" And demo$ = "non" And entree$ = "non" Then joueurA$ = "devant": Aoccupe$ = "oui": reftemps = temps: GoTo gestion
        If temps > reftemps + 27 Then xA = xA + 1: spriteA$ = "debout": spriteavanceA = 4
    End If

    If joueurA$ = "avance4" Then
        xFA = xA + 4: xTA = xA + 4: xMA = xA + 4: xGA = xA + 4
        xAttA = xA
        spriteA$ = "debout"
        If attaqueA$ = "oui" And demo$ = "non" And entree$ = "non" Then joueurA$ = "devant": Aoccupe$ = "oui": reftemps = temps: GoTo gestion
        If temps > reftemps + 36 Then joueurA$ = "debout": reftemps = temps: spriteavanceA = 0
    End If

    '                                avance invers‚e

    If joueurA$ = "avanceR" Then
        xFA = xA: xTA = xA: xMA = xA: xGA = xA
        xAttA = xA + 4
        If attaqueA$ = "oui" And demo$ = "non" Then joueurA$ = "devantR": Aoccupe$ = "oui": reftemps = temps: GoTo gestion
        spriteA$ = "marche1R": spriteavanceA = 1: xA = xA - 1
    End If

    If joueurA$ = "avance1R" Then
        xFA = xA: xTA = xA: xMA = xA: xGA = xA
        xAttA = xA + 4
        If attaqueA$ = "oui" And demo$ = "non" Then joueurA$ = "devantR": Aoccupe$ = "oui": reftemps = temps: GoTo gestion
        If temps > reftemps + 9 Then xA = xA - 1: spriteA$ = "marche2R": spriteavanceA = 2
    End If


    If joueurA$ = "avance2R" Then
        xFA = xA: xTA = xA: xMA = xA: xGA = xA
        xAttA = xA + 4
        spriteA$ = "marche2R"
        If attaqueA$ = "oui" And demo$ = "non" Then joueurA$ = "devantR": Aoccupe$ = "oui": reftemps = temps: GoTo gestion
        If temps > reftemps + 17 Then xA = xA - 1: spriteA$ = "marche3R": spriteavanceA = 3
    End If

    If joueurA$ = "avance3R" Then
        xFA = xA: xTA = xA: xMA = xA: xGA = xA
        xAttA = xA + 4
        spriteA$ = "marche3R"
        If attaqueA$ = "oui" And demo$ = "non" Then joueurA$ = "devantR": Aoccupe$ = "oui": reftemps = temps: GoTo gestion
        If temps > reftemps + 27 Then xA = xA - 1: spriteA$ = "deboutR": spriteavanceA = 4
    End If

    If joueurA$ = "avance4R" Then
        xFA = xA: xTA = xA: xMA = xA: xGA = xA
        xAttA = xA + 4
        spriteA$ = "deboutR"
        If attaqueA$ = "oui" And demo$ = "non" Then joueurA$ = "devantR": Aoccupe$ = "oui": reftemps = temps: GoTo gestion
        If temps > reftemps + 36 Then joueurA$ = "deboutR": reftemps = temps: spriteavanceA = 0
    End If

    '                               recule
    If joueurA$ = "recule" Then
        xFA = xA + 4: xTA = xA + 4: xMA = xA + 4: xGA = xA + 4
        xAttA = xA
        If attaqueA$ = "oui" And demo$ = "non" And sortieA$ = "non" Then joueurA$ = "decapite": Aoccupe$ = "oui": reftemps = temps: GoTo gestion
        spriteA$ = "marche3": spritereculeA = 1: xA = xA - 1
    End If

    If joueurA$ = "recule1" Then
        xFA = xA + 4: xTA = xA + 4: xMA = xA + 4: xGA = xA + 4
        xAttA = xA
        If attaqueA$ = "oui" And demo$ = "non" And sortieA$ = "non" Then joueurA$ = "decapite": Aoccupe$ = "oui": reftemps = temps: GoTo gestion
        If temps > reftemps + 9 Then xA = xA - 1: spriteA$ = "marche2": spritereculeA = 2
    End If

    If joueurA$ = "recule2" Then
        xFA = xA + 4: xTA = xA + 4: xMA = xA + 4: xGA = xA + 4
        xAttA = xA
        spriteA$ = "marche2"
        If attaqueA$ = "oui" And demo$ = "non" And sortieA$ = "non" Then joueurA$ = "decapite": Aoccupe$ = "oui": reftemps = temps: GoTo gestion
        If temps > reftemps + 18 Then xA = xA - 1: spriteA$ = "marche1": spritereculeA = 3
    End If

    If joueurA$ = "recule3" Then
        xFA = xA + 4: xTA = xA + 4: xMA = xA + 4: xGA = xA + 4
        xAttA = xA
        spriteA$ = "marche1"
        If attaqueA$ = "oui" And demo$ = "non" And sortieA$ = "non" Then joueurA$ = "decapite": Aoccupe$ = "oui": reftemps = temps: GoTo gestion
        If temps > reftemps + 26 Then xA = xA - 1: spriteA$ = "debout": spritereculeA = 4
    End If

    If joueurA$ = "recule4" Then
        xFA = xA + 4: xTA = xA + 4: xMA = xA + 4: xGA = xA + 4
        xAttA = xA
        spriteA$ = "debout"
        If attaqueA$ = "oui" And demo$ = "non" And sortieA$ = "non" Then joueurA$ = "decapite": Aoccupe$ = "oui": reftemps = temps: GoTo gestion
        If temps > reftemps + 36 Then joueurA$ = "debout": reftemps = temps: spritereculeA = 0
    End If

    '                               recule inverse

    If joueurA$ = "reculeR" Then
        xAttA = xA + 4
        xFA = xA: xTA = xA: xMA = xA: xGA = xA
        If attaqueA$ = "oui" And demo$ = "non" Then joueurA$ = "decapiteR": Aoccupe$ = "oui": reftemps = temps: GoTo gestion
        spriteA$ = "marche3R": spritereculeA = 1: xA = xA + 1
    End If

    If joueurA$ = "recule1R" Then
        xAttA = xA + 4
        xFA = xA: xTA = xA: xMA = xA: xGA = xA
        If attaqueA$ = "oui" And demo$ = "non" Then joueurA$ = "decapiteR": Aoccupe$ = "oui": reftemps = temps: GoTo gestion
        If temps > reftemps + 9 Then xA = xA + 1: spriteA$ = "marche2R": spritereculeA = 2
    End If

    If joueurA$ = "recule2R" Then
        xAttA = xA + 4
        xFA = xA: xTA = xA: xMA = xA: xGA = xA
        spriteA$ = "marche2R"
        If attaqueA$ = "oui" And demo$ = "non" Then joueurA$ = "decapiteR": Aoccupe$ = "oui": reftemps = temps: GoTo gestion
        If temps > reftemps + 18 Then xA = xA + 1: spriteA$ = "marche1R": spritereculeA = 3
    End If

    If joueurA$ = "recule3R" Then
        xAttA = xA + 4
        xFA = xA: xTA = xA: xMA = xA: xGA = xA
        spriteA$ = "marche1R"
        If attaqueA$ = "oui" And demo$ = "non" Then joueurA$ = "decapiteR": Aoccupe$ = "oui": reftemps = temps: GoTo gestion
        If temps > reftemps + 26 Then xA = xA + 1: spriteA$ = "deboutR": spritereculeA = 4
    End If

    If joueurA$ = "recule4R" Then
        xAttA = xA + 4
        xFA = xA: xTA = xA: xMA = xA: xGA = xA
        spriteA$ = "deboutR"
        If attaqueA$ = "oui" And demo$ = "non" Then joueurA$ = "decapiteR": Aoccupe$ = "oui": reftemps = temps: GoTo gestion
        If temps > reftemps + 36 Then joueurA$ = "deboutR": reftemps = temps: spritereculeA = 0
    End If

    If joueurA$ = "saute" Then
        xAttA = xA: xFA = xA + 4: xTA = xA + 4: xMA = xA + 4: xGA = xA + 4
        decapiteA$ = "non"
        yGA = yMA: yAttA = 14
        If attaqueA$ = "oui" And demo$ = "non" Then joueurA$ = "cou": Aoccupe$ = "oui": reftemps = temps: GoTo joueur2

        If temps > reftemps + 45 Then Aoccupe$ = "non": joueurA$ = "debout": GoTo joueur2
        If temps > reftemps + 40 Then spriteA$ = "debout": xMA = xA + 4: xGA = xA + 4: GoTo joueur2
        If temps > reftemps + 30 Then spriteA$ = "saut1": xMA = xA + 4: xGA = xA + 1: decapiteA$ = "oui": GoTo joueur2
        If temps > reftemps + 13 Then spriteA$ = "saut2": xMA = xA + 1: xGA = xA + 1: GoTo joueur2
        If temps > reftemps + 2 Then spriteA$ = "saut1": xMA = xA + 4: xGA = xA + 1
        spriteA$ = "saut1"
    End If

    If joueurA$ = "sauteR" Then
        xAttA = xA + 4: xFA = xA: xTA = xA: xMA = xA: xGA = xA
        decapiteA$ = "non"
        yGA = yMA: yAttA = 14
        If attaqueA$ = "oui" And demo$ = "non" Then joueurA$ = "couR": Aoccupe$ = "oui": reftemps = temps: GoTo joueur2

        If temps > reftemps + 45 Then Aoccupe$ = "non": joueurA$ = "deboutR": GoTo joueur2
        If temps > reftemps + 40 Then spriteA$ = "deboutR": xMA = xA: xGA = xA: GoTo joueur2
        If temps > reftemps + 30 Then spriteA$ = "saut1R": xMA = xA: xGA = xA + 1: decapiteA$ = "oui": GoTo joueur2
        If temps > reftemps + 13 Then spriteA$ = "saut2R": xMA = xA + 3: xGA = xA + 3: GoTo joueur2
        If temps > reftemps + 2 Then spriteA$ = "saut1R": xMA = xA: xGA = xA + 3
        spriteA$ = "saut1R"
    End If

    If joueurA$ = "assis" Then
        xAttA = xA
        xFA = xA: xTA = xA: xMA = xA: xGA = xA + 4
        spriteA$ = "assis1"
        If temps > reftemps + 10 Then joueurA$ = "assis2": GoTo joueur2
        If attaqueA$ = "oui" And demo$ = "non" Then joueurA$ = "genou": Aoccupe$ = "oui": reftemps = temps
    End If

    If joueurA$ = "assis2" Then
        Aoccupe$ = "non"
        assisA$ = "oui"
        xAttA = xA
        xFA = xA: xTA = xA: xMA = xA + 4: xGA = xA + 4
        spriteA$ = "assis2"
        If attaqueA$ = "oui" And demo$ = "non" Then joueurA$ = "genou": Aoccupe$ = "oui": reftemps = temps
        If demo$ = "oui" Then
            If temps > reftemps + 20 Then Aoccupe$ = "non"
            GoTo joueur2
        End If

    End If

    If joueurA$ = "releve" Then
        xAttA = xA: yAttA = 14
        xFA = xA: xTA = xA: xMA = xA + 4: xGA = xA + 4
        spriteA$ = "assis1"
        If temps > reftemps + 10 Then joueurA$ = "debout": Aoccupe$ = "non": GoTo joueur2
        If attaqueA$ = "oui" And demo$ = "non" Then joueurA$ = "genou": Aoccupe$ = "oui": reftemps = temps
    End If


    If joueurA$ = "assisR" Then
        xAttA = xA + 4
        xFA = xA + 4: xTA = xA + 4: xMA = xA + 4: xGA = xA
        spriteA$ = "assis1R"
        If temps > reftemps + 10 Then joueurA$ = "assis2R": GoTo joueur2
        If attaqueA$ = "oui" And demo$ = "non" Then joueurA$ = "genouR": Aoccupe$ = "oui": reftemps = temps
    End If

    If joueurA$ = "assis2R" Then
        Aoccupe$ = "non"
        assisA$ = "oui"
        xAttA = xA + 4
        xFA = xA + 4: xTA = xA + 4: xMA = xA: xGA = xA
        spriteA$ = "assis2R"
        If attaqueA$ = "oui" And demo$ = "non" Then joueurA$ = "genouR": Aoccupe$ = "oui": reftemps = temps
    End If

    If joueurA$ = "releveR" Then
        xAttA = xA + 4: yAttA = 14
        xFA = xA + 4: xTA = xA + 4: xMA = xA: xGA = xA
        spriteA$ = "assis1R"
        If temps > reftemps + 10 Then joueurA$ = "deboutR": Aoccupe$ = "non": GoTo joueur2
        If attaqueA$ = "oui" And demo$ = "non" Then joueurA$ = "genouR": Aoccupe$ = "oui": reftemps = temps
    End If

    If joueurA$ = "rouladeAV" Then
        xFA = xA: xTA = xA: xMA = xA: xGA = xA
        yGA = 20: yAttA = yGA: xAttA = xA: yTA = yGA
        If attaqueA$ = "oui" And demo$ = "non" Then yTA = 16: joueurA$ = "coupdepied": Aoccupe$ = "oui": reftemps = temps: GoTo gestion
        If temps > reftemps + 38 Then
            spriteA$ = "debout": xTA = xA + 4: xMA = xA + 4: yTA = 16:
            Aoccupe$ = "non": xA = xA + 1: joueurA$ = "finderoulade": GoTo finderoulade
        End If
        If temps > reftemps + 33 Then spriteA$ = "debout": GoTo joueur2
        If temps > reftemps + 31 Then GoTo joueur2
        If temps > reftemps + 30 Then xA = xA + 1: spriteA$ = "roulade6": GoTo joueur2
        If temps > reftemps + 29 Then GoTo joueur2
        If temps > reftemps + 28 Then xA = xA + 1: spriteA$ = "roulade5": GoTo joueur2
        If temps > reftemps + 26 Then GoTo joueur2
        If temps > reftemps + 25 Then xA = xA + 1: spriteA$ = "roulade5": GoTo joueur2
        If temps > reftemps + 23 Then GoTo joueur2
        If temps > reftemps + 22 Then xA = xA + 1: spriteA$ = "roulade4": GoTo joueur2
        If temps > reftemps + 20 Then GoTo joueur2
        If temps > reftemps + 19 Then xA = xA + 1: spriteA$ = "roulade4": GoTo joueur2
        If temps > reftemps + 17 Then GoTo joueur2
        If temps > reftemps + 16 Then xA = xA + 1: xAttA = xA + 5: spriteA$ = "roulade3": GoTo joueur2
        If temps > reftemps + 14 Then GoTo joueur2
        If temps > reftemps + 13 Then xA = xA + 1: xAttA = xA + 5: spriteA$ = "roulade3": GoTo joueur2
        If temps > reftemps + 11 Then GoTo joueur2
        If temps > reftemps + 10 Then xA = xA + 1: spriteA$ = "roulade2": GoTo joueur2
        If temps > reftemps + 8 Then GoTo joueur2
        If temps > reftemps + 7 Then xA = xA + 1: spriteA$ = "roulade2": GoTo joueur2
        If temps > reftemps + 5 Then GoTo joueur2
        If temps > reftemps + 4 Then xA = xA + 1: spriteA$ = "roulade1": GoTo joueur2
        If temps > reftemps + 2 Then GoTo joueur2
        If temps > reftemps + 1 Then _SndPlay roule: xA = xA + 1: spriteA$ = "roulade1": GoTo joueur2

    End If

    finderoulade:

    If joueurA$ = "finderoulade" Then
        If xA < xB Then
            joueurA$ = "debout"
            spriteA$ = "debout"
            xAttA = xA: yGA = 20: yAttA = 17
            xFA = xA + 4: xTA = xA + 4: xMA = xA + 4: xGA = xA + 4
            yFA = 15: yTA = 16: yMA = 18: yGA = 20
            GoTo joueur2
        End If
        If xA > xB - 1 Then
            joueurA$ = "retourne": yAttA = 14: Aoccupe$ = "oui": reftemps = temps
            joueurB$ = "retourne": yAttB = 14: Boccupe$ = "oui": reftempsB = temps
            GoTo affichage
        End If

    End If

    If joueurA$ = "rouladeAVR" Then
        xFA = xA + 4: xTA = xA + 4: xMA = xA + 4: xGA = xA + 4
        yGA = 20: yAttA = yGA: xAttA = xA + 4: yTA = yGA
        If attaqueA$ = "oui" And demo$ = "non" Then joueurA$ = "coupdepiedR": Aoccupe$ = "oui": reftemps = temps: GoTo gestion
        If temps > reftemps + 38 Then
            spriteA$ = "deboutR": xTA = xA: xMA = xA:
            Aoccupe$ = "non": xA = xA - 1: joueurA$ = "finderouladeR": GoTo finderouladeR
        End If
        If temps > reftemps + 33 Then yTA = 16: spriteA$ = "deboutR": GoTo joueur2
        If temps > reftemps + 31 Then GoTo joueur2
        If temps > reftemps + 30 Then xA = xA - 1: spriteA$ = "roulade6R": GoTo joueur2
        If temps > reftemps + 29 Then GoTo joueur2
        If temps > reftemps + 28 Then xA = xA - 1: spriteA$ = "roulade5R": GoTo joueur2
        If temps > reftemps + 26 Then GoTo joueur2
        If temps > reftemps + 25 Then xA = xA - 1: spriteA$ = "roulade5R": GoTo joueur2
        If temps > reftemps + 23 Then GoTo joueur2
        If temps > reftemps + 22 Then xA = xA - 1: spriteA$ = "roulade4R": GoTo joueur2
        If temps > reftemps + 20 Then GoTo joueur2
        If temps > reftemps + 19 Then xA = xA - 1: spriteA$ = "roulade4R": GoTo joueur2
        If temps > reftemps + 17 Then GoTo joueur2
        If temps > reftemps + 16 Then xA = xA - 1: xAttA = xA - 1: spriteA$ = "roulade3R": GoTo joueur2
        If temps > reftemps + 14 Then GoTo joueur2
        If temps > reftemps + 13 Then xA = xA - 1: xAttA = xA - 1: spriteA$ = "roulade3R": GoTo joueur2
        If temps > reftemps + 11 Then GoTo joueur2
        If temps > reftemps + 10 Then xA = xA - 1: spriteA$ = "roulade2R": GoTo joueur2
        If temps > reftemps + 8 Then GoTo joueur2
        If temps > reftemps + 7 Then xA = xA - 1: spriteA$ = "roulade2R": GoTo joueur2
        If temps > reftemps + 5 Then GoTo joueur2
        If temps > reftemps + 4 Then xA = xA - 1: spriteA$ = "roulade1R": GoTo joueur2
        If temps > reftemps + 2 Then GoTo joueur2
        If temps > reftemps + 1 Then _SndPlay roule: xA = xA - 1: spriteA$ = "roulade1R": GoTo joueur2
    End If

    finderouladeR:

    If joueurA$ = "finderouladeR" Then
        If xA > xB Then
            joueurA$ = "deboutR"
            spriteA$ = "deboutR"
            xAttA = xA + 4: yGA = 20: yAttA = 17
            xFA = xA: xTA = xA: xMA = xA: xGA = xA
            yFA = 15: yTA = 16: yMA = 18: yGA = 20
            GoTo joueur2
        End If
        If xA < xB + 1 Then
            joueurA$ = "retourneR": yAttA = 14: Aoccupe$ = "oui": reftemps = temps
            joueurB$ = "retourneR": yAttB = 14: Boccupe$ = "oui": reftempsB = temps
            GoTo affichage
        End If

    End If

    If joueurA$ = "rouladeAR" Then
        xFA = xA: xTA = xA: xMA = xA: xGA = xA
        yGA = 20: yAttA = yGA: xAttA = xA
        If attaqueA$ = "oui" And demo$ = "non" Then joueurA$ = "front": Aoccupe$ = "oui": reftemps = temps: GoTo gestion
        If temps > reftemps + 38 Then
            spriteA$ = "debout": xTA = xA + 4: xMA = xA + 4:
            Aoccupe$ = "non": joueurA$ = "debout": GoTo colision
        End If
        If temps > reftemps + 33 Then spriteA$ = "debout": GoTo joueur2
        If temps > reftemps + 30 Then GoTo joueur2
        If temps > reftemps + 29 Then xA = xA - 1: spriteA$ = "roulade1": GoTo joueur2
        If temps > reftemps + 27 Then GoTo joueur2
        If temps > reftemps + 26 Then xA = xA - 1: spriteA$ = "roulade1": GoTo joueur2
        If temps > reftemps + 24 Then GoTo joueur2
        If temps > reftemps + 23 Then xA = xA - 1: spriteA$ = "roulade2": GoTo joueur2
        If temps > reftemps + 21 Then GoTo joueur2
        If temps > reftemps + 20 Then xA = xA - 1: spriteA$ = "roulade2": GoTo joueur2
        If temps > reftemps + 18 Then GoTo joueur2
        If temps > reftemps + 17 Then xA = xA - 1: spriteA$ = "roulade3": GoTo joueur2
        If temps > reftemps + 15 Then GoTo joueur2
        If temps > reftemps + 14 Then xA = xA - 1: spriteA$ = "roulade3": GoTo joueur2
        If temps > reftemps + 12 Then GoTo joueur2
        If temps > reftemps + 11 Then xA = xA - 1: spriteA$ = "roulade4": GoTo joueur2
        If temps > reftemps + 9 Then GoTo joueur2
        If temps > reftemps + 8 Then xA = xA - 1: spriteA$ = "roulade4": GoTo joueur2
        If temps > reftemps + 6 Then GoTo joueur2
        If temps > reftemps + 5 Then xA = xA - 1: spriteA$ = "roulade5": GoTo joueur2
        If temps > reftemps + 3 Then GoTo joueur2
        If temps > reftemps + 2 Then xA = xA - 1: spriteA$ = "roulade6": GoTo joueur2
        If temps > reftemps + 1 Then _SndPlay roule: spriteA$ = "roulade6": GoTo joueur2
    End If

    If joueurA$ = "rouladeARR" Then
        xFA = xA + 4: xTA = xA + 4: xMA = xA + 4: xGA = xA + 4
        yGA = 20: yAttA = yGA: xAttA = xA + 4
        If attaqueA$ = "oui" And demo$ = "non" Then joueurA$ = "frontR": Aoccupe$ = "oui": reftemps = temps: GoTo gestion
        If temps > reftemps + 38 Then
            spriteA$ = "deboutR": xTA = xA: xMA = xA:
            Aoccupe$ = "non": joueurA$ = "deboutR": GoTo joueur2
        End If
        If temps > reftemps + 33 Then spriteA$ = "deboutR": GoTo joueur2
        If temps > reftemps + 30 Then GoTo joueur2
        If temps > reftemps + 29 Then xA = xA + 1: spriteA$ = "roulade1R": GoTo joueur2
        If temps > reftemps + 27 Then GoTo joueur2
        If temps > reftemps + 26 Then xA = xA + 1: spriteA$ = "roulade2R": GoTo joueur2
        If temps > reftemps + 24 Then GoTo joueur2
        If temps > reftemps + 23 Then xA = xA + 1: spriteA$ = "roulade2R": GoTo joueur2
        If temps > reftemps + 21 Then GoTo joueur2
        If temps > reftemps + 20 Then xA = xA + 1: spriteA$ = "roulade3R": GoTo joueur2
        If temps > reftemps + 18 Then GoTo joueur2
        If temps > reftemps + 17 Then xA = xA + 1: spriteA$ = "roulade3R": GoTo joueur2
        If temps > reftemps + 15 Then GoTo joueur2
        If temps > reftemps + 14 Then xA = xA + 1: spriteA$ = "roulade4R": GoTo joueur2
        If temps > reftemps + 12 Then GoTo joueur2
        If temps > reftemps + 11 Then xA = xA + 1: spriteA$ = "roulade4R": GoTo joueur2
        If temps > reftemps + 9 Then GoTo joueur2
        If temps > reftemps + 8 Then xA = xA + 1: spriteA$ = "roulade5R": GoTo joueur2
        If temps > reftemps + 6 Then GoTo joueur2
        If temps > reftemps + 5 Then xA = xA + 1: spriteA$ = "roulade5R": GoTo joueur2
        If temps > reftemps + 3 Then GoTo joueur2
        If temps > reftemps + 2 Then xA = xA + 1: spriteA$ = "roulade6R": GoTo joueur2
        If temps > reftemps + 1 Then _SndPlay roule: spriteA$ = "roulade6R": GoTo joueur2
    End If

    If joueurA$ = "protegeH1" Then
        xFA = xA + 4: xTA = xA + 4: xMA = xA + 4: xGA = xA + 4
        xAttA = xA
        yGA = 20
        If attaqueA$ = "oui" And demo$ = "non" Then joueurA$ = "araignee": Aoccupe$ = "oui": reftemps = temps: GoTo gestion
        If temps > reftemps + 5 Then protegeHA$ = "oui": spriteA$ = "protegeH": Aoccupe$ = "non": GoTo joueur2
        If temps > reftemps + 2 Then GoTo joueur2
        If temps > reftemps + 1 Then _SndPlay protege: xA = xA - 1: spriteA$ = "marche1": GoTo joueur2
    End If

    If joueurA$ = "protegeH" Then
        xFA = xA + 4: xTA = xA + 4: xMA = xA + 4: xGA = xA + 4
        xAttA = xA
        yGA = 20
        spriteA$ = "protegeH"
        If attaqueA$ = "oui" And demo$ = "non" Then joueurA$ = "araignee": Aoccupe$ = "oui": reftemps = temps: GoTo gestion
    End If

    If joueurA$ = "protegeHR1" Then
        xFA = xA: xTA = xA: xMA = xA: xGA = xA
        xAttA = xA + 4
        yGA = 20
        If attaqueA$ = "oui" And demo$ = "non" Then joueurA$ = "araigneeR": Aoccupe$ = "oui": reftemps = temps: GoTo gestion
        If temps > reftemps + 5 Then protegeHA$ = "oui": joueurA$ = "protegeHR": Aoccupe$ = "non": GoTo joueur2
        If temps > reftemps + 2 Then GoTo joueur2
        If temps > reftemps + 1 Then _SndPlay protege: xA = xA + 1: spriteA$ = "marche1R": GoTo joueur2
    End If

    If joueurA$ = "protegeHR" Then
        xFA = xA: xTA = xA: xMA = xA: xGA = xA
        xAttA = xA + 4
        yGA = 20
        spriteA$ = "protegeHR"
        If attaqueA$ = "oui" And demo$ = "non" Then joueurA$ = "araigneeR": Aoccupe$ = "oui": reftemps = temps: GoTo gestion
    End If

    If joueurA$ = "protegeD1" Then
        xAttA = xA
        yGA = 20
        xFA = xA + 4: xTA = xA + 4: xMA = xA + 4: xGA = xA + 4
        decapiteA$ = "non"
        spriteA$ = "protegeH"
        If attaqueA$ = "oui" And demo$ = "non" Then joueurA$ = "coupdetete": Aoccupe$ = "oui": reftemps = temps: GoTo gestion
        If temps > reftemps + 5 Then joueurA$ = "protegeD": protegeDA$ = "oui": Aoccupe$ = "non"
        If temps > reftemps + 2 Then GoTo joueur2
        If temps > reftemps + 1 Then _SndPlay protege
    End If

    If joueurA$ = "protegeD" Then
        xAttA = xA
        yGA = 20
        xFA = xA + 4: xTA = xA + 4: xMA = xA + 4: xGA = xA + 4
        decapiteA$ = "non"
        spriteA$ = "protegeD"
        If attaqueA$ = "oui" And demo$ = "non" Then joueurA$ = "coupdetete": Aoccupe$ = "oui": reftemps = temps
    End If

    If joueurA$ = "protegeDR1" Then
        xAttA = xA + 4
        yGA = 20
        xFA = xA: xTA = xA: xMA = xA: xGA = xA
        decapiteA$ = "non"
        spriteA$ = "protegeHR"
        If attaqueA$ = "oui" And demo$ = "non" Then joueurA$ = "coupdeteteR": Aoccupe$ = "oui": reftemps = temps: GoTo gestion
        If temps > reftemps + 5 Then spriteA$ = "protegeDR": protegeDA$ = "oui": Aoccupe$ = "non"
        If temps > reftemps + 2 Then GoTo joueur2
        If temps > reftemps + 1 Then _SndPlay protege
    End If

    If joueurA$ = "protegeDR" Then
        xAttA = xA + 4
        yGA = 20
        xFA = xA: xTA = xA: xMA = xA: xGA = xA
        decapiteA$ = "non"
        spriteA$ = "protegeDR"
        If attaqueA$ = "oui" And demo$ = "non" Then joueurA$ = "coupdeteteR": Aoccupe$ = "oui": reftemps = temps: GoTo gestion
    End If

    If joueurA$ = "cou" Then '****attention au temps sinon il saute
        xFA = xA + 4: xTA = xA + 4: xMA = xA + 4: xGA = xA + 4
        yGA = 20
        If temps > reftemps + 45 Then Aoccupe$ = "non": joueurA$ = "debout": GoTo joueur2
        If temps > reftemps + 40 Then spriteA$ = "cou2": xAttA = xA: GoTo joueur2
        If temps > reftemps + 31 Then xAttA = xA: GoTo joueur2
        If temps > reftemps + 30 Then
            spriteA$ = "cou3"
            If joueurB$ = "cou" Then
                If distance < 12 Then
                    soncling = soncling + 1
                    If soncling > 3 Then soncling = 1
                    If soncling = 1 Then _SndPlay cling
                    If soncling = 2 Then _SndPlay cling2
                    If soncling = 3 Then _SndPlay cling3
                End If
                GoTo joueur2
            End If
            xTA = xA: xAttA = xA + 7: GoTo joueur2
        End If
        If temps > reftemps + 16 Then GoTo joueur2
        If temps > reftemps + 15 Then _SndPlay epee: spriteA$ = "cou2": yAttA = yTA: GoTo joueur2
        If temps > reftemps + 4 Then GoTo joueur2
        If temps > reftemps + 3 Then
            songrogne = songrogne + 1
            If songrogne > 6 Then songrogne = 0
            If songrogne = 3 Then _SndPlay grogne1
            If songrogne = 6 Then _SndPlay grogne2
            spriteA$ = "cou1": GoTo joueur2
        End If
    End If

    If joueurA$ = "couR" Then '****attention au temps sinon il saute
        xFA = xA: xTA = xA: xMA = xA: xGA = xA
        yGA = 20
        If temps > reftemps + 45 Then Aoccupe$ = "non": joueurA$ = "deboutR": GoTo joueur2
        If temps > reftemps + 40 Then spriteA$ = "cou2R": xAttA = xA + 4: GoTo joueur2
        If temps > reftemps + 31 Then xAttA = xA + 4: GoTo joueur2
        If temps > reftemps + 30 Then
            spriteA$ = "cou3R"
            If joueurB$ = "couR" Then
                If distance < 12 Then
                    soncling = soncling + 1
                    If soncling > 3 Then soncling = 1
                    If soncling = 1 Then _SndPlay cling
                    If soncling = 2 Then _SndPlay cling2
                    If soncling = 3 Then _SndPlay cling3
                End If
                GoTo joueur2
            End If
            xTA = xA + 4: xAttA = xA - 3: GoTo joueur2
        End If
        If temps > reftemps + 16 Then GoTo joueur2
        If temps > reftemps + 15 Then _SndPlay epee: spriteA$ = "cou2R": yAttA = yTA: GoTo joueur2
        If temps > reftemps + 4 Then GoTo joueur2
        If temps > reftemps + 3 Then
            songrogne = songrogne + 1
            If songrogne > 6 Then songrogne = 0
            If songrogne = 3 Then _SndPlay grogne1
            If songrogne = 6 Then _SndPlay grogne2
            spriteA$ = "cou1R": GoTo joueur2
        End If
    End If

    If joueurA$ = "devant" Then
        xFA = xA + 4: xTA = xA + 4: xMA = xA + 4: xGA = xA + 4
        yGA = 20
        If temps > reftemps + 45 Then Aoccupe$ = "non": joueurA$ = "debout": GoTo joueur2
        If temps > reftemps + 40 Then spriteA$ = "devant2": GoTo joueur2
        If temps > reftemps + 21 Then spriteA$ = "devant3": xAttA = xA: GoTo joueur2
        If temps > reftemps + 20 Then
            spriteA$ = "devant3"
            If joueurB$ = "devant" Then
                If distance < 12 Then
                    soncling = soncling + 1
                    If soncling > 3 Then soncling = 1
                    If soncling = 1 Then _SndPlay cling
                    If soncling = 2 Then _SndPlay cling2
                    If soncling = 3 Then _SndPlay cling3
                End If
                GoTo joueur2
            End If
            xMA = xA: xAttA = xA + 6: GoTo joueur2
        End If
        If temps > reftemps + 11 Then GoTo joueur2
        If temps > reftemps + 10 Then
            songrogne = songrogne + 1
            If songrogne > 6 Then songrogne = 0
            If songrogne = 3 Then _SndPlay grogne1
            If songrogne = 6 Then _SndPlay grogne2
            _SndPlay epee: spriteA$ = "devant2": yAttA = yMA: GoTo joueur2
        End If
        spriteA$ = "devant1"
    End If

    If joueurA$ = "devantR" Then
        xFA = xA: xTA = xA: xMA = xA: xGA = xA
        yGA = 20
        If temps > reftemps + 45 Then Aoccupe$ = "non": joueurA$ = "deboutR": GoTo joueur2
        If temps > reftemps + 40 Then spriteA$ = "devant2R": GoTo joueur2
        If temps > reftemps + 21 Then spriteA$ = "devant3R": xAttA = xA + 4: GoTo joueur2
        If temps > reftemps + 20 Then
            spriteA$ = "devant3R"
            If joueurB$ = "devantR" Then
                If distance < 12 Then
                    soncling = soncling + 1
                    If soncling > 3 Then soncling = 1
                    If soncling = 1 Then _SndPlay cling
                    If soncling = 2 Then _SndPlay cling2
                    If soncling = 3 Then _SndPlay cling3
                End If
                GoTo joueur2
            End If
            xMA = xA + 4: xAttA = xA - 2: GoTo joueur2
        End If
        If temps > reftemps + 11 Then GoTo joueur2
        If temps > reftemps + 10 Then
            songrogne = songrogne + 1
            If songrogne > 6 Then songrogne = 0
            If songrogne = 3 Then _SndPlay grogne1
            If songrogne = 6 Then _SndPlay grogne2
            _SndPlay epee: spriteA$ = "devant2R": yAttA = yMA: GoTo joueur2
        End If
        spriteA$ = "devant1R"
    End If

    If joueurA$ = "genou" Then
        xFA = xA: xTA = xA: xMA = xA: xGA = xA + 4
        yGA = 20
        If temps > reftemps + 45 Then Aoccupe$ = "non": joueurA$ = "assis2": GoTo joueur2
        If temps > reftemps + 40 Then spriteA$ = "genou2": GoTo joueur2
        If temps > reftemps + 21 Then spriteA$ = "genou3": xAttA = xA: GoTo joueur2
        If temps > reftemps + 20 Then
            spriteA$ = "genou3":
            If joueurB$ = "genou" Then
                If distance < 12 Then
                    soncling = soncling + 1
                    If soncling > 3 Then soncling = 1
                    If soncling = 1 Then _SndPlay cling
                    If soncling = 2 Then _SndPlay cling2
                    If soncling = 3 Then _SndPlay cling3
                End If
                GoTo joueur2
            End If
            xGA = xA: xAttA = xA + 7: GoTo joueur2
        End If
        If temps > reftemps + 11 Then GoTo joueur2
        If temps > reftemps + 10 Then
            songrogne = songrogne + 1
            If songrogne > 6 Then songrogne = 0
            If songrogne = 3 Then _SndPlay grogne1
            If songrogne = 6 Then _SndPlay grogne2
            _SndPlay epee: spriteA$ = "genou2": yAttA = yGA: GoTo joueur2
        End If
        spriteA$ = "genou1"
    End If

    If joueurA$ = "genouR" Then
        yGA = 20
        xFA = xA + 4: xTA = xA + 4: xMA = xA + 4: xGA = xA
        If temps > reftemps + 45 Then Aoccupe$ = "non": joueurA$ = "assis2R": GoTo joueur2
        If temps > reftemps + 40 Then spriteA$ = "genou2R": GoTo joueur2
        If temps > reftemps + 21 Then spriteA$ = "genou3R": xAttA = xA + 4: GoTo joueur2
        If temps > reftemps + 20 Then
            spriteA$ = "genou3R"
            If joueurB$ = "genouR" Then
                If distance < 12 Then
                    soncling = soncling + 1
                    If soncling > 3 Then soncling = 1
                    If soncling = 1 Then _SndPlay cling
                    If soncling = 2 Then _SndPlay cling2
                    If soncling = 3 Then _SndPlay cling3
                End If
                GoTo joueur2
            End If
            xGA = xA + 4: xAttA = xA - 3: GoTo joueur2
        End If
        If temps > reftemps + 11 Then GoTo joueur2
        If temps > reftemps + 10 Then
            songrogne = songrogne + 1
            If songrogne > 6 Then songrogne = 0
            If songrogne = 3 Then _SndPlay grogne1
            If songrogne = 6 Then _SndPlay grogne2
            _SndPlay epee: spriteA$ = "genou2R": yAttA = yGA: GoTo joueur2
        End If
        spriteA$ = "genou1R"
    End If

    If joueurA$ = "araignee" Then
        xFA = xA + 4: xTA = xA + 4: xMA = xA: xGA = xA + 4
        yAttA = yGA: xAttA = xA: yGA = 20
        If temps > reftemps + 24 Then Aoccupe$ = "non": joueurA$ = "debout": GoTo joueur2
        If temps > reftemps + 19 Then xAttA = xA: GoTo joueur2
        If temps > reftemps + 18 Then
            _SndPlay epee
            spriteA$ = "toile4"
            If joueurB$ = "araignee" Then
                If distance < 12 Then
                    soncling = soncling + 1
                    If soncling > 3 Then soncling = 1
                    If soncling = 1 Then _SndPlay cling
                    If soncling = 2 Then _SndPlay cling2
                    If soncling = 3 Then _SndPlay cling3
                End If
                GoTo joueur2
            End If
            xAttA = xA + 5: GoTo joueur2
        End If
        If temps > reftemps + 12 Then spriteA$ = "toile3": xAttA = xA: GoTo joueur2
        If temps > reftemps + 7 Then GoTo joueur2
        If temps > reftemps + 6 Then
            songrogne = songrogne + 1
            If songrogne > 6 Then songrogne = 0
            If songrogne = 3 Then _SndPlay grogne1
            If songrogne = 6 Then _SndPlay grogne2
            _SndPlay epee: spriteA$ = "toile2": xAttA = xA: GoTo joueur2
        End If
        spriteA$ = "toile1"
    End If

    If joueurA$ = "araigneeR" Then
        xFA = xA: xTA = xA: xMA = xA + 4: xGA = xA
        yAttA = yGA: xAttA = xA + 4: yGA = 20
        If temps > reftemps + 24 Then Aoccupe$ = "non": joueurA$ = "deboutR": GoTo joueur2
        If temps > reftemps + 19 Then xAttA = xA + 4: GoTo joueur2
        If temps > reftemps + 18 Then
            _SndPlay epee
            spriteA$ = "toile4R"
            If joueurB$ = "araigneeR" Then
                If distance < 12 Then
                    soncling = soncling + 1
                    If soncling > 3 Then soncling = 1
                    If soncling = 1 Then _SndPlay cling
                    If soncling = 2 Then _SndPlay cling2
                    If soncling = 3 Then _SndPlay cling3
                End If
                GoTo joueur2
            End If
            xAttA = xA - 1: GoTo joueur2
        End If
        If temps > reftemps + 12 Then spriteA$ = "toile3R": xAttA = xA + 4: GoTo joueur2
        If temps > reftemps + 7 Then GoTo joueur2
        If temps > reftemps + 6 Then
            songrogne = songrogne + 1
            If songrogne > 6 Then songrogne = 0
            If songrogne = 3 Then _SndPlay grogne1
            If songrogne = 6 Then _SndPlay grogne2
            _SndPlay epee: spriteA$ = "toile2R": xAttA = xA + 4: GoTo joueur2
        End If
        spriteA$ = "toile1R"
    End If

    If joueurA$ = "coupdepied" Then
        xFA = xA + 4: xTA = xA + 4: xMA = xA + 4: xGA = xA + 4
        spriteA$ = "pied1": yAttA = yGA: yGA = 20
        If temps > reftemps + 15 Then spriteA$ = "pied2": xAttA = xA + 5
        If temps > reftemps + 16 Then spriteA$ = "pied2": xAttA = xA
        If temps > reftemps + 30 Then spriteA$ = "pied1"
        If temps > reftemps + 45 Then spriteA$ = "debout"
        If temps > reftemps + 50 Then Aoccupe$ = "non": joueurA$ = "debout"
    End If

    If joueurA$ = "coupdepiedR" Then
        xFA = xA: xTA = xA: xMA = xA: xGA = xA
        spriteA$ = "pied1R": yAttA = yGA: yGA = 20
        If temps > reftemps + 15 Then spriteA$ = "pied2R": xAttA = xA - 1
        If temps > reftemps + 16 Then spriteA$ = "pied2R": xAttA = xA + 4
        If temps > reftemps + 30 Then spriteA$ = "pied1R"
        If temps > reftemps + 45 Then spriteA$ = "deboutR"
        If temps > reftemps + 50 Then Aoccupe$ = "non": joueurA$ = "deboutR"
    End If

    If joueurA$ = "coupdetete" Then
        xFA = xA + 4: xTA = xA + 4: xMA = xA + 4: xGA = xA + 4
        yGA = 20
        If temps > reftemps + 37 Then Aoccupe$ = "non": spriteA$ = "debout": joueurA$ = "debout": GoTo joueur2
        If temps > reftemps + 29 Then GoTo joueur2
        If temps > reftemps + 28 Then xA = xA - 1: spriteA$ = "tete1": GoTo joueur2
        If temps > reftemps + 20 Then xAttA = xA: GoTo joueur2
        If temps > reftemps + 19 Then spriteA$ = "tete2": xAttA = xA + 4: GoTo joueur2
        If temps > reftemps + 18 Then xA = xA + 1: spriteA$ = "tete2": xAttA = xA: GoTo joueur2
        If temps > reftemps + 9 Then spriteA$ = "tete1": yAttA = yTA: GoTo joueur2
        spriteA$ = "tete1"
    End If

    If joueurA$ = "coupdeteteR" Then
        xFA = xA: xTA = xA: xMA = xA: xGA = xA
        yGA = 20: yTA = 16
        If temps > reftemps + 37 Then Aoccupe$ = "non": spriteA$ = "deboutR": joueurA$ = "deboutR": GoTo joueur2
        If temps > reftemps + 29 Then GoTo joueur2
        If temps > reftemps + 28 Then xA = xA + 1: spriteA$ = "tete1R": GoTo joueur2
        If temps > reftemps + 20 Then xAttA = xA + 4: GoTo joueur2
        If temps > reftemps + 19 Then spriteA$ = "tete2R": xAttA = xA: GoTo joueur2
        If temps > reftemps + 18 Then xA = xA - 1: spriteA$ = "tete2R": xAttA = xA + 4: GoTo joueur2
        If temps > reftemps + 9 Then spriteA$ = "tete1R": yAttA = yTA: GoTo joueur2
        spriteA$ = "tete1R"
    End If

    If joueurA$ = "decapite" Then
        decapiteA$ = "non"
        xFA = xA + 3: xTA = xA + 2: xMA = xA + 2: xGA = xA + 4
        If temps > reftemps + 58 Then Aoccupe$ = "non": spriteA$ = "debout": joueurA$ = "debout": GoTo joueur2
        If temps > reftemps + 51 Then spriteA$ = "cou2": xAttA = xA: GoTo joueur2
        If temps > reftemps + 50 Then spriteA$ = "cou3": xTA = xA: xAttA = xA + 6: GoTo joueur2
        If temps > reftemps + 39 Then spriteA$ = "cou3": yAttA = yTA: GoTo joueur2
        If temps > reftemps + 33 Then spriteA$ = "cou2": yAttA = yTA: GoTo joueur2
        If temps > reftemps + 29 Then spriteA$ = "cou1": yAttA = yTA: GoTo joueur2
        If temps > reftemps + 25 Then GoTo joueur2
        If temps > reftemps + 24 Then xA = xA + 1: GoTo joueur2
        If temps > reftemps + 20 Then spriteA$ = "retourne3": GoTo joueur2
        If temps > reftemps + 19 Then xA = xA + 1: GoTo joueur2
        If temps > reftemps + 15 Then spriteA$ = "retourne3": GoTo joueur2
        If temps > reftemps + 14 Then _SndPlay decapite: xA = xA + 1: GoTo joueur2
        If temps > reftemps + 10 Then spriteA$ = "retourne2": GoTo joueur2
        If temps > reftemps + 9 Then xA = xA + 1: GoTo joueur2
        If temps > reftemps + 5 Then spriteA$ = "retourne2": GoTo joueur2
        If temps > reftemps + 4 Then xA = xA + 1: GoTo joueur2
        If temps > reftemps + 2 Then spriteA$ = "retourne1": GoTo joueur2
        If temps > reftemps + 1 Then xA = xA + 1: spriteA$ = "retourne1": GoTo joueur2
    End If

    If joueurA$ = "decapiteR" Then
        decapiteA$ = "non"
        xFA = xA + 1: xTA = xA + 2: xMA = xA + 2: xGA = xA
        If temps > reftemps + 58 Then Aoccupe$ = "non": spriteA$ = "deboutR": joueurA$ = "deboutR": GoTo joueur2
        If temps > reftemps + 51 Then spriteA$ = "cou2R": xAttA = xA + 4: GoTo joueur2
        If temps > reftemps + 50 Then spriteA$ = "cou3R": xTA = xA + 4: xAttA = xA - 2: GoTo joueur2
        If temps > reftemps + 39 Then spriteA$ = "cou3R": yAttA = yTA: GoTo joueur2
        If temps > reftemps + 33 Then spriteA$ = "cou2R": yAttA = yTA: GoTo joueur2
        If temps > reftemps + 29 Then spriteA$ = "cou1R": yAttA = yTA: GoTo joueur2
        If temps > reftemps + 25 GoTo joueur2
        If temps > reftemps + 24 Then xA = xA - 1: GoTo joueur2
        If temps > reftemps + 20 Then spriteA$ = "retourne3R": GoTo joueur2
        If temps > reftemps + 19 Then xA = xA - 1: GoTo joueur2
        If temps > reftemps + 15 Then spriteA$ = "retourne3R": GoTo joueur2
        If temps > reftemps + 14 Then _SndPlay decapite: xA = xA - 1: GoTo joueur2
        If temps > reftemps + 10 Then spriteA$ = "retourne2R": GoTo joueur2
        If temps > reftemps + 9 Then xA = xA - 1: GoTo joueur2
        If temps > reftemps + 5 Then spriteA$ = "retourne2R": GoTo joueur2
        If temps > reftemps + 4 Then xA = xA - 1: GoTo joueur2
        If temps > reftemps + 2 Then spriteA$ = "retourne1R": GoTo joueur2
        If temps > reftemps + 1 Then xA = xA - 1: spriteA$ = "retourne1R": GoTo joueur2
    End If

    If joueurA$ = "front" Then
        xFA = xA + 4: xTA = xA + 4: xMA = xA + 4: xGA = xA + 4
        yGA = 20
        If temps > reftemps + 45 Then Aoccupe$ = "non": joueurA$ = "debout": GoTo joueur2
        If temps > reftemps + 30 Then spriteA$ = "front2": GoTo joueur2
        If temps > reftemps + 24 Then spriteA$ = "front3": xAttA = xA: GoTo joueur2
        If temps > reftemps + 23 Then
            spriteA$ = "front3"
            If joueurB$ = "front" Then
                If distance < 12 Then
                    soncling = soncling + 1
                    If soncling > 3 Then soncling = 1
                    If soncling = 1 Then _SndPlay cling
                    If soncling = 2 Then _SndPlay cling2
                    If soncling = 3 Then _SndPlay cling3
                End If
                GoTo joueur2
            End If
            xFA = xA: xAttA = xA + 7: GoTo joueur2
        End If
        If temps > reftemps + 6 Then GoTo joueur2
        If temps > reftemps + 5 Then
            songrogne = songrogne + 1
            If songrogne > 6 Then songrogne = 0
            If songrogne = 3 Then _SndPlay grogne1
            If songrogne = 6 Then _SndPlay grogne2
            _SndPlay epee: spriteA$ = "front2": yAttA = yFA: GoTo joueur2
        End If
        If temps > reftemps + 3 Then spriteA$ = "front1": GoTo joueur2
    End If

    If joueurA$ = "frontR" Then
        xFA = xA: xTA = xA: xMA = xA: xGA = xA
        yGA = 20
        If temps > reftemps + 45 Then Aoccupe$ = "non": joueurA$ = "deboutR": GoTo joueur2
        If temps > reftemps + 30 Then spriteA$ = "front2R": GoTo joueur2
        If temps > reftemps + 24 Then spriteA$ = "front3R": xAttA = xA + 4: GoTo joueur2
        If temps > reftemps + 23 Then
            spriteA$ = "front3R"
            If joueurB$ = "frontR" Then
                If distance < 12 Then
                    soncling = soncling + 1
                    If soncling > 3 Then soncling = 1
                    If soncling = 1 Then _SndPlay cling
                    If soncling = 2 Then _SndPlay cling2
                    If soncling = 3 Then _SndPlay cling3
                End If
                GoTo joueur2
            End If
            xFA = xA + 4: xAttA = xA - 3: GoTo joueur2
        End If
        If temps > reftemps + 6 Then GoTo joueur2
        If temps > reftemps + 5 Then
            songrogne = songrogne + 1
            If songrogne > 6 Then songrogne = 0
            If songrogne = 3 Then _SndPlay grogne1
            If songrogne = 6 Then _SndPlay grogne2

            _SndPlay epee: spriteA$ = "front2R": yAttA = yFA: GoTo joueur2
        End If
        If temps > reftemps + 3 Then spriteA$ = "front1R": GoTo joueur2
    End If

    If joueurA$ = "retourne" Then
        xAttA = xA: xFA = xA + 4: xTA = xA + 4: xMA = xA + 4: xGA = xA + 4
        yAttA = 14:
        spriteA$ = "retourne1"
        If temps > reftemps + 5 Then spriteA$ = "retourne2"
        If temps > reftemps + 10 Then spriteA$ = "retourne3"
        If temps > reftemps + 15 Then joueurA$ = "deboutR": Aoccupe$ = "non": sens$ = "inverse"
    End If

    If joueurA$ = "retourneR" Then
        xAttA = xA + 4: xFA = xA: xTA = xA: xMA = xA: xGA = xA
        yAttA = 14:
        spriteA$ = "retourne1"
        If temps > reftemps + 5 Then spriteA$ = "retourne2"
        If temps > reftemps + 10 Then spriteA$ = "retourne3"
        If temps > reftemps + 15 Then joueurA$ = "debout": Aoccupe$ = "non": sens$ = "normal"
    End If

    If joueurA$ = "vainqueur" Then
        spriteA$ = "vainqueur1"
        decapiteA$ = "oui"
        sangA$ = "non"
        xAttA = xA: yGA = 20: yAttA = 14
        xFA = xA + 4: xTA = xA + 4: xMA = xA + 4: xGA = xA + 4
        If temps > reftemps + 18 Then spriteA$ = "vainqueur2"
        If temps > reftemps + 35 Then spriteA$ = "vainqueur3"
        If temps > reftemps + 85 Then spriteA$ = "vainqueur2"
        If temps > reftemps + 100 Then spriteA$ = "vainqueur1"
    End If

    If joueurA$ = "vainqueurR" Then
        spriteA$ = "vainqueur1R"
        decapiteA$ = "oui"
        sangA$ = "non"
        xAttA = xFA + 4: yGA = 20: yAttA = 14
        xFA = xA: xTA = xA: xMA = xA: xGA = xA
        If temps > reftemps + 18 Then spriteA$ = "vainqueur2R"
        If temps > reftemps + 35 Then spriteA$ = "vainqueur3R"
        If temps > reftemps + 85 Then spriteA$ = "vainqueur2R"
        If temps > reftemps + 100 Then spriteA$ = "vainqueur1R"
    End If

    If joueurA$ = "vainqueurKO" Then
        decapiteA$ = "oui"
        sangA$ = "non"
        xAttA = xA: yGA = 20:
        xFA = xA + 4: xTA = xA + 4: xMA = xA + 4: xGA = xA + 4

        If temps > reftemps + 230 Then
            gnome$ = "oui": reftemps = temps
            xGNOME = 1
            xSPRt = 270
            GoTo affichage
        End If

        If temps > reftemps + 205 Then spriteA$ = "vainqueur1": GoTo joueur2
        If temps > reftemps + 195 Then spriteA$ = "vainqueur2": GoTo joueur2
        If temps > reftemps + 140 Then spriteA$ = "vainqueur3": GoTo joueur2
        If temps > reftemps + 123 Then spriteA$ = "vainqueur2": GoTo joueur2
        If temps > reftemps + 105 Then spriteA$ = "vainqueur1": GoTo joueur2
        If temps > reftemps + 100 Then spriteA$ = "debout": GoTo joueur2
        If temps > reftemps + 75 Then spriteA$ = "pied1": spriteB$ = "mort4": GoTo joueur2
        If temps > reftemps + 71 Then GoTo joueur2
        If temps > reftemps + 70 Then
            spriteA$ = "pied2": spriteB$ = "mort3": xB = xB + 2: GoTo joueur2
        End If
        If temps > reftemps + 55 Then spriteA$ = "pied1": GoTo joueur2
        If temps > reftemps + 40 Then spriteA$ = "debout": GoTo joueur2
        If temps > reftemps + 36 Then GoTo joueur2
        If temps > reftemps + 35 Then
            distance = xB - xA
            If distance < 5 Then spriteA$ = "marche3": xA = xA - 1
            If distance > 5 Then spriteA$ = "marche3": xA = xA + 1
            GoTo colision
        End If
        If temps > reftemps + 30 Then spriteA$ = "debout": GoTo joueur2
        If temps > reftemps + 23 Then spriteA$ = "retourne3": GoTo joueur2
        If temps > reftemps + 15 Then spriteA$ = "retourne2": GoTo joueur2
        If temps > reftemps + 8 Then spriteA$ = "retourne1"
    End If

    If joueurA$ = "vainqueurKOR" Then
        decapiteA$ = "oui"
        sangA$ = "non"
        xAttA = xFA + 4: yGA = 20
        xFA = xA: xTA = xA: xMA = xA: xGA = xA

        If temps > reftemps + 230 Then
            gnome$ = "oui": reftemps = temps
            xGNOME = 1
            xSPRt = 270
            GoTo affichage
        End If

        If temps > reftemps + 205 Then spriteA$ = "vainqueur1R": GoTo joueur2
        If temps > reftemps + 190 Then spriteA$ = "vainqueur2R": GoTo joueur2
        If temps > reftemps + 140 Then spriteA$ = "vainqueur3R": GoTo joueur2
        If temps > reftemps + 123 Then spriteA$ = "vainqueur2R": GoTo joueur2
        If temps > reftemps + 105 Then spriteA$ = "vainqueur1R": GoTo joueur2
        If temps > reftemps + 100 Then spriteA$ = "deboutR": GoTo joueur2
        If temps > reftemps + 75 Then spriteA$ = "pied1R": spriteB$ = "mort4R": GoTo joueur2
        If temps > reftemps + 71 Then GoTo joueur2
        If temps > reftemps + 70 Then
            spriteA$ = "pied2R": spriteB$ = "mort3R": xB = xB - 2: GoTo joueur2
        End If
        If temps > reftemps + 55 Then spriteA$ = "pied1R": GoTo joueur2
        If temps > reftemps + 40 Then spriteA$ = "deboutR": GoTo joueur2
        If temps > reftemps + 36 Then GoTo joueur2
        If temps > reftemps + 35 Then
            distance = xA - xB
            If distance < 5 Then spriteA$ = "marche3R": xA = xA + 1
            If distance > 5 Then spriteA$ = "marche3R": xA = xA - 1
            GoTo colision
        End If
        If temps > reftemps + 30 Then spriteA$ = "deboutR": GoTo joueur2
        If temps > reftemps + 23 Then spriteA$ = "retourne3R": GoTo joueur2
        If temps > reftemps + 15 Then spriteA$ = "retourne2R": GoTo joueur2
        If temps > reftemps + 8 Then spriteA$ = "retourne1R"
    End If


    '                               ******degats******
    If joueurA$ = "touche" Then
        attenteA = 0
        xAttA = xA
        xFA = xA: xTA = xA: xMA = xA: xGA = xA
        yFA = 15: yTA = 16: yMA = 18: yGA = 20
        If joueurB$ = "coupdepied" Then joueurA$ = "tombe": GoTo gestion

        sangA$ = "oui"
        serpentA$ = "oui"

        If joueurB$ = "decapite" And decapiteA$ = "oui" Then
            joueurA$ = "mortdecap": Aoccupe$ = "oui": reftemps = temps
            xSPRt = xA + 3: scoreB = scoreB + 250
            sangA$ = "non": GoTo mort
        End If

        vieA = vieA - 1:
        If vieA <= 0 Then
            joueurA$ = "mort": Aoccupe$ = "oui": reftemps = temps: sangA$ = "oui": GoTo mort
        End If

        sontouche = sontouche + 1
        If sontouche > 3 Then sontouche = 1
        If sontouche = 1 Then _SndPlay touche
        If sontouche = 2 Then _SndPlay touche2
        If sontouche = 3 Then _SndPlay touche3


        joueurA$ = "touche1": Aoccupe$ = "oui": reftemps = temps: decapiteA$ = "oui"
        GoTo joueur2
    End If

    If joueurA$ = "touche1" Then
        attenteA = 0
        xAttA = xA
        xFA = xA: xTA = xA: xMA = xA: xGA = xA
        If temps > reftemps + 20 Then
            spriteA$ = "debout": Aoccupe$ = "non"
            joueurA$ = "debout": GoTo joueur2
        End If
        If temps > reftemps + 15 Then spriteA$ = "touche4": GoTo joueur2 ' pour serpent
        If temps > reftemps + 11 Then GoTo joueur2
        If temps > reftemps + 10 Then xA = xA - 1: sangA$ = "non": spriteA$ = "touche3": GoTo joueur2
        If temps > reftemps + 6 Then GoTo joueur2
        If temps > reftemps + 5 Then xA = xA - 2: spriteA$ = "touche2": GoTo joueur2
        If temps > reftemps + 2 Then GoTo joueur2
        If temps > reftemps + 1 Then xA = xA - 1: spriteA$ = "touche1": GoTo joueur2
        spriteA$ = "touche1"
    End If

    If joueurA$ = "toucheR" Then
        attenteA = 0
        xAttA = xA + 4
        xFA = xA + 4: xTA = xA + 4: xMA = xA + 4: xGA = xA + 4
        yFA = 15: yTA = 16: yMA = 18: yGA = 20
        If joueurB$ = "coupdepiedR" Then joueurA$ = "tombeR": GoTo gestion

        sangA$ = "oui"
        serpentA$ = "oui"

        If joueurB$ = "decapiteR" And decapiteA$ = "oui" Then
            joueurA$ = "mortdecapR": Aoccupe$ = "oui": reftemps = temps
            xSPRt = xA + 3: scoreB = scoreB + 250
            sangA$ = "non": GoTo mort
        End If

        vieA = vieA - 1
        If vieA <= 0 Then
            joueurA$ = "mortR": Aoccupe$ = "oui": reftemps = temps: sangA$ = "oui": GoTo mort
        End If

        sontouche = sontouche + 1
        If sontouche > 3 Then sontouche = 1
        If sontouche = 1 Then _SndPlay touche
        If sontouche = 2 Then _SndPlay touche2
        If sontouche = 3 Then _SndPlay touche3


        joueurA$ = "touche1R": Aoccupe$ = "oui": reftemps = temps: decapiteA$ = "oui"
        GoTo joueur2

    End If

    If joueurA$ = "touche1R" Then
        attenteA = 0
        xAttA = xA + 4
        xFA = xA + 4: xTA = xA + 4: xMA = xA + 4: xGA = xA + 4
        If temps > reftemps + 20 Then
            spriteA$ = "deboutR": Aoccupe$ = "non"
            joueurA$ = "deboutR": GoTo joueur2
        End If
        If temps > reftemps + 15 Then spriteA$ = "touche4R": GoTo joueur2 'pour serpent
        If temps > reftemps + 11 Then GoTo joueur2
        If temps > reftemps + 10 Then xA = xA + 1: sangA$ = "non": spriteA$ = "touche3R": GoTo joueur2
        If temps > reftemps + 6 Then GoTo joueur2
        If temps > reftemps + 5 Then xA = xA + 2: spriteA$ = "touche2R": GoTo joueur2
        If temps > reftemps + 2 Then GoTo joueur2
        If temps > reftemps + 1 Then xA = xA + 1: spriteA$ = "touche1R": GoTo joueur2
        spriteA$ = "touche1R"
    End If

    If joueurA$ = "tombe" Then

        xAttA = xA
        attenteA = 0
        xFA = xA: xTA = xA: xMA = xA: xGA = xA
        yFA = 15: yTA = 16: yMA = 18: yGA = 20
        sangA$ = "oui"
        serpentA$ = "oui"

        vieA = vieA - 1: scoreB = scoreB + 100
        If joueurB$ = "rouladeAV" Then vieA = vieA + 1: sangA$ = "non": serpentA$ = "non": scoreB = scoreB - 100

        If vieA <= 0 Then
            joueurA$ = "mort": Aoccupe$ = "oui": reftemps = temps: sangA$ = "oui"
            If joueurB$ = "coupdetete" Or joueurB$ = "coupdepied" Then sangA$ = "non"
            GoTo mort
        End If

        If joueurB$ = "coupdetete" Then scoreB = scoreB + 150: sangA$ = "non": _SndPlay coupdetete:


        If joueurB$ = "coupdepied" Then scoreB = scoreB + 150: sangA$ = "non": _SndPlay coupdepied


        joueurA$ = "tombe1": Aoccupe$ = "oui": reftemps = temps
        GoTo joueur2
    End If


    If joueurA$ = "tombe1" Then
        xAttA = xA
        attenteA = 0
        xFA = xA: xTA = xA: xMA = xA: xGA = xA
        If temps > reftemps + 25 Then
            spriteA$ = "debout": xA = xA - 1: joueurA$ = "debout": Aoccupe$ = "non": GoTo joueur2
        End If
        If temps > reftemps + 20 Then spriteA$ = "tombe4": GoTo joueur2
        If temps > reftemps + 15 Then spriteA$ = "tombe3": GoTo joueur2
        If temps > reftemps + 10 Then GoTo joueur2
        If temps > reftemps + 9 Then sangA$ = "non": xA = xA - 2: spriteA$ = "tombe2": GoTo joueur2
        If temps > reftemps + 2 Then GoTo joueur2
        If temps > reftemps + 1 Then
            _SndPlay tombe
            If joueurB$ = "coupdetete" Then _SndStop tombe
            xA = xA - 2: GoTo joueur2
        End If
        spriteA$ = "tombe1"
    End If

    If joueurA$ = "tombeR" Then
        xAttA = xA + 4
        attenteA = 0
        xFA = xA + 4: xTA = xA + 4: xMA = xA + 4: xGA = xA + 4
        yFA = 15: yTA = 16: yMA = 18: yGA = 20
        sangA$ = "oui"
        serpentA$ = "oui"

        vieA = vieA - 1: scoreB = scoreB + 100
        If joueurB$ = "rouladeAVR" Then vieA = vieA + 1: sangA$ = "non": serpentA$ = "non": scoreB = scoreB - 100

        If vieA <= 0 Then
            joueurA$ = "mortR": Aoccupe$ = "oui": reftemps = temps: sangA$ = "oui"
            If joueurB$ = "coupdeteteR" Or joueurB$ = "coupdepiedR" Then sangA$ = "non"
            GoTo mort
        End If


        If joueurB$ = "coupdeteteR" Then _SndPlay coupdetete: scoreB = scoreB + 150: sangA$ = "non"

        If joueurB$ = "coupdepiedR" Then _SndPlay coupdepied: scoreB = scoreB + 150: sangA$ = "non"


        joueurA$ = "tombe1R": Aoccupe$ = "oui": reftemps = temps
        GoTo joueur2

    End If

    If joueurA$ = "tombe1R" Then
        xAttA = xA + 4
        attenteA = 0
        xFA = xA + 4: xTA = xA + 4: xMA = xA + 4: xGA = xA + 4
        If temps > reftemps + 25 Then
            spriteA$ = "deboutR": xA = xA + 1: joueurA$ = "deboutR": Aoccupe$ = "non": GoTo joueur2
        End If
        If temps > reftemps + 20 Then spriteA$ = "tombe4R": GoTo joueur2 ' pour serpent
        If temps > reftemps + 15 Then spriteA$ = "tombe3R": GoTo joueur2
        If temps > reftemps + 10 Then GoTo joueur2
        If temps > reftemps + 9 Then sangA$ = "non": xA = xA + 2: spriteA$ = "tombe2R": GoTo joueur2
        If temps > reftemps + 2 Then GoTo joueur2
        If temps > reftemps + 1 Then
            _SndPlay tombe
            If joueurB$ = "coupdeteteR" Then _SndStop tombe
            xA = xA + 2: GoTo joueur2
        End If
        spriteA$ = "tombe1R"
    End If


    '                               bruit des epees  et decapitation loupee
    If sens$ = "normal" Then

        If joueurA$ = "clingD" Then

            If joueurB$ = "decapite" And decapiteA$ = "non" Then joueurA$ = "touche": Aoccupe$ = "oui": reftemps = temps: GoTo gestion
            If joueurB$ = "genou" Then joueurA$ = "touche": Aoccupe$ = "oui": reftemps = temps: GoTo gestion
            If distance < 12 Then
                soncling = soncling + 1
                If soncling > 3 Then soncling = 1
                If soncling = 1 Then _SndPlay cling
                If soncling = 2 Then _SndPlay cling2
                If soncling = 3 Then _SndPlay cling3
            End If
            joueurA$ = "protegeD": GoTo joueur2
        End If

        If joueurA$ = "clingH" Then
            If distance < 12 Then
                soncling = soncling + 1
                If soncling > 3 Then soncling = 1
                If soncling = 1 Then _SndPlay cling
                If soncling = 2 Then _SndPlay cling2
                If soncling = 3 Then _SndPlay cling3
            End If
            joueurA$ = "protegeH": GoTo joueur2
        End If

    End If

    If sens$ = "inverse" Then

        If joueurA$ = "clingD" Then
            If joueurB$ = "decapiteR" And decapiteA$ = "non" Then joueurA$ = "toucheR": Aoccupe$ = "oui": reftemps = temps: GoTo gestion
            If joueurB$ = "genouR" Then joueurA$ = "toucheR": Aoccupe$ = "oui": reftemps = temps: GoTo gestion
            If distance < 12 Then
                soncling = soncling + 1
                If soncling > 3 Then soncling = 1
                If soncling = 1 Then _SndPlay cling
                If soncling = 2 Then _SndPlay cling2
                If soncling = 3 Then _SndPlay cling3
            End If
            joueurA$ = "protegeDR": GoTo joueur2
        End If

        If joueurA$ = "clingH" Then
            If distance < 12 Then
                soncling = soncling + 1
                If soncling > 3 Then soncling = 1
                If soncling = 1 Then _SndPlay cling
                If soncling = 2 Then _SndPlay cling2
                If soncling = 3 Then _SndPlay cling3
            End If
            joueurA$ = "protegeHR": GoTo joueur2
        End If

    End If


    '                                   *************************************
    '                                   **********gestion de la mort*********
    '                                   *************************************

    mort:

    If joueurA$ = "mort" Then
        If temps > reftemps + 16 Then GoTo joueur2
        If temps > reftemps + 15 Then sangA$ = "non": spriteA$ = "mort2": GoTo joueur2
        If temps > reftemps + 1 Then spriteA$ = "mort1": GoTo joueur2
        spriteA$ = "mort1": joueurB$ = "vainqueurKO": Boccupe$ = "oui": reftempsB = temps
        If lancerfin$ = "oui" Then _SndPlay mortKO: lancerfin$ = "non"
    End If

    If joueurA$ = "mortR" Then
        If temps > reftemps + 16 Then GoTo joueur2
        If temps > reftemps + 15 Then sangA$ = "non": spriteA$ = "mort2R": GoTo joueur2
        If temps > reftemps + 1 Then spriteA$ = "mort1R": GoTo joueur2
        spriteA$ = "mort1R":
        joueurB$ = "vainqueurKOR": Boccupe$ = "oui": reftempsB = temps
        If lancerfin$ = "oui" Then _SndPlay mortKO: lancerfin$ = "non"
    End If

    If joueurA$ = "mortdecap" Then
        If temps > reftemps + 80 Then spriteA$ = "decap4": GoTo joueur2
        If temps > reftemps + 70 Then spriteA$ = "decap3": GoTo joueur2
        If temps > reftemps + 55 Then sangdecapA = 0: GoTo joueur2
        If temps > reftemps + 50 Then sangdecapA = 6: GoTo joueur2
        If temps > reftemps + 45 Then sangdecapA = 5: GoTo joueur2
        If temps > reftemps + 40 Then sangdecapA = 4: GoTo joueur2
        If temps > reftemps + 35 Then spriteA$ = "decap2": GoTo joueur2
        If temps > reftemps + 20 Then sangdecapA = 0: GoTo joueur2
        If temps > reftemps + 15 Then sangdecapA = 3: GoTo joueur2
        If temps > reftemps + 10 Then sangdecapA = 2: GoTo joueur2
        If temps > reftemps + 5 Then sangdecapA = 1: GoTo joueur2
        spriteA$ = "decap1": joueurB$ = "vainqueur": Boccupe$ = "oui": reftempsB = temps
        If lancerfin$ = "oui" Then _SndPlay mortdecap: lancerfin$ = "non"
    End If

    If joueurA$ = "mortdecapR" Then
        If temps > reftemps + 80 Then spriteA$ = "decap4R": GoTo joueur2
        If temps > reftemps + 70 Then spriteA$ = "decap3R": GoTo joueur2
        If temps > reftemps + 55 Then sangdecapA = 0: GoTo joueur2
        If temps > reftemps + 50 Then sangdecapA = 6: GoTo joueur2
        If temps > reftemps + 45 Then sangdecapA = 5: GoTo joueur2
        If temps > reftemps + 40 Then sangdecapA = 4: GoTo joueur2
        If temps > reftemps + 35 Then spriteA$ = "decap2R": GoTo joueur2
        If temps > reftemps + 20 Then sangdecapA = 0: GoTo joueur2
        If temps > reftemps + 15 Then sangdecapA = 3: GoTo joueur2
        If temps > reftemps + 10 Then sangdecapA = 2: GoTo joueur2
        If temps > reftemps + 5 Then sangdecapA = 1: GoTo joueur2
        spriteA$ = "decap1R": joueurB$ = "vainqueurR": Boccupe$ = "oui": reftempsB = temps
        If lancerfin$ = "oui" Then _SndPlay mortdecap: lancerfin$ = "non"
    End If

    If joueurA$ = "mortSORCIER" Then

        If temps > reftemps + 86 Then joueurA$ = "sorcierFINI": GoTo joueur2

        If temps > reftemps + 85 Then sangA$ = "non": spriteA$ = "mort4R": GoTo joueur2
        If temps > reftemps + 71 Then GoTo joueur2
        If temps > reftemps + 70 Then sangA$ = "non": spriteA$ = "mort3R": xA = xA + 2: GoTo joueur2
        If temps > reftemps + 15 Then sangA$ = "non": spriteA$ = "mort2R": GoTo joueur2
        If temps > reftemps + 1 Then spriteA$ = "mort1R": GoTo joueur2
        spriteA$ = "mort1R"

    End If

    '                         **************************************
    '                         *********     joueur 2    ************
    '                         **************************************
    joueur2:
    'debut joueur 2

    If sorcier$ = "oui" Then sangB$ = "non"

    If sorcier$ = "oui" Then

        If xA <= xB + 4 Then
            joueurB$ = "marianna": joueurA$ = "fini"
            spriteB$ = "marianna": spriteA$ = "vainqueur3R"
            xB = 13: xA = 20
            Boccupe$ = "oui": Aoccupe$ = "oui"
            reftempsB = temps: reftempsB = temps
            jeu$ = "gagne"
            GoTo debut
        End If


        If Boccupe$ = "oui" Then GoTo gestionB
        sangB$ = "non"

        GoTo clavierB

    End If



    '                           ************degats sur joueurB************

    If sens$ = "normal" Then
        If xB > xA Then
            If xAttA >= xFB And yAttA = yFB Then
                If joueurB$ = "protegeH" Then joueurB$ = "clingH": GoTo gestionB
                joueurB$ = "tombe": infoBdegatF = infoBdegatF + 1: GoTo gestionB
            End If

            If xAttA >= xTB And yAttA = yTB Then
                If joueurA$ = "coupdetete" Then joueurB$ = "tombe": GoTo gestionB
                joueurB$ = "touche": scoreA = scoreA + 250: infoBdegatT = infoBdegatT + 1: GoTo gestionB
            End If

            If xAttA >= xMB And yAttA = yMB Then
                If joueurB$ = "protegeD" Then joueurB$ = "clingD": GoTo gestionB
                joueurB$ = "touche": scoreA = scoreA + 250: GoTo gestionB
            End If

            If xAttA >= xGB And yAttA = yGB Then
                If joueurA$ = "araignee" Then joueurB$ = "tombe": GoTo gestionB
                If joueurA$ = "rouladeAV" Then joueurB$ = "tombe": GoTo gestionB
                If joueurB$ = "protegeD" Then joueurB$ = "clingD": GoTo gestionB
                If joueurA$ = "coupdepied" Then joueurB$ = "tombe": infoBdegatG = infoBdegatG + 1: GoTo gestionB
                joueurB$ = "touche": scoreA = scoreA + 100: infoBdegatG = infoBdegatG + 1: GoTo gestionB
            End If
        End If
    End If

    If sens$ = "inverse" Then
        If xB < xA Then
            If xAttA <= xFB And yAttA = yFB Then
                If joueurB$ = "protegeHR" Then joueurB$ = "clingH": GoTo gestionB
                joueurB$ = "tombeR": infoBdegatF = infoBdegatF + 1: GoTo gestionB
            End If

            If xAttA <= xTB And yAttA = yTB Then
                If joueurA$ = "coupdeteteR" Then joueurB$ = "tombeR": GoTo gestionB
                joueurB$ = "toucheR": scoreA = scoreA + 250: infoBdegatT = infoBdegatT + 1: GoTo gestionB
            End If

            If xAttA <= xMB And yAttA = yMB Then
                If joueurB$ = "protegeDR" Then joueurB$ = "clingD": GoTo gestionB
                joueurB$ = "toucheR": scoreA = scoreA + 250: GoTo gestionB
            End If

            If xAttA <= xGB And yAttA = yGB Then
                If joueurA$ = "araigneeR" Then joueurB$ = "tombeR": GoTo gestionB
                If joueurA$ = "rouladeAVR" Then joueurB$ = "tombeR": GoTo gestionB
                If joueurB$ = "protegeDR" Then joueurB$ = "clingD": GoTo gestionB
                If joueurA$ = "coupdepiedR" Then joueurB$ = "tombeR": infoBdegatG = infoBdegatG + 1: GoTo gestionB
                joueurB$ = "toucheR": scoreA = scoreA + 100: infoBdegatG = infoBdegatG + 1: GoTo gestionB
            End If
        End If
    End If

    If Boccupe$ = "oui" Then GoTo gestionB
    sangB$ = "non"

    '                       ********************************************
    '                       ******* evenements clavier joueurB *********
    '                       ********************************************

    clavierB:

    x2 = 7: y2 = 7
    levier2$ = "neutre":

    If partie$ = "vs" Then

        '                                   entr‚e des touches

        If _KeyDown(105) Or Stick(3) < 65 Then y2 = y2 - 1
        If _KeyDown(107) Or Stick(3) > 190 Then y2 = y2 + 1
        If _KeyDown(108) Or Stick(2) > 190 Then x2 = x2 + 1
        If _KeyDown(106) Or Stick(2) < 65 Then x2 = x2 - 1


        If _KeyDown(32) Or Strig(3) = -1 Then attaqueB$ = "oui" Else attaqueB$ = "non"




        '                       amplitude du pave virtuel
        If y2 > 9 Then y2 = 9
        If y2 < 5 Then y2 = 5
        If x2 > 9 Then x2 = 9
        If x2 < 5 Then x2 = 5

        '                        position du "levier"  virtuel

        If sens$ = "normal" Then
            If (x2 <= 6 And y2 <= 6) Then levier2$ = "hautG"
            If (x2 >= 8 And y2 <= 6) Then levier2$ = "hautD"
            If (x2 <= 6 And y2 >= 8) Then levier2$ = "basG"
            If (x2 >= 8 And y2 >= 8) Then levier2$ = "basD"
            If (x2 <= 6 And y2 = 7) Then levier2$ = "gauche"
            If (x2 >= 8 And y2 = 7) Then levier2$ = "droite"
            If (x2 = 7 And y2 >= 8) Then levier2$ = "bas"
            If (x2 = 7 And y2 <= 6) Then levier2$ = "haut"
        End If
        If sens$ = "inverse" Then
            If (x2 <= 6 And y2 <= 6) Then levier2$ = "hautG"
            If (x2 >= 8 And y2 <= 6) Then levier2$ = "hautD"
            If (x2 <= 6 And y2 >= 8) Then levier2$ = "basG"
            If (x2 >= 8 And y2 >= 8) Then levier2$ = "basD"
            If (x2 <= 6 And y2 = 7) Then levier2$ = "gauche"
            If (x2 >= 8 And y2 = 7) Then levier2$ = "droite"
            If (x2 = 7 And y2 >= 8) Then levier2$ = "bas"
            If (x2 = 7 And y2 <= 6) Then levier2$ = "haut"
        End If
    End If

    '                       **********************************
    '                       ******* animations  auto *********
    '                       **********************************

    If entree$ = "oui" Then levier2$ = "gauche": GoTo actionB

    If sortieB$ = "oui" Then
        If tempsfini$ = "oui" Then
            If sens$ = "inverse" Then levier2$ = "gauche": GoTo actionB
        End If

        sens$ = "normal": levier2$ = "droite": GoTo actionB
    End If

    '                       *****************************************
    '                       ******* Intelligence Artificielle *******
    '                       *****************************************

    If joueurA$ = "finderoulade" Or joueurA$ = "finderouladeR" Or joueurB$ = "finderoulade" Or joueurB$ = "finderouladeR" Then GoTo gestionB

    If partie$ = "solo" Then

        ' ***************************IA de 1,2,3,6

        If IA = 0 Or IA = 1 Or IA = 2 Or IA = 3 Or IA = 6 Then
            If sens$ = "normal" Then
                distance = xB - xA

                If distance >= 15 Then '  quand trop loin
                    joueurB$ = "rouladeAV": reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                End If

                If IA = 6 Then
                    If distance < 15 Then
                        If joueurA$ = "decapite" Then joueurB$ = "genou": reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                    End If
                End If

                If IA = 3 Then
                    If distance < 15 Then
                        If infoBdegatT > 2 Then
                            If joueurA$ = "decapite" Then joueurB$ = "assis2": GoTo gestionB
                        End If

                        If joueurA$ = "decapite" Then joueurB$ = "protegeD": reftempsB = temps: GoTo gestionB
                    End If
                End If


                If distance = 12 And joueurA$ = "debout" Then joueurB$ = "decapite": reftempsB = temps: Boccupe$ = "oui": GoTo gestionB

                If distance > 9 And distance < 15 Then ' pour se rapprocher
                    If levier1$ = "gauche" Then joueurB$ = "debout": GoTo gestionB
                    levier2$ = "gauche": GoTo actionB
                End If

                If distance = 9 Then
                    If attenteA > 100 Then levier2$ = "gauche": GoTo actionB
                    If joueurA$ = "rouladeAR" Then joueurB$ = "devant": reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                    If Aoccupe$ = "oui" Then levier2$ = "gauche": GoTo actionB

                End If

                If distance < 9 And distance > 6 Then ' distance de combat 1
                    ' pour autoriser les croisements
                    If demo$ = "non" And joueurA$ = "rouladeAV" Then joueurB$ = "saute": reftempsB = temps: Boccupe$ = "oui": GoTo gestionB

                    ' pour se rapprocher
                    If joueurA$ = "rouladeAR" Then joueurB$ = "genou": reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                    If levier1$ = "gauche" Then joueurB$ = "araignee": reftempsB = temps: Boccupe$ = "oui": GoTo gestionB


                    'pour eviter les degats repetitifs

                    If IA > 1 Then
                        If infoBdegatG > 4 Then
                            If joueurA$ = "assis2" Or joueurA$ = "genou" Then joueurB$ = "genou": reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                        End If
                        If infoBdegatG > 2 Then
                            If joueurA$ = "assis2" Or joueurA$ = "rouladeAV" Then joueurB$ = "rouladeAV": reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                        End If

                        If infoBdegatT > 2 Then
                            If joueurA$ = "cou" Then joueurB$ = "rouladeAV": reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                        End If

                        If infoBdegatF > 2 Then
                            If joueurA$ = "front" Then joueurB$ = "rouladeAV": reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                        End If

                    End If


                    'pour alterner les attaques
                    If infocoupB = 0 Then joueurB$ = "coupdepied": infocoupB = infocoupB + 1: reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                    If infocoupB = 1 Then joueurB$ = "debout": infocoupB = infocoupB + 1: reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                    If infocoupB = 2 Then joueurB$ = "araignee": infocoupB = infocoupB + 1: reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                    If infocoupB = 3 Then joueurB$ = "debout": infocoupB = infocoupB + 1: reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                    If infocoupB = 4 Then joueurB$ = "assis2": infocoupB = infocoupB + 1: reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                    If infocoupB = 5 Then joueurB$ = "genou": infocoupB = infocoupB + 1: reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                    If infocoupB = 6 Then levier2$ = "gauche": infocoupB = 0: GoTo actionB


                End If
                If distance <= 6 Then

                    ' pour autoriser les croisements
                    If demo$ = "non" And joueurA$ = "saute" Then joueurB$ = "rouladeAV": reftempsB = temps: Boccupe$ = "oui": GoTo gestionB

                    If IA = 3 Then
                        If joueurA$ = "devant" Then joueurB$ = "protegeD": reftempsB = temps: GoTo gestionB
                    End If

                    If IA = 2 Then
                        If joueurA$ = "genou" Then joueurB$ = "saute": reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                    End If

                    If IA > 1 Then
                        If infoBdegatG > 4 Then
                            If joueurA$ = "assis2" Or joueurA$ = "genou" Then joueurB$ = "coupdepied": reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                            If IA > 2 Then If joueurA$ = "araignee" Then joueurB$ = "araignee": reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                        End If
                        If infoBdegatG > 2 Then
                            If joueurA$ = "coupdepied" Then joueurB$ = "rouladeAV": reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                            If joueurA$ = "assis2" Or joueurA$ = "genou" Then joueurB$ = "rouladeAV": reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                        End If
                    End If

                    If infocoupB = 0 Then joueurB$ = "coupdepied": infocoupB = infocoupB + 1: reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                    If infocoupB = 1 Then joueurB$ = "coupdetete": infocoupB = infocoupB + 1: reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                    If infocoupB = 2 Then joueurB$ = "araignee": infocoupB = infocoupB + 1: reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                    If infocoupB = 3 Then joueurB$ = "debout": infocoupB = infocoupB + 1: reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                    If infocoupB = 4 Then joueurB$ = "assis2": infocoupB = infocoupB + 1: reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                    If infocoupB = 5 Then joueurB$ = "genou": infocoupB = infocoupB + 1: reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                    If infocoupB = 6 Then joueurB$ = "debout": infocoupB = infocoupB + 1: reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                    If infocoupB = 7 Then levier2$ = "gauche": infocoupB = 0: GoTo actionB

                End If
            End If


            If sens$ = "inverse" Then

                distance = xA - xB

                If distance >= 15 Then '  quand trop loin
                    joueurB$ = "rouladeAVR": reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                End If

                If IA = 6 Then
                    If distance < 15 Then
                        If joueurA$ = "decapiteR" Then joueurB$ = "genouR": reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                    End If
                End If

                If IA = 3 Then
                    If distance < 15 Then
                        If infoBdegatT > 2 Then
                            If joueurA$ = "decapiteR" Then joueurB$ = "assis2R": GoTo gestionB
                        End If

                        If joueurA$ = "decapiteR" Then joueurB$ = "protegeDR": reftempsB = temps: GoTo gestionB
                    End If
                End If

                If distance = 12 And joueurA$ = "deboutR" Then joueurB$ = "decapiteR": reftempsB = temps: Boccupe$ = "oui": GoTo gestionB

                If distance > 9 And distance < 15 Then ' pour se rapprocher
                    If levier1$ = "droite" Then joueurB$ = "deboutR": GoTo gestionB
                    levier2$ = "droite": GoTo actionB
                End If

                If distance = 9 Then
                    If attenteA > 100 Then levier2$ = "droite": GoTo actionB
                    If joueurA$ = "rouladeARR" Then joueurB$ = "devantR": reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                    If Aoccupe$ = "oui" Then levier2$ = "droite": GoTo actionB

                End If

                If distance < 9 And distance > 6 Then ' distance de combat 1
                    ' pour autoriser les croisements
                    If demo$ = "non" And joueurA$ = "rouladeAVR" Then joueurB$ = "sauteR": reftempsB = temps: Boccupe$ = "oui": GoTo gestionB

                    ' pour se rapprocher
                    If joueurA$ = "rouladeARR" Then joueurB$ = "genouR": reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                    If levier1$ = "droite" Then joueurB$ = "araigneeR": reftempsB = temps: Boccupe$ = "oui": GoTo gestionB


                    'pour eviter les degats repetitifs

                    If IA > 1 Then
                        If infoBdegatG > 4 Then
                            If joueurA$ = "assis2R" Or joueurA$ = "genouR" Then joueurB$ = "genouR": reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                        End If
                        If infoBdegatG > 2 Then
                            If joueurA$ = "assis2R" Or joueurA$ = "rouladeAVR" Then joueurB$ = "rouladeAVR": reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                        End If

                        If infoBdegatT > 2 Then
                            If joueurA$ = "couR" Then joueurB$ = "rouladeAVR": reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                        End If

                        If infoBdegatF > 2 Then
                            If joueurA$ = "frontR" Then joueurB$ = "rouladeAVR": reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                        End If

                    End If


                    'pour alterner les attaques
                    If infocoupB = 0 Then joueurB$ = "coupdepiedR": infocoupB = infocoupB + 1: reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                    If infocoupB = 1 Then joueurB$ = "deboutR": infocoupB = infocoupB + 1: reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                    If infocoupB = 2 Then joueurB$ = "araigneeR": infocoupB = infocoupB + 1: reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                    If infocoupB = 3 Then joueurB$ = "deboutR": infocoupB = infocoupB + 1: reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                    If infocoupB = 4 Then joueurB$ = "assis2R": infocoupB = infocoupB + 1: reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                    If infocoupB = 5 Then joueurB$ = "genouR": infocoupB = infocoupB + 1: reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                    If infocoupB = 6 Then levier2$ = "droite": infocoupB = 0: GoTo actionB


                End If
                If distance <= 6 Then

                    ' pour autoriser les croisements
                    If demo$ = "non" And joueurA$ = "sauteR" Then joueurB$ = "rouladeAVR": reftempsB = temps: Boccupe$ = "oui": GoTo gestionB

                    If IA = 3 Then
                        If joueurA$ = "devantR" Then joueurB$ = "protegeDR": reftempsB = temps: GoTo gestionB
                    End If

                    If IA = 2 Then
                        If joueurA$ = "genouR" Then joueurB$ = "sauteR": reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                    End If


                    If IA > 1 Then
                        If infoBdegatG > 4 Then
                            If joueurA$ = "assis2R" Or joueurA$ = "genouR" Then joueurB$ = "genouR": reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                            If IA > 2 Then If joueurA$ = "araigneeR" Then joueurB$ = "araigneeR": reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                        End If
                        If infoBdegatG > 2 Then
                            If joueurA$ = "coupdepiedR" Then joueurB$ = "rouladeAVR": reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                            If joueurA$ = "assis2R" Or joueurA$ = "coupdepiedR" Then joueurB$ = "genouR": reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                        End If
                    End If

                    If infocoupB = 0 Then joueurB$ = "coupdepiedR": infocoupB = infocoupB + 1: reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                    If infocoupB = 1 Then joueurB$ = "coupdeteteR": infocoupB = infocoupB + 1: reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                    If infocoupB = 2 Then joueurB$ = "araigneeR": infocoupB = infocoupB + 1: reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                    If infocoupB = 3 Then joueurB$ = "deboutR": infocoupB = infocoupB + 1: reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                    If infocoupB = 4 Then joueurB$ = "assis2R": infocoupB = infocoupB + 1: reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                    If infocoupB = 5 Then joueurB$ = "genouR": infocoupB = infocoupB + 1: reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                    If infocoupB = 6 Then joueurB$ = "deboutR": infocoupB = infocoupB + 1: reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                    If infocoupB = 7 Then levier2$ = "droite": infocoupB = 0: GoTo actionB

                End If
            End If

        End If


        ' ************************* IA de 4 , 5, 7

        If IA = 4 Or IA = 5 Or IA = 7 Then
            If sens$ = "normal" Then
                distance = xB - xA

                If distance >= 15 Then '  quand trop loin
                    joueurB$ = "rouladeAV": reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                End If

                If distance < 15 Then
                    If IA = 7 Then If joueurA$ = "decapite" Then joueurB$ = "rouladeAV": reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                End If

                If distance = 12 And joueurA$ = "debout" Then joueurB$ = "decapite": reftempsB = temps: Boccupe$ = "oui": GoTo gestionB

                If distance > 9 And distance < 15 Then ' pour se rapprocher
                    If levier1$ = "gauche" Then joueurB$ = "debout": GoTo gestionB
                    levier2$ = "gauche": GoTo actionB
                End If

                If distance = 9 Then
                    If attenteA > 100 Then joueurB$ = "decapite": reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                    If demo$ = "oui" Then If attenteA > 25 Then joueurB$ = "decapite": reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                    If joueurA$ = "rouladeAR" Then joueurB$ = "genou": reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                    If IA < 7 Then If Aoccupe$ = "oui" Then joueurB$ = "rouladeAV": reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                    If IA = 7 Then If Aoccupe$ = "oui" Then levier2$ = "gauche": GoTo actionB
                End If

                If distance < 9 And distance > 6 Then ' distance de combat 1
                    ' pour autoriser les croisements
                    If demo$ = "non" And joueurA$ = "rouladeAV" Then joueurB$ = "saute": reftempsB = temps: Boccupe$ = "oui": GoTo gestionB

                    ' pour se rapprocher
                    If joueurA$ = "rouladeAR" Then joueurB$ = "genou": reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                    If levier1$ = "gauche" Then joueurB$ = "araignee": reftempsB = temps: Boccupe$ = "oui": GoTo gestionB


                    'plus l'IA est forte, plus il y des des coups impos‚s avant infocoupB ou infodegat

                    If IA = 5 Then
                        If joueurA$ = "front" Then joueurB$ = "protegeH": reftempsB = temps: GoTo gestionB
                    End If

                    'pour eviter les degats repetitifs
                    If infoBdegatG > 4 Then
                        If joueurA$ = "assis2" Or joueurA$ = "genou" Or joueurA$ = "araignee" Then joueurB$ = "araignee": reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                    End If
                    If infoBdegatG > 2 Then
                        If joueurA$ = "assis2" Or joueurA$ = "genou" Or joueurA$ = "araignee" Then joueurB$ = "rouladeAV": reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                    End If

                    If infoBdegatT > 2 Then
                        If joueurA$ = "cou" Then joueurB$ = "genou": reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                    End If

                    If infoBdegatF > 2 Then
                        If IA < 7 Then If joueurA$ = "front" Then joueurB$ = "rouladeAV": reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                    End If



                    'pour alterner les attaques

                    If infocoupB = 0 Then joueurB$ = "devant": infocoupB = infocoupB + 1: reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                    If infocoupB = 1 Then joueurB$ = "front": infocoupB = infocoupB + 1: reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                    If infocoupB = 2 Then joueurB$ = "araignee": infocoupB = infocoupB + 1: reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                    If infocoupB = 3 Then joueurB$ = "araignee": infocoupB = infocoupB + 1: reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                    If infocoupB = 4 Then joueurB$ = "cou": infocoupB = infocoupB + 1: reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                    If infocoupB = 5 Then levier2$ = "gauche": infocoupB = 0: GoTo actionB


                End If
                If distance <= 6 Then

                    ' pour autoriser les croisements
                    If demo$ = "non" And joueurA$ = "saute" Then joueurB$ = "rouladeAV": reftempsB = temps: Boccupe$ = "oui": GoTo gestionB


                    If IA > 4 Then If joueurA$ = "devant" Then joueurB$ = "protegeD": reftempsB = temps: GoTo gestionB

                    If IA > 4 And IA < 7 Then If joueurA$ = "genou" Then joueurB$ = "saute": reftempsB = temps: Boccupe$ = "oui": GoTo gestionB

                    If infoBdegatG > 4 Then
                        If joueurA$ = "assis2" Or joueurA$ = "genou" Or joueurA$ = "araignee" Then joueurB$ = "araignee": reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                    End If
                    If infoBdegatG > 2 Then
                        If joueurA$ = "coupdepied" Then joueurB$ = "rouladeAV": reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                        If joueurA$ = "assis2" Or joueurA$ = "genou" Or joueurA$ = "araignee" Then joueurB$ = "rouladeAV": reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                    End If

                    If infocoupB = 0 Then joueurB$ = "coupdepied": infocoupB = infocoupB + 1: reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                    If infocoupB = 1 Then joueurB$ = "coupdetete": infocoupB = infocoupB + 1: reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                    If infocoupB = 2 Then joueurB$ = "araignee": infocoupB = infocoupB + 1: reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                    If infocoupB = 3 Then joueurB$ = "genou": infocoupB = infocoupB + 1: reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                    If infocoupB = 4 Then joueurB$ = "genou": infocoupB = infocoupB + 1: reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                    If infocoupB = 5 Then levier2$ = "gauche": infocoupB = 0: GoTo actionB


                End If
            End If


            If sens$ = "inverse" Then

                distance = xA - xB

                If distance >= 15 Then '  quand trop loin
                    joueurB$ = "rouladeAVR": reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                End If

                If distance < 15 Then
                    If IA = 7 Then If joueurA$ = "decapiteR" Then joueurB$ = "rouladeAVR": reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                End If

                If distance = 12 And joueurA$ = "deboutR" Then joueurB$ = "decapiteR": reftempsB = temps: Boccupe$ = "oui": GoTo gestionB

                If distance > 9 And distance < 15 Then ' pour se rapprocher
                    If levier1$ = "droite" Then joueurB$ = "deboutR": GoTo gestionB
                    levier2$ = "droite": GoTo actionB
                End If

                If distance = 9 Then
                    If attenteA > 100 Then joueurB$ = "decapiteR": reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                    If demo$ = "oui" Then If attenteA > 100 Then joueurB$ = "decapiteR": reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                    If joueurA$ = "rouladeARR" Then joueurB$ = "genouR": reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                    If IA < 7 Then If Aoccupe$ = "oui" Then joueurB$ = "rouladeAVR": reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                    If IA = 7 Then If Aoccupe$ = "oui" Then levier2$ = "droite": GoTo actionB
                End If

                If distance < 9 And distance > 6 Then ' distance de combat 1
                    ' pour autoriser les croisements
                    If demo$ = "non" And joueurA$ = "rouladeAV" Then joueurB$ = "sauteR": reftempsB = temps: Boccupe$ = "oui": GoTo gestionB

                    ' pour se rapprocher
                    If joueurA$ = "rouladeARR" Then joueurB$ = "genouR": reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                    If levier1$ = "droite" Then joueurB$ = "araigneeR": reftempsB = temps: Boccupe$ = "oui": GoTo gestionB


                    'plus l'IA est forte, plus il y des des coups impos‚s avant infocoupB ou infodegat

                    If IA = 5 Then
                        If joueurA$ = "frontR" Then joueurB$ = "protegeHR": reftempsB = temps: GoTo gestionB
                    End If

                    'pour eviter les degats repetitifs
                    If infoBdegatG > 4 Then
                        If joueurA$ = "assis2R" Or joueurA$ = "genouR" Or joueurA$ = "araigneeR" Then joueurB$ = "araigneeR": reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                    End If
                    If infoBdegatG > 2 Then
                        If joueurA$ = "assis2R" Or joueurA$ = "genouR" Or joueurA$ = "araigneeR" Then joueurB$ = "rouladeAVR": reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                    End If

                    If infoBdegatT > 2 Then
                        If joueurA$ = "couR" Then joueurB$ = "genouR": reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                    End If

                    If infoBdegatF > 2 Then
                        If IA < 7 Then If joueurA$ = "frontR" Then joueurB$ = "rouladeAVR": reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                    End If



                    'pour alterner les attaques

                    If infocoupB = 0 Then joueurB$ = "devantR": infocoupB = infocoupB + 1: reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                    If infocoupB = 1 Then joueurB$ = "frontR": infocoupB = infocoupB + 1: reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                    If infocoupB = 2 Then joueurB$ = "araigneeR": infocoupB = infocoupB + 1: reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                    If infocoupB = 3 Then joueurB$ = "araigneeR": infocoupB = infocoupB + 1: reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                    If infocoupB = 4 Then joueurB$ = "couR": infocoupB = infocoupB + 1: reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                    If infocoupB = 5 Then levier2$ = "droite": infocoupB = 0: GoTo actionB


                End If
                If distance <= 6 Then

                    ' pour autoriser les croisements
                    If demo$ = "non" And joueurA$ = "sauteR" Then joueurB$ = "rouladeAVR": reftempsB = temps: Boccupe$ = "oui": GoTo gestionB


                    If IA > 4 Then If joueurA$ = "devantR" Then joueurB$ = "protegeDR": reftempsB = temps: GoTo gestionB

                    If IA > 4 And IA < 7 Then If joueurA$ = "genouR" Then joueurB$ = "sauteR": reftempsB = temps: Boccupe$ = "oui": GoTo gestionB

                    If infoBdegatG > 4 Then
                        If joueurA$ = "assis2R" Or joueurA$ = "genouR" Or joueurA$ = "araigneeR" Then joueurB$ = "araigneeR": reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                    End If
                    If infoBdegatG > 2 Then
                        If joueurA$ = "coupdepiedR" Then joueurB$ = "rouladeAVR": reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                        If joueurA$ = "assis2R" Or joueurA$ = "genouR" Or joueurA$ = "araigneeR" Then joueurB$ = "rouladeAVR": reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                    End If

                    If infocoupB = 0 Then joueurB$ = "coupdepiedR": infocoupB = infocoupB + 1: reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                    If infocoupB = 1 Then joueurB$ = "coupdeteteR": infocoupB = infocoupB + 1: reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                    If infocoupB = 2 Then joueurB$ = "araigneeR": infocoupB = infocoupB + 1: reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                    If infocoupB = 3 Then joueurB$ = "genouR": infocoupB = infocoupB + 1: reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                    If infocoupB = 4 Then joueurB$ = "genouR": infocoupB = infocoupB + 1: reftempsB = temps: Boccupe$ = "oui": GoTo gestionB
                    If infocoupB = 5 Then levier2$ = "droite": infocoupB = 0: GoTo actionB


                End If

            End If

        End If


    End If

    '                       redirection suivant les touches

    If levier2$ = "hautG" GoTo actionB
    If levier2$ = "hautD" GoTo actionB
    If levier2$ = "basG" GoTo actionB
    If levier2$ = "basD" GoTo actionB
    If levier2$ = "bas" GoTo actionB
    If levier2$ = "haut" GoTo actionB
    If levier2$ = "gauche" GoTo actionB
    If levier2$ = "droite" GoTo actionB


    '                       actions si aucune touche n'a ete touchee


    spriteavanceB = 0
    spritereculeB = 0

    protegeDB$ = "non": protegeHB$ = "non"

    attenteB = attenteB + 1
    levier2$ = "neutre"

    ' pour se relever
    assisB$ = "non"
    If joueurB$ = "assis2" Then joueurB$ = "releve": Boccupe$ = "oui": reftempsB = temps: GoTo gestionB
    If joueurB$ = "assis2R" Then joueurB$ = "releveR": Boccupe$ = "oui": reftempsB = temps: GoTo gestionB


    'attente des 5 secondes
    If sens$ = "normal" Then
        If attenteB > 250 Then joueurB$ = "attente": Boccupe$ = "oui": reftempsB = temps: GoTo gestionB
    End If
    If sens$ = "inverse" Then
        If attenteB > 250 Then joueurB$ = "attenteR": Boccupe$ = "oui": reftempsB = temps: GoTo gestionB
    End If

    If sens$ = "normal" Then joueurB$ = "debout"
    If sens$ = "inverse" Then joueurB$ = "deboutR"

    GoTo gestionB



    '                       *****************************************
    '                       *************actions joueur 2************
    '                       *****************************************
    actionB:

    attenteB = 1

    If partie$ = "solo" Then '  ****** IA mode ******

        '                       droite,gauche, decapite, devant (normal)  IA
        If sens$ = "normal" Then
            If levier2$ = "gauche" Then
                protegeDB$ = "non"
                If spriteavanceB = 1 Then joueurB$ = "avance1": GoTo gestionB
                If spriteavanceB = 2 Then joueurB$ = "avance2": GoTo gestionB
                If spriteavanceB = 3 Then joueurB$ = "avance3": GoTo gestionB
                If spriteavanceB = 4 Then joueurB$ = "avance4": GoTo gestionB
                joueurB$ = "avance": reftempsB = temps
            End If

            If levier2$ = "droite" Then
                protegeHB$ = "non"
                If spritereculeB = 1 Then joueurB$ = "recule1": GoTo gestionB
                If spritereculeB = 2 Then joueurB$ = "recule2": GoTo gestionB
                If spritereculeB = 3 Then joueurB$ = "recule3": GoTo gestionB
                If spritereculeB = 4 Then joueurB$ = "recule4": GoTo gestionB
                joueurB$ = "recule": reftempsB = temps
            End If
        End If
        '                       droite, gauche, decapite, devant (inverse)  ******* IA mode ********

        If sens$ = "inverse" Then
            If levier2$ = "droite" Then
                protegeDB$ = "non"
                If spriteavanceB = 1 Then joueurB$ = "avance1R": GoTo gestionB
                If spriteavanceB = 2 Then joueurB$ = "avance2R": GoTo gestionB
                If spriteavanceB = 3 Then joueurB$ = "avance3R": GoTo gestionB
                If spriteavanceB = 4 Then joueurB$ = "avance4R": GoTo gestionB
                joueurB$ = "avanceR": reftempsB = temps
            End If

            If levier2$ = "gauche" Then
                protegeHB$ = "non"
                If spritereculeB = 1 Then joueurB$ = "recule1R": GoTo gestionB
                If spritereculeB = 2 Then joueurB$ = "recule2R": GoTo gestionB
                If spritereculeB = 3 Then joueurB$ = "recule3R": GoTo gestionB
                If spritereculeB = 4 Then joueurB$ = "recule4R": GoTo gestionB
                joueurB$ = "reculeR": reftempsB = temps
            End If
        End If

        GoTo gestionB
    End If



    '                       droite,gauche, decapite, devant (normal)


    If sens$ = "normal" Then
        If levier2$ = "gauche" Then
            protegeDB$ = "non"
            If spriteavanceB = 1 Then joueurB$ = "avance1": GoTo gestionB
            If spriteavanceB = 2 Then joueurB$ = "avance2": GoTo gestionB
            If spriteavanceB = 3 Then joueurB$ = "avance3": GoTo gestionB
            If spriteavanceB = 4 Then joueurB$ = "avance4": GoTo gestionB
            joueurB$ = "avance": reftempsB = temps
            If attaqueB$ = "oui" And entree$ = "non" Then joueurB$ = "devant": Boccupe$ = "oui": reftempsB = temps
        End If

        If levier2$ = "droite" Then
            protegeHB$ = "non"
            If spritereculeB = 1 Then joueurB$ = "recule1": GoTo gestionB
            If spritereculeB = 2 Then joueurB$ = "recule2": GoTo gestionB
            If spritereculeB = 3 Then joueurB$ = "recule3": GoTo gestionB
            If spritereculeB = 4 Then joueurB$ = "recule4": GoTo gestionB
            joueurB$ = "recule": reftempsB = temps
            If attaqueB$ = "oui" And sortieB$ = "non" Then joueurB$ = "decapite": Boccupe$ = "oui": reftempsB = temps
        End If
    End If


    '                       droite, gauche, decapite, devant (inverse)

    If sens$ = "inverse" Then
        If levier2$ = "droite" Then
            protegeDB$ = "non"
            If spriteavanceB = 1 Then joueurB$ = "avance1R": GoTo gestionB
            If spriteavanceB = 2 Then joueurB$ = "avance2R": GoTo gestionB
            If spriteavanceB = 3 Then joueurB$ = "avance3R": GoTo gestionB
            If spriteavanceB = 4 Then joueurB$ = "avance4R": GoTo gestionB
            joueurB$ = "avanceR": reftempsB = temps
            If attaqueB$ = "oui" Then joueurB$ = "devantR": Boccupe$ = "oui": reftempsB = temps:
        End If

        If levier2$ = "gauche" Then
            protegeHB$ = "non"
            If spritereculeB = 1 Then joueurB$ = "recule1R": GoTo gestionB
            If spritereculeB = 2 Then joueurB$ = "recule2R": GoTo gestionB
            If spritereculeB = 3 Then joueurB$ = "recule3R": GoTo gestionB
            If spritereculeB = 4 Then joueurB$ = "recule4R": GoTo gestionB
            joueurB$ = "reculeR": reftempsB = temps
            If attaqueB$ = "oui" Then joueurB$ = "decapiteR": Boccupe$ = "oui": reftempsB = temps
        End If
    End If

    '                           saute, attaque cou

    If sens$ = "normal" Then

        If levier2$ = "haut" Then
            protegeDB$ = "non": protegeHB$ = "non"
            joueurB$ = "saute": Boccupe$ = "oui": reftempsB = temps: GoTo gestionB
        End If
    End If

    If sens$ = "inverse" Then
        If levier2$ = "haut" Then
            protegeDB$ = "non": protegeHB$ = "non"
            joueurB$ = "sauteR": Boccupe$ = "oui": reftempsB = temps: GoTo gestionB
        End If
    End If


    '                               assis, attaque genou
    If sens$ = "normal" Then
        If levier2$ = "bas" Then
            If attaqueB$ = "oui" Then joueurB$ = "genou": Boccupe$ = "oui": reftempsB = temps: GoTo gestionB
            If assisB$ = "oui" Then joueurB$ = "assis2": GoTo gestionB
            joueurB$ = "assis": Boccupe$ = "oui": reftempsB = temps: GoTo gestionB
        End If
    End If
    If sens$ = "inverse" Then
        If levier2$ = "bas" Then
            If attaqueB$ = "oui" Then joueurB$ = "genouR": Boccupe$ = "oui": reftempsB = temps: GoTo gestionB
            If assisB$ = "oui" Then joueurB$ = "assis2R": GoTo gestionB
            joueurB$ = "assisR": Boccupe$ = "oui": reftempsB = temps: GoTo gestionB
        End If
    End If


    '                               roulade AV, coup de pied
    If sens$ = "normal" Then
        If levier2$ = "basG" Then
            joueurB$ = "rouladeAV": Boccupe$ = "oui": reftempsB = temps
            If attaqueB$ = "oui" Then joueurB$ = "coupdepied": Boccupe$ = "oui": reftempsB = temps
        End If
    End If
    If sens$ = "inverse" Then
        If levier2$ = "basD" Then
            joueurB$ = "rouladeAVR": Boccupe$ = "oui": reftempsB = temps
            If attaqueB$ = "oui" Then joueurB$ = "coupdepiedR": Boccupe$ = "oui": reftempsB = temps
        End If
    End If



    '                               roulade AR, coup sur front
    If sens$ = "normal" Then
        If levier2$ = "basD" Then
            joueurB$ = "rouladeAR": Boccupe$ = "oui": reftempsB = temps
            If attaqueB$ = "oui" Then joueurB$ = "front": Boccupe$ = "oui": reftempsB = temps
        End If
    End If
    If sens$ = "inverse" Then
        If levier2$ = "basG" Then
            joueurB$ = "rouladeARR": Boccupe$ = "oui": reftempsB = temps
            If attaqueB$ = "oui" Then joueurB$ = "frontR": Boccupe$ = "oui": reftempsB = temps
        End If
    End If

    '                                   protection Haute, araignee
    If sens$ = "normal" Then
        If levier2$ = "hautD" Then
            If protegeHB$ = "oui" Then joueurB$ = "protegeH": GoTo gestionB
            joueurB$ = "protegeH1": Boccupe$ = "oui": reftempsB = temps
            If attaqueB$ = "oui" Then joueurB$ = "araignee": Boccupe$ = "oui": reftempsB = temps
        End If
    End If

    If sens$ = "inverse" Then
        If levier2$ = "hautG" Then
            If protegeHB$ = "oui" Then joueurB$ = "protegeHR": GoTo gestionB
            joueurB$ = "protegeHR1": Boccupe$ = "oui": reftempsB = temps
            If attaqueB$ = "oui" Then joueurB$ = "araigneeR": Boccupe$ = "oui": reftempsB = temps
        End If
    End If


    '                                   protection devant, coup de tete
    If sens$ = "normal" Then
        If levier2$ = "hautG" Then
            If protegeDB$ = "oui" Then joueurB$ = "protegeD": GoTo gestionB
            joueurB$ = "protegeD1": Boccupe$ = "oui": reftempsB = temps
            If attaqueB$ = "oui" Then joueurB$ = "coupdetete": Boccupe$ = "oui": reftempsB = temps
        End If
    End If
    If sens$ = "inverse" Then
        If levier2$ = "hautD" Then
            If protegeDB$ = "oui" Then joueurB$ = "protegeDR": GoTo gestionB
            joueurB$ = "protegeDR1": Boccupe$ = "oui": reftempsB = temps
            If attaqueB$ = "oui" Then joueurB$ = "coupdeteteR": Boccupe$ = "oui": reftempsB = temps
        End If
    End If


    '                       ***********************************
    '                       *********gestion joueur 2**********
    '                       ***********************************
    gestionB:

    If joueurB$ = "debout" Then
        spriteB$ = "debout": decapiteB$ = "oui"
        sangB$ = "non"
        xAttB = xB + 4: yAttB = 14
        yFB = 15: yTB = 16: yMB = 18: yGB = 20
        xFB = xB: xTB = xB: xMB = xB: xGB = xB
        If partie$ = "solo" Then
            If temps > reftempsB + 20 Then Boccupe$ = "non"
        End If
    End If

    If joueurB$ = "deboutR" Then
        spriteB$ = "deboutR"
        decapiteB$ = "oui"
        sangB$ = "non"
        xAttB = xB: yAttB = 14:
        yFB = 15: yTB = 16: yMB = 18: yGB = 20
        xFB = xB + 4: xTB = xB + 4: xMB = xB + 4: xGB = xB + 4
        If partie$ = "solo" Then
            If temps > reftempsB + 20 Then Boccupe$ = "non"
        End If
    End If

    If joueurB$ = "attente" Then
        xFB = xB: xTB = xB: xMB = xB: xGB = xB
        If temps > reftempsB + 50 Then Boccupe$ = "non": attenteB = 1: joueurB$ = "debout": GoTo colision
        If temps > reftempsB + 37 Then spriteB$ = "attente1": GoTo colision
        If temps > reftempsB + 30 Then spriteB$ = "attente2": GoTo colision
        If temps > reftempsB + 23 Then spriteB$ = "attente3": GoTo colision
        If temps > reftempsB + 15 Then spriteB$ = "attente2": GoTo colision
        If temps > reftempsB + 8 Then GoTo colision
        If temps > reftempsB + 7 Then _SndPlay attente: spriteB$ = "attente1": GoTo colision
    End If

    If joueurB$ = "attenteR" Then
        xFB = xB + 4: xTB = xB + 4: xMB = xB + 4: xGB = xB + 4
        If temps > reftempsB + 50 Then Boccupe$ = "non": attenteB = 1: joueurB$ = "deboutR": GoTo colision
        If temps > reftempsB + 37 Then spriteB$ = "attente1R": GoTo colision
        If temps > reftempsB + 30 Then spriteB$ = "attente2R": GoTo colision
        If temps > reftempsB + 23 Then spriteB$ = "attente3R": GoTo colision
        If temps > reftempsB + 15 Then spriteB$ = "attente2R": GoTo colision
        If temps > reftempsB + 8 Then GoTo colision
        If temps > reftempsB + 7 Then _SndPlay attente: spriteB$ = "attente1R": GoTo colision
    End If

    If joueurB$ = "saute" Then
        xAttB = xB + 4: xFB = xB: xTB = xB: xMB = xB: xGB = xB
        yGB = yMB: yAttB = 14
        decapiteB$ = "non"
        If attaqueB$ = "oui" Then joueurB$ = "cou": Boccupe$ = "oui": reftempsB = temps: GoTo colision
        If temps > reftempsB + 45 Then Boccupe$ = "non": spriteB$ = "debout": joueurB$ = "debout": GoTo colision
        If temps > reftempsB + 40 Then spriteB$ = "debout": xMB = xB: xGB = xB: GoTo colision
        If temps > reftempsB + 30 Then spriteB$ = "saut1": xMB = xB: xGB = xB + 1: decapiteB$ = "oui": GoTo colision
        If temps > reftempsB + 13 Then spriteB$ = "saut2": xMB = xB + 3: xGB = xB + 3: GoTo colision
        If temps > reftempsB + 2 Then spriteB$ = "saut1": xMB = xB: xGB = xB + 3
        spriteB$ = "saut1"
    End If

    If joueurB$ = "sauteR" Then
        xAttB = xB: xFB = xB + 4: xTB = xB + 4: xMB = xB + 4: xGB = xB + 4
        yGB = yMB: yAttB = 14
        decapiteB$ = "non"
        If attaqueB$ = "oui" Then joueurB$ = "couR": Boccupe$ = "oui": reftempsB = temps: GoTo colision
        If temps > reftempsB + 45 Then Boccupe$ = "non": spriteB$ = "deboutR": joueurB$ = "deboutR": GoTo colision
        If temps > reftempsB + 40 Then spriteB$ = "deboutR": xMB = xB + 4: xGB = xB + 4: GoTo colision
        If temps > reftempsB + 30 Then spriteB$ = "saut1R": xMB = xB + 4: xGB = xB + 1: decapiteB$ = "oui": GoTo colision
        If temps > reftempsB + 13 Then spriteB$ = "saut2R": xMB = xB + 1: xGB = xB + 1: GoTo colision
        If temps > reftempsB + 2 Then spriteB$ = "saut1R": xMB = xB + 4: xGB = xB + 1
        spriteB$ = "saut1R"
    End If

    '                                   avance
    If joueurB$ = "avance" Then
        xFB = xB: xTB = xB: xMB = xB: xGB = xB
        xAttB = xB + 4
        If attaqueB$ = "oui" And entree$ = "non" Then joueurB$ = "devant": Boccupe$ = "oui": reftempsB = temps: GoTo gestionB
        spriteB$ = "marche1": spriteavanceB = 1: xB = xB - 1
    End If

    If joueurB$ = "avance1" Then
        xFB = xB: xTB = xB: xMB = xB: xGB = xB
        xAttB = xB + 4
        If attaqueB$ = "oui" And entree$ = "non" Then joueurB$ = "devant": Boccupe$ = "oui": reftempsB = temps: GoTo gestionB
        If temps > reftempsB + 9 Then xB = xB - 1: spriteB$ = "marche2": spriteavanceB = 2
    End If

    If joueurB$ = "avance2" Then
        xFB = xB: xTB = xB: xMB = xB: xGB = xB
        xAttB = xB + 4
        spriteB$ = "marche2"
        If attaqueB$ = "oui" And entree$ = "non" Then joueurB$ = "devant": Boccupe$ = "oui": reftempsB = temps: GoTo gestionB
        If temps > reftempsB + 18 Then xB = xB - 1: spriteB$ = "marche3": spriteavanceB = 3
    End If

    If joueurB$ = "avance3" Then
        xFB = xB: xTB = xB: xMB = xB: xGB = xB
        xAttB = xB + 4
        spriteB$ = "marche3"
        If attaqueB$ = "oui" And entree$ = "non" Then joueurB$ = "devant": Boccupe$ = "oui": reftempsB = temps: GoTo gestionB
        If temps > reftempsB + 27 Then xB = xB - 1: spriteB$ = "debout": spriteavanceB = 4
    End If

    If joueurB$ = "avance4" Then
        xFB = xB: xTB = xB: xMB = xB: xGB = xB
        xAttB = xB + 4
        spriteB$ = "debout"
        If attaqueB$ = "oui" And entree$ = "non" Then joueurB$ = "devant": Boccupe$ = "oui": reftempsB = temps: GoTo gestionB
        If temps > reftempsB + 36 Then joueurB$ = "debout": reftempsB = temps: spriteavanceB = 0
    End If


    If joueurB$ = "avanceR" Then
        xFB = xB + 4: xTB = xB + 4: xMB = xB + 4: xGB = xB + 4
        xAttB = xB
        If attaqueB$ = "oui" Then joueurB$ = "devantR": Boccupe$ = "oui": reftempsB = temps: GoTo gestionB
        spriteB$ = "marche1R": spriteavanceB = 1: xB = xB + 1
    End If

    If joueurB$ = "avance1R" Then
        xFB = xB + 4: xTB = xB + 4: xMB = xB + 4: xGB = xB + 4
        xAttB = xB
        If attaqueB$ = "oui" Then joueurB$ = "devantR": Boccupe$ = "oui": reftempsB = temps: GoTo gestionB
        If temps > reftempsB + 9 Then xB = xB + 1: spriteB$ = "marche2R": spriteavanceB = 2
    End If

    If joueurB$ = "avance2R" Then
        xFB = xB + 4: xTB = xB + 4: xMB = xB + 4: xGB = xB + 4
        xAttB = xB
        spriteB$ = "marche2R"
        If attaqueB$ = "oui" Then joueurB$ = "devantR": Boccupe$ = "oui": reftempsB = temps: GoTo gestionB
        If temps > reftempsB + 17 Then xB = xB + 1: spriteB$ = "marche3R": spriteavanceB = 3
    End If

    If joueurB$ = "avance3R" Then
        xFB = xB + 4: xTB = xB + 4: xMB = xB + 4: xGB = xB + 4
        xAttB = xB
        spriteB$ = "marche3R"
        If attaqueB$ = "oui" Then joueurB$ = "devantR": Boccupe$ = "oui": reftempsB = temps: GoTo gestionB
        If temps > reftempsB + 27 Then xB = xB + 1: spriteB$ = "deboutR": spriteavanceB = 4
    End If

    If joueurB$ = "avance4R" Then
        xFB = xB + 4: xTB = xB + 4: xMB = xB + 4: xGB = xB + 4
        xAttB = xB
        spriteB$ = "deboutR"
        If attaqueB$ = "oui" Then joueurB$ = "devantR": Boccupe$ = "oui": reftempsB = temps: GoTo gestionB
        If temps > reftempsB + 36 Then joueurB$ = "deboutR": reftempsB = temps: spriteavanceB = 0
    End If

    '                                        recule
    If joueurB$ = "recule" Then
        xFB = xB: xTB = xB: xMB = xB: xGB = xB
        xAttB = xB + 4
        If attaqueB$ = "oui" And sortieB$ = "non" Then joueurB$ = "decapite": Boccupe$ = "oui": reftempsB = temps: GoTo gestionB
        spriteB$ = "marche3": spritereculeB = 1: xB = xB + 1
    End If

    If joueurB$ = "recule1" Then
        xFB = xB: xTB = xB: xMB = xB: xGB = xB
        xAttB = xB + 4
        If attaqueB$ = "oui" And sortieB$ = "non" Then joueurB$ = "decapite": Boccupe$ = "oui": reftempsB = temps: GoTo gestionB
        If temps > reftempsB + 9 Then xB = xB + 1: spriteB$ = "marche2": spritereculeB = 2
    End If
    If joueurB$ = "recule2" Then
        xFB = xB: xTB = xB: xMB = xB: xGB = xB
        xAttB = xB + 4
        spriteB$ = "marche2"
        If attaqueB$ = "oui" And sortieB$ = "non" Then joueurB$ = "decapite": Boccupe$ = "oui": reftempsB = temps: GoTo gestionB
        If temps > reftempsB + 18 Then xB = xB + 1: spriteB$ = "marche1": spritereculeB = 3
    End If
    If joueurB$ = "recule3" Then
        xFB = xB: xTB = xB: xMB = xB: xGB = xB
        xAttB = xB + 4
        spriteB$ = "marche1"
        If attaqueB$ = "oui" And sortieB$ = "non" Then joueurB$ = "decapite": Boccupe$ = "oui": reftempsB = temps: GoTo gestionB
        If temps > reftempsB + 26 Then xB = xB + 1: spriteB$ = "debout": spritereculeB = 4
    End If
    If joueurB$ = "recule4" Then
        xFB = xB: xTB = xB: xMB = xB: xGB = xB
        xAttB = xB + 4
        spriteB$ = "debout"
        If attaqueB$ = "oui" And sortieB$ = "non" Then joueurB$ = "decapite": Boccupe$ = "oui": reftempsB = temps: GoTo gestionB
        If temps > reftempsB + 36 Then joueurB$ = "debout": reftempsB = temps: spritereculeB = 0
    End If

    '                               recule inverse
    If joueurB$ = "reculeR" Then
        xAttB = xB
        xFB = xB + 4: xTB = xB + 4: xMB = xB + 4: xGB = xB + 4
        If attaqueB$ = "oui" Then joueurB$ = "decapiteR": Boccupe$ = "oui": reftempsB = temps: GoTo gestionB
        spriteB$ = "marche3R": spritereculeB = 1: xB = xB - 1
    End If

    If joueurB$ = "recule1R" Then
        xAttB = xB
        xFB = xB + 4: xTB = xB + 4: xMB = xB + 4: xGB = xB + 4
        If attaqueB$ = "oui" Then joueurB$ = "decapiteR": Boccupe$ = "oui": reftempsB = temps: GoTo gestionB
        If temps > reftempsB + 9 Then xB = xB - 1: spriteB$ = "marche2R": spritereculeB = 2
    End If
    If joueurB$ = "recule2R" Then
        xAttB = xB
        xFB = xB + 4: xTB = xB + 4: xMB = xB + 4: xGB = xB + 4
        spriteB$ = "marche2R"
        If attaqueB$ = "oui" Then joueurB$ = "decapiteR": Boccupe$ = "oui": reftempsB = temps: GoTo gestionB
        If temps > reftempsB + 18 Then xB = xB - 1: spriteB$ = "marche1R": spritereculeB = 3
    End If
    If joueurB$ = "recule3R" Then
        xAttB = xB
        xFB = xB + 4: xTB = xB + 4: xMB = xB + 4: xGB = xB + 4
        spriteB$ = "marche1R"
        If attaqueB$ = "oui" Then joueurB$ = "decapiteR": Boccupe$ = "oui": reftempsB = temps: GoTo gestionB
        If temps > reftempsB + 26 Then xB = xB - 1: spriteB$ = "deboutR": spritereculeB = 4
    End If
    If joueurB$ = "recule4R" Then
        xAttB = xB
        xFB = xB + 4: xTB = xB + 4: xMB = xB + 4: xGB = xB + 4
        spriteB$ = "deboutR"
        If attaqueB$ = "oui" Then joueurB$ = "decapiteR": Boccupe$ = "oui": reftempsB = temps: GoTo gestionB
        If temps > reftempsB + 36 Then joueurB$ = "deboutR": reftempsB = temps: spritereculeB = 0
    End If

    If joueurB$ = "assis" Then
        xAttB = xB + 4
        xFB = xB + 4: xTB = xB + 4: xMB = xB + 4: xGB = xB
        spriteB$ = "assis1"
        If temps > reftempsB + 10 Then joueurB$ = "assis2": GoTo colision
        If attaqueB$ = "oui" Then joueurB$ = "genou": Boccupe$ = "oui": reftempsB = temps
    End If

    If joueurB$ = "assis2" Then
        assisB$ = "oui"
        xAttB = xB + 4
        xFB = xB + 4: xTB = xB + 4: xMB = xB: xGB = xB
        spriteB$ = "assis2"
        If attaqueB$ = "oui" Then joueurB$ = "genou": Boccupe$ = "oui": reftempsB = temps
        If partie$ = "solo" Then
            If temps > reftempsB + 20 Then Boccupe$ = "non"
            GoTo colision
        End If
        Boccupe$ = "non"
    End If

    If joueurB$ = "releve" Then
        xAttB = xB + 4: yAttA = 14
        xFB = xB + 4: xTB = xB + 4: xMB = xB: xGB = xB
        spriteB$ = "assis1"
        If temps > reftempsB + 10 Then joueurB$ = "debout": Boccupe$ = "non": GoTo colision
        If attaqueB$ = "oui" Then joueurB$ = "genou": Boccupe$ = "oui": reftempsB = temps
    End If


    If joueurB$ = "assisR" Then
        xAttB = xB
        xFB = xB: xTB = xB: xMB = xB: xGB = xB + 4
        spriteB$ = "assis1R"
        If temps > reftemps + 10 Then joueurB$ = "assis2R": GoTo colision
        If attaqueB$ = "oui" Then joueurB$ = "genouR": Boccupe$ = "oui": reftempsB = temps
    End If

    If joueurB$ = "assis2R" Then
        assisB$ = "oui"
        xAttB = xB
        xFB = xB: xTB = xB: xMB = xB + 4: xGB = xB + 4
        spriteB$ = "assis2R"
        If attaqueB$ = "oui" Then joueurB$ = "genouR": Boccupe$ = "oui": reftempsB = temps
        If partie$ = "solo" Then
            If temps > reftempsB + 20 Then Boccupe$ = "non"
            GoTo colision
        End If
        Boccupe$ = "non"
    End If

    If joueurB$ = "releveR" Then
        xAttB = xB: yAttA = 14
        xFB = xB: xTB = xB: xMB = xB + 4: xGB = xB + 4
        spriteB$ = "assis1R"
        If temps > reftempsB + 10 Then joueurB$ = "deboutR": Boccupe$ = "non": GoTo colision
        If attaqueB$ = "oui" Then joueurB$ = "genouR": Boccupe$ = "oui": reftempsB = temps
    End If

    If joueurB$ = "rouladeAV" Then
        xFB = xB + 4: xTB = xB + 4: xMB = xB + 4: xGB = xB
        yGB = 20: yAttB = yGB: xAttB = xB + 4
        If attaqueB$ = "oui" Then joueurB$ = "coupdepied": Boccupe$ = "oui": reftempsB = temps: GoTo gestionB
        If temps > reftempsB + 38 Then
            spriteB$ = "debout": xTB = xB: xMB = xB:
            Boccupe$ = "non": xB = xB - 1: joueurB$ = "finderoulade": GoTo finderouladeB
        End If
        If temps > reftempsB + 33 Then spriteB$ = "debout": GoTo colision
        If temps > reftempsB + 31 Then GoTo colision
        If temps > reftempsB + 30 Then xB = xB - 1: spriteB$ = "roulade6": GoTo colision
        If temps > reftempsB + 29 Then GoTo colision
        If temps > reftempsB + 28 Then xB = xB - 1: spriteB$ = "roulade5": GoTo colision
        If temps > reftempsB + 26 Then GoTo colision
        If temps > reftempsB + 25 Then xB = xB - 1: spriteB$ = "roulade5": GoTo colision
        If temps > reftempsB + 23 Then GoTo colision
        If temps > reftempsB + 22 Then xB = xB - 1: spriteB$ = "roulade4": GoTo colision
        If temps > reftempsB + 20 Then GoTo colision
        If temps > reftempsB + 19 Then xB = xB - 1: spriteB$ = "roulade4": GoTo colision
        If temps > reftempsB + 17 Then GoTo colision
        If temps > reftempsB + 16 Then xB = xB - 1: xAttB = xB - 1: spriteB$ = "roulade3": GoTo colision
        If temps > reftempsB + 14 Then GoTo colision
        If temps > reftempsB + 13 Then xB = xB - 1: xAttB = xB - 1: spriteB$ = "roulade3": GoTo colision
        If temps > reftempsB + 11 Then GoTo colision
        If temps > reftempsB + 10 Then xB = xB - 1: spriteB$ = "roulade2": GoTo colision
        If temps > reftempsB + 8 Then GoTo colision
        If temps > reftempsB + 7 Then xB = xB - 1: spriteB$ = "roulade2": GoTo colision
        If temps > reftempsB + 5 Then GoTo colision
        If temps > reftempsB + 4 Then xB = xB - 1: spriteB$ = "roulade1": GoTo colision
        If temps > reftempsB + 2 Then GoTo colision
        If temps > reftempsB + 1 Then _SndPlay roule: xB = xB - 1: spriteB$ = "roulade1": GoTo colision
    End If

    finderouladeB:

    If joueurB$ = "finderoulade" Then
        If xB > xA Then
            joueurB$ = "debout"
            spriteB$ = "debout"
            xAttB = xB + 4: yAttB = 17
            xFB = xB: xTB = xB: xMB = xB: xGB = xB
            yFB = 15: yTB = 16: yMB = 18: yGB = 20
            GoTo colision
        End If
        If xB < xA + 1 Then
            joueurA$ = "retourne": yAttA = 14: Aoccupe$ = "oui": reftemps = temps
            joueurB$ = "retourne": yAttB = 14: Boccupe$ = "oui": reftempsB = temps
            GoTo affichage
        End If
    End If

    If joueurB$ = "rouladeAVR" Then
        xFB = xB: xTB = xB: xMB = xB: xGB = xB + 4
        yGB = 20: yAttB = yGB: xAttB = xB
        If attaqueB$ = "oui" Then joueurB$ = "coupdepiedR": Boccupe$ = "oui": reftempsB = temps: GoTo gestionB
        If temps > reftempsB + 38 Then
            spriteB$ = "deboutR": xTB = xB + 4: xMB = xB + 4:
            Boccupe$ = "non": xB = xB + 1: joueurB$ = "finderouladeR": GoTo finderouladeBR
        End If
        If temps > reftempsB + 33 Then spriteB$ = "deboutR": GoTo colision
        If temps > reftempsB + 31 Then GoTo colision
        If temps > reftempsB + 30 Then xB = xB + 1: spriteB$ = "roulade6R": GoTo colision
        If temps > reftempsB + 29 Then GoTo colision
        If temps > reftempsB + 28 Then xB = xB + 1: spriteB$ = "roulade5R": GoTo colision
        If temps > reftempsB + 26 Then GoTo colision
        If temps > reftempsB + 25 Then xB = xB + 1: spriteB$ = "roulade5R": GoTo colision
        If temps > reftempsB + 23 Then GoTo colision
        If temps > reftempsB + 22 Then xB = xB + 1: spriteB$ = "roulade4R": GoTo colision
        If temps > reftempsB + 20 Then GoTo colision
        If temps > reftempsB + 19 Then xB = xB + 1: spriteB$ = "roulade4R": GoTo colision
        If temps > reftempsB + 17 Then GoTo colision
        If temps > reftempsB + 16 Then xB = xB + 1: xAttB = xB + 5: spriteB$ = "roulade3R": GoTo colision
        If temps > reftempsB + 14 Then GoTo colision
        If temps > reftempsB + 13 Then xB = xB + 1: xAttB = xB + 5: spriteB$ = "roulade3R": GoTo colision
        If temps > reftempsB + 11 Then GoTo colision
        If temps > reftempsB + 10 Then xB = xB + 1: spriteB$ = "roulade2R": GoTo colision
        If temps > reftempsB + 8 Then GoTo colision
        If temps > reftempsB + 7 Then xB = xB + 1: spriteB$ = "roulade2R": GoTo colision
        If temps > reftempsB + 5 Then GoTo colision
        If temps > reftempsB + 4 Then xB = xB + 1: spriteB$ = "roulade1R": GoTo colision
        If temps > reftempsB + 2 Then GoTo colision
        If temps > reftempsB + 1 Then _SndPlay roule: xB = xB + 1: spriteB$ = "roulade1R": GoTo colision
    End If

    finderouladeBR:

    If joueurB$ = "finderouladeR" Then
        If xB < xA Then
            joueurB$ = "deboutR"
            spriteB$ = "deboutR"
            xAttB = xB: yAttB = 17
            xFB = xB + 4: xTB = xB + 4: xMB = xB + 4: xGB = xB + 4
            yFB = 15: yTB = 16: yMB = 18: yGB = 20
            GoTo colision
        End If
        If xB > xA - 1 Then
            joueurA$ = "retourneR": Aoccupe$ = "oui": reftemps = temps
            joueurB$ = "retourneR": Boccupe$ = "oui": reftempsB = temps
            GoTo affichage
        End If
    End If

    If joueurB$ = "rouladeAR" Then
        xFB = xB + 4: xTB = xB + 4: xMB = xB + 4: xGB = xB
        yGB = 20: yAttB = yGB: xAttB = xB + 4
        If attaqueB$ = "oui" Then joueurB$ = "front": Boccupe$ = "oui": reftempsB = temps: GoTo gestionB
        If temps > reftempsB + 38 Then
            spriteB$ = "debout": xTB = xB: xMB = xB:
            Boccupe$ = "non": joueurB$ = "debout": GoTo colision
        End If
        If temps > reftempsB + 33 Then spriteB$ = "debout": GoTo colision
        If temps > reftempsB + 30 Then GoTo colision
        If temps > reftempsB + 29 Then xB = xB + 1: spriteB$ = "roulade1": GoTo colision
        If temps > reftempsB + 27 Then GoTo colision
        If temps > reftempsB + 26 Then xB = xB + 1: spriteB$ = "roulade1": GoTo colision
        If temps > reftempsB + 24 Then GoTo colision
        If temps > reftempsB + 23 Then xB = xB + 1: spriteB$ = "roulade2": GoTo colision
        If temps > reftempsB + 21 Then GoTo colision
        If temps > reftempsB + 20 Then xB = xB + 1: spriteB$ = "roulade2": GoTo colision
        If temps > reftempsB + 18 Then GoTo colision
        If temps > reftempsB + 17 Then xB = xB + 1: spriteB$ = "roulade3": GoTo colision
        If temps > reftempsB + 15 Then GoTo colision
        If temps > reftempsB + 14 Then xB = xB + 1: spriteB$ = "roulade3": GoTo colision
        If temps > reftempsB + 12 Then GoTo colision
        If temps > reftempsB + 11 Then xB = xB + 1: spriteB$ = "roulade4": GoTo colision
        If temps > reftempsB + 9 Then GoTo colision
        If temps > reftempsB + 8 Then xB = xB + 1: spriteB$ = "roulade4": GoTo colision
        If temps > reftempsB + 6 Then GoTo colision
        If temps > reftempsB + 5 Then xB = xB + 1: spriteB$ = "roulade5": GoTo colision
        If temps > reftempsB + 3 Then GoTo colision
        If temps > reftempsB + 2 Then xB = xB + 1: spriteB$ = "roulade6": GoTo colision
        If temps > reftempsB + 1 Then _SndPlay roule: spriteB$ = "roulade6": GoTo colision
    End If

    If joueurB$ = "rouladeARR" Then
        xFB = xB: xTB = xB: xMB = xB: xGB = xB + 4
        yGB = 20: yAttB = yGB: xAttB = xB
        If attaqueB$ = "oui" Then joueurB$ = "frontR": Boccupe$ = "oui": reftempsB = temps: GoTo gestionB
        If temps > reftempsB + 38 Then
            spriteB$ = "deboutR": xTB = xB + 4: xMB = xB + 4:
            Boccupe$ = "non": joueurB$ = "deboutR": GoTo colision
        End If
        If temps > reftempsB + 33 Then spriteB$ = "deboutR": GoTo colision
        If temps > reftempsB + 30 Then GoTo colision
        If temps > reftempsB + 29 Then xB = xB - 1: spriteB$ = "roulade1R": GoTo colision
        If temps > reftempsB + 27 Then GoTo colision
        If temps > reftempsB + 26 Then xB = xB - 1: spriteB$ = "roulade1R": GoTo colision
        If temps > reftempsB + 24 Then GoTo colision
        If temps > reftempsB + 23 Then xB = xB - 1: spriteB$ = "roulade2R": GoTo colision
        If temps > reftempsB + 21 Then GoTo colision
        If temps > reftempsB + 20 Then xB = xB - 1: spriteB$ = "roulade2R": GoTo colision
        If temps > reftempsB + 18 Then GoTo colision
        If temps > reftempsB + 17 Then xB = xB - 1: spriteB$ = "roulade3R": GoTo colision
        If temps > reftempsB + 15 Then GoTo colision
        If temps > reftempsB + 14 Then xB = xB - 1: spriteB$ = "roulade3R": GoTo colision
        If temps > reftempsB + 12 Then GoTo colision
        If temps > reftempsB + 11 Then xB = xB - 1: spriteB$ = "roulade4R": GoTo colision
        If temps > reftempsB + 9 Then GoTo colision
        If temps > reftempsB + 8 Then xB = xB - 1: spriteB$ = "roulade4R": GoTo colision
        If temps > reftempsB + 6 Then GoTo colision
        If temps > reftempsB + 5 Then xB = xB - 1: spriteB$ = "roulade5R": GoTo colision
        If temps > reftempsB + 3 Then GoTo colision
        If temps > reftempsB + 2 Then xB = xB - 1: spriteB$ = "roulade6R": GoTo colision
        If temps > reftempsB + 1 Then _SndPlay roule: spriteB$ = "roulade6R": GoTo colision
    End If

    If joueurB$ = "protegeH1" Then
        xFB = xB: xTB = xB: xMB = xB: xGB = xB
        xAttB = xB + 4
        yGB = 20
        If attaqueB$ = "oui" Then joueurB$ = "araignee": Boccupe$ = "oui": reftempsB = temps: GoTo gestionB
        If temps > reftempsB + 5 Then protegeHB$ = "oui": joueurB$ = "protegeH": Boccupe$ = "non": GoTo colision
        If temps > reftempsB + 2 Then GoTo colision
        If temps > reftempsB + 1 Then _SndPlay protege: xB = xB + 1: spriteB$ = "marche1": GoTo colision
    End If

    If joueurB$ = "protegeH" Then
        xFB = xB: xTB = xB: xMB = xB: xGB = xB
        xAttB = xB + 4
        yGB = 20
        spriteB$ = "protegeH"
        If attaqueB$ = "oui" Then joueurB$ = "araignee": Boccupe$ = "oui": reftempsB = temps: GoTo gestionB
    End If

    If joueurB$ = "protegeHR1" Then
        xFB = xB + 4: xTB = xB + 4: xMB = xB + 4: xGB = xB + 4
        xAttB = xB
        yGB = 20
        If attaqueB$ = "oui" Then joueurB$ = "araigneeR": Boccupe$ = "oui": reftempsB = temps: GoTo gestionB
        If temps > reftempsB + 5 Then protegeHB$ = "oui": joueurB$ = "protegeHR": Boccupe$ = "non": GoTo colision
        If temps > reftempsB + 2 Then GoTo colision
        If temps > reftempsB + 1 Then _SndPlay protege: xB = xB - 1: spriteB$ = "marche1R": GoTo colision
    End If

    If joueurB$ = "protegeHR" Then
        xFB = xB + 4: xTB = xB + 4: xMB = xB + 4: xGB = xB + 4
        xAttB = xB
        yGB = 20
        spriteB$ = "protegeHR"
        If attaqueB$ = "oui" Then joueurB$ = "araigneeR": Boccupe$ = "oui": reftempsB = temps: GoTo gestionB
    End If

    If joueurB$ = "protegeD1" Then
        xAttB = xB + 4
        yGB = 20
        xFB = xB: xTB = xB: xMB = xB: xGB = xB
        decapiteB$ = "non"
        spriteB$ = "protegeH"
        If attaqueB$ = "oui" Then joueurB$ = "coupdetete": Boccupe$ = "oui": reftempsB = temps: GoTo gestionB
        If temps > reftempsB + 5 Then joueurB$ = "protegeD": protegeDB$ = "oui": Boccupe$ = "non"
        If temps > reftempsB + 2 Then GoTo colision
        If temps > reftempsB + 1 Then _SndPlay protege
    End If

    If joueurB$ = "protegeD" Then
        xAttB = xB + 4
        yGB = 20
        xFB = xB: xTB = xB: xMB = xB: xGB = xB
        decapiteB$ = "non"
        spriteB$ = "protegeD"
        If attaqueB$ = "oui" Then joueurB$ = "coupdetete": Boccupe$ = "oui": reftempsB = temps: GoTo gestionB
    End If

    If joueurB$ = "protegeDR1" Then
        xAttB = xB
        yGB = 20
        xFB = xB + 4: xTB = xB + 4: xMB = xB + 4: xGB = xB + 4
        decapiteB$ = "non"
        spriteB$ = "protegeHR"
        If attaqueB$ = "oui" Then joueurB$ = "coupdeteteR": Boccupe$ = "oui": reftempsB = temps: GoTo gestionB
        If temps > reftempsB + 5 Then joueurB$ = "protegeDR": protegeDB$ = "oui": Boccupe$ = "non"
        If temps > reftempsB + 2 Then GoTo colision
        If temps > reftempsB + 1 Then _SndPlay protege
    End If

    If joueurB$ = "protegeDR" Then
        xAttB = xB
        yGB = 20
        xFB = xB + 4: xTB = xB + 4: xMB = xB + 4: xGB = xB + 4
        decapiteB$ = "non"
        spriteB$ = "protegeDR"
        If attaqueB$ = "oui" Then joueurB$ = "coupdeteteR": Boccupe$ = "oui": reftempsB = temps: GoTo gestionB
    End If

    If joueurB$ = "cou" Then '****attention au temps sinon il saute
        xFB = xB: xTB = xB: xMB = xB: xGB = xB
        yGB = 20
        If temps > reftempsB + 45 Then Boccupe$ = "non": joueurB$ = "debout": GoTo colision
        If temps > reftempsB + 40 Then spriteB$ = "cou2": xAttB = xB + 4: GoTo colision
        If temps > reftempsB + 31 Then xAttB = xB + 4: GoTo colision
        If temps > reftempsB + 30 Then
            spriteB$ = "cou3"
            If joueurA$ = "cou" Then GoTo colision
            xTB = xB + 4: xAttB = xB - 3: GoTo colision
        End If
        If temps > reftempsB + 16 Then GoTo colision
        If temps > reftempsB + 15 Then
            songrogne = songrogne + 1
            If songrogne > 6 Then songrogne = 0
            If songrogne = 3 Then _SndPlay grogne1
            If songrogne = 6 Then _SndPlay grogne2
            _SndPlay epee: spriteB$ = "cou2": yAttB = yTB: GoTo colision
        End If
        If temps > reftempsB + 3 Then spriteB$ = "cou1": GoTo colision
    End If

    If joueurB$ = "couR" Then '****attention au temps sinon il saute
        xFB = xB + 4: xTB = xB + 4: xMB = xB + 4: xGB = xB + 4
        yGB = 20
        If temps > reftempsB + 45 Then Boccupe$ = "non": joueurB$ = "deboutR": GoTo colision
        If temps > reftempsB + 40 Then spriteB$ = "cou2R": xAttB = xB: GoTo colision
        If temps > reftempsB + 31 Then xAttB = xB: GoTo colision
        If temps > reftempsB + 30 Then
            spriteB$ = "cou3R"
            If joueurA$ = "couR" Then GoTo colision
            xTB = xB: xAttB = xB + 7: GoTo colision
        End If
        If temps > reftempsB + 16 Then GoTo colision
        If temps > reftempsB + 15 Then
            songrogne = songrogne + 1
            If songrogne > 6 Then songrogne = 0
            If songrogne = 3 Then _SndPlay grogne1
            If songrogne = 6 Then _SndPlay grogne2
            _SndPlay epee: spriteB$ = "cou2R": yAttB = yTB: GoTo colision
        End If
        If temps > reftempsB + 3 Then spriteB$ = "cou1R": GoTo colision
    End If

    If joueurB$ = "devant" Then
        xFB = xB: xTB = xB: xMB = xB: xGB = xB
        yGB = 20
        If temps > reftempsB + 45 Then Boccupe$ = "non": joueurB$ = "debout": GoTo colision
        If temps > reftempsB + 40 Then spriteB$ = "devant2": GoTo colision
        If temps > reftempsB + 21 Then spriteB$ = "devant3": xAttB = xB + 4: GoTo colision
        If temps > reftempsB + 20 Then
            spriteB$ = "devant3"
            If joueurA$ = "devant" Then GoTo colision
            xMB = xB + 4: xAttB = xB - 2: GoTo colision
        End If
        If temps > reftempsB + 11 Then GoTo colision
        If temps > reftempsB + 10 Then
            songrogne = songrogne + 1
            If songrogne > 6 Then songrogne = 0
            If songrogne = 3 Then _SndPlay grogne1
            If songrogne = 6 Then _SndPlay grogne2
            _SndPlay epee: spriteB$ = "devant2": yAttB = yMB
        End If
        spriteB$ = "devant1"
    End If

    If joueurB$ = "devantR" Then
        xFB = xB + 4: xTB = xB + 4: xMB = xB + 4: xGB = xB + 4
        yGB = 20
        If temps > reftempsB + 45 Then Boccupe$ = "non": joueurB$ = "deboutR": GoTo colision
        If temps > reftempsB + 40 Then spriteB$ = "devant2R": GoTo colision
        If temps > reftempsB + 21 Then spriteB$ = "devant3R": xAttB = xB: GoTo colision
        If temps > reftempsB + 20 Then
            spriteB$ = "devant3R"
            If joueurA$ = "devantR" Then GoTo colision
            xMB = xB: xAttB = xB + 6: GoTo colision
        End If
        If temps > reftempsB + 11 Then GoTo colision
        If temps > reftempsB + 10 Then
            songrogne = songrogne + 1
            If songrogne > 6 Then songrogne = 0
            If songrogne = 3 Then _SndPlay grogne1
            If songrogne = 6 Then _SndPlay grogne2
            _SndPlay epee: spriteB$ = "devant2R": yAttB = yMB: GoTo colision
        End If
        spriteB$ = "devant1R"
    End If

    If joueurB$ = "genou" Then
        xFB = xB + 4: xTB = xB + 4: xMB = xB + 4: xGB = xB
        yGB = 20
        If temps > reftempsB + 45 Then Boccupe$ = "non": joueurB$ = "assis2": GoTo colision
        If temps > reftempsB + 40 Then spriteB$ = "genou2": GoTo colision
        If temps > reftempsB + 21 Then spriteB$ = "genou3": xAttB = xB + 4: GoTo colision
        If temps > reftempsB + 20 Then
            spriteB$ = "genou3"
            If joueurA$ = "genou" Then GoTo colision
            xGB = xB + 4: xAttB = xB - 3: GoTo colision
        End If
        If temps > reftempsB + 11 Then GoTo colision
        If temps > reftempsB + 10 Then
            songrogne = songrogne + 1
            If songrogne > 6 Then songrogne = 0
            If songrogne = 3 Then _SndPlay grogne1
            If songrogne = 6 Then _SndPlay grogne2
            _SndPlay epee: spriteB$ = "genou2": yAttB = yGB: GoTo colision
        End If
        spriteB$ = "genou1"
    End If

    If joueurB$ = "genouR" Then
        xFB = xB: xTB = xB: xMB = xB: xGB = xB + 4
        yGB = 20
        If temps > reftempsB + 45 Then Boccupe$ = "non": joueurB$ = "assis2R": GoTo colision
        If temps > reftempsB + 40 Then spriteB$ = "genou2R": GoTo colision
        If temps > reftempsB + 21 Then spriteB$ = "genou3R": xAttB = xB: GoTo colision
        If temps > reftempsB + 20 Then
            spriteB$ = "genou3R"
            If joueurA$ = "genouR" Then GoTo colision
            xGB = xB: xAttB = xB + 7: GoTo colision
        End If
        If temps > reftempsB + 11 Then GoTo colision
        If temps > reftempsB + 10 Then
            songrogne = songrogne + 1
            If songrogne > 6 Then songrogne = 0
            If songrogne = 3 Then _SndPlay grogne1
            If songrogne = 6 Then _SndPlay grogne2
            _SndPlay epee: spriteB$ = "genou2R": yAttB = yGB: GoTo colision
        End If
        spriteB$ = "genou1R"
    End If

    If joueurB$ = "araignee" Then
        xFB = xB: xTB = xB: xMB = xB + 4: xGB = xB
        yAttB = yGB: xAttB = xB + 4: yGB = 20
        If temps > reftempsB + 24 Then Boccupe$ = "non": joueurB$ = "debout": GoTo colision
        If temps > reftempsB + 19 Then xAttB = xB + 4: GoTo colision
        If temps > reftempsB + 18 Then
            _SndPlay epee
            spriteB$ = "toile4"
            If joueurA$ = "araignee" Then GoTo colision
            xAttB = xB - 1: GoTo colision
        End If
        If temps > reftempsB + 13 Then GoTo colision
        If temps > reftempsB + 12 Then spriteB$ = "toile3": xAttB = xB + 4: GoTo colision
        If temps > reftempsB + 7 Then GoTo colision
        If temps > reftempsB + 6 Then
            songrogne = songrogne + 1
            If songrogne > 6 Then songrogne = 0
            If songrogne = 3 Then _SndPlay grogne1
            If songrogne = 6 Then _SndPlay grogne2
            _SndPlay epee: spriteB$ = "toile2": xAttB = xB + 4: GoTo colision
        End If
        spriteB$ = "toile1"
    End If

    If joueurB$ = "araigneeR" Then
        xFB = xB + 4: xTB = xB + 4: xMB = xB: xGB = xB + 4
        yAttB = yGB: xAttB = xB: yGB = 20
        If temps > reftempsB + 24 Then Boccupe$ = "non": joueurB$ = "deboutR": GoTo colision
        If temps > reftempsB + 19 Then xAttB = xB: GoTo colision
        If temps > reftempsB + 18 Then
            _SndPlay epee
            spriteB$ = "toile4R"
            If joueurA$ = "araigneeR" Then GoTo colision
            xAttB = xB + 5: GoTo colision
        End If
        If temps > reftempsB + 13 Then GoTo colision
        If temps > reftempsB + 12 Then spriteB$ = "toile3R": xAttB = xB: GoTo colision
        If temps > reftempsB + 7 Then GoTo colision
        If temps > reftempsB + 6 Then
            songrogne = songrogne + 1
            If songrogne > 6 Then songrogne = 0
            If songrogne = 3 Then _SndPlay grogne1
            If songrogne = 6 Then _SndPlay grogne2
            _SndPlay epee: spriteB$ = "toile2R": xAttB = xB: GoTo colision
        End If
        spriteB$ = "toile1R"
    End If

    If joueurB$ = "coupdepied" Then
        xFB = xB: xTB = xB: xMB = xB: xGB = xB
        spriteB$ = "pied1": yAttB = yGB: yGB = 20
        If temps > reftempsB + 15 Then spriteB$ = "pied2": xAttB = xB - 1
        If temps > reftempsB + 16 Then spriteB$ = "pied2": xAttB = xB + 4
        If temps > reftempsB + 30 Then spriteB$ = "pied1"
        If temps > reftempsB + 45 Then spriteB$ = "debout"
        If temps > reftempsB + 50 Then Boccupe$ = "non": joueurB$ = "debout"
    End If

    If joueurB$ = "coupdepiedR" Then
        xFB = xB + 4: xTB = xB + 4: xMB = xB + 4: xGB = xB + 4
        spriteB$ = "pied1R": yAttB = yGB: yGB = 20
        If temps > reftempsB + 15 Then spriteB$ = "pied2R": xAttB = xB + 5
        If temps > reftempsB + 16 Then spriteB$ = "pied2R": xAttB = xB
        If temps > reftempsB + 30 Then spriteB$ = "pied1R"
        If temps > reftempsB + 45 Then spriteB$ = "deboutR"
        If temps > reftempsB + 50 Then Boccupe$ = "non": joueurB$ = "deboutR"
    End If

    If joueurB$ = "coupdetete" Then
        xFB = xB: xTB = xB: xMB = xB: xGB = xB
        yGB = 20
        If temps > reftempsB + 37 Then Boccupe$ = "non": spriteB$ = "debout": joueurB$ = "debout": GoTo colision
        If temps > reftempsB + 29 Then GoTo colision
        If temps > reftempsB + 28 Then xB = xB + 1: spriteB$ = "tete1": GoTo colision
        If temps > reftempsB + 20 Then xAttB = xB + 4: GoTo colision
        If temps > reftempsB + 19 Then spriteB$ = "tete2": xAttB = xB: GoTo colision
        If temps > reftempsB + 18 Then xB = xB - 1: spriteB$ = "tete2": xAttB = xB + 4: GoTo colision
        If temps > reftempsB + 9 Then spriteB$ = "tete1": yAttB = yTB: GoTo colision
        If temps > reftempsB + 1 Then spriteB$ = "tete1"
    End If

    If joueurB$ = "coupdeteteR" Then
        xFB = xB + 4: xTB = xB + 4: xMB = xB + 4: xGB = xB + 4
        yGB = 20
        If temps > reftempsB + 37 Then Boccupe$ = "non": spriteB$ = "deboutR": joueurB$ = "deboutR": GoTo colision
        If temps > reftempsB + 29 Then GoTo colision
        If temps > reftempsB + 28 Then xB = xB - 1: spriteB$ = "tete1R": xAttB = xB: GoTo colision
        If temps > reftempsB + 20 Then xAttB = xB: GoTo colision
        If temps > reftempsB + 19 Then spriteB$ = "tete2R": xAttB = xB + 4: GoTo colision
        If temps > reftempsB + 18 Then xB = xB + 1: spriteB$ = "tete2R": xAttB = xB: GoTo colision
        If temps > reftempsB + 9 Then spriteB$ = "tete1R": yAttB = yTB: GoTo colision
        If temps > reftempsB + 1 Then spriteB$ = "tete1R"
    End If

    If joueurB$ = "decapite" Then
        decapiteB$ = "non"
        xFB = xB + 1: xTB = xB + 2: xMB = xB + 2: xGB = xB
        If temps > reftempsB + 58 Then Boccupe$ = "non": spriteB$ = "debout": joueurB$ = "debout": GoTo colision
        If temps > reftempsB + 51 Then spriteB$ = "cou2": xAttB = xB + 4: GoTo colision
        If temps > reftempsB + 50 Then spriteB$ = "cou3": xTB = xB + 4: xAttB = xB - 2: GoTo colision
        If temps > reftempsB + 40 Then spriteB$ = "cou3": yAttB = yTB: GoTo colision
        If temps > reftempsB + 35 Then spriteB$ = "cou2": yAttB = yTB: GoTo colision
        If temps > reftempsB + 30 Then spriteB$ = "cou1": yAttB = yTB: GoTo colision
        If temps > reftempsB + 25 Then GoTo colision
        If temps > reftempsB + 24 Then xB = xB - 1: GoTo colision
        If temps > reftempsB + 20 Then spriteB$ = "retourne3": GoTo colision
        If temps > reftempsB + 19 Then xB = xB - 1: GoTo colision
        If temps > reftempsB + 15 Then spriteB$ = "retourne3": GoTo colision
        If temps > reftempsB + 14 Then _SndPlay decapite: xB = xB - 1: GoTo colision
        If temps > reftempsB + 10 Then spriteB$ = "retourne2": GoTo colision
        If temps > reftempsB + 9 Then xB = xB - 1: GoTo colision
        If temps > reftempsB + 5 Then spriteB$ = "retourne2": GoTo colision
        If temps > reftempsB + 4 Then xB = xB - 1: GoTo colision
        If temps > reftempsB + 2 Then spriteB$ = "retourne1": GoTo colision
        If temps > reftempsB + 1 Then xB = xB - 1: spriteB$ = "retourne1": GoTo colision
    End If

    If joueurB$ = "decapiteR" Then
        decapiteB$ = "non"
        xFB = xB + 3: xTB = xB + 2: xMB = xB + 2: xGB = xB + 4
        If temps > reftempsB + 58 Then Boccupe$ = "non": spriteB$ = "deboutR": joueurB$ = "deboutR": GoTo colision
        If temps > reftempsB + 51 Then spriteB$ = "cou2R": xAttB = xB: GoTo colision
        If temps > reftempsB + 50 Then spriteB$ = "cou3R": xTB = xB: xAttB = xB + 6: GoTo colision
        If temps > reftempsB + 40 Then spriteB$ = "cou3R": yAttB = yTB: GoTo colision
        If temps > reftempsB + 35 Then spriteB$ = "cou2R": yAttB = yTB: GoTo colision
        If temps > reftempsB + 30 Then spriteB$ = "cou1R": yAttB = yTB: GoTo colision
        If temps > reftempsB + 25 Then GoTo colision
        If temps > reftempsB + 24 Then xB = xB + 1: GoTo colision
        If temps > reftempsB + 20 Then spriteB$ = "retourne3R": GoTo colision
        If temps > reftempsB + 19 Then xB = xB + 1: GoTo colision
        If temps > reftempsB + 15 Then spriteB$ = "retourne3R": GoTo colision
        If temps > reftempsB + 14 Then _SndPlay decapite: xB = xB + 1: GoTo colision
        If temps > reftempsB + 10 Then spriteB$ = "retourne2R": GoTo colision
        If temps > reftempsB + 9 Then xB = xB + 1: GoTo colision
        If temps > reftempsB + 5 Then spriteB$ = "retourne2R": GoTo colision
        If temps > reftempsB + 4 Then xB = xB + 1: GoTo colision
        If temps > reftempsB + 2 Then spriteB$ = "retourne1R": GoTo colision
        If temps > reftempsB + 1 Then xB = xB + 1: spriteB$ = "retourne1R": GoTo colision
    End If

    If joueurB$ = "front" Then
        xFB = xB: xTB = xB: xMB = xB: xGB = xB
        yGB = 20
        If temps > reftempsB + 45 Then Boccupe$ = "non": joueurB$ = "debout": GoTo colision
        If temps > reftempsB + 35 Then spriteB$ = "front2": GoTo colision
        If temps > reftempsB + 24 Then spriteB$ = "front3": xAttB = xB + 4: GoTo colision
        If temps > reftempsB + 23 Then
            spriteB$ = "front3"
            If joueurA$ = "front" Then GoTo colision
            xFB = xB + 4: xAttB = xB - 3: GoTo colision
        End If
        If temps > reftempsB + 6 Then GoTo colision
        If temps > reftempsB + 5 Then
            songrogne = songrogne + 1
            If songrogne > 6 Then songrogne = 0
            If songrogne = 3 Then _SndPlay grogne1
            If songrogne = 6 Then _SndPlay grogne2
            _SndPlay epee: spriteB$ = "front2": yAttB = yFB: GoTo colision
        End If
        If temps > reftempsB + 3 Then spriteB$ = "front1": GoTo colision
    End If

    If joueurB$ = "frontR" Then
        yGB = 20
        xFB = xB + 4: xTB = xB + 4: xMB = xB + 4: xGB = xB + 4
        If temps > reftempsB + 45 Then Boccupe$ = "non": joueurB$ = "deboutR": GoTo colision
        If temps > reftempsB + 35 Then spriteB$ = "front2R": GoTo colision
        If temps > reftempsB + 24 Then spriteB$ = "front3R": xAttB = xB: GoTo colision
        If temps > reftempsB + 23 Then
            spriteB$ = "front3R"
            If joueurA$ = "frontR" Then GoTo colision
            xFB = xB: xAttB = xB + 7: GoTo colision
        End If
        If temps > reftempsB + 6 Then GoTo colision
        If temps > reftempsB + 5 Then
            songrogne = songrogne + 1
            If songrogne > 6 Then songrogne = 0
            If songrogne = 3 Then _SndPlay grogne1
            If songrogne = 6 Then _SndPlay grogne2
            _SndPlay epee: spriteB$ = "front2R": yAttB = yFB: GoTo colision
        End If
        If temps > reftempsB + 3 Then spriteB$ = "front1R": GoTo colision
    End If

    If joueurB$ = "retourne" Then
        xAttB = xB + 4: xFB = xB: xTB = xB: xMB = xB: xGB = xB
        yAttB = 14:
        spriteB$ = "retourne1"
        If temps > reftempsB + 5 Then spriteB$ = "retourne2"
        If temps > reftempsB + 10 Then spriteB$ = "retourne3"
        If temps > reftempsB + 15 Then joueurB$ = "deboutR": Boccupe$ = "non": sens$ = "inverse"
    End If

    If joueurB$ = "retourneR" Then
        xAttB = xB: xFB = xB + 4: xTB = xB + 4: xMB = xB + 4: xGB = xB + 4
        yAttB = 14:
        spriteB$ = "retourne1R"
        If temps > reftempsB + 5 Then spriteB$ = "retourne2R"
        If temps > reftempsB + 10 Then spriteB$ = "retourne3R"
        If temps > reftempsB + 15 Then joueurB$ = "debout": Boccupe$ = "non": sens$ = "normal"
    End If

    If joueurB$ = "vainqueur" Then
        spriteB$ = "vainqueur1"
        decapiteB$ = "oui"
        sangB$ = "non"
        xAttB = xB + 4: yAttB = 14: yGB = 20
        xFB = xB: xTB = xB: xMB = xB: xGB = xB
        If temps > reftempsB + 18 Then spriteB$ = "vainqueur2"
        If temps > reftempsB + 35 Then spriteB$ = "vainqueur3"
        If temps > reftempsB + 85 Then spriteB$ = "vainqueur2"
        If temps > reftempsB + 100 Then spriteB$ = "vainqueur1"
    End If

    If joueurB$ = "vainqueurR" Then
        spriteB$ = "vainqueur1R"
        decapiteB$ = "oui"
        sangB$ = "non"
        xAttB = xB: yAttB = 14: yGB = 20
        xFB = xB + 4: xTB = xB + 4: xMB = xB + 4: xGB = xB + 4
        If temps > reftempsB + 18 Then spriteB$ = "vainqueur2R"
        If temps > reftempsB + 35 Then spriteB$ = "vainqueur3R"
        If temps > reftempsB + 85 Then spriteB$ = "vainqueur2R"
        If temps > reftempsB + 100 Then spriteB$ = "vainqueur1R"
    End If

    If joueurB$ = "vainqueurKO" Then
        decapiteB$ = "oui"
        sangB$ = "non"
        xAttB = xB + 4: yGB = 20: 'yAttB = 14:
        xFB = xB: xTB = xB: xMB = xB: xGB = xB

        If temps > reftemps + 230 Then
            gnome$ = "oui": reftemps = temps
            xGNOME = 1
            xSPRt = 270
            GoTo affichage
        End If

        If temps > reftempsB + 205 Then spriteB$ = "vainqueur1": GoTo colision
        If temps > reftempsB + 195 Then spriteB$ = "vainqueur2": GoTo colision
        If temps > reftempsB + 140 Then spriteB$ = "vainqueur3": GoTo colision
        If temps > reftempsB + 123 Then spriteB$ = "vainqueur2": GoTo colision
        If temps > reftempsB + 105 Then spriteB$ = "vainqueur1": GoTo colision
        If temps > reftempsB + 100 Then spriteB$ = "debout": GoTo colision
        If temps > reftempsB + 75 Then spriteB$ = "pied1": spriteA$ = "mort4": GoTo colision
        If temps > reftempsB + 71 Then GoTo colision
        If temps > reftempsB + 70 Then
            spriteB$ = "pied2": spriteA$ = "mort3": xA = xA - 2: GoTo colision
        End If
        If temps > reftempsB + 55 Then spriteB$ = "pied1": GoTo colision
        If temps > reftempsB + 40 Then spriteB$ = "debout": GoTo colision
        If temps > reftempsB + 36 Then GoTo colision
        If temps > reftempsB + 35 Then
            distance = xB - xA
            If distance < 5 Then spriteB$ = "marche3": xB = xB + 1
            If distance > 5 Then spriteB$ = "marche3": xB = xB - 1
            GoTo colision
        End If
        If temps > reftempsB + 30 Then spriteB$ = "debout": GoTo colision
        If temps > reftempsB + 23 Then spriteB$ = "retourne3": GoTo colision
        If temps > reftempsB + 15 Then spriteB$ = "retourne2": GoTo colision
        If temps > reftempsB + 8 Then spriteB$ = "retourne1"
    End If

    If joueurB$ = "vainqueurKOR" Then
        decapiteB$ = "oui"
        sangB$ = "non"
        xAttB = xB: yGB = 20: ' yAttB = 14
        xFB = xB + 4: xTB = xB + 4: xMB = xB + 4: xGB = xB + 4

        If temps > reftemps + 230 Then
            gnome$ = "oui": reftemps = temps
            xGNOME = 1
            xSPRt = 270
            GoTo affichage
        End If

        If temps > reftempsB + 205 Then spriteB$ = "vainqueur1R": GoTo colision
        If temps > reftempsB + 190 Then spriteB$ = "vainqueur2R": GoTo colision
        If temps > reftempsB + 140 Then spriteB$ = "vainqueur3R": GoTo colision
        If temps > reftempsB + 123 Then spriteB$ = "vainqueur2R": GoTo colision
        If temps > reftempsB + 105 Then spriteB$ = "vainqueur1R": GoTo colision
        If temps > reftempsB + 100 Then spriteB$ = "deboutR": GoTo colision
        If temps > reftempsB + 75 Then spriteB$ = "pied1R": spriteA$ = "mort4R": GoTo colision
        If temps > reftempsB + 71 Then GoTo colision
        If temps > reftempsB + 70 Then
            spriteB$ = "pied2R": spriteA$ = "mort3R": xA = xA + 2: GoTo colision
        End If
        If temps > reftempsB + 55 Then spriteB$ = "pied1R": GoTo colision
        If temps > reftempsB + 40 Then spriteB$ = "deboutR": GoTo colision
        If temps > reftempsB + 36 Then GoTo colision
        If temps > reftempsB + 35 Then
            distance = xA - xB
            If distance < 5 Then spriteB$ = "marche3R": xB = xB - 1
            If distance > 5 Then spriteB$ = "marche3R": xB = xB + 1
            GoTo colision
        End If
        If temps > reftempsB + 30 Then spriteB$ = "deboutR": GoTo colision
        If temps > reftempsB + 23 Then spriteB$ = "retourne3R": GoTo colision
        If temps > reftempsB + 15 Then spriteB$ = "retourne2R": GoTo colision
        If temps > reftempsB + 8 Then spriteB$ = "retourne1R"
    End If


    '                               ******degats B ******
    If joueurB$ = "touche" Then
        attenteB = 0
        xAttB = xB + 4
        xFB = xB + 4: xTB = xB + 4: xMB = xB + 4: xGB = xB + 4
        yFB = 15: yTB = 16: yMB = 18: yGB = 20
        If joueurA$ = "coupdepied" Then joueurB$ = "tombe": GoTo gestionB


        sangB$ = "oui"
        serpentB$ = "oui"

        If joueurA$ = "decapite" And decapiteB$ = "oui" Then
            joueurB$ = "mortdecap": Boccupe$ = "oui": reftempsB = temps
            xSPRt = xB + 3: scoreA = scoreA + 250
            sangB$ = "non": GoTo mortB
        End If

        vieB = vieB - 1
        If vieB <= 0 Then
            joueurB$ = "mort": Boccupe$ = "oui": reftempsB = temps: sangB$ = "oui": GoTo mortB
        End If

        sontouche = sontouche + 1
        If sontouche > 3 Then sontouche = 1
        If sontouche = 1 Then _SndPlay touche
        If sontouche = 2 Then _SndPlay touche2
        If sontouche = 3 Then _SndPlay touche3


        joueurB$ = "touche1": Boccupe$ = "oui": reftempsB = temps: decapiteB$ = "oui"
        GoTo colision

    End If

    If joueurB$ = "touche1" Then
        If temps > reftempsB + 20 Then
            spriteB$ = "debout": Boccupe$ = "non"
            joueurB$ = "debout": GoTo colision
        End If
        If temps > reftempsB + 15 Then spriteB$ = "touche4": GoTo colision ' pour serpent
        If temps > reftempsB + 11 Then GoTo colision
        If temps > reftempsB + 10 Then xB = xB + 1: sangB$ = "non": spriteB$ = "touche3": GoTo colision
        If temps > reftempsB + 6 Then GoTo colision
        If temps > reftempsB + 5 Then xB = xB + 2: spriteB$ = "touche2": GoTo colision
        If temps > reftempsB + 2 Then GoTo colision
        If temps > reftempsB + 1 Then xB = xB + 1: spriteB$ = "touche1": GoTo colision
        spriteB$ = "touche1"
    End If

    If joueurB$ = "toucheR" Then
        attenteB = 0
        xAttB = xB
        xFB = xB: xTB = xB: xMB = xB: xGB = xB
        yFB = 15: yTB = 16: yMB = 18: yGB = 20
        If joueurA$ = "coupdepiedR" Then joueurB$ = "tombeR": GoTo gestionB

        sangB$ = "oui"
        serpentB$ = "oui"

        If joueurA$ = "decapiteR" And decapiteB$ = "oui" Then
            joueurB$ = "mortdecapR": Boccupe$ = "oui": reftempsB = temps
            xSPRt = xB + 3: scoreA = scoreA + 250
            sangB$ = "non": GoTo mortB
        End If

        vieB = vieB - 1
        If vieB <= 0 Then
            joueurB$ = "mortR": Boccupe$ = "oui": reftempsB = temps: sangB$ = "oui": GoTo mortB
        End If

        sontouche = sontouche + 1
        If sontouche > 3 Then sontouche = 1
        If sontouche = 1 Then _SndPlay touche
        If sontouche = 2 Then _SndPlay touche2
        If sontouche = 3 Then _SndPlay touche3


        joueurB$ = "touche1R": Boccupe$ = "oui": reftempsB = temps: decapiteB$ = "oui"
        GoTo colision
    End If

    If joueurB$ = "touche1R" Then
        If temps > reftempsB + 20 Then
            spriteB$ = "deboutR": Boccupe$ = "non"
            joueurB$ = "deboutR": GoTo colision
        End If
        If temps > reftempsB + 15 Then spriteB$ = "touche4R": GoTo colision ' pour serpent
        If temps > reftempsB + 11 Then GoTo colision
        If temps > reftempsB + 10 Then xB = xB - 1: sangB$ = "non": spriteB$ = "touche3R": GoTo colision
        If temps > reftempsB + 6 Then GoTo colision
        If temps > reftempsB + 5 Then xB = xB - 2: spriteB$ = "touche2R": GoTo colision
        If temps > reftempsB + 2 Then GoTo colision
        If temps > reftempsB + 1 Then xB = xB - 1: spriteB$ = "touche1R": GoTo colision
        spriteB$ = "touche1R"
    End If

    If joueurB$ = "tombe" Then
        attenteB = 0
        xAttB = xB + 4
        xFB = xB + 4: xTB = xB + 4: xMB = xB + 4: xGB = xB + 4
        yFB = 15: yTB = 16: yMB = 18: yGB = 20
        sangB$ = "oui"
        serpentB$ = "oui"

        vieB = vieB - 1: scoreA = scoreA + 100
        If joueurA$ = "rouladeAV" Then vieB = vieB + 1: sangB$ = "non": serpentB$ = "non": scoreA = scoreA - 100
        If vieB <= 0 Then
            joueurB$ = "mort": Boccupe$ = "oui": reftempsB = temps: sangB$ = "oui"
            If joueurA$ = "coupdetete" Or joueurA$ = "coupdepied" Then sangB$ = "non"
            GoTo mortB
        End If

        If joueurA$ = "coupdetete" Then scoreA = scoreA + 150: sangB$ = "non": _SndPlay coupdetete

        If joueurA$ = "coupdepied" Then scoreA = scoreA + 150: sangB$ = "non": _SndPlay coupdepied

        joueurB$ = "tombe1": Boccupe$ = "oui": reftempsB = temps
        GoTo colision
    End If

    If joueurB$ = "tombe1" Then
        attenteB = 0
        xAttB = xB + 4
        xFB = xB + 4: xTB = xB + 4: xMB = xB + 4: xGB = xB + 4
        If temps > reftempsB + 25 Then
            spriteB$ = "debout": xB = xB + 1: joueurB$ = "debout": Boccupe$ = "non":
            GoTo colision
        End If
        If temps > reftempsB + 20 Then spriteB$ = "tombe4": GoTo colision
        If temps > reftempsB + 15 Then spriteB$ = "tombe3": GoTo colision
        If temps > reftempsB + 10 Then GoTo colision
        If temps > reftempsB + 9 Then sangB$ = "non": xB = xB + 2: spriteB$ = "tombe2": GoTo colision
        If temps > reftempsB + 2 Then GoTo colision
        If temps > reftempsB + 1 Then
            _SndPlay tombe
            If joueurA$ = "coupdetete" Then _SndStop tombe
            xB = xB + 2: GoTo colision
        End If
        spriteB$ = "tombe1"
    End If

    If joueurB$ = "tombeR" Then
        xAttB = xB
        attenteB = 0
        xFB = xB: xTB = xB: xMB = xB: xGB = xB
        yFB = 15: yTB = 16: yMB = 18: yGB = 20
        sangB$ = "oui"
        serpentB$ = "oui"

        vieB = vieB - 1: scoreA = scoreA + 100
        If joueurA$ = "rouladeAVR" Then vieB = vieB + 1: sangB$ = "non": serpentB$ = "non": scoreA = scoreA - 100
        If vieB <= 0 Then
            joueurB$ = "mortR": Boccupe$ = "oui": reftempsB = temps: sangB$ = "oui"
            If joueurA$ = "coupdeteteR" Or joueurA$ = "coupdepiedR" Then sangB$ = "non"
            GoTo mortB
        End If

        If joueurA$ = "coupdeteteR" Then scoreA = scoreA + 150: sangB$ = "non": _SndPlay coupdetete

        If joueurA$ = "coupdepiedR" Then scoreA = scoreA + 150: sangB$ = "non": _SndPlay coupdepied

        joueurB$ = "tombe1R": Boccupe$ = "oui": reftempsB = temps
        GoTo colision
    End If

    If joueurB$ = "tombe1R" Then
        xAttB = xB
        attenteB = 0
        xFB = xB: xTB = xB: xMB = xB: xGB = xB
        If temps > reftempsB + 25 Then
            spriteB$ = "deboutR": xB = xB - 1: joueurB$ = "deboutR": Boccupe$ = "non": GoTo colision
        End If
        If temps > reftempsB + 20 Then spriteB$ = "tombe4R": GoTo colision
        If temps > reftempsB + 25 Then spriteB$ = "tombe3R": GoTo colision
        If temps > reftempsB + 10 Then GoTo colision
        If temps > reftempsB + 9 Then sangB$ = "non": xB = xB - 2: spriteB$ = "tombe2R": GoTo colision
        If temps > reftempsB + 2 Then GoTo colision
        If temps > reftempsB + 1 Then
            _SndPlay tombe
            If joueurA$ = "coupdeteteR" Then _SndStop tombe
            xB = xB - 2: GoTo colision
        End If
        spriteB$ = "tombe1R"
    End If


    '                               bruit des epees  et decapitations loupees
    If sens$ = "normal" Then

        If joueurB$ = "clingD" Then
            If joueurA$ = "decapite" And decapiteB$ = "non" Then joueurB$ = "touche": Boccupe$ = "oui": reftempsB = temps: GoTo gestionB
            If joueurA$ = "genou" Then joueurB$ = "touche": Boccupe$ = "oui": reftempsB = temps: GoTo gestionB
            If distance < 12 Then
                soncling = soncling + 1
                If soncling > 3 Then soncling = 1
                If soncling = 1 Then _SndPlay cling
                If soncling = 2 Then _SndPlay cling2
                If soncling = 3 Then _SndPlay cling3
            End If
            joueurB$ = "protegeD": GoTo colision
        End If

        If joueurB$ = "clingH" Then
            If distance < 12 Then
                soncling = soncling + 1
                If soncling > 3 Then soncling = 1
                If soncling = 1 Then _SndPlay cling
                If soncling = 2 Then _SndPlay cling2
                If soncling = 3 Then _SndPlay cling3
            End If
            joueurB$ = "protegeH": GoTo colision
        End If

    End If

    If sens$ = "inverse" Then

        If joueurB$ = "clingD" Then

            If joueurA$ = "decapiteR" And decapiteB$ = "non" Then joueurB$ = "toucheR": Boccupe$ = "oui": reftempsB = temps: GoTo gestionB
            If joueurA$ = "genouR" Then joueurB$ = "toucheR": Boccupe$ = "oui": reftempsB = temps: GoTo gestionB
            If distance < 12 Then
                soncling = soncling + 1
                If soncling > 3 Then soncling = 1
                If soncling = 1 Then _SndPlay cling
                If soncling = 2 Then _SndPlay cling2
                If soncling = 3 Then _SndPlay cling3
            End If
            joueurB$ = "protegeDR": GoTo colision
        End If

        If joueurB$ = "clingH" Then
            If distance < 12 Then
                soncling = soncling + 1
                If soncling > 3 Then soncling = 1
                If soncling = 1 Then _SndPlay cling
                If soncling = 2 Then _SndPlay cling2
                If soncling = 3 Then _SndPlay cling3
            End If
            joueurB$ = "protegeHR": GoTo colision
        End If

    End If

    '                                   *************************************
    '                                   **********gestion de la mort*********
    '                                   *************************************
    mortB:

    If joueurB$ = "mort" Then
        xFB = xB: xTB = xB: xMB = xB: xGB = xB
        If temps > reftempsB + 16 Then GoTo colision
        If temps > reftempsB + 15 Then sangB$ = "non": spriteB$ = "mort2": GoTo colision
        If temps > reftempsB + 1 Then spriteB$ = "mort1": GoTo colision
        spriteB$ = "mort1": joueurA$ = "vainqueurKO": Aoccupe$ = "oui": reftemps = temps
        If lancerfin$ = "oui" Then _SndPlay mortKO: lancerfin$ = "non"
    End If

    If joueurB$ = "mortR" Then
        If temps > reftempsB + 16 Then GoTo colision
        If temps > reftempsB + 15 Then sangB$ = "non": spriteB$ = "mort2R": GoTo colision
        If temps > reftempsB + 1 Then spriteB$ = "mort1R": GoTo colision
        spriteB$ = "mort1R": joueurA$ = "vainqueurKOR": Aoccupe$ = "oui": reftemps = temps
        If lancerfin$ = "oui" Then _SndPlay mortKO: lancerfin$ = "non"
    End If

    If joueurB$ = "mortdecap" Then
        If temps > reftempsB + 80 Then spriteB$ = "decap4": GoTo colision
        If temps > reftempsB + 70 Then spriteB$ = "decap3": GoTo colision
        If temps > reftempsB + 55 Then sangdecapB = 0: GoTo colision
        If temps > reftempsB + 50 Then sangdecapB = 6: GoTo colision
        If temps > reftempsB + 45 Then sangdecapB = 5: GoTo colision
        If temps > reftempsB + 40 Then sangdecapB = 4: GoTo colision
        If temps > reftempsB + 35 Then spriteB$ = "decap2": GoTo colision
        If temps > reftempsB + 20 Then sangdecapB = 0: GoTo colision
        If temps > reftempsB + 15 Then sangdecapB = 3: GoTo colision
        If temps > reftempsB + 10 Then sangdecapB = 2: GoTo colision
        If temps > reftempsB + 5 Then sangdecapB = 1: GoTo colision
        spriteB$ = "decap1": joueurA$ = "vainqueur": Aoccupe$ = "oui": reftemps = temps
        If lancerfin$ = "oui" Then _SndPlay mortdecap: lancerfin$ = "non"
    End If
    If joueurB$ = "mortdecapR" Then
        If temps > reftempsB + 80 Then spriteB$ = "decap4R": GoTo colision
        If temps > reftempsB + 70 Then spriteB$ = "decap3R": GoTo colision
        If temps > reftempsB + 55 Then sangdecapB = 0: GoTo colision
        If temps > reftempsB + 50 Then sangdecapB = 6: GoTo colision
        If temps > reftempsB + 45 Then sangdecapB = 5: GoTo colision
        If temps > reftempsB + 40 Then sangdecapB = 4: GoTo colision
        If temps > reftempsB + 35 Then spriteB$ = "decap2R": GoTo colision
        If temps > reftempsB + 20 Then sangdecapB = 0: GoTo colision
        If temps > reftempsB + 15 Then sangdecapB = 3: GoTo colision
        If temps > reftempsB + 10 Then sangdecapB = 2: GoTo colision
        If temps > reftempsB + 5 Then sangdecapB = 1: GoTo colision
        spriteB$ = "decap1R": joueurA$ = "vainqueurR": Aoccupe$ = "oui": reftemps = temps
        If lancerfin$ = "oui" Then _SndPlay mortdecap: lancerfin$ = "non"
    End If

    '                   ***************************************
    '                   ***********   SORCIER    **************
    '                   ***************************************

    If joueurB$ = "sorcier" Then

        gnome$ = "non"
        xFB = xB + 4: xTB = xB + 4: xMB = xB + 4: xGB = xB + 4

        If temps > reftempsB + 171 Then spriteB$ = "sorcier1": reftempsB = temps: GoTo colision


        If temps > reftempsB + 170 Then xAttB = 6: GoTo colision
        If temps > reftempsB + 165 Then xAttB = 32: GoTo colision
        If temps > reftempsB + 160 Then xAttB = 29: GoTo colision
        If temps > reftempsB + 155 Then xAttB = 26: GoTo colision
        If temps > reftempsB + 150 Then xAttB = 23: GoTo colision
        If temps > reftempsB + 145 Then xAttB = 20: GoTo colision
        If temps > reftempsB + 140 Then xAttB = 17: spriteB$ = "sorcier1": GoTo colision
        If temps > reftempsB + 135 Then xAttB = 14: GoTo colision
        If temps > reftempsB + 131 Then GoTo colision
        If temps > reftempsB + 130 Then spriteB$ = "sorcier2": yAttB = 16: _SndPlay feu: GoTo colision
        If temps > reftempsB + 90 Then xAttB = 6: GoTo colision
        If temps > reftempsB + 85 Then xAttB = 32: GoTo colision
        If temps > reftempsB + 80 Then xAttB = 29: GoTo colision
        If temps > reftempsB + 75 Then xAttB = 26: GoTo colision
        If temps > reftempsB + 70 Then xAttB = 23: GoTo colision
        If temps > reftempsB + 65 Then xAttB = 20: yAttB = 20: GoTo colision
        If temps > reftempsB + 60 Then xAttB = 17: spriteB$ = "sorcier1": yAttB = 18: GoTo colision
        If temps > reftempsB + 55 Then xAttB = 14: GoTo colision
        If temps > reftempsB + 51 Then GoTo colision
        If temps > reftempsB + 50 Then spriteB$ = "sorcier2": _SndPlay feu: GoTo colision
        spriteB$ = "sorcier1"
        xAttB = xB: yAttB = 16: yGB = 20
        sangB$ = "non"
    End If


    '                   ***************************************
    '                   ***********   COLISION   **************
    '                   ***************************************
    colision:

    If sens$ = "inverse" GoTo colisionR

    If joueurA$ = "saute" And joueurB$ = "rouladeAV" Then GoTo sortiecadre
    If joueurB$ = "saute" And joueurA$ = "rouladeAV" Then GoTo sortiecadre

    '                               pour empecher que A entre dans B


    If levier1$ = "droite" Or joueurA$ = "rouladeAV" Or joueurA$ = "decapite" Then
        distance = xB - xA
        If distance < 4 Then xA = xA - 1:
    End If


    '                                pour empecher que B entre dans A

    If levier2$ = "gauche" Or joueurB$ = "rouladeAV" Or joueurB$ = "decapite" Then
        distance = xB - xA
        If distance < 4 Then xB = xB + 1
    End If

    '                               garder la distance debout
    If joueurB$ = "debout" And joueurA$ = "debout" Then
        distance = xB - xA
        If distance < 4 Then xA = xA - 1: xB = xB + 1
    End If


    '                               sortie du cadre
    sortiecadre:

    If entree$ = "oui" Or sortieA$ = "oui" Or sortieB$ = "oui" Then
        If xA < 0 Then xA = 0
        If xB < 0 Then xB = 0
        If xA > 40 Then xA = 40
        If xB > 40 Then xB = 40
        GoTo tetesvolantes
    End If

    If entree$ = "non" Then
        If xA < 5 Then xA = 5
        If xA > 32 Then xA = 32
        If xB < 5 Then xB = 5
        If xB > 32 Then xB = 32
    End If


    GoTo tetesvolantes

    '                   ***************************************
    '                   ***********   COLISION INVERSE ********
    '                   ***************************************

    If sens$ = "normal" Then GoTo affichage

    colisionR:

    If joueurA$ = "sauteR" And joueurB$ = "rouladeAVR" Then GoTo sortiecadreR
    If joueurB$ = "sauteR" And joueurA$ = "rouladeAVR" Then GoTo sortiecadreR

    '                               pour empecher que A entre dans B (inverse)

    If levier1$ = "gauche" Or joueurA$ = "rouladeAVR" Or joueurA$ = "decapiteR" Then
        distance = xA - xB
        If distance < 4 Then xA = xA + 1
    End If


    '                                pour empecher que B entre dans A (inverse)

    If levier2$ = "droite" Or joueurB$ = "rouladeAVR" Or joueurB$ = "decapiteR" Then
        distance = xA - xB
        If distance < 4 Then xB = xB - 1
    End If

    '                               garder la distance debout
    If joueurB$ = "deboutR" And joueurA$ = "deboutR" Then
        distance = xA - xB
        If distance < 4 Then xA = xA + 1: xB = xB - 1
    End If


    sortiecadreR:

    If sortieA$ = "oui" Or sortieB$ = "oui" Or entreesorcier$ = "oui" Then
        If xA < 0 Then xA = 0
        If xB < 0 Then xB = 0
        If xA > 40 Then xA = 40
        If xB > 40 Then xB = 40
        GoTo tetesvolantes
    End If

    If xA < 5 Then xA = 5
    If xA > 32 Then xA = 32
    If xB < 5 Then xB = 5
    If xB > 32 Then xB = 32



    '                       ****************************************
    '                       ********* les tetes volantes ! *********
    '                       ****************************************
    tetesvolantes:

    If sortieA$ = "oui" Or sortieB$ = "oui" Then GoTo affichage

    If joueurA$ = "mortdecap" Or joueurA$ = "mortdecapR" Or joueurB$ = "mortdecap" Or joueurB$ = "mortdecapR" Then

        If xA > 19 And xB > 20 Then GoTo teteagauche

        If joueurA$ = "mortdecap" Or joueurA$ = "mortdecapR" Then


            If temps > reftemps + 125 Then
                gnome$ = "oui": reftemps = temps
                xGNOME = 1
                GoTo affichage
            End If

            If temps > reftemps + 56 Then ySPRt = 164: xSPRt = xA + 16: numerotete = 3: GoTo affichage
            If temps > reftemps + 52 Then ySPRt = 157: xSPRt = xA + 15: numerotete = 2: GoTo affichage
            If temps > reftemps + 48 Then ySPRt = 159: xSPRt = xA + 14: numerotete = 1: GoTo affichage

            If temps > reftemps + 45 Then ySPRt = 157: xSPRt = xA + 13: numerotete = 6: GoTo affichage
            If temps > reftemps + 44 Then
                _SndPlay tete
                ySPRt = 157: xSPRt = xA + 13: numerotete = 6: GoTo affichage
            End If

            If temps > reftemps + 40 Then ySPRt = 159: xSPRt = xA + 12: numerotete = 5: GoTo affichage
            If temps > reftemps + 36 Then ySPRt = 159: xSPRt = xA + 11: numerotete = 4: GoTo affichage
            If temps > reftemps + 32 Then ySPRt = 159: xSPRt = xA + 10: numerotete = 3: GoTo affichage

            If temps > reftemps + 29 Then ySPRt = 159: xSPRt = xA + 9: numerotete = 2: GoTo affichage
            If temps > reftemps + 28 Then
                _SndPlay tete
                ySPRt = 159: xSPRt = xA + 9: numerotete = 2: GoTo affichage
            End If

            If temps > reftemps + 24 Then ySPRt = 139: xSPRt = xA + 8: numerotete = 1: GoTo affichage
            If temps > reftemps + 20 Then ySPRt = 125: xSPRt = xA + 7: numerotete = 6: GoTo affichage
            If temps > reftemps + 16 Then ySPRt = 125: xSPRt = xA + 6: numerotete = 5: GoTo affichage
            If temps > reftemps + 12 Then ySPRt = 118: xSPRt = xA + 5: numerotete = 4: GoTo affichage
            If temps > reftemps + 8 Then ySPRt = 111: xSPRt = xA + 4: numerotete = 3: GoTo affichage
            If temps > reftemps + 4 Then ySPRt = 111: xSPRt = xA + 3: numerotete = 2: GoTo affichage
            If temps >= reftemps Then ySPRt = 111: xSPRt = xA + 2: numerotete = 1: GoTo affichage

        End If


        If joueurB$ = "mortdecap" Or joueurB$ = "mortdecapR" Then

            If temps > reftemps + 125 Then
                gnome$ = "oui": reftemps = temps
                xGNOME = 1
                GoTo affichage
            End If

            If temps > reftemps + 56 Then ySPRt = 164: xSPRt = xB + 16: numerotete = 3: GoTo affichage
            If temps > reftemps + 52 Then ySPRt = 157: xSPRt = xB + 15: numerotete = 2: GoTo affichage
            If temps > reftemps + 48 Then ySPRt = 159: xSPRt = xB + 14: numerotete = 1: GoTo affichage

            If temps > reftemps + 45 Then ySPRt = 157: xSPRt = xB + 13: numerotete = 6: GoTo affichage
            If temps > reftemps + 44 Then
                _SndPlay tete
                ySPRt = 157: xSPRt = xB + 13: numerotete = 6: GoTo affichage
            End If

            If temps > reftemps + 40 Then ySPRt = 159: xSPRt = xB + 12: numerotete = 5: GoTo affichage
            If temps > reftemps + 36 Then ySPRt = 159: xSPRt = xB + 11: numerotete = 4: GoTo affichage
            If temps > reftemps + 32 Then ySPRt = 159: xSPRt = xB + 10: numerotete = 3: GoTo affichage

            If temps > reftemps + 29 Then ySPRt = 159: xSPRt = xB + 9: numerotete = 2: GoTo affichage
            If temps > reftemps + 28 Then
                _SndPlay tete
                ySPRt = 159: xSPRt = xB + 9: numerotete = 2: GoTo affichage
            End If

            If temps > reftemps + 24 Then ySPRt = 139: xSPRt = xB + 8: numerotete = 1: GoTo affichage
            If temps > reftemps + 20 Then ySPRt = 125: xSPRt = xB + 7: numerotete = 6: GoTo affichage
            If temps > reftemps + 16 Then ySPRt = 125: xSPRt = xB + 6: numerotete = 5: GoTo affichage
            If temps > reftemps + 12 Then ySPRt = 118: xSPRt = xB + 5: numerotete = 4: GoTo affichage
            If temps > reftemps + 8 Then ySPRt = 111: xSPRt = xB + 4: numerotete = 3: GoTo affichage
            If temps > reftemps + 4 Then ySPRt = 111: xSPRt = xB + 3: numerotete = 2: GoTo affichage
            If temps >= reftemps Then ySPRt = 111: xSPRt = xB + 2: numerotete = 1: GoTo affichage
            GoTo affichage
        End If

        teteagauche:

        If joueurA$ = "mortdecap" Or joueurA$ = "mortdecapR" Then

            If temps > reftemps + 125 Then
                gnome$ = "oui": reftemps = temps
                xGNOME = 1
                GoTo affichage
            End If

            If temps > reftemps + 56 Then ySPRt = 164: xSPRt = xA - 12: numerotete = 3: GoTo affichage
            If temps > reftemps + 52 Then ySPRt = 157: xSPRt = xA - 11: numerotete = 2: GoTo affichage
            If temps > reftemps + 48 Then ySPRt = 159: xSPRt = xA - 10: numerotete = 1: GoTo affichage

            If temps > reftemps + 45 Then ySPRt = 157: xSPRt = xA - 9: numerotete = 6: GoTo affichage
            If temps > reftemps + 44 Then
                _SndPlay tete
                ySPRt = 157: xSPRt = xA - 9: numerotete = 6: GoTo affichage
            End If

            If temps > reftemps + 40 Then ySPRt = 159: xSPRt = xA - 8: numerotete = 5: GoTo affichage
            If temps > reftemps + 36 Then ySPRt = 159: xSPRt = xA - 7: numerotete = 4: GoTo affichage
            If temps > reftemps + 32 Then ySPRt = 159: xSPRt = xA - 6: numerotete = 3: GoTo affichage

            If temps > reftemps + 29 Then ySPRt = 159: xSPRt = xA - 5: numerotete = 2: GoTo affichage
            If temps > reftemps + 28 Then
                _SndPlay tete
                ySPRt = 159: xSPRt = xA - 5: numerotete = 2: GoTo affichage
            End If

            If temps > reftemps + 24 Then ySPRt = 139: xSPRt = xA - 4: numerotete = 1: GoTo affichage
            If temps > reftemps + 20 Then ySPRt = 125: xSPRt = xA - 3: numerotete = 6: GoTo affichage
            If temps > reftemps + 16 Then ySPRt = 125: xSPRt = xA - 2: numerotete = 5: GoTo affichage
            If temps > reftemps + 12 Then ySPRt = 118: xSPRt = xA - 1: numerotete = 4: GoTo affichage
            If temps > reftemps + 8 Then ySPRt = 111: xSPRt = xA: numerotete = 3: GoTo affichage
            If temps > reftemps + 4 Then ySPRt = 111: xSPRt = xA + 1: numerotete = 2: GoTo affichage
            If temps >= reftemps Then ySPRt = 111: xSPRt = xA + 2: numerotete = 1: GoTo affichage

        End If

        If joueurB$ = "mortdecap" Or joueurB$ = "mortdecapR" Then

            If temps > reftemps + 125 Then
                gnome$ = "oui": reftemps = temps
                xGNOME = 1
                GoTo affichage
            End If

            If temps > reftemps + 56 Then ySPRt = 164: xSPRt = xB - 16: numerotete = 3: GoTo affichage
            If temps > reftemps + 52 Then ySPRt = 157: xSPRt = xB - 15: numerotete = 2: GoTo affichage
            If temps > reftemps + 48 Then ySPRt = 159: xSPRt = xB - 14: numerotete = 1: GoTo affichage

            If temps > reftemps + 45 Then ySPRt = 157: xSPRt = xB - 13: numerotete = 6: GoTo affichage
            If temps > reftemps + 44 Then
                _SndPlay tete
                ySPRt = 157: xSPRt = xB - 13: numerotete = 6: GoTo affichage
            End If

            If temps > reftemps + 40 Then ySPRt = 159: xSPRt = xB - 12: numerotete = 5: GoTo affichage
            If temps > reftemps + 36 Then ySPRt = 159: xSPRt = xB - 11: numerotete = 4: GoTo affichage
            If temps > reftemps + 32 Then ySPRt = 159: xSPRt = xB - 10: numerotete = 3: GoTo affichage

            If temps > reftemps + 29 Then ySPRt = 159: xSPRt = xB - 9: numerotete = 2: GoTo affichage
            If temps > reftemps + 28 Then
                _SndPlay tete
                ySPRt = 159: xSPRt = xB - 9: numerotete = 2: GoTo affichage
            End If

            If temps > reftemps + 24 Then ySPRt = 139: xSPRt = xB - 8: numerotete = 1: GoTo affichage
            If temps > reftemps + 20 Then ySPRt = 125: xSPRt = xB - 7: numerotete = 6: GoTo affichage
            If temps > reftemps + 16 Then ySPRt = 125: xSPRt = xB - 6: numerotete = 5: GoTo affichage
            If temps > reftemps + 12 Then ySPRt = 118: xSPRt = xB - 5: numerotete = 4: GoTo affichage
            If temps > reftemps + 8 Then ySPRt = 111: xSPRt = xB - 4: numerotete = 3: GoTo affichage
            If temps > reftemps + 4 Then ySPRt = 111: xSPRt = xB - 3: numerotete = 2: GoTo affichage
            If temps >= reftemps Then ySPRt = 111: xSPRt = xB - 2: numerotete = 1: GoTo affichage

        End If

    End If

    '                   *********************************
    '                   *******  PASSAGE DU GNOME *******
    '                   *********************************

    gnome:
    If gnome$ = "oui" Then

        numerognome = 4
        If temps > reftemps + 6 Then numerognome = 1
        If temps > reftemps + 12 Then numerognome = 2
        If temps > reftemps + 18 Then numerognome = 3


        If temps > reftemps + 24 Then reftemps = temps: GoTo affichage
        If temps > reftemps + 19 Then GoTo affichage
        If temps > reftemps + 18 Then xGNOME = xGNOME + 1: GoTo affichage
        If temps > reftemps + 7 Then GoTo affichage
        If temps > reftemps + 6 Then xGNOME = xGNOME + 1: GoTo affichage



    End If



    affichage:
    '                   **********************************************
    '                   ************      AFFICHAGE        ***********
    '                   **********************************************

    '                           fond decor


    _PutImage (38, 104), fond


    If transition$ = "oui" Then

        If temps > reftemps + 55 Then
            If joueurB$ = "mort" Or joueurB$ = "mortR" Or joueurB$ = "mortdecap" Or joueurB$ = "mortdecapR" Then xA = 1
            If joueurA$ = "mort" Or joueurA$ = "mortR" Or joueurA$ = "mortdecap" Or joueurA$ = "mortdecapR" Then xB = 39
        End If
        If temps > reftemps + 56 Then transition$ = "non": transitionfinie$ = "oui"

    End If


    '                           caches bleus

    Line (90, 56)-(233, 64), _RGB(34, 34, 153), BF


    If sorcier$ = "oui" Or sorcier$ = "mort" Or jeu$ = "perdu" Then

        Line (114, 95)-(129, 100), _RGB(0, 0, 0), BF
        Line (109, 100)-(134, 114), _RGB(0, 0, 0), BF


        'points de vie cach‚s
        Line (276, 0)-(319, 22), _RGB(0, 0, 0), BF
        Line (0, 0)-(45, 22), _RGB(0, 0, 0), BF
    End If



    '                               affichage du temps

    If joueurA$ = "mortdecap" Or joueurA$ = "mortdecapR" Or joueurB$ = "mortdecap" Or joueurB$ = "mortdecapR" Then GoTo affichetemps
    If joueurA$ = "mort" Or joueurA$ = "mortR" Or joueurB$ = "mort" Or joueurB$ = "mortR" Then GoTo affichetemps

    If temps > chrono + 50 Then
        chronometre = chronometre - 1
        chrono = temps
    End If

    If chronometre < 0 Then
        chronometre = 0
        If partie$ = "vs" Then
            sortieA$ = "oui": sortieB$ = "oui": tempsfini$ = "oui": Aoccupe$ = "non": Boccupe$ = "non"
        End If
    End If


    affichetemps:

    Color _RGB(0, 0, 0)
    _Font 8

    _PrintMode _KeepBackground
    If partie$ = "solo" Then Locate 8, 20: Print "0": Locate 8, 20: Print IA

    If partie$ = "vs" Then
        If chronometre > 10 Then Locate 8, 19: Print chronometre
        If chronometre = 10 Then Locate 8, 19: Print chronometre
        If chronometre < 10 Then Locate 8, 20: Print "0": Locate 8, 20: Print chronometre
    End If


    '                                  affichage du score

    If scoreA = 0 Then Locate 8, 13: Print "00000"
    If scoreB = 0 Then Locate 8, 24: Print "00000"

    If scoreA > 99999 Then scoreA = 0: If scoreB > 99999 Then scoreB = 0

    If scoreA > 99 And scoreA < 999 Then
        Locate 8, 13: Print "00": Locate 8, 14: Print scoreA
    End If
    If scoreA > 999 And scoreA < 9999 Then
        Locate 8, 13: Print "0": Locate 8, 13: Print scoreA
    End If
    If scoreA > 9999 And scoreA < 99999 Then
        Locate 8, 12: Print scoreA
    End If

    If scoreB > 99 And scoreB < 999 Then
        Locate 8, 24: Print "00": Locate 8, 25: Print scoreB
    End If
    If scoreB > 999 And scoreB < 9999 Then
        Locate 8, 24: Print "0": Locate 8, 24: Print scoreB
    End If
    If scoreB > 9999 And scoreB < 99999 Then
        Locate 8, 23: Print scoreB
    End If



    '                                 points de vie

    If vieA = 11 Then Line (38, 10)-(45, 22), _RGB(0, 0, 0), BF
    If vieA = 10 Then Line (29, 10)-(45, 22), _RGB(0, 0, 0), BF
    If vieA = 9 Then Line (22, 10)-(45, 22), _RGB(0, 0, 0), BF
    If vieA = 8 Then Line (13, 10)-(45, 22), _RGB(0, 0, 0), BF
    If vieA = 7 Then Line (6, 10)-(45, 22), _RGB(0, 0, 0), BF
    If vieA = 6 Then Line (0, 10)-(45, 22), _RGB(0, 0, 0), BF
    If vieA = 5 Then Line (38, 0)-(45, 22), _RGB(0, 0, 0), BF
    If vieA = 4 Then Line (29, 0)-(45, 22), _RGB(0, 0, 0), BF
    If vieA = 3 Then Line (22, 0)-(45, 22), _RGB(0, 0, 0), BF
    If vieA = 2 Then Line (13, 0)-(45, 22), _RGB(0, 0, 0), BF
    If vieA = 1 Then Line (6, 0)-(45, 22), _RGB(0, 0, 0), BF
    If vieA = 0 Then Line (0, 0)-(45, 22), _RGB(0, 0, 0), BF

    If vieB = 11 Then Line (315, 10)-(639, 22), _RGB(0, 0, 0), BF
    If vieB = 10 Then Line (306, 10)-(639, 22), _RGB(0, 0, 0), BF
    If vieB = 9 Then Line (299, 10)-(639, 22), _RGB(0, 0, 0), BF
    If vieB = 8 Then Line (290, 10)-(639, 22), _RGB(0, 0, 0), BF
    If vieB = 7 Then Line (283, 10)-(639, 22), _RGB(0, 0, 0), BF
    If vieB = 6 Then Line (276, 10)-(639, 22), _RGB(0, 0, 0), BF
    If vieB = 5 Then Line (315, 0)-(639, 10), _RGB(0, 0, 0), BF
    If vieB = 4 Then Line (306, 0)-(639, 10), _RGB(0, 0, 0), BF
    If vieB = 3 Then Line (299, 0)-(639, 10), _RGB(0, 0, 0), BF
    If vieB = 2 Then Line (290, 0)-(639, 10), _RGB(0, 0, 0), BF
    If vieB = 1 Then Line (283, 0)-(639, 10), _RGB(0, 0, 0), BF
    If vieB = 0 Then Line (276, 0)-(319, 22), _RGB(0, 0, 0), BF


    If version$ = "oui" Then
        Color _RGB(255, 255, 255)
        _Font 8
        Locate 18, 36: Print "FL VERSION": Locate 19, 15: Print "2012"
    End If

    '                       ****************************************
    '                       *********** affichage sprite A**********
    '                       ****************************************


    ' choix du sprite

    If spriteA$ = "debout" Then imageA = deboutA: sensimageA$ = "normal"
    If spriteA$ = "assis1" Then imageA = assis1A: sensimageA$ = "normal"
    If spriteA$ = "assis2" Then imageA = assis2A: sensimageA$ = "normal"
    If spriteA$ = "attente1" Then imageA = attente1A: sensimageA$ = "normal"
    If spriteA$ = "attente2" Then imageA = attente2A: sensimagesA$ = "normal"
    If spriteA$ = "attente3" Then imageA = attente3A: sensimagesA$ = "normal"
    If spriteA$ = "cou1" Then imageA = protegeHA: sensimagesA$ = "normal"
    If spriteA$ = "cou2" Then imageA = cou2A: sensimagesA$ = "normal"
    If spriteA$ = "cou3" Then imageA = cou3A: sensimagesA$ = "normal"
    If spriteA$ = "devant1" Then imageA = devant1A: sensimageA$ = "normal"
    If spriteA$ = "devant2" Then imageA = devant2A: sensimageA$ = "normal"
    If spriteA$ = "devant3" Then imageA = devant3A: sensimagesA$ = "normal"
    If spriteA$ = "genou1" Then imageA = genou1A: sensimageA$ = "normal"
    If spriteA$ = "genou2" Then imageA = assis2A: sensimageA$ = "normal"
    If spriteA$ = "genou3" Then imageA = genou3A: sensimagesA$ = "normal"
    If spriteA$ = "marche1" Then imageA = marche1A: sensimageA$ = "normal"
    If spriteA$ = "marche2" Then imageA = marche2A: sensimageA$ = "normal"
    If spriteA$ = "marche3" Then imageA = marche3A: sensimageA$ = "normal"
    If spriteA$ = "saut1" Then imageA = saut1A: sensimagesA$ = "normal"
    If spriteA$ = "saut2" Then imageA = saut2A: sensimagesA$ = "normal"
    If spriteA$ = "vainqueur1" Then imageA = vainqueur1A: sensimageA$ = "normal"
    If spriteA$ = "vainqueur2" Then imageA = vainqueur2A: sensimageA$ = "normal"
    If spriteA$ = "vainqueur3" Then imageA = vainqueur3A: sensimageA$ = "normal"
    If spriteA$ = "retourne1" Then imageA = retourne1A: sensimageA$ = "normal"
    If spriteA$ = "retourne2" Then imageA = retourne2A: sensimageA$ = "normal"
    If spriteA$ = "retourne3" Then imageA = retourne3A: sensimageA$ = "normal"
    If spriteA$ = "front1" Then imageA = front1A: sensimagesA$ = "normal"
    If spriteA$ = "front2" Then imageA = front2A: sensimagesA$ = "normal"
    If spriteA$ = "front3" Then imageA = front3A: sensimagesA$ = "normal"
    If spriteA$ = "toile1" Then imageA = toile1A: sensimagesA$ = "normal"
    If spriteA$ = "toile2" Then imageA = toile2A: sensimagesA$ = "normal"
    If spriteA$ = "toile3" Then imageA = toile3A: sensimagesA$ = "normal"
    If spriteA$ = "toile4" Then imageA = toile4A: sensimagesA$ = "normal"
    If spriteA$ = "tombe1" Then imageA = tombe1A: sensimagesA$ = "normal"
    If spriteA$ = "tombe2" Then imageA = tombe2A: sensimagesA$ = "normal"
    If spriteA$ = "tombe3" Then imageA = tombe3A: sensimagesA$ = "normal"
    If spriteA$ = "protegeD" Then imageA = protegeDA: sensimagesA$ = "normal"
    If spriteA$ = "protegeH" Then imageA = protegeHA: sensimagesA$ = "normal"
    If spriteA$ = "tete1" Then imageA = couptete1A: sensimagesA$ = "normal"
    If spriteA$ = "tete2" Then imageA = couptete2A: sensimageA$ = "normal"
    If spriteA$ = "touche1" Then imageA = touche2A: sensimageA$ = "normal"
    If spriteA$ = "touche2" Then imageA = touche1A: sensimageA$ = "normal"
    If spriteA$ = "touche3" Then imageA = touche2A: sensimageA$ = "normal"

    If spriteA$ = "pied1" Then imageA = pied1A: sensimagesA$ = "normal"
    If spriteA$ = "pied2" Then imageA = pied2A: sensimagesA$ = "normal"
    If spriteA$ = "decap1" Then imageA = decap1A: sensimageA$ = "normal"
    If spriteA$ = "decap2" Then imageA = decap2A: sensimageA$ = "normal"
    If spriteA$ = "decap3" Then imageA = decap3A: sensimagesA$ = "normal"
    If spriteA$ = "decap4" Then imageA = decap4A: sensimagesA$ = "normal"
    If spriteA$ = "mort1" Then imageA = assis1A: sensimageA$ = "normal"
    If spriteA$ = "mort2" Then imageA = mort2A: sensimagesA$ = "normal"
    If spriteA$ = "mort3" Then imageA = mort3A: sensimagesA$ = "normal"
    If spriteA$ = "mort4" Then imageA = mort4A: sensimagesA$ = "normal"


    If spriteA$ = "roulade1" Then imageA = roulade1A: sensimageA$ = "normal"
    If spriteA$ = "roulade2" Then imageA = roulade2A: sensimageA$ = "normal"
    If spriteA$ = "roulade3" Then imageA = roulade3A: sensimageA$ = "normal"
    If spriteA$ = "roulade4" Then imageA = roulade2A: sensimageA$ = "inverse"
    If spriteA$ = "roulade5" Then imageA = roulade5A: sensimageA$ = "normal"
    If spriteA$ = "roulade6" Then imageA = roulade1A: sensimageA$ = "inverse"


    If spriteA$ = "deboutR" Then imageA = deboutA: sensimageA$ = "inverse"
    If spriteA$ = "assis1R" Then imageA = assis1A: sensimageA$ = "inverse"
    If spriteA$ = "assis2R" Then imageA = assis2A: sensimageA$ = "inverse"
    If spriteA$ = "attente1R" Then imageA = attente1A: sensimageA$ = "inverse"
    If spriteA$ = "attente2R" Then imageA = attente2A: sensimageA$ = "large1R"
    If spriteA$ = "attente3R" Then imageA = attente3A: sensimageA$ = "large1R"
    If spriteA$ = "cou1R" Then imageA = protegeHA: sensimageA$ = "large1R"
    If spriteA$ = "cou2R" Then imageA = cou2A: sensimageA$ = "large1R"
    If spriteA$ = "cou3R" Then imageA = cou3A: sensimageA$ = "large4R"
    If spriteA$ = "devant1R" Then imageA = devant1A: sensimageA$ = "inverse"
    If spriteA$ = "devant2R" Then imageA = devant2A: sensimageA$ = "inverse"
    If spriteA$ = "devant3R" Then imageA = devant3A: sensimageA$ = "large3R"
    If spriteA$ = "genou1R" Then imageA = genou1A: sensimageA$ = "inverse"
    If spriteA$ = "genou2R" Then imageA = assis2A: sensimageA$ = "inverse"
    If spriteA$ = "genou3R" Then imageA = genou3A: sensimageA$ = "large3R"
    If spriteA$ = "marche1R" Then imageA = marche1A: sensimageA$ = "inverse"
    If spriteA$ = "marche2R" Then imageA = marche2A: sensimageA$ = "inverse"
    If spriteA$ = "marche3R" Then imageA = marche3A: sensimageA$ = "inverse"
    If spriteA$ = "saut1R" Then imageA = saut1A: sensimageA$ = "large1R"
    If spriteA$ = "saut2R" Then imageA = saut2A: sensimageA$ = "large1R"
    If spriteA$ = "vainqueur1R" Then imageA = vainqueur1A: sensimageA$ = "inverse"
    If spriteA$ = "vainqueur2R" Then imageA = vainqueur2A: sensimageA$ = "inverse"
    If spriteA$ = "vainqueur3R" Then imageA = vainqueur3A: sensimageA$ = "inverse"
    If spriteA$ = "retourne1R" Then imageA = retourne1A: sensimageA$ = "inverse"
    If spriteA$ = "retourne2R" Then imageA = retourne2A: sensimageA$ = "inverse"
    If spriteA$ = "retourne3R" Then imageA = retourne3A: sensimageA$ = "inverse"
    If spriteA$ = "front1R" Then imageA = front1A: sensimageA$ = "large1R"
    If spriteA$ = "front2R" Then imageA = front2A: sensimageA$ = "large1R"
    If spriteA$ = "front3R" Then imageA = front3A: sensimageA$ = "large3R"
    If spriteA$ = "toile1R" Then imageA = toile1A: sensimageA$ = "large1R"
    If spriteA$ = "toile2R" Then imageA = toile2A: sensimageA$ = "large1R"
    If spriteA$ = "toile3R" Then imageA = toile3A: sensimageA$ = "large1R"
    If spriteA$ = "toile4R" Then imageA = toile4A: sensimageA$ = "large3R"
    If spriteA$ = "tombe1R" Then imageA = tombe1A: sensimageA$ = "large1R"
    If spriteA$ = "tombe2R" Then imageA = tombe2A: sensimageA$ = "large3R"
    If spriteA$ = "tombe3R" Then imageA = tombe3A: sensimageA$ = "large3R"
    If spriteA$ = "protegeDR" Then imageA = protegeDA: sensimageA$ = "large1R"
    If spriteA$ = "protegeHR" Then imageA = protegeHA: sensimageA$ = "large1R"
    If spriteA$ = "tete1R" Then imageA = couptete1A: sensimageA$ = "large1R"
    If spriteA$ = "tete2R" Then imageA = couptete2A: sensimageA$ = "inverse"
    If spriteA$ = "touche1R" Then imageA = touche2A: sensimageA$ = "inverse"
    If spriteA$ = "touche2R" Then imageA = touche1A: sensimageA$ = "inverse"
    If spriteA$ = "touche3R" Then imageA = touche2A: sensimageA$ = "inverse"
    If spriteA$ = "pied1R" Then imageA = pied1A: sensimageA$ = "large1R"
    If spriteA$ = "pied2R" Then imageA = pied2A: sensimageA$ = "large1R"
    If spriteA$ = "decap1R" Then imageA = decap1A: sensimageA$ = "inverse"
    If spriteA$ = "decap2R" Then imageA = decap2A: sensimageA$ = "inverse"
    If spriteA$ = "decap3R" Then imageA = decap3A: sensimageA$ = "large1R"
    If spriteA$ = "decap4R" Then imageA = decap4A: sensimageA$ = "large3R"
    If spriteA$ = "mort1R" Then imageA = assis1A: sensimageA$ = "inverse"
    If spriteA$ = "mort2R" Then imageA = mort2A: sensimageA$ = "large1R"
    If spriteA$ = "mort3R" Then imageA = mort3A: sensimageA$ = "large1R"
    If spriteA$ = "mort4R" Then imageA = mort4A: sensimageA$ = "large3R"


    If spriteA$ = "roulade1R" Then imageA = roulade1A: sensimageA$ = "inverse"
    If spriteA$ = "roulade2R" Then imageA = roulade2A: sensimageA$ = "inverse"
    If spriteA$ = "roulade3R" Then imageA = roulade3A: sensimageA$ = "normal"
    If spriteA$ = "roulade4R" Then imageA = roulade2A: sensimageA$ = "normal"
    If spriteA$ = "roulade5R" Then imageA = roulade5A: sensimageA$ = "normal"
    If spriteA$ = "roulade6R" Then imageA = roulade1A: sensimageA$ = "normal"



    a2 = (xA - 1) * 8: b2 = ((yFA - 2) * 8)

    If a2 > 0 Then
        If sensimageA$ = "normal" Then
            _PutImage (a2, b2), imageA
        End If

        If sensimageA$ = "inverse" Then
            _PutImage (a2 + 39, b2)-(a2, b2 + 79), imageA
        End If

        If sensimageA$ = "large3R" Then
            _PutImage (a2 + 40, b2)-(a2 - 23, b2 + 79), imageA ' retirer 23 (3*8)-1 … a2
        End If '                                              attention a gauche a2 serait de 63 (39+24)

        If sensimageA$ = "large4R" Then
            _PutImage (a2 + 41, b2)-(a2 - 31, b2 + 79), imageA ' retirer 31 (4*8)-1 … a4
        End If

        If sensimageA$ = "large1R" Then
            _PutImage (a2 + 39, b2)-(a2 - 8, b2 + 79), imageA
        End If
    End If


    '                       ****************************************
    '                       *********** affichage sprite B**********
    '                       ****************************************


    'choix du sprite

    If spriteB$ = "debout" Then imageB = deboutB: sensimageB$ = "normal"
    If spriteB$ = "assis1" Then imageB = assis1B: sensimageB$ = "normal"
    If spriteB$ = "assis2" Then imageB = assis2B: sensimageB$ = "normal"
    If spriteB$ = "attente1" Then imageB = attente1B: sensimageB$ = "normal"
    If spriteB$ = "attente2" Then imageB = attente2B: sensimageB$ = "large1"
    If spriteB$ = "attente3" Then imageB = attente3B: sensimageB$ = "large1"
    If spriteB$ = "cou1" Then imageB = protegeHB: sensimageB$ = "large1"
    If spriteB$ = "cou2" Then imageB = cou2B: sensimageB$ = "large1"
    If spriteB$ = "cou3" Then imageB = cou3B: sensimageB$ = "large4"
    If spriteB$ = "devant1" Then imageB = devant1B: sensimageB$ = "normal"
    If spriteB$ = "devant2" Then imageB = devant2B: sensimageB$ = "normal"
    If spriteB$ = "devant3" Then imageB = devant3B: sensimageB$ = "large3"
    If spriteB$ = "genou1" Then imageB = genou1B: sensimageB$ = "normal"
    If spriteB$ = "genou2" Then imageB = assis2B: sensimageB$ = "normal"
    If spriteB$ = "genou3" Then imageB = genou3B: sensimageB$ = "large3"
    If spriteB$ = "marche1" Then imageB = marche1B: sensimageB$ = "normal"
    If spriteB$ = "marche2" Then imageB = marche2B: sensimageB$ = "normal"
    If spriteB$ = "marche3" Then imageB = marche3B: sensimageB$ = "normal"
    If spriteB$ = "saut1" Then imageB = saut1B: sensimageB$ = "large1"
    If spriteB$ = "saut2" Then imageB = saut2B: sensimageB$ = "large1"
    If spriteB$ = "vainqueur1" Then imageB = vainqueur1B: sensimageB$ = "normal"
    If spriteB$ = "vainqueur2" Then imageB = vainqueur2B: sensimageB$ = "normal"
    If spriteB$ = "vainqueur3" Then imageB = vainqueur3B: sensimageB$ = "normal"
    If spriteB$ = "retourne1" Then imageB = retourne1B: sensimageB$ = "normal"
    If spriteB$ = "retourne2" Then imageB = retourne2B: sensimageB$ = "normal"
    If spriteB$ = "retourne3" Then imageB = retourne3B: sensimageB$ = "normal"
    If spriteB$ = "front1" Then imageB = front1B: sensimageB$ = "large1"
    If spriteB$ = "front2" Then imageB = front2B: sensimageB$ = "large1"
    If spriteB$ = "front3" Then imageB = front3B: sensimageB$ = "large3"
    If spriteB$ = "toile1" Then imageB = toile1B: sensimageB$ = "large1"
    If spriteB$ = "toile2" Then imageB = toile2B: sensimageB$ = "large1"
    If spriteB$ = "toile3" Then imageB = toile3B: sensimageB$ = "large1"
    If spriteB$ = "toile4" Then imageB = toile4B: sensimageB$ = "large3"
    If spriteB$ = "tombe1" Then imageB = tombe1B: sensimageB$ = "large1"
    If spriteB$ = "tombe2" Then imageB = tombe2B: sensimageB$ = "large3"
    If spriteB$ = "tombe3" Then imageB = tombe3B: sensimageB$ = "large3"
    If spriteB$ = "protegeD" Then imageB = protegeDB: sensimageB$ = "large1"
    If spriteB$ = "protegeH" Then imageB = protegeHB: sensimageB$ = "large1"
    If spriteB$ = "tete1" Then imageB = couptete1B: sensimageB$ = "large1"
    If spriteB$ = "tete2" Then imageB = couptete2B: sensimageB$ = "normal"
    If spriteB$ = "touche1" Then imageB = touche2B: sensimageB$ = "normal"
    If spriteB$ = "touche2" Then imageB = touche1B: sensimageB$ = "normal"
    If spriteB$ = "touche3" Then imageB = touche2B: sensimageB$ = "normal"
    If spriteB$ = "pied1" Then imageB = pied1B: sensimageB$ = "large1"
    If spriteB$ = "pied2" Then imageB = pied2B: sensimageB$ = "large1"
    If spriteB$ = "decap1" Then imageB = decap1B: sensimageB$ = "normal"
    If spriteB$ = "decap2" Then imageB = decap2B: sensimageB$ = "normal"
    If spriteB$ = "decap3" Then imageB = decap3B: sensimageB$ = "large1"
    If spriteB$ = "decap4" Then imageB = decap4B: sensimageB$ = "large3"
    If spriteB$ = "mort1" Then imageB = assis1B: sensimageB$ = "normal"
    If spriteB$ = "mort2" Then imageB = mort2B: sensimageB$ = "large1"
    If spriteB$ = "mort3" Then imageB = mort3B: sensimageB$ = "large1"
    If spriteB$ = "mort4" Then imageB = mort4B: sensimageB$ = "large3"


    If spriteB$ = "roulade1" Then imageB = roulade1B: sensimageB$ = "normal"
    If spriteB$ = "roulade2" Then imageB = roulade2B: sensimageB$ = "normal"
    If spriteB$ = "roulade3" Then imageB = roulade3B: sensimageB$ = "inverse"
    If spriteB$ = "roulade4" Then imageB = roulade2B: sensimageB$ = "inverse"
    If spriteB$ = "roulade5" Then imageB = roulade5B: sensimageB$ = "inverse"
    If spriteB$ = "roulade6" Then imageB = roulade1B: sensimageB$ = "inverse"


    If spriteB$ = "deboutR" Then imageB = deboutB: sensimageB$ = "inverse"
    If spriteB$ = "assis1R" Then imageB = assis1B: sensimageB$ = "inverse"
    If spriteB$ = "assis2R" Then imageB = assis2B: sensimageB$ = "inverse"
    If spriteB$ = "attente1R" Then imageB = attente1B: sensimageB$ = "inverse"
    If spriteB$ = "attente2R" Then imageB = attente2B: sensimagesB$ = "inverse"
    If spriteB$ = "attente3R" Then imageB = attente3B: sensimagesB$ = "inverse"
    If spriteB$ = "cou1R" Then imageB = protegeHB: sensimagesB$ = "inverse"
    If spriteB$ = "cou2R" Then imageB = cou2B: sensimagesB$ = "inverse"
    If spriteB$ = "cou3R" Then imageB = cou3B: sensimageB$ = "inverse"
    If spriteB$ = "devant1R" Then imageB = devant1B: sensimageB$ = "inverse"
    If spriteB$ = "devant2R" Then imageB = devant2B: sensimageB$ = "inverse"
    If spriteB$ = "devant3R" Then imageB = devant3B: sensimagesB$ = "inverse"
    If spriteB$ = "genou1R" Then imageB = genou1B: sensimageB$ = "inverse"
    If spriteB$ = "genou2R" Then imageB = assis2B: sensimageB$ = "inverse"
    If spriteB$ = "genou3R" Then imageB = genou3B: sensimagesB$ = "inverse"
    If spriteB$ = "marche1R" Then imageB = marche1B: sensimageB$ = "inverse"
    If spriteB$ = "marche2R" Then imageB = marche2B: sensimageB$ = "inverse"
    If spriteB$ = "marche3R" Then imageB = marche3B: sensimageB$ = "inverse"
    If spriteB$ = "saut1R" Then imageB = saut1B: sensimagesB$ = "inverse"
    If spriteB$ = "saut2R" Then imageB = saut2B: sensimagesB$ = "inverse"
    If spriteB$ = "vainqueur1R" Then imageB = vainqueur1B: sensimageB$ = "inverse"
    If spriteB$ = "vainqueur2R" Then imageB = vainqueur2B: sensimageB$ = "inverse"
    If spriteB$ = "vainqueur3R" Then imageB = vainqueur3B: sensimageB$ = "inverse"
    If spriteB$ = "retourne1R" Then imageB = retourne1B: sensimageB$ = "inverse"
    If spriteB$ = "retourne2R" Then imageB = retourne2B: sensimageB$ = "inverse"
    If spriteB$ = "retourne3R" Then imageB = retourne3B: sensimageB$ = "inverse"
    If spriteB$ = "front1R" Then imageB = front1B: sensimagesB$ = "inverse"
    If spriteB$ = "front2R" Then imageB = front2B: sensimagesB$ = "inverse"
    If spriteB$ = "front3R" Then imageB = front3B: sensimagesB$ = "inverse"
    If spriteB$ = "toile1R" Then imageB = toile1B: sensimagesB$ = "inverse"
    If spriteB$ = "toile2R" Then imageB = toile2B: sensimagesB$ = "inverse"
    If spriteB$ = "toile3R" Then imageB = toile3B: sensimagesB$ = "inverse"
    If spriteB$ = "toile4R" Then imageB = toile4B: sensimagesB$ = "inverse"
    If spriteB$ = "tombe1R" Then imageB = tombe1B: sensimagesB$ = "inverse"
    If spriteB$ = "tombe2R" Then imageB = tombe2B: sensimagesB$ = "inverse"
    If spriteB$ = "tombe3R" Then imageB = tombe3B: sensimagesB$ = "inverse"
    If spriteB$ = "protegeDR" Then imageB = protegeDB: sensimagesB$ = "inverse"
    If spriteB$ = "protegeHR" Then imageB = protegeHB: sensimagesB$ = "inverse"
    If spriteB$ = "tete1R" Then imageB = couptete1B: sensimagesB$ = "inverse"
    If spriteB$ = "tete2R" Then imageB = couptete2B: sensimageB$ = "inverse"
    If spriteB$ = "touche1R" Then imageB = touche2B: sensimageB$ = "inverse"
    If spriteB$ = "touche2R" Then imageB = touche1B: sensimageB$ = "inverse"
    If spriteB$ = "touche3R" Then imageB = touche2B: sensimageB$ = "inverse"

    If spriteB$ = "pied1R" Then imageB = pied1B: sensimagesB$ = "inverse"
    If spriteB$ = "pied2R" Then imageB = pied2B: sensimagesB$ = "inverse"
    If spriteB$ = "decap1R" Then imageB = decap1B: sensimageB$ = "inverse"
    If spriteB$ = "decap2R" Then imageB = decap2B: sensimageB$ = "inverse"
    If spriteB$ = "decap3R" Then imageB = decap3B: sensimagesB$ = "inverse"
    If spriteB$ = "decap4R" Then imageB = decap4B: sensimagesB$ = "inverse"
    If spriteB$ = "mort1R" Then imageB = assis1B: sensimageB$ = "inverse"
    If spriteB$ = "mort2R" Then imageB = mort2B: sensimagesB$ = "inverse"
    If spriteB$ = "mort3R" Then imageB = mort3B: sensimagesB$ = "inverse"
    If spriteB$ = "mort4R" Then imageB = mort4B: sensimagesB$ = "inverse"


    If spriteB$ = "roulade1R" Then imageB = roulade1B: sensimageB$ = "inverse"
    If spriteB$ = "roulade2R" Then imageB = roulade2B: sensimageB$ = "inverse"
    If spriteB$ = "roulade3R" Then imageB = roulade3B: sensimageB$ = "inverse"
    If spriteB$ = "roulade4R" Then imageB = roulade2B: sensimageB$ = "normal"
    If spriteB$ = "roulade5R" Then imageB = roulade5B: sensimageB$ = "inverse"
    If spriteB$ = "roulade6R" Then imageB = roulade1B: sensimageB$ = "normal"

    If spriteB$ = "sorcier1" Then imageB = drax1B: sensimageB$ = "inverse"
    If spriteB$ = "sorcier2" Then imageB = drax2B: sensimageB$ = "inverse"

    If spriteB$ = "marianna" Then imageB = mariannaB: sensimagesB$ = "inverse"


    a4 = (xB - 1) * 8: b4 = ((yFB - 2) * 8)

    If a4 < 304 Then
        If sensimageB$ = "large4" Then
            _PutImage (a4 + 41, b4)-(a4 - 31, b4 + 79), imageB ' retirer 31 (4*8)-1 … a4
        End If '

        If sensimageB$ = "large3" Then
            _PutImage (a4 + 40, b4)-(a4 - 23, b4 + 79), imageB ' retirer 23 (3*8)-1 … a4
        End If '                                             attention a gauche a4 serait de 63 (39+24)

        If sensimageB$ = "large1" Then
            _PutImage (a4 + 39, b4)-(a4 - 8, b4 + 79), imageB
        End If '

        If sensimageB$ = "normal" Then
            _PutImage (a4 + 39, b4)-(a4, b4 + 79), imageB
        End If
        If sensimageB$ = "inverse" Then
            _PutImage (a4, b4), imageB
        End If
    End If

    '                           ***********************************************
    '                           re-affichage du spriteA en cas de chevauchement

    If joueurA$ = "mort" Or joueurA$ = "mortR" Or joueurA$ = "mortdecap" Or joueurA$ = "mortdecapR" Or joueurA$ = "genou" Or joueurA$ = "genouR" Then


        a2 = (xA - 1) * 8: b2 = ((yFA - 2) * 8)

        If a2 > 1 And a2 < 304 Then

            If sensimageA$ = "normal" Then
                _PutImage (a2, b2), imageA
            End If

            If sensimageA$ = "inverse" Then
                _PutImage (a2 + 39, b2)-(a2, b2 + 79), imageA
            End If

            If sensimageA$ = "large3R" Then
                _PutImage (a2 + 40, b2)-(a2 - 23, b2 + 79), imageA ' retirer 23 (3*8)-1 … a2
            End If '                                              attention a gauche a2 serait de 63 (39+24)

            If sensimageA$ = "large4R" Then
                _PutImage (a2 + 41, b2)-(a2 - 31, b2 + 79), imageA ' retirer 31 (4*8)-1 … a4
            End If

            If sensimageA$ = "large1R" Then
                _PutImage (a2 + 39, b2)-(a2 - 8, b2 + 79), imageA
            End If
        End If
    End If


    '                       ****************************************
    '                       ********* affichage du sang ************
    '                       ****************************************

    '                    gicl‚es de sang de decapitation

    If joueurA$ = "mortdecap" Or joueurA$ = "mortdecapR" Then
        If sangdecapA = 1 Then
            Xgicle = (xA * 8) + 3: Ygicle = (yFA - 1) * 8
            objet = gicle1
            _PutImage (Xgicle, Ygicle), objet
        End If
        If sangdecapA = 2 Then
            Xgicle = (xA * 8) + 3: Ygicle = (yFA - 1) * 8
            objet = gicle2
            _PutImage (Xgicle, Ygicle), objet
        End If
        If sangdecapA = 3 Then
            Xgicle = (xA * 8) + 3: Ygicle = (yFA - 1) * 8
            objet = gicle3
            _PutImage (Xgicle, Ygicle), objet
        End If

        If sangdecapA = 4 Then
            Xgicle = (xA * 8) + 2: Ygicle = ((yMA - 2) * 8) - 2
            objet = gicle1
            _PutImage (Xgicle, Ygicle), objet
        End If
        If sangdecapA = 5 Then
            Xgicle = (xA * 8) + 2: Ygicle = ((yMA - 2) * 8) - 2
            objet = gicle2
            _PutImage (Xgicle, Ygicle), objet
        End If
        If sangdecapA = 6 Then
            Xgicle = (xA * 8) + 2: Ygicle = ((yMA - 2) * 8) - 2
            objet = gicle3
            _PutImage (Xgicle, Ygicle), objet
        End If
    End If

    If joueurB$ = "mortdecap" Or joueurB$ = "mortdecapR" Then
        If sangdecapB = 1 Then
            Xgicle = (xB * 8) + 3: Ygicle = (yFB - 1) * 8
            objet = gicle1
            _PutImage (Xgicle, Ygicle), objet
        End If
        If sangdecapB = 2 Then
            Xgicle = (xB * 8) + 3: Ygicle = (yFB - 1) * 8
            objet = gicle2
            _PutImage (Xgicle, Ygicle), objet
        End If
        If sangdecapB = 3 Then
            Xgicle = (xB * 8) + 3: Ygicle = (yFB - 1) * 8
            objet = gicle3
            _PutImage (Xgicle, Ygicle), objet
        End If

        If sangdecapB = 4 Then
            Xgicle = (xB * 8) + 1: Ygicle = ((yMB - 2) * 8) - 2
            objet = gicle1
            _PutImage (Xgicle, Ygicle), objet
        End If
        If sangdecapB = 5 Then
            Xgicle = (xB * 8) + 1: Ygicle = ((yMB - 2) * 8) - 2
            objet = gicle2
            _PutImage (Xgicle, Ygicle), objet
        End If
        If sangdecapB = 6 Then
            Xgicle = (xB * 8) + 1: Ygicle = ((yMB - 2) * 8) - 2
            objet = gicle3
            _PutImage (Xgicle, Ygicle), objet
        End If
    End If

    '                           taches de sang au combat

    If sangA$ = "non" Then GoTo sang2


    If joueurA$ = "touche1" Or joueurA$ = "touche1R" Or joueurA$ = "mort" Then
        xS1 = xA: yS1 = yAttB
    End If

    If joueurA$ = "tombe1" Or joueurA$ = "tombe1R" Or joueurA$ = "mortR" Then
        xS1 = xA: yS1 = yAttB
    End If

    xS2 = xS1 * 8: yS2 = yS1 * 8
    objet = tachesang
    _PutImage (xS2, yS2), objet


    sang2:

    If sangB$ = "non" Then GoTo serpent


    If joueurB$ = "touche1" Or joueurB$ = "touche1R" Or joueurB$ = "mort" Then
        xS1 = xB + 1: yS1 = yAttA
    End If

    If joueurB$ = "tombe1" Or joueurB$ = "tombe1R" Or joueurB$ = "mortR" Then
        xS1 = xB + 1: yS1 = yAttA
    End If

    xS2 = xS1 * 8: yS2 = yS1 * 8
    objet = tachesang
    _PutImage (xS2, yS2), objet


    '                       ****************************************
    '                       ********* affichage du serpent *********
    '                       ****************************************
    serpent:


    If entree$ = "oui" Then
        objet2 = serpent1
        If xA = 3 Then objet2 = serpent2
        If xA = 4 Then objet2 = serpent3
        If xA = 5 Then objet2 = serpent2
        If xA = 6 Then objet2 = serpent1
        _PutImage (11, 22), objet2
        objet2 = serpent1
        If xB = 34 Then objet2 = serpent2
        If xB = 33 Then objet2 = serpent3
        If xB = 32 Then objet2 = serpent2
        If xB = 31 Then objet2 = serpent1
        _PutImage (306, 22)-(275, 54), objet2
        GoTo arbres
    End If

    If entreesorcier$ = "oui" Then
        If xA = 35 Then objet2 = serpent3
        If xA = 34 Then objet2 = serpent2
        If xA = 33 Then objet2 = serpent1
        _PutImage (11, 22), objet2
        If xA = 35 Then objet2 = serpent3
        If xA = 34 Then objet2 = serpent2
        If xA = 33 Then objet2 = serpent1
        _PutImage (306, 22)-(275, 54), objet2
        GoTo arbres
    End If

    '                                   affichage serpentA

    If serpentA$ = "non" Then GoTo serpent2

    If spriteA$ = "touche1" Or spriteA$ = "touche1R" Then
        objet2 = serpent2
        _PutImage (11, 22), objet2
    End If
    If spriteA$ = "touche2" Or spriteA$ = "touche2R" Then
        objet2 = serpent3
        _PutImage (11, 22), objet2
    End If
    If spriteA$ = "touche3" Or spriteA$ = "touche3R" Then
        objet2 = serpent2
        _PutImage (11, 22), objet2
    End If
    If spriteA$ = "touche4" Or spriteA$ = "touche4R" Then
        objet2 = serpent1
        _PutImage (11, 22), objet2
    End If


    If spriteA$ = "tombe1" Or spriteA$ = "tombe1R" Then
        objet2 = serpent2
        _PutImage (11, 22), objet2
    End If
    If spriteA$ = "tombe2" Or spriteA$ = "tombe2R" Then
        objet2 = serpent3
        _PutImage (11, 22), objet2
    End If
    If spriteA$ = "tombe3" Or spriteA$ = "tombe3R" Then
        objet2 = serpent2
        _PutImage (11, 22), objet2
    End If
    If spriteA$ = "tombe4" Or spriteA$ = "tombe4R" Then
        objet2 = serpent1
        _PutImage (11, 22), objet2
    End If


    serpent2:

    '                                   affichage serpentB

    If serpentB$ = "non" Then GoTo tete2

    If spriteB$ = "touche1" Or spriteB$ = "touche1R" Then
        objet2 = serpent2
        _PutImage (306, 22)-(275, 54), objet2
    End If
    If spriteB$ = "touche2" Or spriteB$ = "touche2R" Then
        objet2 = serpent3
        _PutImage (306, 22)-(275, 54), objet2
    End If
    If spriteB$ = "touche3" Or spriteB$ = "touche3R" Then
        objet2 = serpent2
        _PutImage (306, 22)-(275, 54), objet2
    End If
    If spriteB$ = "touche4" Or spriteB$ = "touche4R" Then
        objet2 = serpent1
        _PutImage (306, 22)-(275, 54), objet2
    End If

    If spriteB$ = "tombe1" Or spriteB$ = "tombe1R" Then
        objet2 = serpent2
        _PutImage (306, 22)-(275, 54), objet2
    End If
    If spriteB$ = "tombe2" Or spriteB$ = "tombe2R" Then
        objet2 = serpent3
        _PutImage (306, 22)-(275, 54), objet2
    End If
    If spriteB$ = "tombe3" Or spriteB$ = "tombe3R" Then
        objet2 = serpent2
        _PutImage (306, 22)-(275, 54), objet2
    End If
    If spriteB$ = "tombe4" Or spriteB$ = "tombe4R" Then
        objet2 = serpent1
        _PutImage (306, 22)-(275, 54), objet2
    End If



    '                       ****************************************
    '                       ********* affichage des tetes **********
    '                       ****************************************
    tete2:

    If gnome$ = "oui" Then

        If joueurA$ = "mort" Or joueurB$ = "mort" Or joueurA$ = "mortR" Or joueurB$ = "mortR" Then GoTo gnome2

        If football$ = "oui" Then GoTo gnometapetete

        If xGNOME < 33 And (xGNOME * 8) > xSPRt - 24 Then football$ = "oui": reftempsB = temps
        GoTo afficheteombre

        gnometapetete:
        If football$ = "oui" Then

            If temps > reftempsB + 113 Then GoTo afficheteombre
            If temps > reftempsB + 112 Then ySPRt = 151: xSPRt = xSPRt + 16: numerotete = 5: GoTo afficheteombre
            If temps > reftempsB + 106 Then GoTo afficheteombre
            If temps > reftempsB + 105 Then ySPRt = 151: xSPRt = xSPRt + 16: numerotete = 6: GoTo afficheteombre
            If temps > reftempsB + 98 Then GoTo afficheteombre
            If temps > reftempsB + 97 Then ySPRt = 151: xSPRt = xSPRt + 16: numerotete = 1: GoTo afficheteombre
            If temps > reftempsB + 91 Then GoTo afficheteombre
            If temps > reftempsB + 90 Then ySPRt = 159: xSPRt = xSPRt + 16: numerotete = 2: GoTo afficheteombre
            If temps > reftempsB + 83 Then GoTo afficheteombre
            If temps > reftempsB + 82 Then
                If xGNOME < 273 And xSPRt < 273 Then _SndPlay tete
                ySPRt = 159: xSPRt = xSPRt + 16: numerotete = 3: GoTo afficheteombre
            End If
            If temps > reftempsB + 76 Then GoTo afficheteombre
            If temps > reftempsB + 75 Then ySPRt = 157: xSPRt = xSPRt + 16: numerotete = 4: GoTo afficheteombre
            If temps > reftempsB + 68 Then GoTo afficheteombre
            If temps > reftempsB + 67 Then ySPRt = 151: xSPRt = xSPRt + 16: numerotete = 5: GoTo afficheteombre
            If temps > reftempsB + 61 Then GoTo afficheteombre
            If temps > reftempsB + 60 Then ySPRt = 151: xSPRt = xSPRt + 16: numerotete = 6: GoTo afficheteombre
            If temps > reftempsB + 53 Then GoTo afficheteombre
            If temps > reftempsB + 52 Then ySPRt = 151: xSPRt = xSPRt + 16: numerotete = 1: GoTo afficheteombre
            If temps > reftempsB + 46 Then GoTo afficheteombre
            If temps > reftempsB + 45 Then ySPRt = 159: xSPRt = xSPRt + 16: numerotete = 2: GoTo afficheteombre
            If temps > reftempsB + 38 Then GoTo afficheteombre
            If temps > reftempsB + 37 Then
                If xGNOME < 273 And xSPRt < 273 Then _SndPlay tete
                ySPRt = 159: xSPRt = xSPRt + 16: numerotete = 3: GoTo afficheteombre
            End If
            If temps > reftempsB + 31 Then GoTo afficheteombre
            If temps > reftempsB + 30 Then ySPRt = 151: xSPRt = xSPRt + 16: numerotete = 4: GoTo afficheteombre
            If temps > reftempsB + 23 Then GoTo afficheteombre
            If temps > reftempsB + 22 Then ySPRt = 151: xSPRt = xSPRt + 16: numerotete = 5: GoTo afficheteombre
            If temps > reftempsB + 16 Then GoTo afficheteombre
            If temps > reftempsB + 15 Then ySPRt = 151: xSPRt = xSPRt + 16: numerotete = 6: GoTo afficheteombre
            If temps > reftempsB + 8 Then GoTo afficheteombre
            If temps > reftempsB + 7 Then ySPRt = 151: xSPRt = xSPRt + 16: numerotete = 1: GoTo afficheteombre
            If temps > reftempsB + 5 Then GoTo afficheteombre
            If temps > reftempsB + 4 Then ySPRt = 153: xSPRt = xSPRt + 16: numerotete = 2: GoTo afficheteombre
            If temps > reftempsB + 2 Then GoTo afficheteombre
            If temps > reftempsB + 1 Then
                If xGNOME < 273 And xSPRt < 273 Then _SndPlay teteX
                GoTo afficheteombre
            End If

        End If

        afficheteombre:
        If joueurA$ = "mortdecap" Or joueurA$ = "mortdecapR" Then
            If numerotete = 1 Then objet = tete1A
            If numerotete = 2 Then objet = tete2A
            If numerotete = 3 Then objet = tete3A
            If numerotete = 4 Then objet = tete4A
            If numerotete = 5 Then objet = tete5A
            If numerotete = 6 Then objet = tete6A
        End If

        If joueurB$ = "mortdecap" Or joueurB$ = "mortdecapR" Then
            If numerotete = 1 Then objet = tete1B
            If numerotete = 2 Then objet = tete2B
            If numerotete = 3 Then objet = tete3B
            If numerotete = 4 Then objet = tete4B
            If numerotete = 5 Then objet = tete5B
            If numerotete = 6 Then objet = tete6B
        End If


        If xSPRt < 320 Then _PutImage (xSPRt, 175), spriteombre

        If xSPRt < 320 Then _PutImage (xSPRt, ySPRt), objet


        GoTo gnome2
    End If

    If joueurA$ = "mortdecap" Or joueurA$ = "mortdecapR" Or joueurB$ = "mortdecap" Or joueurB$ = "mortdecapR" Then

        If joueurA$ = "mortdecap" Or joueurA$ = "mortdecapR" Then
            If numerotete = 1 Then objet = tete1A
            If numerotete = 2 Then objet = tete2A
            If numerotete = 3 Then objet = tete3A
            If numerotete = 4 Then objet = tete4A
            If numerotete = 5 Then objet = tete5A
            If numerotete = 6 Then objet = tete6A
        End If

        If joueurB$ = "mortdecap" Or joueurB$ = "mortdecapR" Then
            If numerotete = 1 Then objet = tete1B
            If numerotete = 2 Then objet = tete2B
            If numerotete = 3 Then objet = tete3B
            If numerotete = 4 Then objet = tete4B
            If numerotete = 5 Then objet = tete5B
            If numerotete = 6 Then objet = tete6B
        End If

        xSPRt = (xSPRt - 1) * 8 ' laisser en 8 pour le football :)

        ySPRt = ySPRt + 7

        If xSPRt < 320 Then _PutImage (xSPRt, 175), spriteombre

        If xSPRt < 320 Then _PutImage (xSPRt, ySPRt), objet

    End If



    '                       ****************************************
    '                       ********* affichage du gnome  **********
    '                       ****************************************
    gnome2:

    If gnome$ = "oui" Then

        If xGNOME > 39 Then
            'xGNOME = 39
            If joueurB$ = "mortdecap" Or joueurB$ = "mortdecapR" Then
                If partie$ = "vs" Then bonusA$ = "oui"
                If partie$ = "solo" Then
                    If xB >= 40 Then sortieA$ = "oui": Aoccupe$ = "non"
                End If
            End If
            If joueurB$ = "mort" Or joueurB$ = "mortR" Then
                If partie$ = "vs" Then bonusA$ = "oui"
                If partie$ = "solo" Then
                    If xB >= 40 Then sortieA$ = "oui": Aoccupe$ = "non"
                End If
            End If

            If joueurA$ = "mortdecap" Or joueurA$ = "mortdecapR" Then
                If partie$ = "vs" Then bonusB$ = "oui"
                If partie$ = "solo" Then
                    If xA >= 40 Then sortieB$ = "oui": Boccupe$ = "non"
                End If
            End If
            If joueurA$ = "mort" Or joueurA$ = "mortR" Then
                If partie$ = "vs" Then bonusB$ = "oui"
                If partie$ = "solo" Then
                    If xA >= 40 Then sortieB$ = "oui": Boccupe$ = "non"
                End If
            End If


        End If

        If numerognome = 1 Then objet = gnome1
        If numerognome = 2 Then objet = gnome2
        If numerognome = 3 Then objet = gnome3
        If numerognome = 4 Then objet = gnome4
        If numerognome = 5 Then objet = gnomerire1
        If numerognome = 6 Then objet = gnomerire2

        xGNOME2 = ((xGNOME - 1) * 8)

        If xGNOME < 40 Then _PutImage (xGNOME2, 152), objet

    End If


    '  gnome rigole

    If joueurA$ = "mortdecap" Or joueurA$ = "mort" Then
        If xGNOME > xA + 3 Then
            sonrigole$ = "oui"
            gnomerigole$ = "oui"
        End If
    End If

    If joueurA$ = "mortdecapR" Or joueurA$ = "mortR" Then
        If xGNOME > xA Then
            sonrigole$ = "oui"
            gnomerigole$ = "oui"
        End If
    End If

    If joueurB$ = "mortdecap" Or joueurB$ = "mort" Then
        If xGNOME > xB Then
            sonrigole$ = "oui"
            gnomerigole$ = "oui"
        End If
    End If

    If joueurB$ = "mortdecapR" Or joueurB$ = "mortR" Then
        If xGNOME > xB + 3 Then
            sonrigole$ = "oui"
            gnomerigole$ = "oui"
        End If
    End If



    ' cadavre tir‚ par le gnome

    If joueurA$ = "mortdecap" Or joueurA$ = "mort" Then
        If xGNOME > xA + 5 Then
            gnometire$ = "non"
            xA = xA + 1
        End If
    End If
    If joueurA$ = "mortdecapR" Or joueurA$ = "mortR" Then
        If xGNOME > xA + 4 Then
            gnometire$ = "non"
            xA = xA + 1
        End If
    End If

    If joueurB$ = "mortdecap" Or joueurB$ = "mort" Then
        If xGNOME > xB + 4 Then
            gnometire$ = "non"
            xB = xB + 1
        End If
    End If
    If joueurB$ = "mortdecapR" Or joueurB$ = "mortR" Then
        If xGNOME > xB + 5 Then
            gnometire$ = "non"
            xB = xB + 1
        End If
    End If



    '                       ****************************************
    '                       ********* affichage des arbres**********
    '                       ****************************************
    arbres:

    If xA < 6 Or xB < 6 Or gnome$ = "oui" And xGNOME < 12 Then
        _PutImage (0, 104), arbreG
    End If


    If xB > 29 Or xA > 29 Or xGNOME > 32 Or xSPRt > 263 Then
        _PutImage (272, 104), arbreD
    End If


    '                       ****************************************
    '                       ************ affichage du feu **********
    '                       ****************************************


    If jeu$ = "encours" And sorcier$ = "oui" And xAttB > xB + 5 Then

        xfeu = (xAttB - 2) * 8: yfeu = yAttB * 8

        If xAttB = 14 Or xAttB = 23 Or xAttB = 32 Then
            objet = feu1
            _PutImage (xfeu, yfeu), objet
        End If

        If xAttB = 17 Or xAttB = 26 And xAttB < xB + 20 Then
            objet = feu2
            _PutImage (xfeu, yfeu), objet
        End If

        If xAttB = 20 Or xAttB = 29 Then
            objet = feu3
            _PutImage (xfeu, yfeu), objet
        End If

    End If



    '                       ****************************************
    '                       ********* jeu gagn‚ - jeu perdu ********
    '                       ****************************************


    If jeu$ = "gagne" Then
        ' cache marianna
        Line (186, 95)-(200, 114), _RGB(0, 0, 0), BF
        Line (185, 113)-(201, 114), _RGB(0, 0, 0), BF

        Color _RGB(0, 0, 0), _RGB(34, 34, 153)
        _Font 8
        _PrintMode _FillBackground
        Locate 10, 12: Print "Thanks big boy."


    End If

    If jeu$ = "perdu" And joueurA$ = "sorcierFINI" Then
        Color _RGB(0, 0, 0), _RGB(34, 34, 153)
        _Font 8
        _PrintMode _FillBackground
        Locate 10, 11: Print "Your end has come!"

    End If

    _Display
    _Limit 50 ' nombre de boucles a la seconde



    '                        gestion du temps et retour



    If arret$ = "oui" Then

        If jeu$ = "encours" Then
            _SndStop mortdecap: _SndStop mortKO: _SndStop prepare
            scoreA = 0: scoreB = 0
            GoTo menu
        End If


        If jeu$ = "gagne" Or jeu$ = "perdu" Then
            IA = 0: scoreA = 0: scoreB = 0
            sorcier$ = "non": jeu$ = "encours"
            GoTo menu
        End If

    End If

Loop

