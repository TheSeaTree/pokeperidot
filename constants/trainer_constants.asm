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

KRIS EQU __enum__
	trainerclass FALKNER ; 1
	const FALKNER1
	const FALKNER2

	trainerclass WHITNEY ; 2
	const WHITNEY1

	trainerclass BUGSY ; 3
	const BUGSY1
	const BUGSY2
	const BUGSY3
	
	trainerclass MORTY ; 4
	const MORTY1

	trainerclass PRYCE ; 5
	const PRYCE1

	trainerclass JASMINE ; 6
	const JASMINE1

	trainerclass CHUCK ; 7
	const CHUCK1

	trainerclass CLAIR ; 8
	const CLAIR1

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

	trainerclass POKEMON_PROF ; a

	trainerclass WILL ; b
	const WILL1

	trainerclass CAL ; c
	const CAL1
	const CAL2
	const CAL3

	trainerclass BRUNO ; d
	const BRUNO1

	trainerclass KAREN ; e
	const KAREN1

	trainerclass KOGA ; f
	const KOGA1

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

	trainerclass ERIKA ; 15
	const ERIKA1

	trainerclass YOUNGSTER ; 16
	const JACK
	const BEN

	trainerclass SCHOOLBOY ; 17
	const TIMMY
	const DANNY
	const JOHNNY
	const GUS
	const MARTIN

	trainerclass BIRD_KEEPER ; 18
	const PHIL
	const ALEX
	const ELLIS
	const ROY

	trainerclass LASS ; 19
	const NICOLE
	const MELISSA
	const ELIZABETH
	const AMANDA
	const STEPHANIE
	const HOLLY
	const VICKY

	trainerclass JANINE ; 1a
	const JANINE1

	trainerclass COOLTRAINERM ; 1b
	const LEON
	const LUCAS

	trainerclass COOLTRAINERF ; 1c
	const REGGIE
	const ANYA
	
	trainerclass BEAUTY ; 1d
	const LILY
	const BLAZE
	const JILL
	const TRACEY
	const REBECCA
	
	trainerclass POKEMANIAC ; 1e
	const CHARLIE
	const SCOTT
	const DYLAN
	const TRENT
	const TYLER

	trainerclass GRUNTM ; 1f

	trainerclass GENTLEMAN ; 20
	
	trainerclass SKIER ; 21
	
	trainerclass TEACHER ; 22
	const ANDREA
	const CAMILLA
	
	trainerclass SABRINA ; 23
	const SABRINA1

	trainerclass BUG_CATCHER ; 24
	const LIAM
	const EDDIE
	const OWEN
	const LONNIE
	const GREG

	trainerclass FISHER ; 25
	const BRADY
	const NELSON
	const LEO
	const MARSHALL
	
	trainerclass SWIMMERM ; 26
	const VINNY
	const JIMMY1
	const RONNIE
	
	trainerclass SWIMMERF ; 27
	const VIVIAN
	const KAIT
	
	trainerclass SAILOR ; 28
	const CALVIN
	const JEREMY
	const MILES
	const ROLAND
	
	trainerclass SUPER_NERD ; 29
	const SHANE
	const STEVEN
	const PETER

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
	const JOEL
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
	
	trainerclass BIKER ; 2d
	const JERRY
	const JARED
	const JESSE
	
	trainerclass BLAINE ; 2e
	const BLAINE1

	trainerclass BURGLAR ; 2f
	const ALLEN
	const LAMAAR
	const AVERY
	const MARCUS
	const HARVEY
	const MANUEL
	const SHAWN
	const DUKE
	
	trainerclass FIREBREATHER ; 30
	const BRIAN
	const ROBIN
	const WAYNE
	
	trainerclass JUGGLER ; 31
	const ROBERT
	
	trainerclass BLACKBELT_T ; 32
	const BILLY
	const JIMMY
	const AXEL
	const CLINT

	trainerclass EXECUTIVEM ; 33

	trainerclass PSYCHIC_T ; 34
	const PARKER
	const CHRISTIAN
	const DAMIEN
	const SOLOMON
	
	trainerclass PICNICKER ; 35
	const JAMIE
	const CINDY
	const JESS
	const TERRY
	const BRITTANY
	const LESLIE

	trainerclass CAMPER ; 36
	const NICHOLAS
	const JAMES
	const RALPH
	const NATE
	const JEFF
	const RUSTY

	trainerclass EXECUTIVEF ; 37

	trainerclass SAGE ; 38
	const ABBOT
	const CALEB
	const LO

	trainerclass MEDIUM ; 39
	
	trainerclass BOARDER ; 3a
	
	trainerclass POKEFANM ; 3b
	const LESTER
	const DOUG
	
	trainerclass KIMONO_GIRL ; 3c
	const TEST
	
	trainerclass TWINS ; 3d
	const FAYEANDMAE1
	const FAYEANDMAE2
	
	trainerclass POKEFANF ; 3e
	const ELANE
	
	trainerclass RED ; 3f
	const RED1

	trainerclass BLUE ; 40
	const BLUE1

	trainerclass OFFICER ; 41
	
	trainerclass GRUNTF ; 42

	trainerclass MYSTICALMAN ; 43
	const EUSINE

NUM_TRAINER_CLASSES EQU __enum__
