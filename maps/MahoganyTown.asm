	const_def 2 ; object constants
	const MAHOGANYTOWN_LASS
	const MAHOGANYTOWN_YOUNGSTER
	const MAHOGANYTOWN_FISHER
	const MAHOGANYTOWN_TWIN
	const MAHOGANYTOWN_SAILOR
	const MAHOGANYTOWN_COOLTRAINER
	const MAHOGANYTOWN_JOEL
	const MAHOGANYTOWN_OFFICER1
	const MAHOGANYTOWN_OFFICER2
	const MAHOGANYTOWN_RHYDON1
	const MAHOGANYTOWN_RHYDON2
	const MAHOGANYTOWN_GRIMER1
	const MAHOGANYTOWN_GRIMER2
	const MAHOGANYTOWN_ITEMBALL
	const MAHOGANYTOWN_FRUIT_TREE

MahoganyTown_MapScripts:
	db 0 ; scene scripts

	db 3 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint
	callback MAPCALLBACK_TILES, .PowerPlant
	callback MAPCALLBACK_OBJECTS, .MoveOfficer

.FlyPoint:
	setflag ENGINE_FLYPOINT_MAHOGANY
	return

.PowerPlant:
	checkevent EVENT_POWER_PLANT_1F_MUK
	iffalse .skip
	changeblock 2, 2, $ae
.skip
	return
	
.MoveOfficer:
	checkevent EVENT_MAHOGANY_OFFICER_WITHDRAW
	iffalse .skip2
	moveobject MAHOGANYTOWN_OFFICER1, 26, 8
.skip2
	return
	
PowerPlantDoor:
	playsound SFX_ENTER_DOOR
	special FadeOutPalettes
	special FadeOutMusic
	waitsfx
	warpfacing UP, POWER_PLANT_1F, 5, 21
	end
	
MahoganyGymLeader:
	faceplayer
	opentext
	checkevent EVENT_EXPLAINED_POWER_PLANT
	iftrue .ExplainedPlant
	writetext MahoganyGymLeaderIntroText
	waitbutton
	setevent EVENT_EXPLAINED_POWER_PLANT
	writetext MahoganyGymLeaderAskText
	yesorno
	iffalse .No

.ExplainedPlant
	writetext MahoganyGymLeaderAgree
	waitbutton
	closetext
	setevent EVENT_BACKUP_REQUESTED
	end
	
.No
	writetext MahoganyGymLeaderComeBack
	yesorno
	iftrue .ExplainedPlant
	iffalse .No
	
MahoganyGymEvent:
	checkflag ENGINE_COGBADGE
	iftrue .havebadge
	clearevent EVENT_BEAT_SCIENTIST_ANDRE
	clearevent EVENT_BEAT_SCIENTIST_KURT
	clearevent EVENT_BEAT_SCIENTIST_DAVID
	clearevent EVENT_BEAT_SCIENTIST_SETH
	clearevent EVENT_MAHOGANY_GYM_SWITCH_1
	clearevent EVENT_MAHOGANY_GYM_SWITCH_2
	clearevent EVENT_MAHOGANY_GYM_SWITCH_3
	clearevent EVENT_MAHOGANY_GYM_SWITCH_4
	scall MahoganyGymEntrance
	iffalse .no
.warp
	warpfacing UP, MAHOGANY_GYM, 12, 31
.no
	end	

.havebadge
	scall MahoganyEnterGym
	jump .warp
	
MahoganyGymEntrance:
	jumpstd gymdoor
	end
	
MahoganyEnterGym:
	jumpstd entergym
	end

MahoganyTownOfficerScript:
	faceplayer
	opentext
	checkevent EVENT_MAHOGANY_GRIMER
	iftrue .Opening
	checkevent EVENT_MAHOGANY_OFFICER_WITHDRAW
	iftrue .Waiting
	checkevent EVENT_BACKUP_REQUESTED
	iftrue .Backup
	writetext MahoganyTownOfficerBeforeText
	waitbutton
	closetext
	turnobject LAST_TALKED, LEFT
	end
	
