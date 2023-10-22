	const_def 2 ; object constants
	const PAVONAVILLAGE_TEACHER
	const PAVONAVILLAGE_YOUNGSTER
	const PAVONAVILLAGE_FISHER
	const PAVONAVILLAGE_ROCK1
	const PAVONAVILLAGE_ROCK2

PavonaVillage_MapScripts:
	db 3 ; scene scripts
	scene_script .DummyScene0 ; SCENE_PAVONAVILLAGE_NOTHING
	scene_script .DummyScene1 ; SCENE_PAVONAVILLAGE_MEET_RIVAL
	scene_script .DummyScene2 ; SCENE_PAVONAVILLAGE_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.DummyScene0:
	end

.DummyScene1:
	end
	
.DummyScene2:
	end

.FlyPoint:
	setflag ENGINE_FLYPOINT_PAVONA
	return
	
CherrygroveNoMonTop:
	showemote EMOTE_SHOCK, PAVONAVILLAGE_FISHER, 15
	applymovement PAVONAVILLAGE_FISHER, MovementData_FisherApproachTop
	turnobject PLAYER, LEFT
	opentext
	writetext CherrygroveCantGo
	waitbutton
	closetext
	follow PAVONAVILLAGE_FISHER, PLAYER
	applymovement PAVONAVILLAGE_FISHER, MovementData_FisherLeaveTop
	turnobject PLAYER, DOWN
	opentext
	writetext CherrygroveIrresponsible
	waitbutton
	closetext
	stopfollow	
	end
	
CherrygroveNoMonBottom:
	showemote EMOTE_SHOCK, PAVONAVILLAGE_FISHER, 15
	applymovement PAVONAVILLAGE_FISHER, MovementData_FisherApproachBottom
	turnobject PLAYER, LEFT
	opentext
	writetext CherrygroveCantGo
	waitbutton
	closetext
	follow PAVONAVILLAGE_FISHER, PLAYER
	applymovement PAVONAVILLAGE_FISHER, MovementData_FisherLeaveBottom
	turnobject PLAYER, DOWN
	opentext
	writetext CherrygroveIrresponsible
	waitbutton
	closetext
	stopfollow	
	end
	
CherrygroveYoungsterBattle:
	turnobject PAVONAVILLAGE_YOUNGSTER, LEFT
	showemote EMOTE_QUESTION, PAVONAVILLAGE_YOUNGSTER, 15
	applymovement PAVONAVILLAGE_YOUNGSTER, MovementData_YoungsterApproach
	turnobject PLAYER, RIGHT
	opentext
	writetext CherrygroveYoungsterChallenge
	playmusic MUSIC_YOUNGSTER_ENCOUNTER
	waitbutton
	writetext CherrygroveYoungsterLetMeSee
	waitbutton
	closetext
	winlosstext SchoolboyTimmyBeatenText, SchoolboyTimmyWinText
    loadtrainer SCHOOLBOY, TIMMY
	writecode VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_SCHOOLBOY_TIMMY
	opentext
	writetext SchoolboyTimmyAfterText
	waitbutton
	closetext
	applymovement PAVONAVILLAGE_YOUNGSTER, MovementData_YoungsterLeave
	special HealParty
	setscene SCENE_PAVONAVILLAGE_FINISHED
	end	

CherrygroveTeacherScript:
	jumptextfaceplayer CherrygroveTeacherText_HaveMapCard

CherrygroveYoungsterScript:
	faceplayer
	opentext
	writetext CherrygroveYoungsterNoMon
	waitbutton
	closetext
	end

CherrygroveFisherScript:
	faceplayer
	opentext
	writetext CherrygroveIrresponsible
	waitbutton
	closetext
	end

CherrygroveCitySign:
	jumptext CherrygroveCitySignText

GuideGentsHouseSign:
	jumptext GuideGentsHouseSignText
	
CherrygroveMailbox:
	jumpstd mailbox
	
CherrygroveInnSign:
	jumptext CherrygroveInnSignText

CherrygroveCityRock:
	jumpstd smashrock
	
MovementData_FisherApproachTop:
	run_step UP
	run_step UP
	run_step RIGHT
	run_step RIGHT
	run_step RIGHT
	step_end
	
MovementData_FisherApproachBottom:
	run_step UP
	run_step RIGHT
	run_step RIGHT
	run_step RIGHT
	step_end
	
MovementData_FisherLeaveTop:
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	turn_head UP
	step_end
	
MovementData_FisherLeaveBottom:
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	turn_head UP
	step_end
	
MovementData_YoungsterApproach:
	step LEFT
	step LEFT
	step LEFT
	step UP
	turn_head LEFT
	step_end
	
MovementData_YoungsterLeave:
	step RIGHT
	step RIGHT
	step RIGHT
	step DOWN
	step_resume
	
CherrygroveCantGo:
	text "Wait! You can't"
	line "go out there!"
	done
	
