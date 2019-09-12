	const_def 2 ; object constants
	const AZALEATOWN_TEACHER1
	const AZALEATOWN_YOUNGSTER1
	const AZALEATOWN_GROWLITHE1
	const AZALEATOWN_POKEFAN_M
	const AZALEATOWN_GROWLITHE2
	const AZALEATOWN_ROCKER
	const AZALEATOWN_GROWLITHE3
	const AZALEATOWN_YOUNGSTER2
	const AZALEATOWN_SILVER
	const AZALEATOWN_TEACHER2
	const AZALEATOWN_GYM_GUY
	const AZALEATOWN_YOUNGSTER3
	const AZALEATOWN_FRUIT_TREE
	const AZALEATOWN_BURGLAR

AzaleaTown_MapScripts:
	db 3 ; scene scripts
	scene_script .DummyScene0 ; SCENE_AZALEATOWN_NOTHING
	scene_script .DummyScene1 ; SCENE_AZALEATOWN_DEFEATED_RIVAL
	scene_script .DummyScene2 ; SCENE_AZALEATOWN_KURT_RETURNS_GS_BALL

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .Flypoint

.DummyScene0:
	end

.DummyScene1:
	end

.DummyScene2:
	end

.Flypoint:
	setflag ENGINE_FLYPOINT_AZALEA
	return
	
AzaleaTownRivalBattleScene1:
	checkevent EVENT_BEAT_RIVAL_1
	iftrue .skip
	moveobject AZALEATOWN_SILVER, 36, 13
	opentext
	writetext AzaleaTownRivalWait
	waitbutton
	closetext
	turnobject PLAYER, LEFT
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 15
	appear AZALEATOWN_SILVER
	applymovement AZALEATOWN_SILVER, AzaleaTownRivalBattleApproachMovement1
	jump AzaleaTownRivalBattleScript
	
.skip:
	end

AzaleaTownRivalBattleScript:
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext AzaleaTownRivalBeforeText
	waitbutton
	closetext
	setevent EVENT_BEAT_RIVAL_1
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftrue .Totodile
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue .Chikorita
	winlosstext AzaleaTownRivalWinText, AzaleaTownRivalLossText
	setlasttalked AZALEATOWN_SILVER
	loadtrainer RIVAL1, RIVAL1_1_TOTODILE
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .AfterBattle

.Totodile:
	winlosstext AzaleaTownRivalWinText, AzaleaTownRivalLossText
	setlasttalked AZALEATOWN_SILVER
	loadtrainer RIVAL1, RIVAL1_1_CHIKORITA
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .AfterBattle

.Chikorita:
	winlosstext AzaleaTownRivalWinText, AzaleaTownRivalLossText
	setlasttalked AZALEATOWN_SILVER
	loadtrainer RIVAL1, RIVAL1_1_CYNDAQUIL
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .AfterBattle

.AfterBattle:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext AzaleaTownRivalAfterText
	waitbutton
	closetext
	applymovement AZALEATOWN_SILVER, AzaleaTownRivalBattleExitMovement
	disappear AZALEATOWN_SILVER
	waitsfx
	playmapmusic
	setevent EVENT_BEAT_RIVAL_1
	variablesprite SPRITE_OLIVINE_RIVAL, SPRITE_SWIMMER_GIRL_LAND
	special LoadUsedSpritesGFX
	end
	
AzaleaGymConfirm:
	faceplayer
	opentext
	checkcode VAR_BADGES
	ifgreater 0, .ConfirmText
	writetext AzaleaGymFirstTimeText
	waitbutton
	jump .ConfirmText
	
.ConfirmText
	writetext AzaleaAskEnterText
	yesorno
	iftrue .Enter
	closetext
	end

.Enter
	closetext
	applymovement AZALEATOWN_GYM_GUY, AzaleaGymMovement
	playsound SFX_ENTER_DOOR
	disappear AZALEATOWN_GYM_GUY
	setevent EVENT_GYM_EXPLAINATION
	setmapscene VIOLET_GYM, SCENE_FINISHED
	end	
	
