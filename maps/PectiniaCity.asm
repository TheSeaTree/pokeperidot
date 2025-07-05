	const_def 2 ; object constants
	const PECTINIACITY_TEACHER1
	const PECTINIACITY_YOUNGSTER1
	const PECTINIACITY_GROWLITHE1
	const PECTINIACITY_POKEFAN_M
	const PECTINIACITY_GROWLITHE2
	const PECTINIACITY_ROCKER
	const PECTINIACITY_GROWLITHE3
	const PECTINIACITY_YOUNGSTER2
	const PECTINIACITY_SILVER
	const PECTINIACITY_TEACHER2
	const PECTINIACITY_GYM_GUY
	const PECTINIACITY_YOUNGSTER3
	const PECTINIACITY_FRUIT_TREE
	const PECTINIACITY_BURGLAR
	const PECTINIACITY_GENTLEMAN
	const PECTINIACITY_FANGIRL

PectiniaCity_MapScripts:
	db 3 ; scene scripts
	scene_script .DummyScene0 ; SCENE_PECTINIACITY_NOTHING
	scene_script .DummyScene1 ; SCENE_PECTINIACITY_DEFEATED_RIVAL
	scene_script .DummyScene2 ; SCENE_PECTINIACITY_KURT_RETURNS_GS_BALL

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .Flypoint

.DummyScene0:
	end

.DummyScene1:
	end

.DummyScene2:
	end

.Flypoint:
	setflag ENGINE_FLYPOINT_PECTINIA
	return
	
PectiniaCityRivalBattleScene1:
	moveobject PECTINIACITY_SILVER, 36, 13
	opentext
	writetext PectiniaCityRivalWait
	waitbutton
	closetext
	turnobject PLAYER, LEFT
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 15
	appear PECTINIACITY_SILVER
	applymovement PECTINIACITY_SILVER, PectiniaCityRivalBattleApproachMovement1

PectiniaCityRivalBattleScript:
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext PectiniaCityRivalBeforeText
	waitbutton
	closetext
	setevent EVENT_BEAT_RIVAL_1
	checkevent EVENT_GOT_SQUIRTLE_FROM_MAPLE
	iftrue .Totodile
	checkevent EVENT_GOT_BULBASAUR_FROM_MAPLE
	iftrue .Chikorita
	winlosstext PectiniaCityRivalWinText, PectiniaCityRivalLossText
	setlasttalked PECTINIACITY_SILVER
	loadtrainer RIVAL1, RIVAL1_1_TOTODILE
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .AfterBattle

.Totodile:
	winlosstext PectiniaCityRivalWinText, PectiniaCityRivalLossText
	setlasttalked PECTINIACITY_SILVER
	loadtrainer RIVAL1, RIVAL1_1_CHIKORITA
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .AfterBattle

.Chikorita:
	winlosstext PectiniaCityRivalWinText, PectiniaCityRivalLossText
	setlasttalked PECTINIACITY_SILVER
	loadtrainer RIVAL1, RIVAL1_1_CYNDAQUIL
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .AfterBattle

.AfterBattle:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext PectiniaCityRivalAfterText
	waitbutton
	closetext
	applymovement PECTINIACITY_SILVER, PectiniaCityRivalBattleExitMovement
	disappear PECTINIACITY_SILVER
	waitsfx
	setevent EVENT_BEAT_RIVAL_1
	setscene SCENE_PECTINIACITY_DEFEATED_RIVAL
	playsound SFX_EXIT_BUILDING
	moveobject PECTINIACITY_FANGIRL, 40, 17
	appear PECTINIACITY_FANGIRL
	applymovement PLAYER, PectiniaPlayerStepRight
	applymovement PECTINIACITY_FANGIRL, PectiniaFangirlStepDown
	playmusic MUSIC_MYSTICALMAN_ENCOUNTER
	opentext
	writetext PectiniaFangirlIntroductionText
	waitbutton
.RivalNameLoop
	special NameRival
	writetext PectiniaFangirlConfirmRivalName
	yesorno
	iffalse .RivalNameLoop
	writetext PectiniaFangirlLeaveText
	waitbutton
	closetext
	applymovement PECTINIACITY_FANGIRL, PectiniaFangirlLeave
	disappear PECTINIACITY_FANGIRL
	playmapmusic
	setmapscene RIDGE_VILLAGE, SCENE_RIDGEVILLAGE_DEFEATED_RIVAL
	end
	
