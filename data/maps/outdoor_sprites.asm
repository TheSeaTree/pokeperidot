; Valid sprite IDs for each map group.
; Maps with environment ROUTE or TOWN can only use these sprites.

OutdoorSprites:
; entries correspond to map groups
	dw OceanGroupSprites
	dw RugosaGroupSprites
	dw DungeonsGroupSprites
	dw StaghornGroupSprites
	dw AcroporaGroupSprites
	dw CinnabarGroupSprites
	dw CeruleanGroupSprites
	dw PectiniaGroupSprites
	dw LakeOfRageGroupSprites
	dw RidgeGroupSprites
	dw FaviaGroupSprites
	dw VermilionGroupSprites
	dw PalletGroupSprites
	dw PewterGroupSprites
	dw FastShipGroupSprites
	dw IndigoGroupSprites
	dw FuchsiaGroupSprites
	dw LavenderGroupSprites
	dw SilverGroupSprites
	dw CableClubGroupSprites
	dw CeladonGroupSprites
	dw CianwoodGroupSprites
	dw OrchidGroupSprites
	dw NewBarkGroupSprites
	dw SaffronGroupSprites
	dw PavonaGroupSprites
	dw PalerockGroupSprites
	dw NorthForestGroupSprites
	dw SeaRoute7GroupSprites

; Route1 and ViridianCity are connected
; Route2 and PewterCity are connected
; PalletTown and Route21 are connected
PalletGroupSprites:
	db SPRITE_TEACHER
	db SPRITE_FISHER
	db SPRITE_YOUNGSTER
	db SPRITE_LASS
	db SPRITE_BUENA
	db SPRITE_BUG_CATCHER
	db SPRITE_COOLTRAINER_F
	db SPRITE_COOLTRAINER_M
	db SPRITE_SUPER_NERD
	; limit of 9 walking sprites
	db SPRITE_POKEFAN_M
	db SPRITE_BIRD
	db SPRITE_POKE_BALL
	db SPRITE_ROCK
	db SPRITE_FRUIT_TREE
	db 0 ; end

; Route1, PalletTown
PewterGroupSprites:
; Route3, PewterCity
	db SPRITE_BUG_CATCHER
	db SPRITE_SCIENTIST
	db SPRITE_SUPER_NERD
	db SPRITE_CLERK
	db SPRITE_YOUNGSTER
	db SPRITE_POKEFAN_F
	db SPRITE_LASS
	db SPRITE_ROCKER
	db SPRITE_COOLTRAINER_F
	; limit 9 of 9 walking sprites
	db SPRITE_FISHER
	db SPRITE_HO_OH
	db 0 ; end

CinnabarGroupSprites:
; Route19, Route20, Route21, CinnabarIsland
	db SPRITE_TEACHER
	db SPRITE_FISHER
	db SPRITE_YOUNGSTER
	db SPRITE_LASS
	db SPRITE_FANGIRL
	db SPRITE_BUG_CATCHER
	db SPRITE_COOLTRAINER_F
	db SPRITE_SUPER_NERD
	db SPRITE_POKEFAN_M
	; limit of 9 walking sprites
	db SPRITE_SWIMMER_GIRL_LAND
	db SPRITE_BLACK_BELT
	db SPRITE_PARAS
	db SPRITE_LAPRAS
	db SPRITE_MACHOP
	db SPRITE_SUDOWOODO
	db SPRITE_TAUROS
	db SPRITE_POKE_BALL
	db SPRITE_FRUIT_TREE
	db SPRITE_ROCK
	db 0 ; end

; CeruleanCity and Route5 are connected
CeruleanGroupSprites:
	db SPRITE_LASS
	db SPRITE_BUENA
	db SPRITE_POKEFAN_F
	db SPRITE_YOUNGSTER
	db SPRITE_TEACHER
	db SPRITE_BUG_CATCHER
	db SPRITE_SUPER_NERD
	db SPRITE_FISHER
	db SPRITE_BIKER
	; limit 9 of 9 walking sprites
	db SPRITE_SWIMMER_GIRL_LAND
	db SPRITE_OFFICER_M
	db SPRITE_GRAMPS
	db SPRITE_TAUROS
	db SPRITE_FRUIT_TREE
	db SPRITE_POKE_BALL
	db SPRITE_BIG_SNORLAX
	db 0

