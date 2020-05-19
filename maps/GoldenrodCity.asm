	const_def 2 ; object constants
	const ROUTE34_GRAMPS
	const ROUTE34_DAY_CARE_MON_1
	const ROUTE34_DAY_CARE_MON_2
	const GOLDENROD_LASS
	const GOLDENROD_YOUNGSTER
	const GOLDENROD_FANGIRL

GoldenrodCity_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED
	
	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPointAndFloria
	callback MAPCALLBACK_OBJECTS, .EggCheckCallback

.DummyScene0:
	end
	
.DummyScene1:
	end
	
.FlyPointAndFloria:
	setflag ENGINE_FLYPOINT_GOLDENROD
	return

.EggCheckCallback:
	checkflag ENGINE_DAY_CARE_MAN_HAS_EGG
	iftrue .PutDayCareManOutside
	clearevent EVENT_DAY_CARE_MAN_IN_DAY_CARE
	setevent EVENT_DAY_CARE_MAN_ON_ROUTE_34
	jump .CheckMon1

.PutDayCareManOutside:
	setevent EVENT_DAY_CARE_MAN_IN_DAY_CARE
	clearevent EVENT_DAY_CARE_MAN_ON_ROUTE_34
	jump .CheckMon1

.CheckMon1:
	checkflag ENGINE_DAY_CARE_MAN_HAS_MON
	iffalse .HideMon1
	checkevent EVENT_DAY_CARE_MON_2
	clearevent EVENT_DAY_CARE_MON_1
	jump .CheckMon2

.HideMon1:
	setevent EVENT_DAY_CARE_MON_1
	jump .CheckMon2

.CheckMon2:
	checkflag ENGINE_DAY_CARE_LADY_HAS_MON
	iffalse .HideMon2
	checkevent EVENT_DAY_CARE_MON_1
	clearevent EVENT_DAY_CARE_MON_2
	return

.HideMon2:
	setevent EVENT_DAY_CARE_MON_2
	return
	
DayCareManScript_Outside:
	faceplayer
	opentext
	special DayCareManOutside
	waitbutton
	closetext
	ifequal TRUE, .end_fail
	clearflag ENGINE_DAY_CARE_MAN_HAS_EGG
	checkcode VAR_FACING
	ifequal LEFT, .walk_around_player
	applymovement ROUTE34_GRAMPS, Route34MovementData_DayCareManWalksBackInside
	playsound SFX_ENTER_DOOR
	disappear ROUTE34_GRAMPS
.end_fail
	end
	
.walk_around_player
	applymovement PLAYER, Route34MovementData_PlayerMoves
	applymovement ROUTE34_GRAMPS, Route34MovementData_DayCareManWalksBackInside
	playsound SFX_ENTER_DOOR
	disappear ROUTE34_GRAMPS
	end

DayCareMon1Script:
	opentext
	special DayCareMon1
	closetext
	end

DayCareMon2Script:
	opentext
	special DayCareMon2
	closetext
	end	
	
GoldenrodLassScript:
	faceplayer
	opentext
	checkflag ENGINE_DAY_CARE_MAN_HAS_MON
	iffalse .DayCareOneMon
	checkflag ENGINE_DAY_CARE_LADY_HAS_MON
	iffalse .DayCareOneMon
	special DayCareMon1
	closetext
	end

.DayCareOneMon
	writetext GoldenrodLassText
	waitbutton
	closetext
	end	
	
GoldenrodLadScript:
	jumptextfaceplayer GoldenrodLadText
	
GoldenrodGymEvent:
	checkflag ENGINE_PLAINBADGE
	iftrue .havebadge
	clearevent EVENT_BEAT_SCIENTIST_ADRIAN
	clearevent EVENT_BEAT_PSYCHIC_PARKER
	clearevent EVENT_BEAT_PSYCHIC_CHRISTIAN
	clearevent EVENT_BEAT_PSYCHIC_DAMIEN
	clearevent EVENT_BEAT_SCIENTIST_MELVIN
	clearevent EVENT_BEAT_GUITARIST_XAVIER
	scall GoldenrodGymEntrance
	iffalse .no
