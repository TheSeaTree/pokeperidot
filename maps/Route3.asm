	const_def 2 ; object constants
	const ROUTE3_LASS1
	const ROUTE3_YOUNGSTER1
	const ROUTE3_HIKER1
	const ROUTE3_GRANT
	const ROUTE3_HIKER3
	const ROUTE3_YOUNGSTER2
	const ROUTE3_NURSE
	const ROUTE3_CLEFAIRY
	const ROUTE3_HIKER4
	const ROUTE3_LASS2
	const ROUTE3_OMANYTE
	const ROUTE3_KABUTO
	
Route3_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
TrainerPicnickerCindy:
	trainer PICNICKER, CINDY, EVENT_BEAT_PICNICKER_CINDY, PicnickerCindyText, PicnickerCindyWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerCindyAfterText
	waitbutton
	closetext
	end	
	
TrainerCamperNate:
	trainer CAMPER, NATE, EVENT_BEAT_CAMPER_NATE, CamperNateText, CamperNateWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperNateAfterText
	waitbutton
	closetext
	end	

TrainerHikerEarl:
	trainer HIKER, EARL, EVENT_BEAT_HIKER_EARL, HikerEarlText, HikerEarlWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerEarlAfterText
	waitbutton
	closetext
	end	
	
TrainerHikerGrant:
	trainer HIKER, GRANT, EVENT_BEAT_HIKER_GRANT, HikerGrantText, HikerGrantWinText, 0, .Script

.Script:
;	endifjustbattled
	opentext
	checkevent EVENT_TAKE_FOSSIL
	iftrue .gotfossil
	writetext HikerGrantAfterText
	waitbutton
	closetext
	end	

.gotfossil
	writetext HikerGrantFossilTakenText
	waitbutton
	closetext
	end
	
TrainerHikerWarren:
	trainer HIKER, WARREN, EVENT_BEAT_HIKER_WARREN, HikerWarrenText, HikerWarrenWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerWarrenAfterText
	waitbutton
	closetext
	end	
	
TrainerCamperRalph:
	trainer CAMPER, RALPH, EVENT_BEAT_CAMPER_RALPH, CamperRalphText, CamperRalphWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperRalphAfterText
	waitbutton
	closetext
	end	
	
Route3HealerScript:
	faceplayer
	opentext
	writetext Route3HealerText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	special StubbedTrainerRankings_Healings
	playmusic MUSIC_HEAL
	special HealParty
	pause 60
	special FadeInQuickly
	special RestartMapMusic
	opentext
	writetext Route3HealerGoodLuckText
	waitbutton
	turnobject LAST_TALKED, UP
	pause 10
	turnobject LAST_TALKED, DOWN
	pause 10
	closetext
	end

Route3ClefableScript:
	opentext
	writetext Route3ClefableText
	cry CLEFABLE
	waitbutton
	closetext
	end
	
Route3MoveTutor:
	faceplayer
	opentext
	writetext Route3TutorText
	waitbutton
	checkitem SILVER_LEAF
	iffalse .NoLeaf
	writetext Route3TutorTeach
	yesorno
	iftrue .Growth
	jump .Refused
	
.Growth
	writetext Route3TutorWhichOne
	buttonsound
	writebyte GROWTH
	special MoveTutor
	ifequal $0, .TeachMove
	jump .Refused
	
.TeachMove
	takeitem SILVER_LEAF
	writetext Route3TutorThankYou
	waitbutton
	turnobject LAST_TALKED, RIGHT
	closetext
	end
	
.Refused
	writetext Route3TutorRefused
	waitbutton
	closetext
	end
	
.NoLeaf
	writetext Route3TutorExplainSilverLeaf
	waitbutton
	turnobject LAST_TALKED, DOWN
	closetext
	end
	
Route3SilverLeaf:
	hiddenitem SILVER_LEAF, EVENT_ROUTE_3_HIDDEN_SILVER_LEAF
	
Route3AttractGirl:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM_ATTRACT
	iftrue .GotAttract
	writetext Route3AttractGirlText
	waitbutton
	verbosegiveitem TM_ATTRACT
	setevent EVENT_GOT_TM_ATTRACT
	
.GotAttract
	writetext Route3ExplainAttract
	waitbutton
	closetext
	end
	
PickupHelixFossilEvent:
	opentext
	writetext TryTakeFossil
	yesorno
	iffalse .no
	verbosegiveitem HELIX_FOSSIL
	iffalse .no
	waitbutton
	closetext
	disappear ROUTE3_OMANYTE
	applymovement ROUTE3_GRANT, HikerGrantTakeDomeFossil
	opentext
	writetext HikerGrantSelectFossilText
	waitbutton
	writetext HikerGrantPickUpDomeFossil
	playsound SFX_ITEM
	waitsfx
	waitbutton
	closetext
	turnobject ROUTE3_GRANT, DOWN
	disappear ROUTE3_KABUTO
	setevent EVENT_TAKE_FOSSIL
	end
