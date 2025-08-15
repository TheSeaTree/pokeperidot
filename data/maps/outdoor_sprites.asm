; Valid sprite IDs for each map group.
; Maps with environment ROUTE or TOWN can only use these sprites.

OutdoorSprites:
; entries correspond to map groups
	dw OceanGroupSprites
	dw RugosaGroupSprites
	dw DungeonsGroupSprites
	dw StaghornGroupSprites
	dw AcroporaGroupSprites
	dw SafariZoneGroupSprites
	dw CarnationGroupSprites
	dw PectiniaGroupSprites
	dw OrientemGroupSprites
	dw RidgeGroupSprites
	dw FaviaGroupSprites
	dw DeptStoreGroupSprites
	dw Route10GroupSprites
	dw RoofsGroupSprites
	dw SSMakoGroupSprites
	dw LeagueGroupSprites
	dw OccidentGroupSprites
	dw Route11GroupSprites
	dw LostLandGroupSprites
	dw CableClubGroupSprites
	dw CastleGroupSprites
	dw HepaticaGroupSprites
	dw OrchidGroupSprites
	dw ElkhornGroupSprites
	dw PostgameGroupSprites
	dw PavonaGroupSprites
	dw PalerockGroupSprites
	dw BoreasForestGroupSprites
	dw SeaRoute7GroupSprites
	dw BattleSimGroupSprites
	dw PastFaviaGroupSprites
	dw PastPectiniaGroupSprites
	dw PastRoute10GroupSprites
	dw PastElkhornGroupSprites
	dw PastPavonaGroupSprites

Route10GroupSprites:
; Route 10
; Connected to Elkhorn
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

RoofsGroupSprites:
; Rugosa Dept Store Roof, Gilded Hall Roof
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

SafariZoneGroupSprites:
; Safari Zone, Carnation Zoo
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

CarnationGroupSprites:
; Carnation Town, Roputes 14-16
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

PostgameGroupSprites:
; Routes 22, 23
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

DeptStoreGroupSprites:
; Rugosa Department Store
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

CastleGroupSprites:
; Gilded Hall, Lugia's Cave
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

Route11GroupSprites:
; Routes 11-13
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

OccidentGroupSprites:
; Occident Forest, past Occident Forest
	db SPRITE_POKEFAN_M
	db SPRITE_YOUNGSTER
	db SPRITE_FISHER
	db SPRITE_TEACHER
	db SPRITE_SUPER_NERD
	db SPRITE_POKEFAN_F
	db SPRITE_LASS
	db SPRITE_SWIMMER_GIRL_LAND
	db SPRITE_BLUE
	; 9 of max 9 walking sprites
	db SPRITE_TWIN
	db SPRITE_COOLTRAINER_F
	db SPRITE_ROCK
	db SPRITE_KIMONO_GIRL
	db SPRITE_CELEBI
	db SPRITE_POKE_BALL
	db SPRITE_FRUIT_TREE
	db 0 ; end

LeagueGroupSprites:
; Pokemon League
	db SPRITE_SUPER_NERD
	db SPRITE_COOLTRAINER_F
	db SPRITE_YOUNGSTER
	db SPRITE_BUENA
	db SPRITE_ROCKER
	db SPRITE_TEACHER
	db SPRITE_POKEFAN_M
	db SPRITE_SAILOR
	db SPRITE_SWIMMER_GUY_LAND
	; 0 of max 9 walking sprites
	db SPRITE_POKE_BALL
	db 0 ; end

ElkhornGroupSprites:
; Elkhorn Town, Route 1
PavonaGroupSprites:
; Pavona Village, Pavona Oasis, Route 9
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
; Orchid City, Route 20, Molten Peak
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

StaghornGroupSprites:
; Staghorn Town, Painter's Forest
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
	db SPRITE_POKE_BALL
	db SPRITE_FRUIT_TREE
	db 0 ; end

PectiniaGroupSprites:
; Pectinia City, Route 3
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
; Ridge Village, Routes 4-6, 8
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
; Favia Townn
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

OceanGroupSprites:
; Rugosa Coast, Routes 7 and 21, Sea Routes 1-3, 5, 6
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

HepaticaGroupSprites:
; Hepatica Town
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
; Rugosa City
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

OrientemGroupSprites:
; Orientem Forest
	db SPRITE_SUPER_NERD
	db SPRITE_TEACHER
	; 2 of max 9 walking sprites
	db SPRITE_JYNX
	db SPRITE_FRUIT_TREE
	db SPRITE_POKE_BALL
	db 0 ; end

AcroporaGroupSprites:
; Acropora City, Eoutes 17-19
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

LostLandGroupSprites:
; Remnant Cave, Lost Land
	db SPRITE_SCIENTIST
	; 1 of max 9 walking sprites
	db SPRITE_EGG
	db SPRITE_BIG_AERODACTYL
	db SPRITE_POKE_BALL
	db 0 ; end

DungeonsGroupSprites:
; Pavona Pass, Palerock Cave, Hepatica Cave, Burglar Hideout, Sea Route 4 Cave
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

SSMakoGroupSprites:
; SS Mako, Route 19
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
; Palerock Mountain
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

BoreasForestGroupSprites:
; Boreas Forest, Genesis Island
	db SPRITE_SILVER
	db SPRITE_MEWTWO
	db SPRITE_MEW
	db SPRITE_CAPTAIN
	db 0

SeaRoute7GroupSprites:
; Sea Route 7, Route 24
	db SPRITE_POKEFAN_M
	; 1 of max 9 walking sprites
	db SPRITE_POKE_BALL
	db 0 ; end

BattleSimGroupSprites:
; (no outdoor maps)
	; 0 of max 9 walking sprites
	db 0

PastFaviaGroupSprites:
; Favia Town(Past), Routes 3, 7(Past)
	db SPRITE_SAILOR
	db SPRITE_BUENA
	db SPRITE_LASS
	db SPRITE_YOUNGSTER
	db SPRITE_BUG_CATCHER
	db SPRITE_GENTLEMAN
	db SPRITE_TWIN
	db SPRITE_SUPER_NERD
	db SPRITE_BIKER
	; 9 of max 9 walking sprites
	db SPRITE_POKEFAN_M
	db SPRITE_POKE_BALL
	db SPRITE_CELEBI
	db 0

PastPectiniaGroupSprites:
; Pectinia City(Past)
	db SPRITE_POKEFAN_M
	db SPRITE_SAILOR
	db SPRITE_COOLTRAINER_M
	db SPRITE_COOLTRAINER_F
	db SPRITE_TWIN
	db SPRITE_SUPER_NERD
	; 5 of max 9 walking sprites
	db SPRITE_MACHOP
	db SPRITE_MOLTRES
	db SPRITE_GROWLITHE
	db SPRITE_POKE_BALL
	db SPRITE_FRUIT_TREE
	db SPRITE_POKE_BALL
	db SPRITE_CELEBI
	db 0

PastRoute10GroupSprites:
; Route 10(Past)
PastElkhornGroupSprites:
; Elkhorn Town(Past)
PastPavonaGroupSprites:
; Pavona Village(Past), Routes 1, 2(Past)
	db SPRITE_LASS
	db SPRITE_SUPER_NERD
	db SPRITE_YOUNGSTER
	db SPRITE_FISHER
	db SPRITE_OFFICER_M
	db SPRITE_POKEFAN_M
	db SPRITE_POKEFAN_F
	db SPRITE_TEACHER
	; 9 of max 9 walking sprites
	db SPRITE_TWIN
	db SPRITE_ROCK
	db SPRITE_POKE_BALL
	db SPRITE_CELEBI
	db 0
