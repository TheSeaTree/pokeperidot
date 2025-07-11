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

RugosaCity_MapScripts:
	db 0 ; scene scripts

	db 3 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint
	callback MAPCALLBACK_TILES, .PowerPlant
	callback MAPCALLBACK_OBJECTS, .MoveOfficer

.FlyPoint:
	setflag ENGINE_FLYPOINT_RUGOSA
	return

.PowerPlant:
	checkevent EVENT_POWER_PLANT_1F_MUK
	iffalse .skip
	changeblock 6, 4, $ae
.skip
	return
	
.MoveOfficer:
	checkevent EVENT_MAHOGANY_OFFICER_WITHDRAW
	iffalse .skip2
	moveobject MAHOGANYTOWN_OFFICER1, 30, 8
.skip2
	return
	
PowerPlantDoorLeft:
	playsound SFX_ENTER_DOOR
	special FadeOutPalettes
	special FadeOutMusic
	waitsfx
	warpfacing UP, POWER_PLANT_1F, 5, 21
	end

PowerPlantDoorRight:
	playsound SFX_ENTER_DOOR
	special FadeOutPalettes
	special FadeOutMusic
	waitsfx
	warpfacing UP, POWER_PLANT_1F, 6, 21
	end
	
RugosaGymLeader:
	faceplayer
	opentext
	checkevent EVENT_EXPLAINED_POWER_PLANT
	iftrue .ExplainedPlant
	writetext RugosaGymLeaderIntroText
	waitbutton
	setevent EVENT_EXPLAINED_POWER_PLANT
	writetext RugosaGymLeaderAskText
	yesorno
	iffalse .No

.ExplainedPlant
	writetext RugosaGymLeaderAgree
	waitbutton
	closetext
	setevent EVENT_BACKUP_REQUESTED
	end
	
.No
	writetext RugosaGymLeaderComeBack
	yesorno
	iftrue .ExplainedPlant
	iffalse .No
	
RugosaGymEvent:
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
	scall RugosaGymEntrance
	iffalse .no
.warp
	warpfacing UP, RUGOSA_GYM, 12, 31
.no
	end	

.havebadge
	scall RugosaEnterGym
	jump .warp
	
RugosaGymEntrance:
	jumpstd gymdoor
	end
	
RugosaEnterGym:
	jumpstd entergym
	end

RugosaCityOfficerScript:
	faceplayer
	opentext
	checkevent EVENT_MAHOGANY_GRIMER
	iftrue .Opening
	checkevent EVENT_MAHOGANY_OFFICER_WITHDRAW
	iftrue .Waiting
	checkevent EVENT_BACKUP_REQUESTED
	iftrue .Backup
	writetext RugosaCityOfficerBeforeText
	waitbutton
	closetext
	turnobject LAST_TALKED, LEFT
	end
	
.Backup
	writetext RugosaCityOfficerBackupText
	waitbutton
	closetext
	turnobject MAHOGANYTOWN_OFFICER1, LEFT
	opentext
	writetext RugosaCityOfficerReturnText
	waitbutton
	closetext
	playsound SFX_BALL_POOF
	disappear MAHOGANYTOWN_RHYDON1
	waitsfx
	checkcode VAR_FACING
	ifequal UP, .FacingUp
	applymovement MAHOGANYTOWN_OFFICER1, RugosaOfficerFacingLeftMovement
	turnobject MAHOGANYTOWN_OFFICER1, UP
	setevent EVENT_MAHOGANY_OFFICER_WITHDRAW
	end

.FacingUp
	applymovement MAHOGANYTOWN_OFFICER1, RugosaOfficerFacingUpMovement
	end
	
.Waiting
	writetext RugosaCityOfficerWaitingText
	waitbutton
	closetext
	end
	
.Opening
	writetext RugosaCityOfficerOpeningText
	waitbutton
	closetext
	end
	
RugosaCityOfficer2Script:
	checkevent EVENT_BACKUP_REQUESTED
	iftrue .Backup
	jumptextfaceplayer RugosaCityOfficerBeforeText
	
.Backup
	faceplayer
	opentext
	writetext RugosaCityOfficer2Text
	waitbutton
	closetext
	turnobject LAST_TALKED, LEFT
	end

