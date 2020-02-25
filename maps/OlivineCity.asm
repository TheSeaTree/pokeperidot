	const_def 2 ; object constants
	const OLIVINECITY_SAILOR1
	const OLIVINECITY_STANDING_YOUNGSTER
	const OLIVINECITY_SAILOR2
	const OLIVINECITY_OLIVINE_RIVAL

OlivineCity_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.DummyScene0:
	disappear OLIVINECITY_OLIVINE_RIVAL
	end

.DummyScene1:
	end

.FlyPoint:
	setflag ENGINE_FLYPOINT_OLIVINE
	return

OlivineCityRivalSceneTop:
	special FadeOutMusic
	playsound SFX_ENTER_DOOR
	appear OLIVINECITY_OLIVINE_RIVAL
	applymovement OLIVINECITY_OLIVINE_RIVAL, MovementData_0x1a88d2
	applymovement PLAYER, OlivineCityPlayerPushedBack
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext OlivineCityRivalText
	waitbutton
	closetext
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftrue .Totodile
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue .Chikorita
	winlosstext OlivineCityRivalWinText, OlivineCityRivalLossText
	setlasttalked OLIVINECITY_OLIVINE_RIVAL
	loadtrainer RIVAL1, RIVAL1_4_TOTODILE
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .AfterBattle

.Totodile:
	winlosstext OlivineCityRivalWinText, OlivineCityRivalLossText
	setlasttalked OLIVINECITY_OLIVINE_RIVAL
	loadtrainer RIVAL1, RIVAL1_4_CHIKORITA
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .AfterBattle

.Chikorita:
	winlosstext OlivineCityRivalWinText, OlivineCityRivalLossText
	setlasttalked OLIVINECITY_OLIVINE_RIVAL
	loadtrainer RIVAL1, RIVAL1_4_CYNDAQUIL
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .AfterBattle

.AfterBattle:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext OlivineCityRivalAfterText
	waitbutton
	closetext
	applymovement OLIVINECITY_OLIVINE_RIVAL, MovementData_0x1a88db
	setscene SCENE_FINISHED
	disappear OLIVINECITY_OLIVINE_RIVAL
	setevent EVENT_RIVAL_OLIVINE_CITY
	playmapmusic
	end

OlivineCitySailor1Script:
	jumptextfaceplayer OlivineCitySailor1Text

OlivineCityStandingYoungsterScript:
	faceplayer
	opentext
	random 2
	ifequal 0, .FiftyFifty
	writetext OlivineCityStandingYoungsterPokegearText
	waitbutton
	closetext
	end

.FiftyFifty:
	writetext OlivineCityStandingYoungsterPokedexText
	waitbutton
	closetext
	end
	
OlivineCityMoveTutor:
	faceplayer
	opentext
	writetext OlivineCityTutorText
	waitbutton
	checkitem SILVER_LEAF
	iffalse .NoLeaf
	writetext OlivineCityTutorTeach
	yesorno
	iftrue .IcyWind
	jump .Refused
	
.IcyWind
	writetext OlivineCityTutorWhichOne
	buttonsound
	writebyte ICY_WIND
	special MoveTutor
	ifequal $0, .TeachMove
	jump .Refused
	
.TeachMove
	takeitem SILVER_LEAF
	writetext OlivineCityTutorThankYou
	waitbutton
	closetext
	end
	
.Refused
	writetext OlivineCityTutorRefused
	waitbutton
	closetext
	end
	
.NoLeaf
	writetext OlivineCityTutorExplainGoldLeaf
	waitbutton
	closetext
	end

OlivineCitySailor2Script:
	jumptextfaceplayer OlivineCitySailor2Text

OlivineCitySign:
	jumptext OlivineCitySignText

OlivineCityPortSign:
	jumptext OlivineCityPortSignText

OlivineGymSign:
	jumptext OlivineGymSignText

OlivineLighthouseSign:
	jumptext OlivineLighthouseSignText

OlivineCityBattleTowerSign:
	jumptext OlivineCityBattleTowerSignText

OlivineCitySurfHouseSign:
	jumptext OlivineSurfHouseSignText

OlivineCityMartSign:
	jumpstd martsign

MovementData_0x1a88d2:
	step DOWN
	step_end
	
OlivineCityPlayerPushedBack:
	turn_head UP
	fix_facing
	step DOWN
	remove_fixed_facing
	step_end

MovementData_0x1a88d6:
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step_end

MovementData_0x1a88db:
	run_step LEFT
	run_step DOWN
	run_step DOWN
	run_step DOWN
	run_step DOWN
	run_step DOWN
	run_step DOWN
	step_end

OlivineCityRivalText:
	text "…"

	para "You again?"

	para "I'm only coming"
	line "down this way"
	cont "because the GYM"
	cont "isn't open right"
	cont "now."
	
	para "Something about"
	line "the POWER PLANT"
	cont "not producing"
	cont "enough energy."
	
	para "It's not my"
	line "problem, I can"
	cont "get other badges"
	cont "elsewhere."
	
	para "But you being in"
	line "the way is my"
	cont "problem."
	
	para "If you won't get"
	line "out of the way,"
	cont "I'll move you"
	cont "myself!"
	done
	
