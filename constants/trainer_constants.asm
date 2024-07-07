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
	const CECIL_REMATCH1
	const CECIL_REMATCH2
	const CECIL_REMATCH3
	const CECIL_REMATCH4
	const CECIL_REMATCH5

	trainerclass CELESTE ; 2
	const CELESTE1
	const CELESTE_REMATCH1
	const CELESTE_REMATCH2
	const CELESTE_REMATCH3
	const CELESTE_REMATCH4
	const CELESTE_REMATCH5

	trainerclass MURPHY ; 3
	const MURPHY1
	const MURPHY2
	const MURPHY_REMATCH1
	const MURPHY_REMATCH2
	const MURPHY_REMATCH3
	const MURPHY_REMATCH4
	const MURPHY_REMATCH5

	trainerclass DUANE ; 4
	const DUANE1
	const DUANE2
	const DUANE3
	const DUANE_REMATCH1
	const DUANE_REMATCH2
	const DUANE_REMATCH3
	const DUANE_REMATCH4
	const DUANE_REMATCH5

	trainerclass PRYCE ; 5

	trainerclass ALAN ; 6
	const ALAN1
	const ALAN_REMATCH1
	const ALAN_REMATCH2
	const ALAN_REMATCH3
	const ALAN_REMATCH4
	const ALAN_REMATCH5

	trainerclass JOEL ; 7
	const JOEL1
	const JOEL_REMATCH1
	const JOEL_REMATCH2
	const JOEL_REMATCH3
	const JOEL_REMATCH4
	const JOEL_REMATCH5

	trainerclass ENYA ; 8
	const ENYA1
	const ENYA_REMATCH1
	const ENYA_REMATCH2
	const ENYA_REMATCH3
	const ENYA_REMATCH4
	const ENYA_REMATCH5

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
	const RIVAL1_6_CHIKORITA
	const RIVAL1_6_CYNDAQUIL
	const RIVAL1_6_TOTODILE
	const RIVAL1_7

	trainerclass FANGIRL
	const EMILY1
	const EMILY2 ; House Encounter
	const EMILY3 ; Safari Zone Encounter

	trainerclass PROFESSOR ; a
	const MAPLE1
	const MAPLE2
	const MAPLE3
	const MAPLE4

	trainerclass CAL ; c
	const CAL1
	const CAL2
	const CAL3

	trainerclass WILBUR ; b
	const WILBUR1
	const WILBUR_REMATCH1
	const WILBUR_REMATCH2
	const WILBUR_REMATCH3
	const WILBUR_REMATCH4
	const WILBUR_REMATCH5

	trainerclass REGAN ; d
	const REGAN1
	const REGAN_REMATCH1
	const REGAN_REMATCH2
	const REGAN_REMATCH3
	const REGAN_REMATCH4
	const REGAN_REMATCH5

	trainerclass AMBER ; e
	const AMBER1
	const AMBER_REMATCH1
	const AMBER_REMATCH2
	const AMBER_REMATCH3
	const AMBER_REMATCH4
	const AMBER_REMATCH5

	trainerclass BREDE ; f
	const BREDE1
	const BREDE_REMATCH1
	const BREDE_REMATCH2
	const BREDE_REMATCH3
	const BREDE_REMATCH4
	const BREDE_REMATCH5

	trainerclass CHAMPION ; 10
	const JOSEPH

	trainerclass YOUNG_CHAMPION
	const JOSEPH_PAST

	trainerclass MISTY
	const TEST

	trainerclass LT_SURGE ; 13

	trainerclass SCIENTIST ; 14
	const ADRIAN
	const MELVIN
	const ANDRE
	const KURT
	const DAVID
	const SETH
	const PETER
	const MILTON
	const COMP1_TRAINER1
	const COMP2_TRAINER1
	const COMP3_TRAINER1

	trainerclass POSEY ; 15
	const POSEY1
	const POSEY2
	const POSEY_REMATCH1
	const POSEY_REMATCH2
	const POSEY_REMATCH3
	const POSEY_REMATCH4
	const POSEY_REMATCH5

	trainerclass LAD ; 16
	const JACK
	const BEN
	const TRISTAN
	const DEVIN
	const JULES
	const LAWRENCE
	const DARREN

	trainerclass SCHOOLBOY ; 17
	const TIMMY
	const DANNY
	const JOHNNY
	const GUS
	const MARTIN
	const OLIVER
	const JASPER
	const PATRICK

	trainerclass BIRD_KEEPER ; 18
	const PHIL
	const ALEX
	const ELLIS
	const ROY
	const RICKY
	const HUGH
	const RILEY
	const COREY
	const SKY1_TRAINER1
	const SKY2_TRAINER1
	const SKY3_TRAINER1
	const CHESTER

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
	const JODIE
	const CATHY
	const JEAN

	trainerclass JANINE ; 1a

	trainerclass COOLTRAINERM ; 1b
	const LEON
	const LUCAS
	const BRUCE
	const JORDAN
	const TODD
	const TORY
	const EDGAR
	const ALBERT
	const CASTLE1_TRAINER3
	const CASTLE2_TRAINER3
	const CASTLE3_TRAINER3
	const MITCH

	trainerclass COOLTRAINERF ; 1c
	const ANYA
	const SASHA
	const ASHLEY
	const EVE
	const FAITH
	const KARI
	const HEIDY
	const ABBY
	const ALICE
	const CASTLE1_TRAINER2
	const CASTLE2_TRAINER2
	const CASTLE3_TRAINER2
	const HANNAH

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
	const SKY1_TRAINER2
	const SKY2_TRAINER2
	const SKY3_TRAINER2
	const CASTLE3_BONUS
	const LINA
	const VIOLET

	trainerclass POKEMANIAC ; 1e
	const CHARLIE
	const SCOTT
	const DYLAN
	const TRENT
	const TYLER
	const DEXTER
	const GRAVE1_TRAINER3
	const GRAVE2_TRAINER3
	const GRAVE3_TRAINER3

	trainerclass TEACHERM ; 1f
	const MASON

	trainerclass GENTLEMAN ; 20
	const WINFRED
	const CHARLES
	const RON
	const SKY1_TRAINER3
	const SKY2_TRAINER3
	const SKY3_TRAINER3
	const NIGEL
	
	trainerclass SKIER ; 21
	const ICE1_TRAINER1
	const ICE2_TRAINER1
	const ICE3_TRAINER1
	
	trainerclass TEACHER ; 22
	const ANDREA
	const SHARON
	const LISA
	const BEA
	const ILENE
	const CECELIA
	const COMP3_BONUS
	const CLAUDIA

	trainerclass SABRINA ; 23

	trainerclass BUG_CATCHER ; 24
	const LIAM
	const EDDIE
	const OWEN
	const LONNIE
	const GREG
	const CARLOS
	const TROY
	const FOREST1_TRAINER3
	const FOREST2_TRAINER1
	const FOREST3_TRAINER1
	const KEVIN
	const TONY

	trainerclass FISHER ; 25
	const BRADY
	const NELSON
	const LEO
	const MARSHALL
	const DERRICK
	const FISHER_TRAINER
	const STAN
	const CODY
	const ICE1_TRAINER3
	const ICE2_TRAINER3
	const ICE3_TRAINER3
	const SKY3_BONUS
	const MARK

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
	const ICE3_BONUS
	const DALE

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
	const COMP1_TRAINER3
	const COMP2_TRAINER3
	const COMP3_TRAINER3
	const CONNOR

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
	const GRAVE3_BONUS

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
	const NOAH
	const LAVA1_TRAINER3
	const LAVA2_TRAINER3
	const LAVA3_TRAINER3
	const WARREN_SR

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
	const LAVA1_TRAINER2
	const LAVA2_TRAINER2
	const LAVA3_TRAINER2
	const ZACHARY
	
	trainerclass JADE_LINK ; 2e
	const JADE_LINK1
	const JADE_LINK2
	const JADE_LINK3

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
	const LAVA1_TRAINER1
	const LAVA2_TRAINER1
	const LAVA3_TRAINER1
	
	trainerclass JUGGLER ; 31
	const ROBERT
	const BLAIR
	const URI
	const KAI
	const CASTLE1_TRAINER1
	const CASTLE2_TRAINER1
	const CASTLE3_TRAINER1

	trainerclass BLACKBELT_T ; 32
	const AXEL
	const CLINT
	const JUN
	const TAKEO
	const RIKU
	const TOURNAMENT_1
	const TOURNAMENT_2
	const TOURNAMENT_3
	const TOURNAMENT_4
	const TOURNAMENT_5
	const TOURNAMENT_6
	const TOURNAMENT_7
	const LAVA3_BONUS

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
	const CHAZ
	const ROSS

	trainerclass PICNICKER ; 35
	const JAMIE
	const CINDY
	const JESS
	const TERRY
	const BRITTANY
	const LESLIE
	const TAMMY
	const FOREST1_TRAINER2
	const FOREST2_TRAINER2
	const FOREST3_TRAINER2
	const JENNIE
	const GIA

	trainerclass CAMPER ; 36
	const NICHOLAS
	const JAMES
	const RALPH
	const NATE
	const JEFF
	const RUSTY
	const NORRIS
	const FOREST1_TRAINER1
	const FOREST2_TRAINER3
	const FOREST3_TRAINER3
	const WILSON

	trainerclass ENGINEER ; 37
	const ENRIQUE
	const RUDOLPH
	const ARNIE
	const BERNARD
	const ROCCO
	const COMP1_TRAINER2
	const COMP2_TRAINER2
	const COMP3_TRAINER2

	trainerclass SAGE ; 38
	const CALEB
	const LO
	const CALEB2
	const LO2

	trainerclass MEDIUM ; 39
	const ANNABELLE
	const GRAVE1_TRAINER1
	const GRAVE2_TRAINER1
	const GRAVE3_TRAINER1

	trainerclass BOARDER ; 3a
	const ICE1_TRAINER2
	const ICE2_TRAINER2
	const ICE3_TRAINER2
	
	trainerclass POKEFANM ; 3b
	const LESTER
	const GERALD
	const RICHARD
	const DOUG
	const HANS
	const IRVING
	const BRADLEY
	
	trainerclass KIMONO_GIRL ; 3c
	const ANRI
	const FOREST3_BONUS
	
	trainerclass TWINS ; 3d
	const FAYEANDMAE1
	const FAYEANDMAE2
	const LEAHANDMIA1
	const LEAHANDMIA2
	const JANANDANNE1
	const JANANDANNE2
	const ALIANDLIA1
	const ALIANDLIA2

	trainerclass POKEFANF ; 3e
	const ELANE
	const MARCI
	const FELICIA
	const ZOEY
	const PATRICIA

	trainerclass RED ; 3f
	const RED1

	trainerclass CHAMPIONF ; 40
	const EMILY_CHAMPION1
	const EMILY_CHAMPION2
	const EMILY_CHAMPION3
	const EMILY_CHAMPION4
	const EMILY_CHAMPION5

	trainerclass OFFICER ; 41
	const BILLY
	const JIMMY
	const GORDON
	const HARRY
	const DANIEL1
	const DANIEL2
	const MATTHEW
	const GRAVE1_TRAINER2
	const GRAVE2_TRAINER2
	const GRAVE3_TRAINER2
	const TOMMY

	trainerclass JADE ; 42

	trainerclass PERRY ; 43
	const BOSS_LV10
	const BOSS_LV20
	const BOSS_LV30
	const BOSS_LV40
	const BOSS_LV50
	const BOSS_LV60
	const BOSS_LV70
	const BOSS_LV80
	const BOSS_LV90
	const BOSS_LV100

; Used for trainerpic images
	trainerclass GEN_1_ARTICUNO
	trainerclass GEN_1_ZAPDOS
	trainerclass GEN_1_MOLTRES
	trainerclass SW97_RAIKOU
	trainerclass SW97_ENTEI
	trainerclass SW97_SUICUNE

KRIS EQU __enum__
NUM_TRAINER_CLASSES EQU __enum__
