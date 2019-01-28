	const_def 2 ; object constants
	const ROUTE3_LASS
	const ROUTE3_HIKER1
	const ROUTE3_HIKER2
	const ROUTE3_HIKER3
	const ROUTE3_GUIDE
	const ROUTE3_ROCK1
	const ROUTE3_ROCK2
	
Route3_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
AerodactylAndRepels:
	faceplayer
	opentext
	givepoke AERODACTYL, 20
	giveitem MAX_REPEL, 99
	giveitem ULTRA_BALL, 99
	closetext
	end

Route3Rock:
	jumpstd smashrock
	
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
	endifjustbattled
	opentext
	writetext HikerGrantAfterText
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
	
Route3TrainerTipsSign:
	jumptext Route3TrainerTipsSignText
	
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
	cont "climing other"
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
	text "I'm always on the"
	line "lookout for"
	cont "fossils of ancient"
	cont "#MON!"
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
	text "At least this lake"
	line "is a beautiful"
	cont "sight."
	done
	
CamperRalphText:
	text "I am a #MON"
	line "trainer."
	done
	
CamperRalphWinText:
	text "I lost."
	done

CamperRalphAfterText:
	text "I lost."
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
	
Route3_MapEvents:
	db 0, 0 ; filler

	db 10 ; warp events
	warp_event 43,  39, ROUTE_3_AZALEA_GATE, 1
	warp_event 44,  39, ROUTE_3_AZALEA_GATE, 2
	warp_event 44,  29, DIGLETTS_CAVE, 1
	warp_event 28,  31, DIGLETTS_CAVE, 2
	warp_event 28,   5, PALEROCK_MOUNTAIN_1F, 1
	warp_event 57,  14, ROUTE_3_ROUTE_4_GATE, 1
	warp_event 57,  15, ROUTE_3_ROUTE_4_GATE, 2
	warp_event  4,  34, ROUTE_2_GATE, 3
	warp_event  4,  35, ROUTE_2_GATE, 4
	warp_event 42,   7, PALEROCK_CAVE_1F, 2

	db 0 ; coord events

	db 1 ; bg events
	bg_event 43, 35, BGEVENT_READ, Route3TrainerTipsSign

	db 10 ; object events
	object_event 52, 28, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerPicnickerCindy, -1
	object_event 50, 15, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerCamperNate, -1
	object_event 21, 25, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerHikerEarl, -1
	object_event 32, 17, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerHikerGrant, -1
	object_event 12,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerHikerWarren, -1
	object_event  5, 14, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerCamperRalph, -1
	object_event 15,  9, SPRITE_ROCK, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route3Rock, -1
	object_event 16,  8, SPRITE_ROCK, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route3Rock, -1
	object_event  6, 31, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route3HealerScript, -1
	object_event  7, 31, SPRITE_CLEFAIRY, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route3ClefableScript, -1
	