OlivineCityRivalWinText:
	text "I never lose to"
	line "anyone! How does"
	cont "an amateur like"
	cont "you always get the"
	cont "upper hand?"
	done
	
OlivineCityRivalLossText:
	text "Pathetic!"
	
	para "Even after all"
	line "this time you have"
	cont "learned nothing!"
	done
	
OlivineCityRivalAfterText:
	text "…"
	done

OlivineCitySailor1Text:
	text "Dark roads are"
	line "dangerous at"
	cont "night."

	para "But in the pitch-"
	line "black of night,"

	para "the sea is even"
	line "more treacherous!"

	para "Without the beacon"
	line "of the LIGHTHOUSE"

	para "to guide it, no"
	line "ship can sail."
	done

OlivineCityStandingYoungsterPokegearText:
	text "That thing you"
	line "have--it's a #-"
	cont "GEAR, right? Wow,"
	cont "that's cool."
	done

OlivineCityStandingYoungsterPokedexText:
	text "Wow, you have a"
	line "#DEX!"

	para "That is just so"
	line "awesome."
	done

OlivineCitySailor2Text:
	text "The sea is sweet!"

	para "Sunsets on the sea"
	line "are marvelous!"

	para "Sing with me! "
	line "Yo-ho! Blow the"
	cont "man down!…"
	done

OlivineCitySignText:
	text "OLIVINE CITY"

	para "The Port Closest"
	line "to Foreign Lands"
	done

OlivineCityPortSignText:
	text "OLIVINE PORT"
	line "FAST SHIP PIER"
	done

OlivineGymSignText:
	text "OLIVINE CITY"
	line "#MON GYM"
	cont "LEADER: JASMINE"

	para "The Steel-Clad"
	line "Defense Girl"
	done

OlivineLighthouseSignText:
	text "OLIVINE LIGHTHOUSE"
	line "Also known as the"
	cont "GLITTER LIGHTHOUSE"
	done

OlivineCityBattleTowerSignText:
	text "BATTLE TOWER AHEAD"
	line "Opening Now!"
	done

OlivineCityBattleTowerSignText_NotYetOpen:
; unused; originally shown when the Battle Tower was closed
	text "BATTLE TOWER AHEAD"
	done
	
OlivineCityTutorText:
	text "Brr…"
	
	para "The w-water is so"
	line "c-c-cold today."
	
	para "I c-could teach"
	line "your P-P-#MON"
	cont "how c-cold it is"
	cont "in exchange for a"
	cont "SILVER LEAF."
	done

OlivineCityTutorTeach:
	text "Would you like to"
	line "t-teach ICY WIND"
	cont "to your P-#MON?"
	done

OlivineCityTutorWhichOne:
	text "Which #MON"
	line "should I t-tutor?"
	done

OlivineCityTutorThankYou:
	text "Th-thank y-you!"
	
	para "I r-really should"
	line "have asked for a"
	cont "blanket instead."
	
	para "I'm sh-shivering!"
	done

OlivineCityTutorRefused:
	text "Well, c-could you"
	line "g-get me something"
	cont "warmer to wear"
	cont "instead?"
	done

OlivineCityTutorExplainGoldLeaf:
	text "S-sorry…"

	para "I c-can't t-teach"
	line "this move without"
	cont "a S-SILVER LEAF."
	done
	
OlivineSurfHouseSignText:
	text "CYNARIA COAST"
	line "SURF HOUSE"
	
	para "Members only."
	done

OlivineCity_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4, 14, ROUTE_14_OLIVINE_GATE, 3
	warp_event  4, 15, ROUTE_14_OLIVINE_GATE, 4
	warp_event 17,  5, MAHOGANY_GATE, 3
	warp_event 23, 11, OLIVINE_SURF_HOUSE, 1

	db 1 ; coord events
	coord_event 17,  6, SCENE_DEFAULT, OlivineCityRivalSceneTop

	db 7 ; bg events
	bg_event 18, 14, BGEVENT_READ, OlivineCitySign
	bg_event 22, 31, BGEVENT_READ, OlivineCityPortSign
	bg_event 25, 31, BGEVENT_READ, OlivineGymSign
	bg_event 23, 31, BGEVENT_READ, OlivineLighthouseSign
	bg_event 21, 31, BGEVENT_READ, OlivineCityBattleTowerSign
	bg_event 22, 12, BGEVENT_READ, OlivineCitySurfHouseSign
	bg_event 24, 31, BGEVENT_READ, OlivineCityMartSign

	db 5 ; object events
	object_event 12, 24, SPRITE_SAILOR, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineCitySailor1Script, -1
	object_event 20, 17, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OlivineCityStandingYoungsterScript, -1
	object_event 17, 25, SPRITE_SAILOR, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineCitySailor2Script, -1
	object_event 17,  5, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_OLIVINE_CITY
	object_event 36, 20, SPRITE_OLIVINE_RIVAL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineCityMoveTutor, -1 ; Icy Wind tutor