PectiniaGymConfirm:
	faceplayer
	opentext
	writetext PectiniaGymFirstTimeText
	waitbutton
	closetext
	applymovement PECTINIACITY_GYM_GUY, PectiniaGymMovement
	playsound SFX_ENTER_DOOR
	disappear PECTINIACITY_GYM_GUY
	setevent EVENT_GYM_EXPLAINATION
	setmapscene RIDGE_GYM, SCENE_FINISHED
	end	
	
PectiniaBurglar:
	faceplayer
	opentext
	checkevent EVENT_AZALEA_BIKE_THIEF
	iffalse .GetLost
	writetext PectiniaBurglarText
	waitbutton
	playmusic MUSIC_POKEMANIAC_ENCOUNTER
	writetext PectiniaBurglarChallengeText
	waitbutton
	closetext
	winlosstext PectiniaBurglarWinText, 0
	loadtrainer BURGLAR, LAMAAR
	startbattle
	reloadmapafterbattle
	jump .AfterBattle
	
.GetLost
	writetext PectiniaBurglarGetLost
	waitbutton
	closetext
	end
	
.AfterBattle
	opentext
	writetext PectiniaBurglarAfterText
	waitbutton
	verbosegiveitem BICYCLE
	closetext
	checkcode VAR_FACING
	ifequal DOWN, .FacingDown
	applymovement PECTINIACITY_BURGLAR, BurglarExitLeft
.Leave
	disappear PECTINIACITY_BURGLAR
	setevent EVENT_AZALEA_RETURNED_BIKE
	end
	
.FacingDown
	applymovement PECTINIACITY_BURGLAR, BurglarExitLeft2
	jump .Leave

PectiniaGymEvent:
	checkflag ENGINE_FISTBADGE
	iftrue .havebadge
	clearevent EVENT_BEAT_OFFICER_BILLY
	clearevent EVENT_BEAT_OFFICER_JIMMY
	clearevent EVENT_BEAT_OFFICER_GORDON
	scall PectiniaGymEntrance
	iffalse .no
.warp
	warpfacing UP, PECTINIA_GYM,  8, 17
.no
	end	

.havebadge
	scall PectiniaEnterGym
	jump .warp

PectiniaGymEntrance:
	jumpstd gymdoor
	end
	
PectiniaEnterGym:
	jumpstd entergym
	end

PectiniaCityGrowlitheScript:
	opentext
	writetext PectiniaCityGrowlitheText
	cry GROWLITHE
	waitbutton
	closetext
	end
	
PectiniaCityHoundourScript:
	opentext
	writetext PectiniaCityHoundourText
	cry HOUNDOUR
	waitbutton
	closetext
	end

PectiniaCityTeacherScript:
	jumptextfaceplayer PectiniaCityTeacherText

PectiniaCityTeacher2Script:
	jumptextfaceplayer PectiniaCityTeacher2Text
	
PectiniaCityYoungsterScript:
	jumptextfaceplayer PectiniaCityYoungsterText

PectiniaCityYoungster2Script:
	jumptextfaceplayer PectiniaCityYoungster2Text
	
PectiniaCityYoungster3Script:
	jumptextfaceplayer PectiniaCityYoungster3Text
	
PectiniaCityPokefanMScript:
	jumptextfaceplayer PectiniaCityPokefanMText

PectiniaCityRockerScript:
	jumptextfaceplayer PectiniaCityRockerText
	
PectiniaTrainBlock:
	jumptextfaceplayer PectiniaCityGentlemanText

PectiniaCitySign:
	jumptext PectiniaCitySignText

PectiniaApartmentsSign:
	jumptext PectiniaApartmentsSignText

PectiniaSquareSign:
	jumptext PectiniaSquareSignText
	
PectiniaTrainStationSign:
	jumptext PectiniaTrainStationSignText

PectiniaCityPokecenterSign:
	jumpstd pokecentersign

PectiniaCityMartSign:
	jumpstd martsign
	
PectiniaCityRepel:
	itemball REPEL

PectiniaCityHiddenFullHeal:
	hiddenitem FULL_HEAL, EVENT_AZALEA_TOWN_HIDDEN_FULL_HEAL
	
PectiniaCityHiddenGreatBall:
	hiddenitem GREAT_BALL, EVENT_AZALEA_TOWN_HIDDEN_GREAT_BALL
	
PectiniaCityHiddenEther:
	hiddenitem ETHER, EVENT_AZALEA_TOWN_HIDDEN_ETHER
	
PectiniaCityVendingMachine:
	opentext
	writetext PectiniaVendingText
