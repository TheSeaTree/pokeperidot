; sprite ids
; OverworldSprites indexes (see data/sprites/sprites.asm)
	const_def
	const SPRITE_NONE ; 00
	const SPRITE_PERRY ; 01
	const SPRITE_PERRY_BIKE ; 02
	const SPRITE_GAMEBOY_KID ; 03
	const SPRITE_GAMEBOY_GIRL ; 03
	const SPRITE_SILVER ; 04
	const SPRITE_OAK ; 05
	const SPRITE_RED ; 06
	const SPRITE_BLUE ; 07
	const SPRITE_BILL ; 08
	const SPRITE_ELDER ; 09
	const SPRITE_JANINE ; 0a
	const SPRITE_PERRY_HEADSET
	const SPRITE_BLUE_MOM ; 0c
	const SPRITE_JADE_HEADSET
	const SPRITE_RED_MOM ; 0e
	const SPRITE_DAISY ; 0f
	const SPRITE_PURPLE_PERRY ; 10
	const SPRITE_GREEN_JADE ; 11
	const SPRITE_CECIL ; 12
	const SPRITE_PERIDOT_TROPHY ; 13
	const SPRITE_MURPHY ; 14
	const SPRITE_DUANE ; 15
	const SPRITE_UNUSED_16 ; 16
	const SPRITE_JASMINE ; 17
	const SPRITE_UNUSED_18 ; 18
	const SPRITE_CLAIR ; 19
	const SPRITE_RED_DAD ; 1a
	const SPRITE_BLUE_DAD ; 1b
	const SPRITE_UNUSED_1C ; 1c
	const SPRITE_UNUSED_1D ; 1d
	const SPRITE_JOSEPH ; 1e
	const SPRITE_UNUSED_1F ; 1f
	const SPRITE_UNUSED_20 ; 20
	const SPRITE_UNUSED_21 ; 21
	const SPRITE_UNUSED_22 ; 22
	const SPRITE_COOLTRAINER_M ; 23
	const SPRITE_COOLTRAINER_F ; 24
	const SPRITE_BUG_CATCHER ; 25
	const SPRITE_TWIN ; 26
	const SPRITE_YOUNGSTER ; 27
	const SPRITE_LASS ; 28
	const SPRITE_TEACHER ; 29
	const SPRITE_BUENA ; 2a
	const SPRITE_SUPER_NERD ; 2b
	const SPRITE_ROCKER ; 2c
	const SPRITE_POKEFAN_M ; 2d
	const SPRITE_POKEFAN_F ; 2e
	const SPRITE_GRAMPS ; 2f
	const SPRITE_GRANNY ; 30
	const SPRITE_SWIMMER_GUY ; 31
	const SPRITE_SWIMMER_GIRL ; 32
	const SPRITE_BIG_SNORLAX ; 33
	const SPRITE_SURFING_PIKACHU ; 34
	const SPRITE_ROCKET ; 35
	const SPRITE_ROCKET_GIRL ; 36
	const SPRITE_NURSE ; 37
	const SPRITE_LINK_RECEPTIONIST ; 38
	const SPRITE_CLERK ; 39
	const SPRITE_FISHER ; 3a
	const SPRITE_FISHING_GURU ; 3b
	const SPRITE_SCIENTIST ; 3c
	const SPRITE_KIMONO_GIRL ; 3d
	const SPRITE_SAGE ; 3e
	const SPRITE_UNUSED_GUY ; 3f
	const SPRITE_GENTLEMAN ; 40
	const SPRITE_BLACK_BELT ; 41
	const SPRITE_RECEPTIONIST ; 42
	const SPRITE_OFFICER_M ; 43
	const SPRITE_CAL ; 44
	const SPRITE_SLOWPOKE ; 45
	const SPRITE_CAPTAIN ; 46
	const SPRITE_BIG_LAPRAS ; 47
	const SPRITE_GYM_GUY ; 48
	const SPRITE_SAILOR ; 49
	const SPRITE_BIKER ; 4a
	const SPRITE_PHARMACIST ; 4b
	const SPRITE_MONSTER ; 4c
	const SPRITE_FAIRY ; 4d
	const SPRITE_BIRD ; 4e
	const SPRITE_DRAGON ; 4f
	const SPRITE_BIG_ONIX ; 50
	const SPRITE_N64 ; 51
	const SPRITE_SUDOWOODO ; 52
	const SPRITE_SURF ; 53
	const SPRITE_POKE_BALL ; 54
	const SPRITE_POKEDEX ; 55
	const SPRITE_PAPER ; 56
	const SPRITE_VIRTUAL_BOY ; 57
	const SPRITE_OLD_LINK_RECEPTIONIST ; 58
	const SPRITE_ROCK ; 59
	const SPRITE_BOULDER ; 5a
	const SPRITE_SNES ; 5b
	const SPRITE_FAMICOM ; 5c
	const SPRITE_FRUIT_TREE ; 5d
	const SPRITE_GOLD_TROPHY ; 5e
	const SPRITE_SILVER_TROPHY ; 5f
	const SPRITE_JADE ; 60
	const SPRITE_JADE_BIKE ; 61
	const SPRITE_UNUSED_62 ; 62
	const SPRITE_CAMERA_YOUNGSTER ; 66
	const SPRITE_CONE
	const SPRITE_PROFESSOR
	const SPRITE_OLD_AMBER
	const SPRITE_BOOK
	const SPRITE_BUSH
	const SPRITE_SWIMMER_GUY_LAND
	const SPRITE_SWIMMER_GIRL_LAND
	const SPRITE_PERRY_RUN
	const SPRITE_JADE_RUN
	const SPRITE_POSEY
	const SPRITE_CELESTE
	const SPRITE_ABBOT
	const SPRITE_FANGIRL
	const SPRITE_FOOD
	const SPRITE_CHEF
	const SPRITE_JOEL
	const SPRITE_REGAN
	const SPRITE_BREDE
	const SPRITE_AMBER
	const SPRITE_WILBUR
	const SPRITE_BOMB
	const SPRITE_TEACHER_SLEEPING
	const SPRITE_BUENA_SLEEPING
	const SPRITE_PERRY_SURF
	const SPRITE_JADE_SURF
	const SPRITE_SHADOW
	const SPRITE_OFFICER_F
	const SPRITE_BIG_AERODACTYL

