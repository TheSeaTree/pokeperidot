	const_def 2 ; object constants

PastRoute11Schoolhouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PastRoute11SchoolhouseTeacher:
	faceplayer
	opentext
	checkevent EVENT_DEFEATED_SCHOOLHOUSE_TEACHER
	iftrue .After
	checkevent EVENT_INTRODUCED_SCHOOLHOUSE_TEACHER
	iftrue .Introduced
	writetext PastRoute11SchoolhouseTeacherIntroText
	; This event will "activate" all of the students for battle.
	setevent EVENT_INTRODUCED_SCHOOLHOUSE_TEACHER
	waitbutton
	closetext
	end

.Introduced
	writetext PastRoute11SchoolhouseTeacherWaitingText
	waitbutton
	closetext
	end

.Battle
	; Replace the Kanto gym flags and check them here.
	writetext PastRoute11SchoolhouseTeacherChallengeText
	setevent EVENT_DEFEATED_SCHOOLHOUSE_TEACHER
	waitbutton
.After
	writetext PastRoute11SchoolhouseTeacherAfterText
	waitbutton
	closetext
	end

PastRoute11SchoolhouseEmptyDesk:
	jumptext PastRoute11SchoolhouseEmptyDeskText

PastRoute11SchoolhouseChalkboard:
	jumptext PastRoute11SchoolhouseChalkboardText

PastRoute11SchoolhouseTeacherIntroText:
	text ""
	done

PastRoute11SchoolhouseTeacherWaitingText:
	text "You train #MON,"
	line "right?"

	para "You're perfect to"
	line "test how much my"
	cont "students have"
	cont "learned from me!"
	done

PastRoute11SchoolhouseTeacherChallengeText:
	text "Oh my! You've won"
	line "against all of my"
	cont "students!"
	done

PastRoute11SchoolhouseTeacherAfterText:
	text "Is every trainer"
	line "from your hometown"
	cont "as strong as you?"

	para "We have so much to"
	line "learn, class!"
	done

PastRoute11SchoolhouseEmptyDeskText:
	text "There are lots of"
	line "papers left inside"
	cont "this desk."
	done

PastRoute11SchoolhouseChalkboardText:
	text "The board is full"
	line "of battle theory"
	cont "and charts."
	done

PastRoute11Schoolhouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  5,  9, PAST_ROUTE_11, 3
	warp_event  6,  9, PAST_ROUTE_11, 3

	db 0 ; coord events

	db 3 ; bg events
	bg_event 6, 6, BGEVENT_UP, PastRoute11SchoolhouseEmptyDesk
	bg_event  6,  0, BGEVENT_UP, PastRoute11SchoolhouseChalkboard
	bg_event  5,  0, BGEVENT_UP, PastRoute11SchoolhouseChalkboard

	db 8 ; object events
	object_event  5,  3, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, 7, 15, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, PastRoute11SchoolhouseTeacher, -1
	object_event  4,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 1, 0, 7, 15, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  2,  7, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 1, 0, 7, 15, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  8,  5, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_UP, 1, 0, 7, 15, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  4,  5, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_UP, 1, 0, 7, 15, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  2,  5, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_UP, 1, 0, 7, 15, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  8,  7, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 1, 0, 7, 15, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  6,  5, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_UP, 1, 0, 7, 15, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