.Start:
	special PlaceMoneyTopRight
	loadmenu .MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .FreshWater
	ifequal 2, .PokeDoll
	ifequal 3, .NES
	closetext
	end

.FreshWater:
	checkmoney YOUR_MONEY, 350
	ifequal HAVE_LESS, .NotEnoughMoney
	giveitem FRESH_WATER
	iffalse .NotEnoughSpace
	takemoney YOUR_MONEY, 350
	itemtotext FRESH_WATER, MEM_BUFFER_0
	jump .VendItem
	
.PokeDoll:
	checkmoney YOUR_MONEY, 1000
	ifequal HAVE_LESS, .NotEnoughMoney
	giveitem POKE_DOLL
	iffalse .NotEnoughSpace
	takemoney YOUR_MONEY, 1000
	itemtotext POKE_DOLL, MEM_BUFFER_0
	jump .VendItem
	
.NES:
	checkmoney YOUR_MONEY, 10000
	ifequal HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_FAMICOM
	iftrue .AlreadyHave
	takemoney YOUR_MONEY, 10000
	special PlaceMoneyTopRight
	setevent EVENT_DECO_FAMICOM
	pause 10
	playsound SFX_ENTER_DOOR
	writetext PectiniaClangTextNES
	buttonsound
	writetext SentNESHome
	buttonsound
	jump .Start
	
.VendItem:
	special PlaceMoneyTopRight
	pause 10
	playsound SFX_ENTER_DOOR
	writetext PectiniaClangText
	buttonsound
	itemnotify
	jump .Start

.NotEnoughMoney:
	writetext PectiniaVendingNoMoneyText
	waitbutton
	jump .Start

.NotEnoughSpace:
	writetext PectiniaVendingNoSpaceText
	waitbutton
	jump .Start
	
.AlreadyHave:
	writetext PectiniaVendingAlreadyHaveText
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
	db "FRESH WATER  ¥350@"
	db "POKE DOLL   ¥1000@"
	db "NES        ¥10000@"
	db "CANCEL@"

PectiniaBerryTree:
	fruittree FRUITTREE_AZALEA_TOWN

PectiniaCityRivalBattleApproachMovement1:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

PectiniaFangirlLeave:
	step LEFT
;fallthrough
PectiniaCityRivalBattleExitMovement:
	step LEFT
	step LEFT
	run_step UP
	run_step UP
	run_step UP
	run_step UP
	run_step UP
	step_end
	
PectiniaFangirlStepDown:
	step DOWN
	turn_head RIGHT
	step_end
	
PectiniaPlayerStepRight:
	turn_head LEFT
	fix_facing
	step RIGHT
	remove_fixed_facing
	step_end
	
PectiniaGymMovement:
	step UP
	step_end
	
PectiniaCityLeaveGymMovement:
	step DOWN
	step_end
	
BurglarExitLeft:
	run_step UP
	run_step LEFT
	run_step LEFT
	run_step LEFT
	run_step LEFT
	run_step LEFT
	run_step LEFT
	step_end

BurglarExitLeft2:
	run_step LEFT
	run_step UP
	run_step LEFT
	run_step LEFT
	run_step LEFT
	run_step LEFT
	run_step LEFT
	step_end
	
PectiniaCityRivalWait:
	text "Hey you!"
	done
	
PectiniaCityRivalBeforeText:
	text "Where do you think"
	line "you're going?"

	para "I already had an"
	line "appointment with"
	cont "the GYM LEADER!"

	para "What's that?"

	para "You just started"
	line "your journey as a"
	cont "#MON trainer?"
	
	para "And you think"
	line "you're good enough"
	cont "to even set foot"
	cont "in a GYM?"
	
	para "Don't make"
	line "me laugh!"
	
	para "You think you're"
	line "so good?"
	
	para "Get through me"
	line "first!"
	done

PectiniaCityRivalWinText:
	text "Argh!"

	para "Fine. You can"
	line "challenge this GYM"
	cont "before me."
	done

PectiniaCityRivalAfterText:
	text "…"
	done

PectiniaCityRivalLossText:
	text "…Humph! I knew"
	line "you were lying."
	done
	
PectiniaFangirlIntroductionText:
	text "Hey! That battle"
	line "was great! I was"
	cont "able to catch the"
	cont "end of it after I"
	cont "finished up my GYM"
	cont "challenge here."
	
	para "By the way, what's"
	line "your name?"
	
	para "<……><……><……>"
	
	para "<PLAYER>? It's"
	line "a pleasure to meet"
	cont "you! I'm EMILY!"
	
	para "Your opponent was"
	line "so quick to leave,"
	cont "did you catch his"
	cont "name too?"
	done
	
