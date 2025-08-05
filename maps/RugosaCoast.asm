	const_def 2 ; object constants
	const OLIVINECITY_SAILOR1
	const OLIVINECITY_YOUNGSTER
	const OLIVINECITY_BEAUTY
	const OLIVINECITY_SAILOR2
	const OLIVINECITY_MACHOKE
	const OLIVINECITY_OLIVINE_RIVAL
	const OLIVINECITY_TUTOR
	const OLIVINECITY_ITEMBALL
	const OLIVINECITY_ROCK1
	const OLIVINECITY_ROCK2
	const OLIVINECITY_ROCK3
	const OLIVINECITY_ROCK4
	const OLIVINECITY_ROCK5

RugosaCoast_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 0 ; callbacks

.DummyScene0:
	disappear OLIVINECITY_OLIVINE_RIVAL
	end

.DummyScene1:
	end

RugosaCoastRivalSceneTop:
	special FadeOutMusic
	playsound SFX_ENTER_DOOR
	appear OLIVINECITY_OLIVINE_RIVAL
	special StopPlayerRunning
	applymovement OLIVINECITY_OLIVINE_RIVAL, MovementData_0x1a88d2
	applymovement PLAYER, RugosaCoastPlayerPushedBack
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext RugosaCoastRivalText
	waitbutton
	closetext
	checkevent EVENT_GOT_SQUIRTLE_FROM_MAPLE
	iftrue .Totodile
	checkevent EVENT_GOT_BULBASAUR_FROM_MAPLE
	iftrue .Chikorita
	winlosstext RugosaCoastRivalWinText, RugosaCoastRivalLossText
	setlasttalked OLIVINECITY_OLIVINE_RIVAL
	loadtrainer RIVAL1, RIVAL1_4_TOTODILE
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .AfterBattle

.Totodile:
	winlosstext RugosaCoastRivalWinText, RugosaCoastRivalLossText
	setlasttalked OLIVINECITY_OLIVINE_RIVAL
	loadtrainer RIVAL1, RIVAL1_4_CHIKORITA
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .AfterBattle

.Chikorita:
	winlosstext RugosaCoastRivalWinText, RugosaCoastRivalLossText
	setlasttalked OLIVINECITY_OLIVINE_RIVAL
	loadtrainer RIVAL1, RIVAL1_4_CYNDAQUIL
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .AfterBattle

.AfterBattle:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext RugosaCoastRivalAfterText
	waitbutton
	closetext
	applymovement OLIVINECITY_OLIVINE_RIVAL, MovementData_0x1a88db
	setscene SCENE_FINISHED
	disappear OLIVINECITY_OLIVINE_RIVAL
	setevent EVENT_RIVAL_OLIVINE_CITY
	playmapmusic
	end

RugosaCoastSailor1Script:
	jumptextfaceplayer RugosaCoastSailor1Text

RugosaCoastStandingYoungsterScript:
	jumptextfaceplayer RugosaCoastYoungsterText
	
RugosaCoastBeautyScript:
	jumptextfaceplayer RugosaCoastBeautyText
	
RugosaCoastMoveTutor:
	faceplayer
	opentext
	writetext RugosaCoastTutorText
	waitbutton
	checkitem SILVER_LEAF
	iffalse .NoLeaf
	writetext RugosaCoastTutorTeach
	yesorno
	iftrue .IcyWind
	jump .Refused
	
.IcyWind
	writetext RugosaCoastTutorWhichOne
	buttonsound
	writebyte ICY_WIND
	special MoveTutor
	ifequal $0, .TeachMove
	jump .Refused
	
.TeachMove
	takeitem SILVER_LEAF
	writetext RugosaCoastTutorThankYou
	waitbutton
	closetext
	end
	
.Refused
	writetext RugosaCoastTutorRefused
	waitbutton
	closetext
	end
	
.NoLeaf
	writetext RugosaCoastTutorExplainGoldLeaf
	waitbutton
	closetext
	end

RugosaCoastSwimmer:
	jumptextfaceplayer RugosaCoastSwimmerText

RugosaCoastSailor2Script:
	jumptextfaceplayer RugosaCoastSailor2Text

RugosaCoastMachokeScript:
	opentext
	writetext RugosaCoastMachokeText
	cry MACHOKE
	waitbutton
	closetext
	end

RugosaCoastStarPiece:
	itemball STAR_PIECE

RugosaCoastHiddenMaxRevive:
	hiddenitem MAX_REVIVE, EVENT_OLIVINE_CITY_HIDDEN_MAX_REVIVE

RugosaCoastSmashRock:
	jumpstd smashrock

RugosaCoastSign:
	jumptext RugosaCoastSignText

RugosaCoastPortSign:
	jumptext RugosaCoastPortSignText

RugosaCoastLabSign:
	jumptext RugosaCoastLabSignText

RugosaCoastSurfHouseSign:
	jumptext RugosaCoastSurfHouseSignText

MovementData_0x1a88d2:
	step DOWN
	step_end
	
RugosaCoastPlayerPushedBack:
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

RugosaCoastRivalText:
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
	cont "get other BADGEs"
	cont "elsewhere."
	
	para "But you being in"
	line "the way is my"
	cont "problem."
	
	para "If you won't get"
	line "out of the way,"
	cont "I'll move you"
	cont "myself!"
	done
	
RugosaCoastRivalWinText:
	text "I never lose to"
	line "anyone! How does"
	cont "an amateur like"
	cont "you always get the"
	cont "upper hand?"
	done
	
