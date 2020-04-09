	const_def 2 ; object constants
	const BLACKTHORNLASSHOUSE_LASS1
	const BLACKTHORNLASSHOUSE_LASS2

BlackthornLassHouse_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .Lass

.Lass:
	checkevent EVENT_FLUTE_HIDEOUT_OPEN
	iffalse .NoAppear
	return

.NoAppear:
	moveobject BLACKTHORNLASSHOUSE_LASS1,  -4, -4
	return

BlackthornLassHouseLass2:
	jumptextfaceplayer BlackthornLassHouseLass2Text
	
BlackthornLassHouseLass2Text:
	text "There were some"
	line "shady men blocking"
	cont "the path. They"
	cont "wouldn't let my"
	cont "friend pass."
	
	para "You say that was"
	line "you who made them"
	cont "leave?"
	
	para "No way! Don't lie"
	line "to me."
	done

BlackthornLassHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, BLACKTHORN_CITY, 8
	warp_event  3,  7, BLACKTHORN_CITY, 8

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  2,  4, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  5,  4, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BlackthornLassHouseLass2, -1