; Route4, Route9, Route10North, Route24, Route25, CeruleanCity
SaffronGroupSprites:
; Route5, SaffronCity
	db SPRITE_COOLTRAINER_M
	db SPRITE_COOLTRAINER_F
	db SPRITE_YOUNGSTER
	db SPRITE_LASS
	db SPRITE_POKEFAN_M
	db SPRITE_BUENA
	db SPRITE_MONSTER
	db SPRITE_BIRD
	db SPRITE_DRAGON
	; limit of 9 walking sprites
	db SPRITE_OFFICER_M
	db SPRITE_SUPER_NERD
	db SPRITE_POKEFAN_F
	db SPRITE_SCIENTIST
	db SPRITE_NURSE
	db SPRITE_POKE_BALL
	db SPRITE_SLOWPOKE
	db 0 ; end

VermilionGroupSprites:
; Route6, Route11, VermilionCity
	db SPRITE_POKEFAN_M
	db SPRITE_GRAMPS
	db SPRITE_YOUNGSTER
	db SPRITE_TEACHER
	db SPRITE_SUPER_NERD
	; 5 of max 9 walking sprites
	db SPRITE_BIG_SNORLAX
	db SPRITE_MACHOP
	db SPRITE_POKE_BALL
	db SPRITE_FRUIT_TREE
	db 0 ; end

CeladonGroupSprites:
; Route7, Route16, Route17, CeladonCity
	db SPRITE_FISHER
	db SPRITE_TEACHER
	db SPRITE_GRAMPS
	db SPRITE_YOUNGSTER
	db SPRITE_LASS
	db SPRITE_BIKER
	; 6 of max 9 walking sprites
	db SPRITE_POLIWAG
	db SPRITE_POKE_BALL
	db SPRITE_FRUIT_TREE
	db 0 ; end

; Route12 and Route13 are connected
; Route8, Route12, Route10South, LavenderTown
LavenderGroupSprites:
	db SPRITE_POKEFAN_M
	db SPRITE_BUENA	
	db SPRITE_YOUNGSTER
	db SPRITE_FISHER
	db SPRITE_TEACHER
	db SPRITE_SUPER_NERD
	db SPRITE_BIKER
	db SPRITE_SWIMMER_GIRL_LAND
	db SPRITE_LASS
	; 9 of max 9 walking sprites
	db SPRITE_TWIN
	db SPRITE_BUG_CATCHER
	db SPRITE_COOLTRAINER_M
	db SPRITE_PHARMACIST
	db SPRITE_GYM_GUY
	db SPRITE_ROCK
	db SPRITE_KIMONO_GIRL
	db SPRITE_BIG_SNORLAX
	db SPRITE_POKE_BALL
	db SPRITE_FRUIT_TREE
	db SPRITE_BUSH
	db 0 ; end
	
FuchsiaGroupSprites:
; Route13, Route14, Route15, Route18, FuchsiaCity
	db SPRITE_POKEFAN_M
	db SPRITE_YOUNGSTER
	db SPRITE_FISHER
	db SPRITE_TEACHER
	db SPRITE_SUPER_NERD
	db SPRITE_POKEFAN_F
	db SPRITE_LASS
	; 9 of max 9 walking sprites
	db SPRITE_TWIN
	db SPRITE_COOLTRAINER_F
	db SPRITE_ROCK
	db SPRITE_KIMONO_GIRL
	db SPRITE_CELEBI
	db SPRITE_POKE_BALL
	db SPRITE_FRUIT_TREE
	db 0 ; end

IndigoGroupSprites:
; Route23
	db SPRITE_SUPER_NERD
	db SPRITE_COOLTRAINER_F
	db SPRITE_YOUNGSTER
	db SPRITE_BUENA
	db SPRITE_ROCKER
	db SPRITE_TEACHER
	db SPRITE_POKEFAN_M
	; 0 of max 9 walking sprites
	db SPRITE_POKE_BALL
	db 0 ; end

NewBarkGroupSprites:
PavonaGroupSprites:
	db SPRITE_TEACHER
	db SPRITE_FISHER
	db SPRITE_YOUNGSTER
	db SPRITE_LASS
	db SPRITE_BUENA
	db SPRITE_BUG_CATCHER
	db SPRITE_COOLTRAINER_F
	db SPRITE_COOLTRAINER_M
	db SPRITE_SUPER_NERD
	; limit of 9 walking sprites
	db SPRITE_VARIABLE_MOM
	db SPRITE_SUICUNE
	db SPRITE_BUSH
	db SPRITE_POKE_BALL
	db SPRITE_ROCK
	db SPRITE_FRUIT_TREE
	db 0 ; end
	
OrchidGroupSprites:
	db SPRITE_TEACHER
	db SPRITE_POKEFAN_M
	db SPRITE_YOUNGSTER
	db SPRITE_LASS
	db SPRITE_BUENA
	db SPRITE_BLACK_BELT
	db SPRITE_COOLTRAINER_F
	db SPRITE_COOLTRAINER_M
	db SPRITE_SUPER_NERD
	; limit of 9 walking sprites
	db SPRITE_NURSE
	db SPRITE_CLEFAIRY
	db SPRITE_POKE_BALL
	db SPRITE_ROCK
	db SPRITE_FRUIT_TREE
	db 0 ; end