RugosaCoastRivalLossText:
	text "Pathetic!"
	
	para "Even after all"
	line "this time you have"
	cont "learned nothing!"
	done
	
RugosaCoastRivalAfterText:
	text "…"
	done

RugosaCoastSailor1Text:
	text "I really needed a"
	line "break."
	
	para "Do me a favor,"
	line "kid."
	
	para "Become the best"
	line "trainer you can be"
	cont "so you don't have"
	cont "to lug around"
	cont "cargo every day."
	done

RugosaCoastYoungsterText:
	text "I wanted to visit"
	line "the beach to get"
	cont "away from all of"
	cont "the trainers."
	
	para "It's so much more"
	line "calm here."
	done
	
RugosaCoastBeautyText:
	text "Did PROF. MAPLE"
	line "give you a #-"
	cont "DEX?"
	
	para "Her dad gave me"
	line "mine when I bec-"
	cont "ame a trainer!"
	done

RugosaCoastSwimmerText:
	text "I can't stand the"
	line "guys who run the"
	cont "SURF HOUSE."

	para "They won't teach"
	line "anyone how to SURF"
	cont "unless they've"
	cont "earn more BADGEs"
	cont "than the owner."

	para "I'm no good at"
	line "#MON battles…"
	done

RugosaCoastSailor2Text:
	text "I love the sea!"
	
	para "But I like to get"
	line "my feet on solid"
	cont "ground to train"
	cont "and get stronger!"
	
	para "MACHOKE and I like"
	line "to break up any"
	cont "rocks that wash"
	cont "up on shore."
	done
	
RugosaCoastMachokeText:
	text "MACHOKE: Guooh"
	line "gogogoh!"
	done

RugosaCoastSignText:
	text "RUGOSA COAST"

	para "The Port of"
	line "Champions"
	done

RugosaCoastPortSignText:
	text "RUGOSA PORT"
	done

RugosaCoastLabSignText:
	text "MAPLE #MON LAB"
	done

RugosaCoastTutorText:
	text "Brr…"
	
	para "The w-water is so"
	line "c-c-cold today."
	
	para "I c-could teach"
	line "your P-P-#MON"
	cont "how c-cold it is"
	cont "in exchange for a"
	cont "SILVER LEAF."
	done

RugosaCoastTutorTeach:
	text "Would you like to"
	line "t-teach ICY WIND"
	cont "to your P-#MON?"
	done

RugosaCoastTutorWhichOne:
	text "Which #MON"
	line "should I t-tutor?"
	done

RugosaCoastTutorThankYou:
	text "Th-thank y-you!"
	
	para "I r-really should"
	line "have asked for a"
	cont "blanket instead."
	
	para "I'm sh-shivering!"
	done

RugosaCoastTutorRefused:
	text "Well, c-could you"
	line "g-get me something"
	cont "warmer to wear"
	cont "instead?"
	done

RugosaCoastTutorExplainGoldLeaf:
	text "S-sorry…"

	para "I c-can't t-teach"
	line "this move without"
	cont "a S-SILVER LEAF."
	done
	
RugosaCoastSurfHouseSignText:
	text "RUGOSA COAST"
	line "SURF HOUSE"
	
	para "Members only."
	done

RugosaCoast_MapEvents:
	db 0, 0 ; filler

	db 6 ; warp events
	warp_event  4, 14, ROUTE_13_RUGOSA_GATE, 3
	warp_event  4, 15, ROUTE_13_RUGOSA_GATE, 4
	warp_event 17,  5, RUGOSA_GATE, 3
	warp_event 13, 17, RUGOSA_SURF_HOUSE, 1
	warp_event 10, 11, COASTAL_LAB, 1
	warp_event 28, 11, RUGOSA_PORT, 1

	db 1 ; coord events
	coord_event 17,  6, SCENE_DEFAULT, RugosaCoastRivalSceneTop

	db 5 ; bg events
	bg_event 18, 14, BGEVENT_READ, RugosaCoastSign
	bg_event 26, 12, BGEVENT_READ, RugosaCoastPortSign
	bg_event  8, 12, BGEVENT_READ, RugosaCoastLabSign
	bg_event 12, 18, BGEVENT_READ, RugosaCoastSurfHouseSign
	bg_event 11, 27, BGEVENT_ITEM, RugosaCoastHiddenMaxRevive

	db 14 ; object events
	object_event 22, 11, SPRITE_SAILOR, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RugosaCoastSailor1Script, -1
	object_event 21, 16, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RugosaCoastStandingYoungsterScript, -1
	object_event 15, 12, SPRITE_BUENA, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RugosaCoastBeautyScript, -1
	object_event 14, 22, SPRITE_SAILOR, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RugosaCoastSailor2Script, -1
	object_event 13, 22, SPRITE_MACHOP, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RugosaCoastMachokeScript, -1
	object_event 17,  5, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_OLIVINE_CITY
	object_event 25, 24, SPRITE_SWIMMER_GIRL_LAND, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RugosaCoastMoveTutor, -1 ; Icy Wind tutor
	object_event 11, 17, SPRITE_SWIMMER_GUY_LAND, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RugosaCoastSwimmer, -1
	object_event  6, 29, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RugosaCoastStarPiece, EVENT_OLIVINE_CITY_STAR_PIECE
	object_event 15, 24, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RugosaCoastSmashRock, -1
	object_event 12, 25, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RugosaCoastSmashRock, -1
	object_event 11, 23, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RugosaCoastSmashRock, -1
	object_event  9, 25, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RugosaCoastSmashRock, -1
	object_event  8, 26, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RugosaCoastSmashRock, -1