RugosaCityGrimerBattle:
	opentext
	writetext RugosaCityGrimerText
	cry GRIMER
	waitsfx
	closetext
	setlasttalked -1
	loadwildmon GRIMER, 35
	writecode VAR_BATTLETYPE, BATTLETYPE_FORCEITEM
	startbattle
	disappear MAHOGANYTOWN_GRIMER1
	disappear MAHOGANYTOWN_OFFICER1
	moveobject MAHOGANYTOWN_OFFICER1, 30, 8
	appear MAHOGANYTOWN_OFFICER1
	reloadmapafterbattle
	setevent EVENT_MAHOGANY_GRIMER
	applymovement MAHOGANYTOWN_OFFICER1, RugosaOfficerToPlayerMovement
	turnobject PLAYER, RIGHT
	opentext
	writetext RugosaCityOfficerOpeningText
	waitbutton
	writetext RugosaCityOfficerHealText
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

RugosaCityOfficersPokemon:
	opentext
	writetext RugosaCityRhydonText
	cry RHYDON
	waitsfx
	writetext RugosaCityOfficersPokemonText
	waitbutton
	closetext
	end

RugosaCityGrimer2Battle:
	opentext
	writetext RugosaCityGrimerText
	cry GRIMER
	waitsfx
	writetext RugosaCityGrimerInBattleText
	waitbutton
	closetext
	end
	
RugosaVendingMachine:
	opentext
	writetext RugosaVendingText
.Start:
	special PlaceMoneyTopRight
	loadmenu .MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .Magikarp
	ifequal 2, .Poliwag
	ifequal 3, .Staryu
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
	writetext RugosaClangTextMagikarpDoll
	buttonsound
	writetext SentMagikarpDollHome
	buttonsound
	closetext
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
	writetext RugosaClangTextPoliwagDoll
	buttonsound
	writetext SentPoliwagDollHome
	buttonsound
	closetext
	end

.Staryu:
	checkmoney YOUR_MONEY, 1200
	ifequal HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_STARMIE_DOLL
	iftrue .AlreadyHave
	takemoney YOUR_MONEY, 1200
	special PlaceMoneyTopRight
	setevent EVENT_DECO_STARMIE_DOLL
	pause 10
	playsound SFX_ENTER_DOOR
	writetext RugosaClangTextStaryuDoll
	buttonsound
	writetext SentStaryuDollHome
	buttonsound
	closetext
	end

.NotEnoughMoney:
	writetext RugosaVendingNoMoneyText
	waitbutton
	jump .Start
	
.AlreadyHave:
	writetext RugosaVendingAlreadyHaveText
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
	db "STARYU      ¥6000@"
	db "CANCEL@"

RugosaCityLass:
	jumptextfaceplayer RugosaCityLassText

RugosaCityYoungster:
	jumptextfaceplayer RugosaCityYoungsterText
	
RugosaCityFisher:
	jumptextfaceplayer RugosaCityFisherText
	
RugosaCityTwin:
	jumptextfaceplayer RugosaCityTwinText
	
RugosaCitySailor:
	jumptextfaceplayer RugosaCitySailorText
	
RugosaCityCooltrainerM:
	jumptextfaceplayer RugosaCityCooltrainerMText
	
RugosaMoveManagersHouse:
	jumptext MoveManagersHouseText
	
RugosaCitySign:
	jumptext RugosaCitySignText
	
RugosaDeptStoreSign:
	jumptext RugosaDeptStoreSignText
	
RugosaPowerPlantSign:
	jumptext RugosaPowerPlantSignText
	
RugosaCityPokecenterSign:
	jumpstd pokecentersign

RugosaCityCafeSign:
	jumptext RugosaCafeSignText

RugosaCityMetalPowder:
	itemball METAL_POWDER
	
RugosaCityFruitTree:
	fruittree FRUITTREE_MAHOGANY_TOWN
	
RugosaHiddenProtien:
	hiddenitem PROTEIN, EVENT_MAHOGANY_HIDDEN_PROTEIN

RugosaHiddenCarbos:
	hiddenitem CARBOS, EVENT_MAHOGANY_HIDDEN_CARBOS

RugosaHiddenHPUp:
	hiddenitem HP_UP, EVENT_MAHOGANY_HIDDEN_HP_UP

RugosaHiddenCalcium:
	hiddenitem CALCIUM, EVENT_MAHOGANY_HIDDEN_CALCIUM

RugosaHiddenIron:
	hiddenitem IRON, EVENT_MAHOGANY_HIDDEN_IRON

RugosaGymMovement:
	step UP
	step_resume
	
RugosaOfficerFacingLeftMovement:
	step DOWN
	step_resume
	
RugosaOfficerFacingUpMovement:
	step RIGHT
	turn_step LEFT
	step_resume
	
RugosaOfficerToPlayerMovement:
	step LEFT
	step_resume