.Backup
	writetext MahoganyTownOfficerBackupText
	waitbutton
	closetext
	turnobject MAHOGANYTOWN_OFFICER1, LEFT
	opentext
	writetext MahoganyTownOfficerReturnText
	waitbutton
	closetext
	playsound SFX_BALL_POOF
	disappear MAHOGANYTOWN_RHYDON1
	waitsfx
	checkcode VAR_FACING
	ifequal UP, .FacingUp
	applymovement MAHOGANYTOWN_OFFICER1, MahoganyOfficerFacingLeftMovement
	turnobject MAHOGANYTOWN_OFFICER1, UP
	setevent EVENT_MAHOGANY_OFFICER_WITHDRAW
	end

.FacingUp
	applymovement MAHOGANYTOWN_OFFICER1, MahoganyOfficerFacingUpMovement
	end
	
.Waiting
	writetext MahoganyTownOfficerWaitingText
	waitbutton
	closetext
	
.Opening
	writetext MahoganyTownOfficerOpeningText
	waitbutton
	closetext
	end
	
MahoganyTownOfficer2Script:
	checkevent EVENT_BACKUP_REQUESTED
	iftrue .Backup
	jumptextfaceplayer MahoganyTownOfficerBeforeText
	
.Backup
	jumptext MahoganyTownOfficer2Text

MahoganyTownGrimerBattle:
	opentext
	writetext MahoganyTownGrimerText
	cry GRIMER
	waitbutton
	closetext
	setlasttalked -1
	loadwildmon GRIMER, 35
	writecode VAR_BATTLETYPE, BATTLETYPE_TRAP
	startbattle
	disappear MAHOGANYTOWN_GRIMER1
	disappear MAHOGANYTOWN_OFFICER1
	moveobject MAHOGANYTOWN_OFFICER1, 26, 8
	appear MAHOGANYTOWN_OFFICER1
	reloadmapafterbattle
	setevent EVENT_MAHOGANY_GRIMER
;	moveobject MAHOGANYTOWN_OFFICER1, 26, 8
	applymovement MAHOGANYTOWN_OFFICER1, MahoganyOfficerToPlayerMovement
	turnobject PLAYER, RIGHT
	opentext
	writetext MahoganyTownOfficerOpeningText
	waitbutton
	writetext MahoganyTownOfficerHealText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	special StubbedTrainerRankings_Healings
	playsound SFX_FULL_HEAL
	special HealParty
	waitsfx
	special FadeInQuickly
	end

MahoganyTownOfficersPokemon:
	opentext
	writetext MahoganyTownRhydonText
	cry RHYDON
	waitbutton
	writetext MahoganyTownOfficersPokemon
	waitbutton
	closetext
	end

MahoganyTownGrimer2Battle:
	opentext
	writetext MahoganyTownGrimerText
	cry GRIMER
	waitbutton
	writetext MahoganyTownGrimerInBattleText
	waitbutton
	closetext
	end
	
MahoganyVendingMachine:
	opentext
	writetext MahoganyVendingText
.Start:
	special PlaceMoneyTopRight
	loadmenu .MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .Magikarp
	ifequal 2, .Poliwag
	ifequal 3, .Starmie
	closetext
	end
	
.Magikarp:
	checkmoney YOUR_MONEY, 700
	ifequal HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_MAGIKARP_DOLL
	iftrue .AlreadyHave
	takemoney YOUR_MONEY, 700
	special PlaceMoneyTopRight
	setevent EVENT_DECO_MAGIKARP_DOLL
	pause 10
	playsound SFX_ENTER_DOOR
	writetext MahoganyClangTextMagikarpDoll
	special PlaceMoneyTopRight
	buttonsound
	writetext SentMagikarpDollHome
	buttonsound
	end
	
.Poliwag:
	checkmoney YOUR_MONEY, 1200
	ifequal HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_POLIWAG_DOLL
	iftrue .AlreadyHave
	takemoney YOUR_MONEY, 1200
	special PlaceMoneyTopRight
	setevent EVENT_DECO_POLIWAG_DOLL
	pause 10
	playsound SFX_ENTER_DOOR
	writetext MahoganyClangTextPoliwagDoll
	special PlaceMoneyTopRight
	buttonsound
	writetext SentPoliwagDollHome
	buttonsound
	end

.Starmie:
	checkmoney YOUR_MONEY, 1200
	ifequal HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_STARMIE_DOLL
	iftrue .AlreadyHave
	takemoney YOUR_MONEY, 1200
	special PlaceMoneyTopRight
	setevent EVENT_DECO_STARMIE_DOLL
	pause 10
	playsound SFX_ENTER_DOOR
	writetext MahoganyClangTextStarmieDoll
	special PlaceMoneyTopRight
	buttonsound
	writetext SentStarmieDollHome
	buttonsound
	end

