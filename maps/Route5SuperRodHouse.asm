	const_def 2 ; object constants
	const ROUTE5SUPERRODHOUSE_FISHING_GURU

Route5SuperRodHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route5SuperRodHouseFishingGuruScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_GOOD_ROD
	iftrue .GotSuperRod
	writetext OfferSuperRodText
	yesorno
	iffalse .Refused
	checkflag ENGINE_WAVEBADGE
	iffalse .DontHaveHiveBadge
	writetext GiveSuperRodText
	buttonsound
	verbosegiveitem GOOD_ROD
	iffalse .NoRoom
	setevent EVENT_GOT_GOOD_ROD
.GotSuperRod:
	writetext GaveSuperRodText
	waitbutton
	closetext
	end

.Refused:
	writetext DontWantSuperRodText
	waitbutton
.NoRoom:
	closetext
	end
.DontHaveHiveBadge
	writetext DontHaveHiveBadgeText
	waitbutton
	closetext
	end

SuperRodHouseBookshelf:
; unused
	jumpstd picturebookshelf

OfferSuperRodText:
	text "Welcome to"
	line "my home."

	para "I am the "
	line "FISHING GURU!"

	para "I can see that you"
	line "show interest"
	cont "in fishing."

	para "There's no doubt"
	line "in my mind at all!"

	para "So? I know I'm"
	line "right."
	done

GiveSuperRodText:
	text "Yes, yes. Just as"
	line "I thought!"

	para "Here, fishing fan!"
	line "Take this--it's a"
	cont "GOOD ROD."
	done

GaveSuperRodText:
	text "Try your hand at"
	line "fishing wherever"
	cont "there is water."

	para "Remember--you can"
	line "catch different"

	para "#MON using"
	line "different RODS."
	done

DontWantSuperRodText:
	text "Huh? My own eyes"
	line "deceived me?"
	done
	
DontHaveHiveBadgeText:
	text "Yes, yes. Just as"
	line "I thought!"
	
	para "…Unfortunately"
	line "I can't let you"
	cont "have this ROD just"
	cont "this moment."
	
	para "Come back with"
	line "the BADGE of a"
	cont "WATER-type leader."
	
	para "Then you may have"
	line "this GOOD ROD"
	cont "and share the joy"
	cont "of fishing!"
	done

Route5SuperRodHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, ROUTE_5, 1
	warp_event  3,  7, ROUTE_5, 1

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  5,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route5SuperRodHouseFishingGuruScript, -1