AzaleaBurglar:
	faceplayer
	opentext
	checkevent EVENT_AZALEA_BIKE_THIEF
	iffalse .GetLost
	writetext AzaleaBurglarText
	waitbutton
	winlosstext AzaleaBurglarWinText, -1
	loadtrainer BURGLAR, LAMAAR
	startbattle
	reloadmapafterbattle
	jump .AfterBattle
	
.GetLost
	writetext AzaleaBurglarGetLost
	waitbutton
	closetext
	end
	
.AfterBattle
	opentext
	writetext AzaleaBurglarAfterText
	waitbutton
	verbosegiveitem BICYCLE
	closetext
	checkcode VAR_FACING
	ifequal DOWN, .FacingDown
	applymovement AZALEATOWN_BURGLAR, BurglarExitLeft
.Leave
	disappear AZALEATOWN_BURGLAR
	setevent EVENT_AZALEA_RETURNED_BIKE
	end
	
.FacingDown
	applymovement AZALEATOWN_BURGLAR, BurglarExitLeft2
	jump .Leave
	
AzaleaGymEvent:
	scall AzaleaGymEntrance
	iffalse .no
	warpfacing UP, AZALEA_GYM,  8, 19
.no
	end	

AzaleaGymEntrance:
	jumpstd gymdoor
	end

AzaleaTownGrowlitheScript:
	opentext
	writetext AzaleaTownGrowlitheText
	cry GROWLITHE
	waitbutton
	closetext
	end
	
AzaleaTownHoundourScript:
	opentext
	writetext AzaleaTownHoundourText
	cry HOUNDOUR
	waitbutton
	closetext
	end

AzaleaTownTeacherScript:
	jumptextfaceplayer AzaleaTownTeacherText

AzaleaTownTeacher2Script:
	jumptextfaceplayer AzaleaTownTeacher2Text
	
AzaleaTownYoungsterScript:
	jumptextfaceplayer AzaleaTownYoungsterText

AzaleaTownYoungster2Script:
	jumptextfaceplayer AzaleaTownYoungster2Text
	
AzaleaTownYoungster3Script:
	jumptextfaceplayer AzaleaTownYoungster3Text
	
AzaleaTownPokefanMScript:
	jumptextfaceplayer AzaleaTownPokefanMText

AzaleaTownRockerScript:
	jumptextfaceplayer AzaleaTownRockerText

AzaleaTownSign:
	jumptext AzaleaTownSignText

AzaleaTownPokecenterSign:
	jumpstd pokecentersign

AzaleaTownMartSign:
	jumpstd martsign
	
AzaleaTownRepel:
	itemball REPEL

AzaleaTownHiddenFullHeal:
	hiddenitem FULL_HEAL, EVENT_AZALEA_TOWN_HIDDEN_FULL_HEAL
	
AzaleaTownHiddenGreatBall:
	hiddenitem GREAT_BALL, EVENT_AZALEA_TOWN_HIDDEN_GREAT_BALL
	
AzaleaTownHiddenEther:
	hiddenitem ETHER, EVENT_AZALEA_TOWN_HIDDEN_ETHER
	
AzaleaTownVendingMachine:
	opentext
	writetext AzaleaVendingText
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
	setevent EVENT_DECO_FAMICOM
	pause 10
	playsound SFX_ENTER_DOOR
	writetext AzaleaClangTextNES
	buttonsound
	writetext SentNESHome
	buttonsound
	jump .Start
	
.VendItem:
	pause 10
	playsound SFX_ENTER_DOOR
	writetext AzaleaClangText
	buttonsound
	itemnotify
	jump .Start

.NotEnoughMoney:
	writetext AzaleaVendingNoMoneyText
	waitbutton
	jump .Start

.NotEnoughSpace:
	writetext AzaleaVendingNoSpaceText
	waitbutton
	jump .Start
	
.AlreadyHave:
	writetext AzaleaVendingAlreadyHaveText
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
	db "FRESH WATER ¥350@"
	db "POKE DOLL  ¥1000@"
	db "NES       ¥10000@"
	db "CANCEL@"

AzaleaBerryTree:
	fruittree FRUITTREE_AZALEA_TOWN

