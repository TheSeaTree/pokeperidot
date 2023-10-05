	const_def 2 ; object constants
	const CIANWOODCHURCH_SAGE1
	const CIANWOODCHURCH_BURGLAR1
	const CIANWOODCHURCH_BURGLAR2
	const CIANWOODCHURCH_BURGLAR3
	const CIANWOODCHURCH_BURGLAR4
	const CIANWOODCHURCH_SAGE2

HepaticaChurch_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SageScript:
	opentext
	writetext Sage2Text
	waitbutton
	closetext
	applymovement CIANWOODCHURCH_SAGE2, Sage2Movement
	opentext
	writetext Sage2IntruderText
	waitbutton
	closetext
	applymovement CIANWOODCHURCH_SAGE2, Sage2Movement2
	applymovement CIANWOODCHURCH_BURGLAR1, Burglar1Approach
	playmusic MUSIC_HIKER_ENCOUNTER
	opentext
	writetext Burglar1Text
	waitbutton
	closetext
	winlosstext Burglar1WinText, 0
	loadtrainer BURGLAR, MARCUS
	startbattle
	reloadmapafterbattle
	ifnotequal $0, .Lost
	applymovement CIANWOODCHURCH_BURGLAR1, BurglarRetreat
	disappear CIANWOODCHURCH_BURGLAR1
	applymovement CIANWOODCHURCH_BURGLAR2, Burglar2Approach
	playmusic MUSIC_HIKER_ENCOUNTER
	opentext
	writetext Burglar2Text
	waitbutton
	closetext
	winlosstext Burglar2WinText, 0
	loadtrainer BURGLAR, HARVEY
	startbattle
	reloadmapafterbattle
	ifnotequal $0, .Lost
	applymovement CIANWOODCHURCH_BURGLAR2, BurglarRetreat
	disappear CIANWOODCHURCH_BURGLAR2
	applymovement CIANWOODCHURCH_BURGLAR3, Burglar3Approach
	playmusic MUSIC_HIKER_ENCOUNTER
	opentext
	writetext Burglar3Text
	waitbutton
	closetext
	winlosstext Burglar3WinText, 0
	loadtrainer BURGLAR, MANUEL
	startbattle
	reloadmapafterbattle
	ifnotequal $0, .Lost
	applymovement CIANWOODCHURCH_BURGLAR3, BurglarRetreat
	disappear CIANWOODCHURCH_BURGLAR3
	applymovement CIANWOODCHURCH_BURGLAR4, Burglar4Approach
	playmusic MUSIC_HIKER_ENCOUNTER
	opentext
	writetext Burglar4Text
	waitbutton
	closetext
	winlosstext Burglar4WinText, 0
	loadtrainer BURGLAR, SHAWN
	startbattle
	reloadmapafterbattle
	ifnotequal $0, .Lost
	applymovement CIANWOODCHURCH_BURGLAR4, BurglarRetreat
	disappear CIANWOODCHURCH_BURGLAR4
	applymovement CIANWOODCHURCH_SAGE2, Sage2Approach
	special HealParty
	playsound SFX_FULL_HEAL
	waitsfx
	opentext
	writetext Sage2AfterText
	waitbutton
	closetext
	follow CIANWOODCHURCH_SAGE2, PLAYER
	applymovement CIANWOODCHURCH_SAGE2, Sage2ApproachAltar
	stopfollow
	faceplayer
	opentext
	writetext Sage2GoAheadText
	waitbutton
	closetext
	turnobject CIANWOODCHURCH_SAGE2, DOWN
	applymovement PLAYER, PlayerApproachSage
	turnobject CIANWOODCHURCH_SAGE1, LEFT
	opentext
	writetext Sage1Text
	waitbutton
	closetext
	winlosstext Sage1WinText, 0
	loadtrainer EXECUTIVEM, ABBOT
	startbattle
	reloadmapafterbattle
	ifnotequal $0, .Lost
	opentext
	writetext Sage1AfterText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	pause 12
	disappear CIANWOODCHURCH_SAGE1
	disappear CIANWOODCHURCH_SAGE2
	setevent EVENT_CLEARED_CHURCH
	clearevent EVENT_CIANWOOD_FLY_GUY
	special FadeInQuickly
.Lost
	end

Burglar1:
	jumptextfaceplayer Burglar1BeforeText

Burglar2:
	jumptextfaceplayer Burglar2BeforeText

Burglar3:
	jumptextfaceplayer Burglar3BeforeText

Burglar4:
	jumptextfaceplayer Burglar4BeforeText
	
HepaticaChurchRevive:
	itemball REVIVE
	
Sage2Movement:
	step RIGHT
	step UP
	turn_head DOWN
	step_end
	
Sage2Movement2:
	step UP
	step UP
	step UP
	step UP
	step_end
	
Burglar3Approach:
	run_step LEFT
	run_step LEFT
	run_step UP
	run_step UP
	run_step LEFT
	run_step LEFT
	run_step LEFT
	step_end
	