.NotEnoughMoney:
	writetext MahoganyVendingNoMoneyText
	waitbutton
	jump .Start
	
.AlreadyHave:
	writetext MahoganyVendingAlreadyHaveText
	waitbutton
	jump .Start

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "MAGIKARP    ¥4500@"
	db "POLIWAG     ¥5000@"
	db "STARMIE     ¥6000@"
	db "CANCEL@"

MahoganyTownLass:
	jumptextfaceplayer MahoganyTownLassText

MahoganyTownYoungster:
	jumptextfaceplayer MahoganyTownYoungsterText
	
MahoganyTownFisher:
	jumptextfaceplayer MahoganyTownFisherText
	
MahoganyTownTwin:
	jumptextfaceplayer MahoganyTownTwinText
	
MahoganyTownSailor:
	jumptextfaceplayer MahoganyTownSailorText
	
MahoganyTownCooltrainerM:
	jumptextfaceplayer MahoganyTownCooltrainerMText
	
MahoganyMoveManagersHouse:
	jumptext MoveManagersHouseText
	
MahoganyTownSign:
	jumptext MahoganyTownSignText
	
MahoganyDeptStoreSign:
	jumptext MahoganyDeptStoreSignText
	
MahoganyPowerPlantSign:
	jumptext MahoganyPowerPlantSignText
	
MahoganyTownMetalPowder:
	itemball METAL_POWDER
	
MahoganyTownFruitTree:
	fruittree FRUITTREE_MAHOGANY_TOWN
	
MahoganyHiddenProtien:
	hiddenitem PROTEIN, EVENT_MAHOGANY_HIDDEN_PROTEIN

MahoganyHiddenCarbos:
	hiddenitem CARBOS, EVENT_MAHOGANY_HIDDEN_CARBOS

MahoganyHiddenHPUp:
	hiddenitem HP_UP, EVENT_MAHOGANY_HIDDEN_HP_UP

MahoganyHiddenCalcium:
	hiddenitem CALCIUM, EVENT_MAHOGANY_HIDDEN_CALCIUM

MahoganyHiddenIron:
	hiddenitem IRON, EVENT_MAHOGANY_HIDDEN_IRON

MahoganyGymMovement:
	step UP
	step_resume
	
MahoganyOfficerFacingLeftMovement:
	step DOWN
	step_resume
	
MahoganyOfficerFacingUpMovement:
	step RIGHT
	turn_step LEFT
	step_resume
	
MahoganyOfficerToPlayerMovement:
	step LEFT
	step_resume

MahoganyGymLeaderIntroText:
	text "JOEL: Sorry, kid."
	
	para "If you're here for" 
	line "a GYM challenge,"
	cont "you're going to be"
	cont "disappointed."

	para "Something is wrong"
	line "with the POWER"
	cont "PLANT. It's not"
	cont "producing enough"
	cont "electricity to run"
	cont "the GYM."
	
	para "Without power, I"
	line "can't accept any"
	cont "challenges."

	para "I sent a crew to"
	line "check it out, but"
	cont "they can can"
	cont "barely deal with"
	cont "the wild GRIMER"
	cont "nesting there."
	
	para "Those #MON must"
	line "be mucking up the"
	cont "turbines."
	
	para "I even asked a"
	line "young trainer like"
	cont "you to assist, but"
	cont "he refused!"
	done
	
MahoganyGymLeaderAskText:
	text "I know it's a lot"
	line "to ask, but could"
	cont "you go assist the"
	cont "OFFICERs?"
	done
	
MahoganyGymLeaderComeBack:
	text "What do you mean"
	line "you won't do it?"
	
	para "I know it's a lot"
	line "to ask, but I need"
	cont "to stay here and"
	cont "keep an eye on the"
	cont "GYM."
	
	para "Help a guy out,"
	line "here? Please?"
	done
	
MahoganyGymLeaderAgree:
	text "You can find a"
	line "path to the POWER"
	cont "PLANT behind this"
	cont "GYM."
	
	para "I would help out"
	line "myself, but I need"
	cont "to stay here and"
	cont "let challengers"
	cont "know I am not"
	cont "accepting challen-"
	cont "gers right now."
	done
	