AzaleaTownRivalBattleApproachMovement1:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

AzaleaTownRivalBattleExitMovement:
	step LEFT
	step LEFT
	run_step UP
	run_step UP
	run_step UP
	run_step UP
	run_step UP
	step_end
	
AzaleaGymMovement:
	step UP
	step_end
	
AzaleaTownLeaveGymMovement:
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
	
AzaleaTownRivalWait:
	text "Hey you!"
	done
	
AzaleaTownRivalBeforeText:
	text "Where do you think"
	line "you're going?"

	para "I already had an"
	line "appointment with"
	cont "the gym leader!"

	para "What's that?"

	para "You just started"
	line "your journey as a"
	cont "#MON trainer?"
	
	para "And you think"
	line "you're good enough"
	cont "to even set foot"
	cont "in a gym?"
	
	para "Don't make"
	line "me laugh!"
	
	para "You think you're"
	line "so good?"
	
	para "Get through me"
	line "first!"
	done

AzaleaTownRivalWinText:
	text "Argh!"

	para "Fine. You can"
	line "challenge this gym"
	cont "before me."
	done

AzaleaTownRivalAfterText:
	text "…"
	done

AzaleaTownRivalLossText:
	text "…Humph! I knew"
	line "you were lying."
	done
	
AzaleaTownTeacherText:
	text "I don't have any"
	line "#MON of my own,"
	cont "but I still love"
	cont "to meet all of the"
	cont "ones here."
	done
	
AzaleaTownTeacher2Text:
	text "I heard there are"
	line "some FLYING-type"
	cont "#MON that live"
	cont "on ROUTE 3."
	
	para "If you are having"
	line "trouble with the"
	cont "the GYM here, try"
	cont "and find one."
	done
	
AzaleaTownYoungsterText:
	text "It's important for"
	line "both people and"
	cont "#MON to spend"
	cont "some time outdoors"
	cont "now and again."
	done
	
AzaleaTownYoungster2Text:
	text "They just started"
	line "stocking the NES"
	cont "in vending"
	cont "machines!"
	
	para "…Too bad they're"
	line "way too expensive"
	cont "for me to afford."
	done
	
AzaleaTownYoungster3Text:
	text "Sometimes trainers"
	line "drop items by"
	cont "mistake."
	
	para "If you find one,"
	line "you're free to"
	cont "take it."
	done
	
AzaleaTownPokefanMText:
	text "I caught a"
	line "GROWLITHE to help"
	cont "me meet some new"
	cont "people."
	
	para "She's a wonderful"
	line "icebreaker!"
	done
	
AzaleaTownRockerText:
	text "I have to keep my"
	line "HOUNDOUR on a"
	cont "short leash."
	
	para "Sometimes he likes"
	line "to attack #MON"
	cont "in the trees."
	done

AzaleaTownGrowlitheText:
	text "GROWLITHE: Bark!"
	done

AzaleaTownHoundourText:
	text "HOUNDOUR: Grrr…"
	done
	
AzaleaTownSignText:
	text "AZALEA TOWN"
	line "Where People and"

	para "#MON Live in"
	line "Happy Harmony"
	done

AzaleaGymFirstTimeText:
	text "You will be unable"
	line "to leave this GYM"
	cont "until you defeat"
	cont "the leader or"
	cont "white out."
	done
	
AzaleaAskEnterText:
	text "Would you like to"
	line "enter the GYM?"
	done
	
AzaleaBurglarText:
	text "Yeah, I stole a"
	line "BICYCLE, what"
	cont "about it?"
	
	para "You want me to"
	line "just give it back"
	cont "to you?"
	
	para "No chance! You'll"
	line "need to battle me"
	cont "for it!"
	done
	
AzaleaBurglarWinText:
	text "What? How could a"
	line "kid beat me like"
	cont "that?"
	done
	
AzaleaBurglarAfterText:
	text "Just take the"
	line "BICYCLE, kid. This"
	cont "is humiliating"
	cont "enough."
	done
	
AzaleaBurglarGetLost:
	text "What am I doing"
	line "out here?"
	
	para "That's none of"
	line "your business! Get"
	cont "out of here!"
	done
	
