trainerclass: MACRO
	enum \1
const_value = 1
ENDM

; trainer class ids
; `trainerclass` indexes are for:
; - TrainerClassNames (see data/trainers/class_names.asm)
; - TrainerClassAttributes (see data/trainers/attributes.asm)
; - TrainerClassDVs (see data/trainers/dvs.asm)
; - TrainerGroups (see data/trainers/party_pointers.asm)
; - TrainerEncounterMusic (see data/trainers/encounter_music.asm)
; - TrainerPicPointers (see data/trainers/pic_pointers.asm)
; - TrainerPalettes (see data/trainers/palettes.asm)
; - BTTrainerClassSprites (see data/trainers/sprites.asm)
; - BTTrainerClassGenders (see data/trainers/genders.asm)
; trainer constants are Trainers indexes, for the sub-tables of TrainerGroups (see data/trainers/parties.asm)
	enum_start
CHRIS EQU __enum__
	trainerclass TRAINER_NONE ; 0
	const PHONECONTACT_MOM
	const PHONECONTACT_BIKESHOP
	const PHONECONTACT_BILL
	const PHONECONTACT_ELM
	const PHONECONTACT_BUENA

	trainerclass CECIL ; 1
	const CECIL1
	const CECIL2
	const CECIL3
	const CECIL4
	const CECIL5
	const CECIL_REMATCH

	trainerclass CELESTE ; 2
	const CELESTE1
	const CELESTE_REMATCH

	trainerclass MURPHY ; 3
	const MURPHY1
	const MURPHY2
	const MURPHYY_REMATCH
	
	trainerclass DUANE ; 4
	const DUANE1
	const DUANE2
	const DUANE3
	const DUANE_REMATCH

	trainerclass PRYCE ; 5
	const PRYCE1

	trainerclass JASMINE ; 6
	const JASMINE1
	const JASMINE_REMATCH

	trainerclass JOEL ; 7
	const JOEL1
	const JOEL_REMATCH

	trainerclass ENYA ; 8
	const ENYA1
	const ENYA_REMATCH

	trainerclass RIVAL1 ; 9
	const RIVAL1_1_CHIKORITA
	const RIVAL1_1_CYNDAQUIL
	const RIVAL1_1_TOTODILE
	const RIVAL1_2_CHIKORITA
	const RIVAL1_2_CYNDAQUIL
	const RIVAL1_2_TOTODILE
	const RIVAL1_3_CHIKORITA
	const RIVAL1_3_CYNDAQUIL
	const RIVAL1_3_TOTODILE
	const RIVAL1_4_CHIKORITA
	const RIVAL1_4_CYNDAQUIL
	const RIVAL1_4_TOTODILE
	const RIVAL1_5_CHIKORITA
	const RIVAL1_5_CYNDAQUIL
	const RIVAL1_5_TOTODILE
	const RIVAL1_6

	trainerclass FANGIRL
	const EMILY1
	const EMILY2 ; House Encounter
	const EMILY3 ; Safari Zone Encounter

	trainerclass PROFESSOR ; a
	const TEST

	trainerclass CAL ; c
	const CAL1
	const CAL2
	const CAL3

	trainerclass ORVILLE ; b
	const ORVILLE1

	trainerclass REGAN ; d
	const REGAN1

	trainerclass AMBER ; e
	const AMBER1

	trainerclass BREDE ; f
	const BREDE1

	trainerclass CHAMPION ; 10
	const LANCE

	trainerclass BROCK ; 11
	const BROCK1

	trainerclass MISTY ; 12
	const MISTY1

	trainerclass LT_SURGE ; 13
	const LT_SURGE1

	trainerclass SCIENTIST ; 14
	const ADRIAN
	const MELVIN
	const ANDRE
	const KURT
	const DAVID
	const SETH
	const PETER
	const MILTON

	trainerclass POSEY ; 15
	const POSEY1
	const POSEY2
	const POSEY3
	const POSEY4
	const POSEY_REMATCH

	trainerclass LAD ; 16
	const JACK
	const BEN
	const TRISTAN
	const DEVIN
	const JULES
	const LAWRENCE

	trainerclass SCHOOLBOY ; 17
	const TIMMY
	const DANNY
	const JOHNNY
	const GUS
	const MARTIN
	const OLIVER

	trainerclass BIRD_KEEPER ; 18
	const PHIL
	const ALEX
	const ELLIS
	const ROY
	const RICKY
	const HUGH
	const RILEY
	const COREY

	trainerclass LASS ; 19
	const NICOLE
	const MELISSA
	const ELIZABETH
	const AMANDA
	const STEPHANIE
	const HOLLY
	const VICKY
	const GINGER
	const KELLY
	const DANNI

	trainerclass JANINE ; 1a
	const JANINE1

	trainerclass COOLTRAINERM ; 1b
	const LEON
	const LUCAS
	const BRUCE
	const JORDAN
	const TODD
	const TORY
	const EDGAR

	trainerclass COOLTRAINERF ; 1c
	const ANYA
	const SASHA
	const ASHLEY
	const EVE
	const FAITH
	const KARI
	const HEIDY
	const ABBY

	trainerclass BEAUTY ; 1d
	const LILY
	const BLAZE
	const JILL
	const TRACEY
	const REBECCA
	const REGGIE
	const MARIE1
	const MARIE2
	const BRIANNA
	const DIANE
	const CHELLE
	const ERIN
	const GRACE

	trainerclass POKEMANIAC ; 1e
	const CHARLIE
	const SCOTT
	const DYLAN
	const TRENT
	const TYLER
	const DEXTER

	trainerclass GRUNTM ; 1f

	trainerclass GENTLEMAN ; 20
	const WINFRED
	const CHARLES
	const RON
	
	trainerclass SKIER ; 21
	
	trainerclass TEACHER ; 22
	const ANDREA
	const SHARON
	const LISA
	const BEA
	const ILENE
	const CECELIA

	trainerclass SABRINA ; 23
	const SABRINA1

	trainerclass BUG_CATCHER ; 24
	const LIAM
	const EDDIE
	const OWEN
	const LONNIE
	const GREG
	const CARLOS
	const TROY

	trainerclass FISHER ; 25
	const BRADY
	const NELSON
	const LEO
	const MARSHALL
	const DERRICK
	const FISHER_TRAINER
	const STAN
	const CODY
	
	trainerclass SWIMMERM ; 26
	const VINNY
	const JIMMY1
	const RONNIE
	const HARLEY
	const RUSSEL
	const HAROLD
	const SAUL
	const GLENN
	const WALKER

	trainerclass SWIMMERF ; 27
	const VIVIAN
	const KAIT
	const ANGIE
	const LAURIE
	const SANDRA
	const BRETT
	const MIRANDA
	const LAUREN
	const KARLA
	
	trainerclass SAILOR ; 28
	const CALVIN
	const JEREMY
	const MILES
	const ROLAND
	const TUCKER
	const GENE
	const DARIUS
	const NATHAN
	const ROSCOE
	const HERMAN
	const TAYLOR
	const TAYLOR_REMATCH1
	const TAYLOR_REMATCH2
	const TAYLOR_REMATCH3
	const TAYLOR_REMATCH4
	const TAYLOR_REMATCH5

	trainerclass SUPER_NERD ; 29
	const SHANE
	const STEVEN
	const PAT
	const SANDY
	const HAL
	const DENNIS
	const HERBERT
	const MAX
	const NORBERT

	trainerclass RIVAL2 ; 2a
	const RIVAL2_1_CHIKORITA
	const RIVAL2_1_CYNDAQUIL
	const RIVAL2_1_TOTODILE
	const RIVAL2_2_CHIKORITA
	const RIVAL2_2_CYNDAQUIL
	const RIVAL2_2_TOTODILE

	trainerclass GUITARIST ; 2b
	const TOMAS
	const PAUL
	const FREDRIK
	const BRENDON
	const ANTHONY
	const XAVIER
	const TREVOR
	const COLIN
	const ANDY
	const LEE
	const MARCEL
	const IVAN
	const CONRAD
	const BOBBY

	trainerclass HIKER ; 2c
	const ADAM
	const EARL
	const GRANT
	const JOSE
	const JAY
	const JACOB
	const GEORGE
	const WARREN
	const RAY
	const OMAR
	const DEAN
	const CARTER
	const ZEKE
	const VINCENT
	const ISAIAH
	
	trainerclass BIKER ; 2d
	const JERRY
	const JARED
	const JESSE
	const MORTON
	const FLYNN
	const BRANDON
	const RYAN
	const BAM
	const CHASE
	const LARS
	const DANTE
	
	trainerclass BLAINE ; 2e
	const BLAINE1

	trainerclass BURGLAR ; 2f
	const ALLEN
	const LAMAAR
	const KEN
	const MARCUS
	const HARVEY
	const MANUEL
	const SHAWN
	const DUKE
	const HARRIS
	const DUKE2
	const RANDY
	
	trainerclass FIREBREATHER ; 30
	const BRIAN
	const ROBIN
	const WAYNE
	const DREW
	const RUBIN
	const LOUIS
	const ROGER
	const KENNY
	const AIDEN
	
	trainerclass JUGGLER ; 31
	const ROBERT
	const BLAIR
	const URI
	const KAI

	trainerclass BLACKBELT_T ; 32
	const AXEL
	const CLINT
	const JUN
	const TAKEO
	const RIKU

	trainerclass EXECUTIVEM ; 33
	const ABBOT
	const ABBOT2

	trainerclass PSYCHIC_T ; 34
	const PARKER
	const CHRISTIAN
	const DAMIEN
	const SOLOMON
	const WES
	const FREDDIE
	
	trainerclass PICNICKER ; 35
	const JAMIE
	const CINDY
	const JESS
	const TERRY
	const BRITTANY
	const LESLIE
	const TAMMY

	trainerclass CAMPER ; 36
	const NICHOLAS
	const JAMES
	const RALPH
	const NATE
	const JEFF
	const RUSTY
	const NORRIS

	trainerclass ENGINEER ; 37
	const ENRIQUE
	const RUDOLPH
	const ARNIE
	const BERNARD
	const ROCCO

	trainerclass SAGE ; 38
	const CALEB
	const LO
	const CALEB2
	const LO2

	trainerclass MEDIUM ; 39
	const ANNABELLE
	
	trainerclass BOARDER ; 3a
	
	trainerclass POKEFANM ; 3b
	const LESTER
	const GERALD
	const RICHARD
	const DOUG
	const HANS
	const IRVING
	
	trainerclass KIMONO_GIRL ; 3c
	const ANRI
	
	trainerclass TWINS ; 3d
	const FAYEANDMAE1
	const FAYEANDMAE2
	const LEAHANDMIA1
	const LEAHANDMIA2
	const JANANDANNE1
	const JANANDANNE2

	trainerclass POKEFANF ; 3e
	const ELANE
	const MARCI
	const FELICIA

	trainerclass RED ; 3f
	const RED1

	trainerclass BLUE ; 40
	const BLUE1

	trainerclass OFFICER ; 41
	const BILLY
	const JIMMY
	const GORDON
	const HARRY
	
	trainerclass GRUNTF ; 42

	trainerclass MYSTICALMAN ; 43
	const EUSINE

KRIS EQU __enum__
NUM_TRAINER_CLASSES EQU __enum__