Burglar2Approach:
	run_step UP
	run_step UP
	run_step UP
	run_step UP
	run_step UP
	run_step LEFT
	run_step LEFT
	run_step LEFT
	step_end
	
BurglarRetreat:
	run_step RIGHT
	run_step RIGHT
	run_step DOWN
	run_step DOWN
	run_step DOWN
	run_step DOWN
	run_step DOWN
	run_step DOWN
	step_end
	
Burglar1Approach:
	run_step UP
	run_step UP
	run_step UP
	run_step UP
	run_step UP
	run_step LEFT
	run_step LEFT
	step_end
	
Burglar4Approach:
	run_step RIGHT
	run_step RIGHT
	run_step RIGHT
	run_step RIGHT
	run_step RIGHT
	run_step UP
	run_step UP
	run_step UP
	run_step UP
	run_step LEFT
	run_step LEFT
	step_end
	
Sage2Approach:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step LEFT
	step_end
	
Sage2ApproachAltar:
	step RIGHT
	step UP
	step UP
	step UP
	step UP
	step RIGHT
	step_end
	
Sage1Talk:
	step RIGHT
	step DOWN
	step DOWN
	step LEFT
	step_end
	
PlayerApproachSage:
	step UP
	step UP
	step RIGHT
	step_end

Sage2Text:	
	text "My child, what"
	line "brings you to me?"
	
	para "Surely it isn't to"
	line "stop our job here."
	
	para "Go home, let the"
	line "grown-ups do their"
	cont "business."
	done
	
Sage2IntruderText:
	text "Take care of this"
	line "intruder!"
	done
	
Sage2BeforeText:
	text "This place has"
	line "been abandoned for"
	cont "years. It was the"
	cont "perfect place for"
	cont "our hideout."

	para "Until some little"
	line "brat mucked up our"
	cont "plans."
	done
	
Sage2WinText:
	text "I may be defeated,"
	line "but our boss will"
	cont "take care of you!"
	done
	
Sage2AfterText:
	text "Come…"
	line "He is waiting…"
	done
	
Sage2GoAheadText:
	text "Do not waste the"
	line "FATHER's time…"
	done

Sage1Text:
	text "The guards…"
	
	para "They were…"
	
	para "…Unworthy."
	done
	
Sage1WinText:
	text "……………"
	
	para "I…"
	
	para "…Am unworthy…"
	done
	
Sage1AfterText:
	text "Unworthy, indeed…"
	done
	
Burglar1BeforeText:
	text "How'd you get in"
	line "here?"
	
	para "Ah, who cares."
	line "All of the really"
	cont "valuable stuff is"
	cont "in the back."
	done

Burglar2BeforeText:
	text "This is quite the"
	line "haul, right?"
	
	para "Man, we have so"
	line "much more in our"
	cont "base on ROUTE 17."

	para "But we have that"
	line "place watched like"
	cont "a FEAROW."
	done

Burglar3BeforeText:
	text "A secret cave"
	line "entrance?"
	
	para "That's ridiculous!"
	
	para "You watch too many"
	line "movies, kid!"
	done

Burglar4BeforeText:
	text "Don't try anything"
	line "funny, you hear?"
	
	para "We'll give you"
	line "such a walloping"
	cont "if you do!"
	done

Burglar1Text:
	text "We are going to"
	line "make a killing on"
	cont "this gig!"
	done
	
Burglar1WinText:
	text "Don't think I'm"
	line "the only one you"
	cont "will battle."
	done
	
Burglar2Text:
	text "Don't be a hero,"
	line "kid. Just leave us"
	cont "to our work."
	done
	
Burglar2WinText:
	text "I really needed"
	line "the money from"
	cont "this job!"
	done
	
Burglar3Text:
	text "Are you getting"
	line "tired yet, little"
	cont "one?"
	done
	
Burglar3WinText:
	text "You may have won,"
	line "but at what cost?"
	done
	
Burglar4Text:
	text "Hey! You're the"
	line "kid I bumped into"
	cont "outside!"
	done
	
Burglar4WinText:
	text "I should have put"
	line "you in your place"
	cont "then!"
	done

HepaticaChurch_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  6, 21, HEPATICA_TOWN, 6
	warp_event  7, 21, HEPATICA_TOWN, 6
	warp_event  1,  3, HEPATICA_CAVE_B1F, 4

	db 0 ; coord events

	db 0 ; bg events

	db 7 ; object events
	object_event  7, 0, SPRITE_ABBOT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_CLEARED_CHURCH
	object_event  6, 11, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Burglar1, EVENT_CLEARED_CHURCH
	object_event  7, 11, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Burglar2, EVENT_CLEARED_CHURCH
	object_event  9,  8, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Burglar3, EVENT_CLEARED_CHURCH
	object_event  1, 10, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Burglar4, EVENT_CLEARED_CHURCH
	object_event  4, 6, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SageScript, EVENT_CLEARED_CHURCH
	object_event  3, 3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, HepaticaChurchRevive, EVENT_CIANWOOD_CHURCH_REVIVE
