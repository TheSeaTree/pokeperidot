	const_def 2 ; object constants
	const ROUTE10_CLEANSE_TAG_GUY

Route10CleanseTagHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route10CleanseTagScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_CLEANSE_TAG
	iftrue .GotCleanseTag
	writetext GiveCleanseTagText
	buttonsound
	verbosegiveitem CLEANSE_TAG
	iffalse .NoRoom
	setevent EVENT_GOT_CLEANSE_TAG
.GotCleanseTag:
	writetext GaveCleanseTagText
	waitbutton
	closetext
	end

.NoRoom:
	writetext NoRoomForCleanseTagText
	waitbutton
	closetext
	end

GiveCleanseTagText:
	text "Have you heard the"
	line "rumors of a spirit"
	cont "that wanders this"
	cont "route?"
	
	para "I swear, they are"
	line "true! But I have"
	cont "expelled it using"
	cont "one of my many"
	cont "CLEANSE TAGs!"
	
	para "Here, you should"
	line "take one just for"
	cont "precaution!"
	done

GaveCleanseTagText:
	text "That CLEANSE TAG"
	line "will ward off any"
	cont "malicious spirits."
	
	para "I believe wild"
	line "#MON will be"
	cont "less likely to"
	cont "approach you if"
	cont "one of your"
	cont "#MON holds it"
	cont "as well."
	done

NoRoomForCleanseTagText:
	text "Oh, is your pack"
	line "full?"
	
	para "Make some room and"
	line "come back."
	done

Route10CleanseTagHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, ROUTE_10, 5
	warp_event  3,  7, ROUTE_10, 5

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  5,  3, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Route10CleanseTagScript, -1