.warp
	warpfacing UP, CIANWOOD_GYM, 15, 39
.no
	end

.havebadge
	scall GoldenrodEnterGym
	jump .warp
	
GoldenrodGymEntrance:
	jumpstd gymdoor
	end
	
GoldenrodEnterGym
	jumpstd entergym
	end
	
Route34MovementData_PlayerMoves:
	step DOWN
	turn_head UP
	step_end	
	
Route34MovementData_DayCareManWalksBackInside:
	slow_step RIGHT
	turn_head UP
	slow_step UP
	step_end
	
GoldenrodFangirlScene:
	special FadeOutMusic
	playsound SFX_EXIT_BUILDING
	moveobject GOLDENROD_FANGIRL, 21, 25
	appear GOLDENROD_FANGIRL
	checkcode VAR_YCOORD
	ifequal 27, .South
	applymovement GOLDENROD_FANGIRL, GoldenrodFangirlStepDownNorth
	jump .Next
.South
	applymovement GOLDENROD_FANGIRL, GoldenrodFangirlStepDownSouth
.Next
	opentext
	writetext GoldenrodFangirlStopPlayerText
	waitbutton
	closetext
	turnobject PLAYER, LEFT
	showemote EMOTE_QUESTION, PLAYER, 15
	playmusic MUSIC_MYSTICALMAN_ENCOUNTER
	applymovement GOLDENROD_FANGIRL, GoldenrodFangirlApproachPlayer
	opentext
	writetext GoldenrodFangirlText
	waitbutton
	closetext
	winlosstext GoldenrodFangirlLossText, GoldenrodFangirlWinText
	setlasttalked GOLDENROD_FANGIRL
	loadtrainer FANGIRL, EMILY1
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	playmusic MUSIC_MYSTICALMAN_ENCOUNTER
.AfterBattle
	opentext
	writetext GoldenrodFangirlAfterText
	waitbutton
	closetext
	applymovement GOLDENROD_FANGIRL, GoldenrodFangirlLeave
	disappear GOLDENROD_FANGIRL
	setscene SCENE_DEFAULT
	playmapmusic
	end
	
GoldenrodHiddenSilverLeaf:
	hiddenitem SILVER_LEAF, EVENT_GOLDENROD_HIDDEN_SILVER_LEAF	

GoldenrodHiddenRareCandy:
	hiddenitem RARE_CANDY, EVENT_GOLDENROD_HIDDEN_RARE_CANDY
	
GoldenrodCityPokecenterSign:
	jumpstd pokecentersign
	
DayCareSign:
	jumptext DayCareSignText
	
GoldenrodCitySign:
	jumptext GoldenrodCitySignText
	
GoldenrodCityMartSign:
	jumpstd martsign
	
GoldenrodGymMovement:
	step UP
	step_resume
	
GoldenrodFangirlStepDownSouth:
	step DOWN
GoldenrodFangirlStepDownNorth:
	step DOWN
	turn_step RIGHT
	step_resume

GoldenrodFangirlApproachPlayer:
	step RIGHT
	step RIGHT
	step_end
	
GoldenrodFangirlLeave:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end
	
GoldenrodLassText:
	text "#MON love to"
	line "play in the DAY"
	cont "CARE's yard."
	
	para "Especially if they"
	line "can make new"
	cont "friends."
	done
	
GoldenrodLadText:
	text "The leader of this"
	line "GYM really gives"
	cont "me the creeps."
	
	para "She hardly ever"
	line "leaves, and is"
	cont "always wearing"
	cont "a hood to hide her"
	cont "face."
	
	para "…At least I think"
	line "it's a woman under"
	cont "those robes."
	done

DayCareSignText:
	text "DAY-CARE"

	para "LET US RAISE YOUR"
	line "#MON FOR YOU!"
	done
	
GoldenrodFangirlStopPlayerText:
	text "Hey! <PLAYER>!"
	line "Wait up!"
	done
	