AzaleaVendingText:
	text "A vending machine!"
	line "Here's the menu."
	done

AzaleaClangText:
	text "Clang!"

	para "@"
	text_from_ram wStringBuffer3
	text_start
	line "popped out."
	done

AzaleaClangTextNES:
	text "Clang!"

	para "The NES"
	line "popped out."
	done
	
AzaleaVendingNoMoneyText:
	text "Oops, not enough"
	line "money…"
	done

AzaleaVendingNoSpaceText:
	text "There's no more"
	line "room for stuff…"
	done
	
AzaleaVendingAlreadyHaveText:
	text "You already have"
	line "an NES."
	done
	
SentNESHome:
	text "The NES was sent"
	line "to <PLAYER>'s"
	cont "home."
	done

AzaleaTown_MapEvents:
	db 0, 0 ; filler

	db 14 ; warp events
	warp_event 49,  7, AZALEA_POKECENTER_1F, 1
	warp_event 24,  9, GOLDENROD_MAGNET_TRAIN_STATION, 1
	warp_event 31, 11, AZALEA_MART, 2
	warp_event 51, 25, AZALEA_BERRY_HOUSE, 1
	warp_event 43,  5, ROUTE_3_AZALEA_GATE, 3
	warp_event  4, 26, ROUTE_2_AZALEA_GATE, 3
	warp_event  4, 27, ROUTE_2_AZALEA_GATE, 4
	warp_event 53, 10, ROUTE_4_AZALEA_GATE, 1
	warp_event 53, 11, ROUTE_4_AZALEA_GATE, 2
	warp_event 14, 19, AZALEA_APARTMENT_RIGHT, 1
	warp_event 19, 19, AZALEA_APARTMENT_LEFT, 1
	warp_event 11, 25, AZALEA_GYM_SPEECH_HOUSE, 1
	warp_event 17, 25, AZALEA_BIKE_HOUSE, 1
	warp_event 37, 11, AZALEA_EVOLUTION_HOUSE, 1

	db 1 ; coord events
	coord_event 40, 18, -1, AzaleaTownRivalBattleScene1

	db 8 ; bg events
	bg_event 17, 21, BGEVENT_READ, AzaleaTownSign
	bg_event 50,  7, BGEVENT_READ, AzaleaTownPokecenterSign
	bg_event 32, 11, BGEVENT_READ, AzaleaTownMartSign
	bg_event 16, 18, BGEVENT_ITEM, AzaleaTownHiddenFullHeal
	bg_event 40, 10, BGEVENT_ITEM, AzaleaTownHiddenGreatBall
	bg_event 11, 33, BGEVENT_ITEM, AzaleaTownHiddenEther
	bg_event 34, 11, BGEVENT_READ, AzaleaTownVendingMachine
	bg_event 40, 17, BGEVENT_UP,   AzaleaGymEvent

	db 14 ; object events
	object_event 29, 19, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, AzaleaTownTeacherScript, -1
	object_event 31, 16, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, AzaleaTownYoungsterScript, -1
	object_event 32, 16, SPRITE_GROWLITHE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaTownGrowlitheScript, -1
	object_event 25, 17, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, AzaleaTownPokefanMScript, -1
	object_event 26, 17, SPRITE_GROWLITHE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaTownGrowlitheScript, -1
	object_event 34, 21, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, AzaleaTownRockerScript, -1
	object_event 33, 21, SPRITE_GROWLITHE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaTownHoundourScript, -1
	object_event 35, 12, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, AzaleaTownYoungster2Script, -1
	object_event 1, 1, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_BEAT_RIVAL_1
	object_event 45, 10, SPRITE_TEACHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaTownTeacher2Script, -1
	object_event 40, 18, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaGymConfirm, EVENT_GYM_EXPLAINATION
	object_event 13, 28, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 3, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, AzaleaTownYoungster3Script, -1
	object_event 49, 26, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaBerryTree, -1
	object_event 33, 37, SPRITE_PHARMACIST, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, AzaleaBurglar, EVENT_AZALEA_RETURNED_BIKE