PectiniaFangirlConfirmRivalName:
	text "<RIVAL>?"
	line "Did I hear that"
	cont "right?"
	done
	
PectiniaFangirlLeaveText:
	text "Thanks! I'll try"
	line "and catch up with"
	cont "him! You two have"
	cont "a lot of promise"
	cont "as trainers."
	
	para "I'm going to have"
	line "my eye on you,"
	cont "<PLAYER>!"
	done
	
PectiniaCityTeacherText:
	text "I don't have any"
	line "#MON of my own,"
	cont "but I still love"
	cont "to meet all of the"
	cont "ones here."
	done
	
PectiniaCityTeacher2Text:
	text "I heard there are"
	line "some FLYING-type"
	cont "#MON that live"
	cont "on ROUTE 3."
	
	para "If you are having"
	line "trouble with the"
	cont "the GYM here, try"
	cont "and find one."
	done
	
PectiniaCityYoungsterText:
	text "It's important for"
	line "both people and"
	cont "#MON to spend"
	cont "some time outdoors"
	cont "now and again."
	done
	
PectiniaCityYoungster2Text:
	text "They just started"
	line "stocking the NES"
	cont "in vending"
	cont "machines!"
	
	para "…Too bad they're"
	line "way too expensive"
	cont "for me to afford."
	done
	
PectiniaCityYoungster3Text:
	text "Sometimes trainers"
	line "drop items by"
	cont "mistake."
	
	para "If you find one,"
	line "you're free to"
	cont "take it."
	done
	
PectiniaCityPokefanMText:
	text "I caught a"
	line "GROWLITHE to help"
	cont "me meet some new"
	cont "people."
	
	para "She's a wonderful"
	line "icebreaker!"
	done
	
PectiniaCityRockerText:
	text "I have to keep my"
	line "HOUNDOUR on a"
	cont "short leash."
	
	para "Sometimes he likes"
	line "to attack #MON"
	cont "in the trees."
	done

PectiniaCityGentlemanText:
	text "The PECTINIA MALL"
	line "is not yet open to"
	cont "the public."

	para "We apologize for"
	line "any inconvenience"
	cont "this may cause."
	done

PectiniaCityGrowlitheText:
	text "GROWLITHE: Bark!"
	done

PectiniaCityHoundourText:
	text "HOUNDOUR: Grrr…"
	done
	
PectiniaCitySignText:
	text "PECTINIA CITY"
	
	para "The big city with"
	line "small town values."
	done
	
PectiniaApartmentsSignText:
	text "PECTINIA APARTMENT"
	line "COMPLEX"
	done
	
PectiniaSquareSignText:
	text "PECTINIA SQUARE"
	
	para "Where your #MON"
	line "may roam free."
	done
	
PectiniaTrainStationSignText:
	text "PECTINIA MALL"
	done

PectiniaGymFirstTimeText:
	text "Sorry, I was just"
	line "on break. Are you"
	cont "the next"
	cont "challenger?"
	
	para "It doesn't look"
	line "like you have any"
	cont "badges, so you"
	cont "must be a newbie."
	
	para "Anyway, you should"
	line "make sure your"
	cont "#MON are all"
	cont "healed up before"
	cont "entering the GYM."
	
	para "I'll see you in-"
	line "side, trainer!"
	done
	
PectiniaAskEnterText:
	text "Would you like to"
	line "enter the GYM?"
	done
	
PectiniaBurglarText:
	text "Yeah, I stole a"
	line "BICYCLE, what"
	cont "about it?"
	
	para "You want me to"
	line "just give it back"
	cont "to you?"
	done

PectiniaBurglarChallengeText:
	text "No chance! You'll"
	line "need to battle me"
	cont "for it!"
	done
	
PectiniaBurglarWinText:
	text "What? How could a"
	line "kid beat me like"
	cont "that?"
	done
	
PectiniaBurglarAfterText:
	text "Just take the"
	line "BICYCLE, kid. This"
	cont "is humiliating"
	cont "enough."
	done
	
PectiniaBurglarGetLost:
	text "What am I doing"
	line "out here?"
	
	para "That's none of"
	line "your business! Get"
	cont "out of here!"
	done
	
PectiniaVendingText:
	text "A vending machine!"
	line "Here's the menu."
	done

