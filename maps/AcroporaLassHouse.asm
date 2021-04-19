	const_def 2 ; object constants
	const ACROPORALASSHOUSE_LASS1
	const ACROPORALASSHOUSE_LASS2

AcroporaLassHouse_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .Lass

.Lass:
	checkevent EVENT_FLUTE_HIDEOUT_OPEN
	iffalse .NoAppear
	return

.NoAppear:
	moveobject ACROPORALASSHOUSE_LASS1,  -4, -4
	return

AcroporaLassHouseLass1:
	jumptextfaceplayer AcroporaLassHouseLass1Text

AcroporaLassHouseLass2:
	faceplayer
	opentext
	checkevent EVENT_FLUTE_HIDEOUT_OPEN
	iffalse .BeforeHideout
	writetext AcroporaLassHouseLass2AfterText
	waitbutton
	closetext
	end

.BeforeHideout
	writetext AcroporaLassHouseLass2Text
	waitbutton
	closetext
	end
	
AcroporaLassHouseLass1Text:
	text "I heard that you"
	line "beat the men who"
	cont "were blocking the"
	cont "way from STAGHORN"
	cont "TOWN."
	
	para "My friend doesn't"
	line "believe it, but"
	cont "I do!"
	
	para "Thank you for"
	line "doing that."
	done
	
AcroporaLassHouseLass2Text:
	text "I have a friend in"
	line "STAGHORN TOWN that"
	cont "is supposed to"
	cont "come visit today."
	
	para "…I wonder what"
	line "happened to her."
	done

AcroporaLassHouseLass2AfterText:
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

AcroporaLassHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, ACROPORA_CITY, 8
	warp_event  3,  7, ACROPORA_CITY, 8

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  2,  4, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AcroporaLassHouseLass1, -1
	object_event  5,  4, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, AcroporaLassHouseLass2, -1