MahoganyTownOfficerBeforeText:
	text "Everything's under"
	line "control here."
	
	para "Move along."
	done
	
MahoganyTownOfficerBackupText:
	text "Are you the backup"
	line "JOEL was sending?"
	
	para "I can't hold back"
	line "the GRIMER, there's"
	cont "too many!"
	
	para "Give us a hand"
	line "here, will ya?"
	done
	
MahoganyTownOfficerReturnText:
	text "RHYDON, Return!"
	done
	
MahoganyTownOfficerWaitingText:
	text "What are you wait-"
	line "ing for?"
	
	para "The GRIMER is"
	line "right there!"
	done
	
MahoganyTownOfficer2Text:
	text "Quick, my partner"
	line "needs help!"
	
	para "I have this GRIMER"
	line "under control!"
	done
	
MahoganyTownGrimerText:
	text "GRIMER: Blblbl!"
	done
	
MahoganyTownRhydonText:
	text "RHYDON: Gugooh!"
	done
	
MahoganyTownGrimerInBattleText:
	text "This GRIMER is in"
	line "battle with the"
	cont "OFFICER's #MON."
	done
	
MahoganyTownOfficersPokemonText:
	text "The OFFICER's"
	line "#MON is locked"
	cont "in battle with the"
	cont "GRIMER."
	done
	
MahoganyTownOfficerOpeningText:
	text "You've made an"
	line "opening!"
	
	para "Quickly, make your"
	line "way to the POWER"
	cont "PLANT. We'll watch"
	cont "your back here."
	done
	
MahoganyTownOfficerHealText:
	text "Let me heal your"
	line "#MON too."
	
	para "I have plenty of"
	line "POTIONs to share."
	done

MahoganyVendingText:
	text "A vending machine!"
	line "It sells DOLLs."
	done

MahoganyClangText:
	text "Clang!"

	para "@"
	text_from_ram wStringBuffer3
	text_start
	line "popped out."
	done
	
MahoganyAnythingElseText:
	text "Anything else?"
	done
	
MahoganyVendingNoMoneyText:
	text "Oops, not enough"
	line "money…"
	done

MahoganyVendingAlreadyHaveText:
	text "You already have"
	line "that DOLL."
	done
	
MahoganyClangTextMagikarpDoll:
	text "Clang!"

	para "The MAGIKARP DOLL"
	line "popped out."
	done
	
SentMagikarpDollHome:
	text "The MAGIKARP DOLL"
	line "was sent to"
	cont "<PLAYER>'s home."
	done
	
MahoganyClangTextPoliwagDoll:
	text "Clang!"

	para "The POLIWAG DOLL"
	line "popped out."
	done
	
SentPoliwagDollHome:
	text "The POLIWAG DOLL"
	line "was sent to"
	cont "<PLAYER>'s home."
	done
	
MahoganyClangTextStarmieDoll:
	text "Clang!"

	para "The STARMIE DOLL"
	line "popped out."
	done
	
SentStarmieDollHome:
	text "The STARMIE DOLL"
	line "was sent to"
	cont "<PLAYER>'s home."
	done
	
MahoganyTownLassText:
	text "It is way too exp-"
	line "ensive to live in"
	cont "this city."
	
	para "I just visit from"
	line "STAGHORN TOWN to"
	cont "go shopping and"
	cont "get something to"
	cont "eat!"
	done
	
MahoganyTownYoungsterText:
	text "Did you know that"
	line "#MON were alive"
	cont "even before people"
	cont "existed?"
	
	para "I'm not kidding!"
	line "Sometimes scient-"
	cont "ists even find old"
	cont "FOSSILs of those"
	cont "#MON."
	
	para "Wouldn't it be wild"
	line "if those #MON"
	cont "could be brought"
	cont "back to life?"
	done
	
MahoganyTownFisherText:
	text "Augh…"
	
	para "I definitely ate"
	line "too much. I feel"
	cont "sick…"
	
	para "But it was so"
	line "good…"
	done
	
MahoganyTownTwinText:
	text "I want to collect"
	line "all the dolls!"
	
	para "I'll save up my"
	line "allowance for"
	cont "them!"
	done
	
MahoganyTownSailorText:
	text "Hey! Don't you dare"
	line "touch my truck. I"
	cont "just paid it off!"
	
	para "If the paint job"
	line "gets scratched up,"
	cont "I will be livid!"
	done
	