PectiniaClangText:
	text "Clang!"

	para "@"
	text_from_ram wStringBuffer3
	text_start
	line "popped out."
	done

PectiniaClangTextNES:
	text "Clang!"

	para "The NES"
	line "popped out."
	done
	
PectiniaVendingNoMoneyText:
	text "Oops, not enough"
	line "money…"
	done

PectiniaVendingNoSpaceText:
	text "There's no more"
	line "room for stuff…"
	done
	
PectiniaVendingAlreadyHaveText:
	text "You already have"
	line "an NES."
	done
	
SentNESHome:
	text "The NES was sent"
	line "to <PLAYER>'s"
	cont "home."
	done

PectiniaCity_MapEvents:
	db 0, 0 ; filler

	db 14 ; warp events
	warp_event 49,  7, PECTINIA_POKECENTER_1F, 1
	warp_event 24,  9, PECTINIA_MALL, 1
	warp_event 31, 11, PECTINIA_MART, 1
	warp_event 51, 25, PECTINIA_BERRY_HOUSE, 1
	warp_event 43,  5, ROUTE_3_PECTINIA_GATE, 3
	warp_event  4, 26, ROUTE_2_PECTINIA_GATE, 3
	warp_event  4, 27, ROUTE_2_PECTINIA_GATE, 4
	warp_event 53, 10, ROUTE_4_PECTINIA_GATE, 1
	warp_event 53, 11, ROUTE_4_PECTINIA_GATE, 2
	warp_event 14, 19, PECTINIA_APARTMENT_RIGHT, 1
	warp_event 19, 19, PECTINIA_APARTMENT_LEFT, 1
	warp_event 11, 25, PECTINIA_GYM_SPEECH_HOUSE, 1
	warp_event 17, 25, PECTINIA_BIKE_HOUSE, 1
	warp_event 37, 11, PECTINIA_EVOLUTION_HOUSE, 1

	db 1 ; coord events
	coord_event 40, 18, SCENE_PECTINIACITY_NOTHING, PectiniaCityRivalBattleScene1

	db 11 ; bg events
	bg_event  6, 25, BGEVENT_READ, PectiniaCitySign
	bg_event 17, 19, BGEVENT_READ, PectiniaApartmentsSign
	bg_event 29, 23, BGEVENT_READ, PectiniaSquareSign
	bg_event 23, 11, BGEVENT_READ, PectiniaTrainStationSign
	bg_event 50,  7, BGEVENT_READ, PectiniaCityPokecenterSign
	bg_event 32, 11, BGEVENT_READ, PectiniaCityMartSign
	bg_event 16, 18, BGEVENT_ITEM, PectiniaCityHiddenFullHeal
	bg_event 40, 10, BGEVENT_ITEM, PectiniaCityHiddenGreatBall
	bg_event 11, 33, BGEVENT_ITEM, PectiniaCityHiddenEther
	bg_event 34, 11, BGEVENT_READ, PectiniaCityVendingMachine
	bg_event 40, 17, BGEVENT_UP,   PectiniaGymEvent

	db 16 ; object events
	object_event 29, 19, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PectiniaCityTeacherScript, -1
	object_event 31, 16, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PectiniaCityYoungsterScript, -1
	object_event 32, 16, SPRITE_GROWLITHE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PectiniaCityGrowlitheScript, -1
	object_event 25, 17, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PectiniaCityPokefanMScript, -1
	object_event 26, 17, SPRITE_GROWLITHE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PectiniaCityGrowlitheScript, -1
	object_event 34, 21, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PectiniaCityRockerScript, -1
	object_event 33, 21, SPRITE_GROWLITHE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PectiniaCityHoundourScript, -1
	object_event 35, 12, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PectiniaCityYoungster2Script, -1
	object_event 1, 1, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_BEAT_RIVAL_1
	object_event 45, 10, SPRITE_TEACHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PectiniaCityTeacher2Script, -1
	object_event 40, 18, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PectiniaGymConfirm, EVENT_GYM_EXPLAINATION
	object_event 13, 28, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 3, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PectiniaCityYoungster3Script, -1
	object_event 49, 26, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PectiniaBerryTree, -1
	object_event 33, 37, SPRITE_PHARMACIST, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PectiniaBurglar, EVENT_AZALEA_RETURNED_BIKE
	object_event 24, 10, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PectiniaTrainBlock, EVENT_GOT_TM_CUT
	object_event 0, 0, SPRITE_FANGIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