.no
	closetext
	end
	
PickupDomeFossilEvent:
	opentext
	writetext TryTakeFossil
	yesorno
	iffalse .no
	verbosegiveitem DOME_FOSSIL
	iffalse .no
	waitbutton
	closetext
	disappear ROUTE3_KABUTO
	applymovement ROUTE3_GRANT, HikerGrantTakeHelixFossil
	opentext
	writetext HikerGrantSelectFossilText
	waitbutton
	writetext HikerGrantPickUpHelixFossil
	playsound SFX_ITEM
	waitsfx
	waitbutton
	closetext
	turnobject ROUTE3_GRANT, RIGHT
	disappear ROUTE3_OMANYTE
	setevent EVENT_TAKE_FOSSIL
	end
.no
	closetext
	end
	
Route3FruitTree:
	fruittree FRUITTREE_ROUTE_3
	
Route3TrainerTipsSign:
	jumptext Route3TrainerTipsSignText
	
HikerGrantTakeHelixFossil:
	step DOWN
	step DOWN
	step DOWN
	turn_head RIGHT
	step_resume

HikerGrantTakeDomeFossil:
	step DOWN
	step RIGHT
	step RIGHT
	step DOWN
	turn_head DOWN
	step_end
	
PicnickerCindyText:
	text "My mom doesn't let"
	line "me play in caves."
	done
	
PicnickerCindyWinText:
	text "It would help if"
	line "could train in the"
	cont "caves."
	done
	
PicnickerCindyAfterText:
	text "Don't tell my mom"
	line "I lost our battle."
	done
	
CamperNateText:
	text "Camping is so much"
	line "fun with #MON"
	cont "by your side!"
	done
	
CamperNateWinText:
	text "Careful! You"
	line "almost knocked"
	cont "down my tent!"
	done

CamperNateAfterText:
	text "I'm camping out to"
	line "find a TEDDIURSA!"
	done

HikerEarlText:
	text "You're just one"
	line "stepping stone on"
	cont "my way to the top!"
	done

HikerEarlWinText:
	text "Taken down before"
	line "I could begin…"
	done

HikerEarlAfterText:
	text "You've really dis-"
	line "couraged me from"
	cont "climbing other"
	cont "mountains, kid."
	done

HikerGrantText:
	text "This isn't any"
	line "place for a kid to"
	cont "be playing around!"
	done

HikerGrantWinText:
	text "Careful! This is"
	line "my dig site!"
	done

HikerGrantAfterText:
	text "These are the"
	line "remains of ancient"
	cont "#MON that have"
	cont "been extinct for"
	cont "centuries."
	
	para "Since you beat me"
	line "fair and square,"
	cont "you can take one"
	cont "of them."
	done

HikerGrantSelectFossilText:
	text "I'll pick up this"
	line "other FOSSIL, just"
	cont "in case another"
	cont "child comes down"
	cont "here to disturb my"
	cont "work."
	done

HikerGrantPickUpHelixFossil:
	text "GRANT received"
	line "HELIX FOSSIL."
	done

HikerGrantPickUpDomeFossil:
	text "GRANT received"
	line "DOME FOSSIL."
	done

HikerGrantFossilTakenText:
	text "I hope to one day"
	line "learn what #MON"
	cont "lived like in the"
	cont "past."
	done

HikerWarrenText:
	text "I'm taking a short"
	line "rest before taking"
	cont "on this mountain."
	
	para "I'm sure I could"
	line "fit in a battle!"
	done

HikerWarrenWinText:
	text "My rest is going"
	line "to last longer"
	cont "than I thought…"
	done

HikerWarrenAfterText:
	text "My dad spent so"
	line "long carving out"
	cont "this path to"
	cont "PALEROCK MOUNTAIN."

	para "I'll make it to the"
	line "top."

	para "It's my destiny!"
	done

CamperRalphText:
	text "Hey! Don't try and"
	line "sneak up on my"
	cont "camp like that!"
	done
	
CamperRalphWinText:
	text "Fine, you can stay"
	line "here too."
	done

CamperRalphAfterText:
	text "I think I picked"
	line "the best spot on"
	cont "ROUTE 3. The view"
	cont "of the lake is"
	cont "wonderful."
	done

Route3TutorText:
	text "Howdy, stranger!"
	
	para "I'm a MOVE TUTOR."
	
	para "For the price of a"
	line "SILVER LEAF, I can"
	cont "teach one of your"
	cont "#MON a move"
	cont "called GROWTH."
	done
	
Route3TutorTeach:
	text "Would you like to"
	line "teach your #MON"
	cont "GROWTH?"
	done