; SpriteMons indexes (see data/sprites/sprite_mons.asm)
	const_def $80
SPRITE_POKEMON EQU const_value
	const SPRITE_UNOWN ; 80
	const SPRITE_GEODUDE ; 81
	const SPRITE_GROWLITHE ; 82
	const SPRITE_WEEDLE ; 83
	const SPRITE_SHELLDER ; 84
	const SPRITE_ODDISH ; 85
	const SPRITE_GENGAR ; 86
	const SPRITE_ZUBAT ; 87
	const SPRITE_MAGIKARP ; 88
	const SPRITE_SQUIRTLE ; 89
	const SPRITE_TOGEPI ; 8a
	const SPRITE_BUTTERFREE ; 8b
	const SPRITE_DIGLETT ; 8c
	const SPRITE_POLIWAG ; 8d
	const SPRITE_PIKACHU ; 8e
	const SPRITE_CLEFAIRY ; 8f
	const SPRITE_CHARMANDER ; 90
	const SPRITE_JYNX ; 91
	const SPRITE_STARMIE ; 92
	const SPRITE_BULBASAUR ; 93
	const SPRITE_JIGGLYPUFF ; 94
	const SPRITE_GRIMER ; 95
	const SPRITE_EKANS ; 96
	const SPRITE_PARAS ; 97
	const SPRITE_TENTACOOL ; 98
	const SPRITE_TAUROS ; 99
	const SPRITE_MACHOP ; 9a
	const SPRITE_VOLTORB ; 9b
	const SPRITE_LAPRAS ; 9c
	const SPRITE_RHYDON ; 9d
	const SPRITE_MOLTRES ; 9e
	const SPRITE_SNORLAX ; 9f
	const SPRITE_GYARADOS ; a0
	const SPRITE_LUGIA ; a1
	const SPRITE_HO_OH ; a2
	const SPRITE_OMANYTE
	const SPRITE_SHIFUR
	const SPRITE_EGG
	const SPRITE_MEWTWO
	const SPRITE_RAIKOU
	const SPRITE_ENTEI
	const SPRITE_SUICUNE
	const SPRITE_CELEBI

; special GetMonSprite values (see engine/overworld/overworld.asm)
	const_def $e0
	const SPRITE_DAY_CARE_MON_1 ; e0
	const SPRITE_DAY_CARE_MON_2 ; e1

; wVariableSprites indexes (see wram.asm)
	const_def $f0
SPRITE_VARS EQU const_value
	const SPRITE_CONSOLE ; f0
	const SPRITE_DOLL_1 ; f1
	const SPRITE_DOLL_2 ; f2
	const SPRITE_BIG_DOLL ; f3
	const SPRITE_WEIRD_TREE ; f4
	const SPRITE_OLIVINE_RIVAL ; f5
	const SPRITE_SUBSTITUTE_GUY ; f6
	const SPRITE_FUCHSIA_GYM_1 ; f7
	const SPRITE_VARIABLE_DAD ; f8
	const SPRITE_SUBWAY_BOSS ; f9
	const SPRITE_VARIABLE_MOM ; fa
	const SPRITE_HOF_CHAMPION ; fb
	const SPRITE_LEAGUE_PLAYER ; fc