MahoganyTownCooltrainerMText:
	text "I paid a visit to"
	line "the MOVE REMINDER"
	cont "earlier."
	
	para "I can't hope to"
	line "take on the #-"
	cont "MON LEAGUE without"
	cont "the best moveset"
	cont "possible!"
	done
	
MahoganyTownSignText:
	text "RUGOSA CITY"
	
	para "The shining beacon"
	line "of technology and"
	cont "industry!"
	done
	
MahoganyDeptStoreSignText:
	text "RUGOSA DEPT.STORE"
	done
	
MoveManagersHouseText:
	text "MOVE MANAGERs'"
	line "house."
	done
	
MahoganyPowerPlantSignText:
	text "POWER PLANT"
	done

MahoganyTown_MapEvents:
	db 0, 0 ; filler

	db 10 ; warp events
	warp_event 23, 33, MAHOGANY_GATE, 1
	warp_event 24, 33, MAHOGANY_GATE, 2
	warp_event  2,  3, POWER_PLANT_1F_B, 1
	warp_event 27, 29, MAHOGANY_POKECENTER_1F, 1
	warp_event 10, 21, MAHOGANY_DEPT_STORE_1F, 1
	warp_event 31, 19, EMYS_HOUSE, 1
	warp_event 35,  9, MOVE_DELETERS_HOUSE, 1
	warp_event 11, 29, SUBSTITUTE_HOUSE, 1
	warp_event 21, 21, MAHOGANY_APARTMENT_1F, 1
	warp_event 19, 29, MAHOGANY_CAFE, 1

	db 1 ; coord events
	coord_event  2,  3, -1, PowerPlantDoor

	db 11 ; bg events
	bg_event 24, 29, BGEVENT_UP, MahoganyTownSign
	bg_event 11, 21, BGEVENT_UP, MahoganyDeptStoreSign
	bg_event 24, 13, BGEVENT_UP, MahoganyGymEvent
	bg_event 33,  9, BGEVENT_UP, MahoganyMoveManagersHouse
	bg_event  4,  5, BGEVENT_UP, MahoganyPowerPlantSign
	bg_event 22, 29, BGEVENT_UP, MahoganyVendingMachine
	bg_event 19, 16, BGEVENT_ITEM, MahoganyHiddenProtien
	bg_event 23, 27, BGEVENT_ITEM, MahoganyHiddenCarbos
	bg_event  4, 23, BGEVENT_ITEM, MahoganyHiddenHPUp
	bg_event 29, 18, BGEVENT_ITEM, MahoganyHiddenCalcium
	bg_event 14, 28, BGEVENT_ITEM, MahoganyHiddenIron

	db 15 ; object events
	object_event 24, 24, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 3, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyTownLass, -1
	object_event  6, 31, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 2, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, MahoganyTownYoungster, -1
	object_event 19, 31, SPRITE_FISHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MahoganyTownFisher, -1
	object_event 23, 30, SPRITE_TWIN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, MahoganyTownTwin, -1
	object_event  7, 19, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MahoganyTownSailor, -1
	object_event 34, 22, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WANDER, 0, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyTownCooltrainerM, -1
	object_event 24, 14, SPRITE_JOEL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MahoganyGymLeader, EVENT_POWER_PLANT_1F_MUK
	object_event 25,  8, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MahoganyTownOfficerScript, EVENT_POWER_PLANT_1F_MUK
	object_event 24,  9, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MahoganyTownOfficer2Script, EVENT_POWER_PLANT_1F_MUK
	object_event 24,  8, SPRITE_MONSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, MahoganyTownOfficersPokemon, EVENT_MAHOGANY_OFFICER_WITHDRAW
	object_event 23,  9, SPRITE_MONSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, MahoganyTownOfficersPokemon, EVENT_POWER_PLANT_1F_MUK
	object_event 23,  8, SPRITE_GRIMER, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, MahoganyTownGrimerBattle, EVENT_MAHOGANY_GRIMER
	object_event 22,  9, SPRITE_GRIMER, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, MahoganyTownGrimer2Battle, EVENT_POWER_PLANT_1F_MUK
	object_event 17, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_ITEMBALL, 0, MahoganyTownMetalPowder, EVENT_MAHOGANY_TOWN_METAL_POWDER
	object_event 22,  2, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyTownFruitTree, -1