Route3TutorRefused:
	text "I understand."

	para "It can be hard to"
	line "come by a SILVER"
	cont "LEAF."
	done

Route3TutorExplainSilverLeaf:
	text "When you find a"
	line "SILVER LEAF, feel"
	cont "free to find me"
	cont "again. You'll know"
	cont "where I'll be."
	done
	
Route3TutorWhichOne:
	text "Which #MON"
	line "should I tutor?"
	done
	
Route3TutorThankYou:
	text "Thanks a bunch!"
	
	para "Come see me again"
	line "if you find"
	cont "another SILVER"
	cont "LEAF."
	done

Route3TrainerTipsSignText:
	text "TRAINER TIPS"

	para "It is wise to"
	line "stock up on"
	cont "items before"
	cont "going on a long"
	cont "route."
	done

Route3GymText:
	text "Greetings!"
	
	para "It seems that you"
	line "are without a gym"
	cont "badge."
	
	para "That is no issue"
	line "at all, trainer!"
	
	para "I can see you are"
	line "one who seeks cha-"
	cont "llenges wherever"
	cont "you can find one!"

	para "To my right is an"
	line "open path."
	
	para "A series of routes"
	line "leading you to the"
	cont "ocean."

	para "Many trainers will"
	line "visit this gym for"
	cont "their second"
	cont "badge, but the"
	cont "leader welcomes"
	cont "challengers of all"
	cont "skill levels."
	done
	
Route3HealerText:
	text "Your #MON look"
	line "awfully tired."

	para "Please, let me"
	line "and CLEFABLE help."
	done
	
Route3HealerGoodLuckText:
	text "There!"

	para "Your #MON are"
	line "looking good!"

	para "Good luck!"
	done
	
Route3ClefableText:
	text "CLEFABLE: Pippi!"
	done
	
Route3AttractGirlText:
	text "…Snivel, hic…"

	para "I can't believe my"
	line "boyfriend would"
	cont "stand me up like"
	cont "this."

	para "He said to meet"
	line "him here for a"
	cont "date, but never"
	cont "showed up."

	para "I even got him a"
	line "present!"

	para "If he won't appre-"
	line "ciate me, then you"
	cont "can take it"
	cont "instead!"
	done
	
Route3ExplainAttract:
	text "That move will"
	line "make your #MON"
	cont "irresistible to"
	cont "#MON of the"
	cont "opposite gender."
	
	para "It won't work on"
	line "people, but it's"
	cont "sweet of you to"
	cont "try."
	done
	
TryTakeFossil:
	text "This looks like"
	line "the remains of an"
	cont "ancient #MON."
	
	para "Would you like to"
	line "pick it up?"
	done
	
Route3NoRoomForFossil:
	text "There's no room in"
	line "the BAG for it…"
	done
	
Route3_MapEvents:
	db 0, 0 ; filler

	db 10 ; warp events
	warp_event 43,  39, ROUTE_3_PECTINIA_GATE, 1
	warp_event 44,  39, ROUTE_3_PECTINIA_GATE, 2
	warp_event 42,  29, DIGLETTS_CAVE, 1
	warp_event 28,  31, DIGLETTS_CAVE, 2
	warp_event 28,   5, PALEROCK_MOUNTAIN_1F, 1
	warp_event 57,  14, ROUTE_3_ROUTE_4_GATE, 1
	warp_event 57,  15, ROUTE_3_ROUTE_4_GATE, 2
	warp_event  4,  34, ROUTE_2_GATE, 3
	warp_event  4,  35, ROUTE_2_GATE, 4
	warp_event 42,   7, PALEROCK_CAVE_1F, 2

	db 0 ; coord events

	db 2 ; bg events
	bg_event 42, 35, BGEVENT_READ, Route3TrainerTipsSign
	bg_event 10, 37, BGEVENT_ITEM, Route3SilverLeaf

	db 13 ; object events
	object_event 52, 28, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerPicnickerCindy, -1
	object_event 50, 15, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerCamperNate, -1
	object_event 21, 25, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerHikerEarl, -1
	object_event 30, 16, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerHikerGrant, -1
	object_event 12,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerHikerWarren, -1
	object_event  5, 14, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerCamperRalph, -1
	object_event  6, 31, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route3HealerScript, -1
	object_event  7, 31, SPRITE_CLEFAIRY, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route3ClefableScript, -1
	object_event 16, 37, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route3MoveTutor, -1
	object_event  0,  4, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route3AttractGirl, -1
	object_event 31, 19, SPRITE_OMANYTE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PickupHelixFossilEvent, EVENT_TAKE_FOSSIL
	object_event 32, 19, SPRITE_SHELLDER, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PickupDomeFossilEvent, EVENT_TAKE_FOSSIL
	object_event 52,  3, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route3FruitTree, -1
	