RugosaGymLeaderIntroText:
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
	cont "they can barely"
	cont "deal with the"
	cont "wild GRIMER nest-"
	cont "ing there."
	
	para "Those #MON must"
	line "be mucking up the"
	cont "turbines."
	
	para "I even asked a"
	line "young trainer like"
	cont "you to assist, but"
	cont "he refused!"
	done
	
RugosaGymLeaderAskText:
	text "I know it's a lot"
	line "to ask, but could"
	cont "you go assist the"
	cont "OFFICERs?"
	done
	
RugosaGymLeaderComeBack:
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
	
RugosaGymLeaderAgree:
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

RugosaCityOfficerBeforeText:
	text "Everything's under"
	line "control here."
	
	para "Move along."
	done
	
RugosaCityOfficerBackupText:
	text "Are you the backup"
	line "JOEL was sending?"
	
	para "I can't hold back"
	line "the GRIMER, there's"
	cont "too many!"
	
	para "Give us a hand"
	line "here, will ya?"
	done
	
RugosaCityOfficerReturnText:
	text "RHYDON, Return!"
	done
	
RugosaCityOfficerWaitingText:
	text "What are you wait-"
	line "ing for?"
	
	para "The GRIMER is"
	line "right there!"
	done
	
RugosaCityOfficer2Text:
	text "Quick, my partner"
	line "needs help!"
	
	para "I have this GRIMER"
	line "under control!"
	done
	
RugosaCityGrimerText:
	text "GRIMER: Blblbl!"
	done
	
RugosaCityRhydonText:
	text "RHYDON: Gugooh!"
	done
	
RugosaCityGrimerInBattleText:
	text "This GRIMER is in"
	line "battle with the"
	cont "OFFICER's #MON."
	done
	
RugosaCityOfficersPokemonText:
	text "The OFFICER's"
	line "#MON is locked"
	cont "in battle with the"
	cont "GRIMER."
	done
	
RugosaCityOfficerOpeningText:
	text "You've made an"
	line "opening!"
	
	para "Quickly, make your"
	line "way to the POWER"
	cont "PLANT. We'll watch"
	cont "your back here."
	done
	
RugosaCityOfficerHealText:
	text "Let me heal your"
	line "#MON too."
	
	para "I have plenty of"
	line "POTIONs to share."
	done

RugosaVendingText:
	text "A vending machine!"
	line "It sells DOLLs."
	done

RugosaClangText:
	text "Clang!"

	para "@"
	text_from_ram wStringBuffer3
	text_start
	line "popped out."
	done
	
RugosaAnythingElseText:
	text "Anything else?"
	done
	
RugosaVendingNoMoneyText:
	text "Oops, not enough"
	line "money…"
	done

RugosaVendingAlreadyHaveText:
	text "You already have"
	line "that DOLL."
	done
	
RugosaClangTextMagikarpDoll:
	text "Clang!"

	para "The MAGIKARP DOLL"
	line "popped out."
	done
	
SentMagikarpDollHome:
	text "The MAGIKARP DOLL"
	line "was sent to"
	cont "<PLAYER>'s home."
	done
	
RugosaClangTextPoliwagDoll:
	text "Clang!"

	para "The POLIWAG DOLL"
	line "popped out."
	done
	
SentPoliwagDollHome:
	text "The POLIWAG DOLL"
	line "was sent to"
	cont "<PLAYER>'s home."
	done
	
RugosaClangTextStaryuDoll:
	text "Clang!"

	para "The STARYU DOLL"
	line "popped out."
	done
	
SentStaryuDollHome:
	text "The STARYU DOLL"
	line "was sent to"
	cont "<PLAYER>'s home."
	done
	
RugosaCityLassText:
	text "It is way too exp-"
	line "ensive to live in"
	cont "this city."
	
	para "I just visit from"
	line "STAGHORN TOWN to"
	cont "go shopping and"
	cont "get something to"
	cont "eat!"
	done
	
RugosaCityYoungsterText:
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
	
RugosaCityFisherText:
	text "Augh…"
	
	para "I definitely ate"
	line "too much. I feel"
	cont "sick…"
	
	para "But it was so"
	line "good…"
	done
	
RugosaCityTwinText:
	text "I want to collect"
	line "all the dolls!"
	
	para "I'll save up my"
	line "allowance for"
	cont "them!"
	done
	
RugosaCitySailorText:
	text "Hey! Don't you dare"
	line "touch my truck. I"
	cont "just paid it off!"
	
	para "If the paint job"
	line "gets scratched up,"
	cont "I will be livid!"
	done
	