CherrygroveIrresponsible:	
	text "It would be really"
	line "irresponsible of"
	cont "me to let a kid"
	cont "past here alone."
	
	para "There are a lot"
	line "of trainers out"
	cont "there on Route 2."
	done
	
CherrygroveYoungsterChallenge:
	text "Hey! Did you just"
	line "get a #MON from"
	cont "MAPLE's lab?"
	
	para "That's so cool!"
	done
	
CherrygroveYoungsterLetMeSee:
	text "You have to let"
	line "me see it!"
	done
	
CherrygroveYoungsterNoMon:
	text "I wish I could get"
	line "a cool #MON"
	cont "from the LAB."
	
	para "I had to catch"
	line "my own!"
	done
	
CherrygroveScientistCantGoText:
	text "Hey! You can't go"
	line "any further all"
	cont "alone like that!"

	para "You need a"
	line "#MON partner!"

	para "Lots of trainers"
	line "and wild #MON"
	cont "reside on Route 2."
	done

SchoolboyTimmyBeatenText:
	text "Oh man, the"
	line "#MON you got is"
	cont "so strong!"
	done
	
SchoolboyTimmyWinText:
	text "Woohoo!"
	line "I knew my partner"
	cont "and I could do it!"
	done
	
SchoolboyTimmyAfterText:
	text "Someday my #MON"
	line "will be as strong"
	cont "as yours!"
	
	para "Until then, I will"
	line "train every day!"
	done
	
SilverCherrygroveWinText:
	text "Humph. Are you"
	line "happy you won?"
	done

CherrygroveRivalText_YouLost:
	text "<……> <……> <……>"

	para "My name's ???."

	para "I'm going to be"
	line "the world's great-"
	cont "est #MON"
	cont "trainer."
	done

SilverCherrygroveLossText:
	text "Humph. That was a"
	line "waste of time."
	done

CherrygroveRivalText_YouWon:
	text "<……> <……> <……>"

	para "My name's ???."

	para "I'm going to be"
	line "the world's great-"
	cont "est #MON"
	cont "trainer."
	done

CherrygroveTeacherText_NoMapCard:
	text "Did you talk to"
	line "the old man by the"
	cont "#MON CENTER?"

	para "He'll put a MAP of"
	line "JOHTO on your"
	cont "#GEAR."
	done

CherrygroveTeacherText_HaveMapCard:
	text "When you're with"
	line "#MON, going"
	cont "anywhere is fun."
	done

CherrygroveYoungsterText_NoPokedex:
	text "MR.#MON's house"
	line "is still farther"
	cont "up ahead."
	done

CherrygroveYoungsterText_HavePokedex:
	text "I battled the"
	line "trainers on the"
	cont "road."

	para "My #MON lost."
	line "They're a mess! I"

	para "must take them to"
	line "a #MON CENTER."
	done

MysticWaterGuyTextBefore:
	text "A #MON I caught"
	line "had an item."

	para "I think it's"
	line "MYSTIC WATER."

	para "I don't need it,"
	line "so do you want it?"
	done

MysticWaterGuyTextAfter:
	text "Back to fishing"
	line "for me, then."
	done

CherrygroveCitySignText:
	text "PAVONA VILLAGE"
	done

GuideGentsHouseSignText:
	text "MAPLE #MON LAB"
	done
	
CherrygroveInnSignText:
	text "PAVONA INN"
	
	para "Trainers stay"
	line "free!"
	done
	
PavonaVillage_MapEvents:
	db 0, 0 ; filler

	db 6 ; warp events
	warp_event 25, 23, PAVONA_GYM_SPEECH_HOUSE, 1
	warp_event 15, 11, ROUTE_1_PAVONA_GATE, 3
	warp_event 24, 15, MAPLES_LAB, 1
	warp_event  6, 13, UNION_CAVE_1F, 1
	warp_event  4,  3, HIDDEN_POWER_CAVE, 1
	warp_event 15, 21, PAVONA_INN, 1

	db 3 ; coord events
	coord_event 24, 16, SCENE_PAVONAVILLAGE_MEET_RIVAL, CherrygroveYoungsterBattle
	coord_event 33, 20, SCENE_PAVONAVILLAGE_NOTHING, CherrygroveNoMonTop
	coord_event 33, 21, SCENE_PAVONAVILLAGE_NOTHING, CherrygroveNoMonBottom
	
	db 4 ; bg events
	bg_event 17, 14, BGEVENT_READ, CherrygroveCitySign
	bg_event 23, 16, BGEVENT_READ, GuideGentsHouseSign
	bg_event 23, 23, BGEVENT_UP, CherrygroveMailbox
	bg_event 18, 21, BGEVENT_READ, CherrygroveInnSign

	db 5 ; object events
	object_event 19, 13, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CherrygroveTeacherScript, -1
	object_event 28, 17, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CherrygroveYoungsterScript, -1
	object_event 29, 22, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CherrygroveFisherScript, -1
	object_event  6, 15, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CherrygroveCityRock, -1
	object_event  7, 14, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CherrygroveCityRock, -1
	