; Route37 and StaghornCity are connected
StaghornGroupSprites:
; StaghornCity
	db SPRITE_FISHER
	db SPRITE_LASS
	db SPRITE_OFFICER_M
	db SPRITE_GRAMPS
	db SPRITE_YOUNGSTER
	db SPRITE_COOLTRAINER_M
	db SPRITE_BUG_CATCHER
	db SPRITE_SUPER_NERD
	db SPRITE_SILVER
	; 9 of max 9 walking sprites
	db SPRITE_GYM_GUY
	db SPRITE_MOLTRES
	db SPRITE_WEIRD_TREE ; variable sprite: becomes SPRITE_SUDOWOODO and SPRITE_TWIN
	db SPRITE_POKE_BALL
	db SPRITE_FRUIT_TREE
	db 0 ; end

PectiniaGroupSprites:
; Route33, PectiniaTown
	db SPRITE_FANGIRL
	db SPRITE_YOUNGSTER
	db SPRITE_POKEFAN_M
	db SPRITE_TEACHER
	db SPRITE_SILVER
	db SPRITE_LASS
	db SPRITE_ROCKER
	db SPRITE_GYM_GUY
	db SPRITE_PHARMACIST
	; 9 of max 9 walking sprites
	db SPRITE_FRUIT_TREE
	db SPRITE_GROWLITHE
	db SPRITE_ROCK
	db SPRITE_SHELLDER
	db SPRITE_OMANYTE
	db SPRITE_NURSE
	db SPRITE_CLEFAIRY
	db SPRITE_GENTLEMAN
	db SPRITE_POKE_BALL
	db 0 ; end

RidgeGroupSprites:
	db SPRITE_SUPER_NERD
	db SPRITE_FANGIRL
	db SPRITE_YOUNGSTER
	db SPRITE_BUG_CATCHER
	db SPRITE_SILVER
	db SPRITE_FISHER
	db SPRITE_LASS
	db SPRITE_SAILOR
	db SPRITE_BUENA
	; 9 of max 9 walking sprites
	db SPRITE_COOLTRAINER_F
	db SPRITE_POKEFAN_M
	db SPRITE_DAY_CARE_MON_1
	db SPRITE_DAY_CARE_MON_2
	db SPRITE_POKE_BALL
	db SPRITE_FRUIT_TREE
	db SPRITE_ROCK
	db SPRITE_BUSH
	db 0 ; end
	
FaviaGroupSprites:
; Route34, FaviaCity
	db SPRITE_GRAMPS
	db SPRITE_YOUNGSTER
	db SPRITE_BUG_CATCHER
	db SPRITE_POKEFAN_M
	db SPRITE_COOLTRAINER_F
	db SPRITE_FISHER
	db SPRITE_LASS
	db SPRITE_POKEFAN_F
	db SPRITE_FANGIRL
	; 9 of max 9 walking sprites
	db SPRITE_DAY_CARE_MON_1
	db SPRITE_DAY_CARE_MON_2
	db SPRITE_POKE_BALL
	db SPRITE_TEACHER
	db SPRITE_SCIENTIST
	db 0 ; end

; OceanCity and Route40 are connected
OceanGroupSprites:
; Route38, Route39, OceanCity
	db SPRITE_SUPER_NERD
	db SPRITE_YOUNGSTER
	db SPRITE_BUENA
	db SPRITE_SILVER
	db SPRITE_FISHER
	db SPRITE_LASS
	db SPRITE_SWIMMER_GUY
	db SPRITE_SWIMMER_GIRL
	db SPRITE_SWIMMER_GIRL_LAND
	; 9 of max 9 walking sprites
	db SPRITE_SAILOR
	db SPRITE_BOULDER
	db SPRITE_BLACK_BELT
	db SPRITE_FRUIT_TREE
	db SPRITE_MACHOP
	db SPRITE_ROCK
	db SPRITE_POKE_BALL
	db SPRITE_SWIMMER_GUY_LAND
	db SPRITE_BUSH
	db SPRITE_MOLTRES
	db 0 ; end

CianwoodGroupSprites:
; Route40, Route41, CianwoodCity, BattleTowerOutside
	db SPRITE_OLIVINE_RIVAL ; variable sprite: becomes SPRITE_SILVER and SPRITE_SWIMMER_GUY
	db SPRITE_POKEFAN_M
	db SPRITE_LASS
	db SPRITE_BUENA
	db SPRITE_SWIMMER_GIRL
	db SPRITE_SAILOR
	db SPRITE_POKEFAN_F
	db SPRITE_SUPER_NERD
	db SPRITE_PHARMACIST
	; 9 of max 9 walking sprites
	db SPRITE_BOULDER
	db SPRITE_TAUROS
	db SPRITE_FRUIT_TREE
	db SPRITE_ROCK
	db SPRITE_POKE_BALL
	db 0 ; end

