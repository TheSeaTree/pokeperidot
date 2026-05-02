	const_def 2 ; object constants
	const PVPROOM_BATTLE_RECEPTIONIST

PVPRoom_MapScripts:
	db 2 ; scene scripts
	scene_script .Scene0 ; SCENE_DEFAULT
	scene_script .Scene2 ; SCENE_POKECENTER2F_LEAVE_COLOSSEUM

	db 0 ; callbacks

.Scene0:
	checkcode VAR_PARTYCOUNT
	ifnotequal 0, .Nothing
	givepoke PORYGON, 5
	giveitem TM_CALM_MIND
	giveitem TM_BULK_UP
	giveitem TM_HIDDEN_POWER
	giveitem TM_ROAR
	giveitem TM_TOXIC
	giveitem TM_SUBMISSION
	giveitem TM_HEADBUTT
	giveitem TM_CURSE
	giveitem TM_FIRE_PUNCH
	giveitem TM_FLAMETHROWER
	giveitem TM_FIRE_BLAST
	giveitem TM_ICE_PUNCH
	giveitem TM_ICE_BEAM
	giveitem TM_BLIZZARD
	giveitem TM_THUNDERPUNCH
	giveitem TM_THUNDERBOLT
	giveitem TM_THUNDER
	giveitem TM_HURRICANE
	giveitem TM_WATERFALL
	giveitem TM_HYPER_BEAM
	giveitem TM_THUNDER_WAVE
	giveitem TM_LEECH_LIFE
	giveitem TM_DIG
	giveitem TM_STRENGTH
	giveitem TM_RETURN
	giveitem TM_REFLECT
	giveitem TM_LIGHT_SCREEN
	giveitem TM_SAFEGUARD
	giveitem TM_PROTECT
	giveitem TM_ENDURE
	giveitem TM_PSYCHIC_M
	giveitem TM_CRUNCH
	giveitem TM_SHADOW_BALL
	giveitem TM_DRAGONBREATH
	giveitem TM_TELEPORT
	giveitem TM_PSYCH_UP
	giveitem TM_SLUDGE_BOMB
	giveitem TM_ROCK_SMASH
	giveitem TM_FLY
	giveitem TM_ROCK_SLIDE
	giveitem TM_EARTHQUAKE
	giveitem TM_IRON_HEAD
	giveitem TM_CUT
	giveitem TM_THIEF
	giveitem TM_WHIRLPOOL
	giveitem TM_SWAGGER
	giveitem TM_NASTY_PLOT
	giveitem TM_SUBSTITUTE
	giveitem TM_REST
	giveitem TM_SLEEP_TALK
	giveitem TM_ATTRACT
	giveitem TM_DOUBLE_TEAM
	giveitem TM_SUNNY_DAY
	giveitem TM_RAIN_DANCE
	giveitem TM_SANDSTORM
	giveitem TM_SOLARBEAM
	giveitem TM_GIGA_DRAIN
	giveitem TM_DRAGON_DANCE
	giveitem TM_SWORDS_DANCE
	giveitem TM_BULLDOZE
	giveitem TM_PLAY_ROUGH
	giveitem HM_SURF
.Nothing
	end

.Scene2:
	priorityjump Script_LeftCableColosseum
	end

Arena_EggTutor:
	faceplayer
	opentext
	special SpecialEggTutor
	waitbutton
	closetext
	end

Arena_Reminder:
	faceplayer
	opentext
	special SimulationMoveRelearner
	waitbutton
	closetext
	end

Arena_MoveTutor1:
	faceplayer
	opentext
	writetext Arena_TutorIntroText
	loadmenu .MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .SweetKiss
	ifequal 2, .LovelyKiss
	ifequal 3, .DrainKiss
	ifequal 4, .DrainPunch
	jump Arena_MoveTutorRefused

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 15, 9
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "SWEET KISS@"
	db "LOVELY KISS@"
	db "DRAIN KISS@"
	db "DRAIN PUNCH@"

.SweetKiss	
	writebyte SWEET_KISS
	jump Arena_MoveTutorCommon

.LovelyKiss	
	writebyte LOVELY_KISS
	jump Arena_MoveTutorCommon
	
.DrainKiss	
	writebyte DRAIN_KISS
	jump Arena_MoveTutorCommon
	
.DrainPunch	
	writebyte DRAIN_PUNCH
	jump Arena_MoveTutorCommon

Arena_MoveTutor2:
	faceplayer
	opentext
	writetext Arena_TutorIntroText
	loadmenu .MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .BodySlam
	ifequal 2, .HealBell
	ifequal 3, .Growth
	ifequal 4, .Bubblebeam
	jump Arena_MoveTutorRefused

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 15, 9
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "BODY SLAM@"
	db "HEAL BELL@"
	db "GROWTH@"
	db "BUBBLEBEAM@"

.BodySlam	
	writebyte BODY_SLAM
	jump Arena_MoveTutorCommon

.HealBell
	writebyte HEAL_BELL
	jump Arena_MoveTutorCommon
	
.Growth	
	writebyte GROWTH
	jump Arena_MoveTutorCommon
	
.Bubblebeam
	writebyte BUBBLEBEAM
	jump Arena_MoveTutorCommon

Arena_MoveTutor3:
	faceplayer
	opentext
	writetext Arena_TutorIntroText
	loadmenu .MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .IcyWind
	ifequal 2, .Nightmare
	ifequal 3, .DreamEater
	ifequal 4, .RunicPower
	jump Arena_MoveTutorRefused

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 15, 9
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "ICY WIND@"
	db "NIGHTMARE@"
	db "DREAM EATER@"
	db "RUNIC POWER@"

.IcyWind	
	writebyte ICY_WIND
	jump Arena_MoveTutorCommon

.Nightmare
	writebyte NIGHTMARE
	jump Arena_MoveTutorCommon
	
.DreamEater	
	writebyte DREAM_EATER
	jump Arena_MoveTutorCommon
	
.RunicPower	
	writebyte RUNIC_POWER

Arena_MoveTutorCommon:
	writetext Arena_TutorWhichOneText
	waitbutton
	special MoveTutor
	ifnotequal $0, Arena_MoveTutorRefused
Arena_MoveTutorAfter:
	writetext Arena_TutorAfterText
	waitbutton
	closetext
	end

Arena_MoveTutorRefused:
	writetext Arena_TutorDeclineText
	waitbutton
	closetext
	end

Arena_MoveDeleter:
	faceplayer
	opentext
	special MoveDeletion
	waitbutton
	closetext
	end

Arena_TutorIntroText:
	text "I'm a MOVE TUTOR."

	para "Please select a"
	line "move to learn."
	done

Arena_TutorWhichOneText:
	text "Which #MON am I"
	line "tutoring?"
	done

Arena_TutorAfterText:
	text "I can teach your"
	line "#MON more moves"
	cont "any time you want."
	done

Arena_TutorDeclineText:
	text "Some other time,"
	line "then?"
	done

PVPRoom_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  5,  0, COLOSSEUM, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event  7,  3, BGEVENT_READ, Pokecenter2FLinkRecordSign

	db 7 ; object events
	object_event  5,  2, SPRITE_LINK_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, LinkReceptionistScript_Battle, -1
	object_event  0,  1, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, Arena_EggTutor, -1
	object_event  1,  1, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Arena_Reminder, -1
	object_event  9,  1, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Arena_MoveTutor1, -1
	object_event  8,  1, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Arena_MoveTutor2, -1
	object_event 10,  1, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Arena_MoveTutor3, -1
	object_event  0,  7, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Arena_MoveDeleter, -1