GoldenrodFangirlText:
	text "I caught up with"
	line "<RIVAL> earlier!"
	
	para "He wouldn't say"
	line "what was bugging"
	cont "him so much after"
	cont "your battle with"
	cont "him, but he seemed"
	cont "determined to get"
	cont "stronger."
	
	para "I challenged him"
	line "to a battle!"
	cont "It was fun!"
	
	para "Even though he"
	line "won, I feel that I"
	cont "learned a lot from"
	cont "that battle."
	
	para "You already chall-"
	line "enged the GYM in"
	cont "this town, right?"
	
	para "<……><……><……>"
	
	para "No way! You just"
	line "won a MYSTICBADGE?"
	
	para "C'mon! You gotta"
	line "let me show you"
	cont "what I've learned!"
	
	para "Let's have a"
	line "battle!"
	done
	
GoldenrodFangirlWinText:
	text "Yay! My studying"
	line "has paid off!"
	done

GoldenrodFangirlLossText:
	text "Hm… I see…"
	
	para "I think I know"
	line "what I need to"
	cont "work on some more."
	done

GoldenrodFangirlAfterText:
	text "Y'know, there is"
	line "a man on ROUTE 1"
	cont "that gives out a"
	cont "prize to winners"
	cont "the MYSTICBADGE."
	
	para "You should check"
	line "it out. In the"
	cont "meantime, it's"
	cont "my turn to take"
	cont "on CELESTE."
	
	para "Wish me luck!"
	done
	
GoldenrodCitySignText:
	text "FAVIA TOWN"
	
	para "Your friendly far-"
	line "away neighbors."
	done

GoldenrodCity_MapEvents:
	db 0, 0 ; filler

	db 10 ; warp events
	warp_event 19, 15, GOLDENROD_POKECENTER_1F, 1
	warp_event 21, 25, GOLDENROD_MART, 1
	warp_event 13,  6, CIANWOOD_GYM, 1 ;	warp_event 12,  7, GOLDENROD_GYM, 1
	warp_event  9, 17, DAY_CARE, 1
	warp_event 14, 21, GOLDENROD_HAPPINESS_RATER, 1
	warp_event 27, 29, ROUTE_1_GOLDENROD_GATE, 1
	warp_event 28, 29, ROUTE_1_GOLDENROD_GATE, 2
	warp_event 25, 18, ROUTE_8_GOLDENROD_GATE, 1
	warp_event 25, 19, ROUTE_8_GOLDENROD_GATE, 2
	warp_event  5,  5, ROUTE_11_GOLDENROD_GATE, 3

	db 2 ; coord events
	coord_event 24, 26, SCENE_FINISHED, GoldenrodFangirlScene
	coord_event 24, 27, SCENE_FINISHED, GoldenrodFangirlScene

	db 7 ; bg events
	bg_event 10, 18, BGEVENT_READ, DayCareSign
	bg_event 10, 18, BGEVENT_READ, GoldenrodCitySign
	bg_event 22, 25, BGEVENT_READ, GoldenrodCityMartSign
	bg_event 20, 15, BGEVENT_READ, GoldenrodCityPokecenterSign
	bg_event  1, 22, BGEVENT_ITEM, GoldenrodHiddenSilverLeaf
	bg_event 21,  8, BGEVENT_ITEM, GoldenrodHiddenRareCandy
	bg_event 12,  7, BGEVENT_UP,   GoldenrodGymEvent
	
	db 6 ; object events
	object_event  8, 18, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DayCareManScript_Outside, EVENT_DAY_CARE_MAN_ON_ROUTE_34
	object_event  6, 14, SPRITE_DAY_CARE_MON_1, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DayCareMon1Script, EVENT_DAY_CARE_MON_1
	object_event  4, 15, SPRITE_DAY_CARE_MON_2, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DayCareMon2Script, EVENT_DAY_CARE_MON_2
	object_event  6, 20, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodLassScript, -1
	object_event 11, 10, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodLadScript, -1
	object_event  0,  0, SPRITE_FANGIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