RugosaGroupSprites:
; Route42, Route44, RugosaTown
	db SPRITE_GRAMPS
	db SPRITE_YOUNGSTER
	db SPRITE_LASS
	db SPRITE_SAILOR
	db SPRITE_COOLTRAINER_M
	db SPRITE_JOEL
	db SPRITE_COOLTRAINER_F
	db SPRITE_FISHER
	db SPRITE_OFFICER_M
	; 9 of max 9 walking sprites
	db SPRITE_SCIENTIST
	db SPRITE_TWIN
	db SPRITE_GRIMER
	db SPRITE_MONSTER
	db SPRITE_FRUIT_TREE
	db SPRITE_POKE_BALL
	db 0 ; end

LakeOfRageGroupSprites:
; Route43, LakeOfRage
	db SPRITE_SUPER_NERD
	db SPRITE_TEACHER
	; 2 of max 9 walking sprites
	db SPRITE_JYNX
	db SPRITE_FRUIT_TREE
	db SPRITE_POKE_BALL
	db 0 ; end

AcroporaGroupSprites:
; Route45, Route46, AcroporaCity
	db SPRITE_FISHER
	db SPRITE_YOUNGSTER
	db SPRITE_LASS
	db SPRITE_BUENA
	db SPRITE_COOLTRAINER_M
	db SPRITE_POKEFAN_M
	db SPRITE_ROCKER
	db SPRITE_COOLTRAINER_F
	db SPRITE_BIKER
	; 9 of max 9 walking sprites
	db SPRITE_PHARMACIST
	db SPRITE_FRUIT_TREE
	db SPRITE_BUSH
	db SPRITE_POKE_BALL
	db SPRITE_BIG_SNORLAX
	db 0 ; end

SilverGroupSprites:
; Route28, SilverCaveOutside
	db SPRITE_SCIENTIST
	; 1 of max 9 walking sprites
	db SPRITE_EGG
	db SPRITE_BIG_AERODACTYL
	db SPRITE_POKE_BALL
	db 0 ; end

DungeonsGroupSprites:
; NationalPark, NationalParkBugContest, RuinsOfAlphOutside
	db SPRITE_LASS
	db SPRITE_POKEFAN_F
	db SPRITE_TEACHER
	db SPRITE_YOUNGSTER
	db SPRITE_POKEFAN_M
	db SPRITE_ROCKER
	db SPRITE_FISHER
	db SPRITE_SCIENTIST
	db SPRITE_SUPER_NERD
	; 8 of max 9 walking sprites
	db SPRITE_JYNX
	db SPRITE_EGG
	db SPRITE_GAMEBOY_KID
	db SPRITE_GROWLITHE
	db SPRITE_POKE_BALL
	db 0 ; end

FastShipGroupSprites:
; OceanPort, VermilionPort, MountMoonSquare, TinTowerRoof
	db SPRITE_SAILOR
	db SPRITE_FISHING_GURU
	db SPRITE_SUPER_NERD
	db SPRITE_COOLTRAINER_F
	db SPRITE_YOUNGSTER
	db SPRITE_PHARMACIST
	; 5 of max 9 walking sprites
	db SPRITE_HO_OH
	db SPRITE_FAIRY
	db SPRITE_POKE_BALL
	db SPRITE_ROCK
	db SPRITE_FRUIT_TREE
	db 0 ; end

CableClubGroupSprites:
; (no outdoor maps)
	; 0 of max 9 walking sprites
	db 0 ; end
	
PalerockGroupSprites:
	db SPRITE_NURSE
	db SPRITE_LASS
	db SPRITE_POKEFAN_F
	db SPRITE_TEACHER
	db SPRITE_YOUNGSTER
	db SPRITE_POKEFAN_M
	db SPRITE_ROCKER
	db SPRITE_FISHER
	db SPRITE_SCIENTIST
	; limit of 9 walking sprites
	db SPRITE_MOLTRES
	db SPRITE_POKE_BALL
	db SPRITE_BOULDER
	db 0 ; end

NorthForestGroupSprites:
	db SPRITE_SILVER
	db SPRITE_MEWTWO
	db 0

SeaRoute7GroupSprites:
; Sea Route 7
	db SPRITE_POKEFAN_M
	; 0 of max 9 walking sprites
	db SPRITE_POKE_BALL
	db 0 ; end