RugosaCityCooltrainerMText:
	text "I paid a visit to"
	line "the MOVE MANIAC"
	cont "earlier today."
	
	para "I can't hope to"
	line "take on the #-"
	cont "MON LEAGUE without"
	cont "the best set of"
	cont "moves possible!"
	done
	
RugosaCitySignText:
	text "RUGOSA CITY"
	
	para "The shining beacon"
	line "of technology and"
	cont "industry!"
	done
	
RugosaDeptStoreSignText:
	text "RUGOSA DEPT.STORE"
	done
	
MoveManagersHouseText:
	text "MOVE MANAGERs'"
	line "house."
	done
	
RugosaPowerPlantSignText:
	text "RUGOSA CITY"
	line "POWER PLANT"
	done

RugosaCafeSignText:
	text "RUGOSA CAFé"
	done

RugosaCity_MapEvents:
	db 0, 0 ; filler

	db 11 ; warp events
	warp_event 27, 33, RUGOSA_GATE, 1
	warp_event 28, 33, RUGOSA_GATE, 2
	warp_event  6,  4, POWER_PLANT_1F_B, 1
	warp_event 31, 29, RUGOSA_POKECENTER_1F, 1
	warp_event 14, 21, RUGOSA_DEPT_STORE_1F, 1
	warp_event 35, 19, EMYS_HOUSE, 1
	warp_event 39,  9, MOVE_DELETERS_HOUSE, 1
	warp_event 15, 29, SUBSTITUTE_HOUSE, 1
	warp_event 25, 21, RUGOSA_APARTMENT_1F, 1
	warp_event 23, 29, RUGOSA_CAFE, 1
	warp_event  7,  4, POWER_PLANT_1F_B, 2

	db 2 ; coord events
	coord_event  6,  4, -1, PowerPlantDoorLeft
	coord_event  7,  4, -1, PowerPlantDoorRight

	db 13 ; bg events
	bg_event 28, 29, BGEVENT_UP, RugosaCitySign
	bg_event 15, 21, BGEVENT_UP, RugosaDeptStoreSign
	bg_event 28, 13, BGEVENT_UP, RugosaGymEvent
	bg_event  8,  5, BGEVENT_UP, RugosaPowerPlantSign
	bg_event 26, 29, BGEVENT_UP, RugosaVendingMachine
	bg_event 37,  9, BGEVENT_READ, RugosaMoveManagersHouse
	bg_event 32, 29, BGEVENT_READ, RugosaCityPokecenterSign
	bg_event 23, 16, BGEVENT_ITEM, RugosaHiddenProtien
	bg_event 27, 27, BGEVENT_ITEM, RugosaHiddenCarbos
	bg_event  8, 23, BGEVENT_ITEM, RugosaHiddenHPUp
	bg_event 33, 18, BGEVENT_ITEM, RugosaHiddenCalcium
	bg_event 18, 28, BGEVENT_ITEM, RugosaHiddenIron
	bg_event 24, 29, BGEVENT_READ, RugosaCityCafeSign

	db 15 ; object events
	object_event 28, 24, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 3, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RugosaCityLass, -1
	object_event 10, 31, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 2, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RugosaCityYoungster, -1
	object_event 23, 31, SPRITE_FISHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RugosaCityFisher, -1
	object_event 27, 30, SPRITE_TWIN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RugosaCityTwin, -1
	object_event 11, 19, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RugosaCitySailor, -1
	object_event 38, 22, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WANDER, 0, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RugosaCityCooltrainerM, -1
	object_event 28, 14, SPRITE_JOEL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RugosaGymLeader, EVENT_POWER_PLANT_1F_MUK
	object_event 29,  8, SPRITE_OFFICER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RugosaCityOfficerScript, EVENT_POWER_PLANT_1F_MUK
	object_event 28,  9, SPRITE_OFFICER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RugosaCityOfficer2Script, EVENT_POWER_PLANT_1F_MUK
	object_event 28,  8, SPRITE_MONSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, RugosaCityOfficersPokemon, EVENT_MAHOGANY_OFFICER_WITHDRAW
	object_event 27,  9, SPRITE_MONSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, RugosaCityOfficersPokemon, EVENT_POWER_PLANT_1F_MUK
	object_event 27,  8, SPRITE_GRIMER, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, RugosaCityGrimerBattle, EVENT_MAHOGANY_GRIMER
	object_event 26,  9, SPRITE_GRIMER, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, RugosaCityGrimer2Battle, EVENT_POWER_PLANT_1F_MUK
	object_event 21, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_ITEMBALL, 0, RugosaCityMetalPowder, EVENT_MAHOGANY_TOWN_METAL_POWDER
	object_event 26,  2, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RugosaCityFruitTree, -1
