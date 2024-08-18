	const_def 2 ; object constants

AcroporaCastleHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

AcroporaCastleHouseSuperNerd:
	jumptextfaceplayer AcroporaCastleHouseSuperNerdText
	
AcroporaCastleHouseSuperNerdText:
	text "Have you heard the"
	line "rumors of the gold"
	cont "castle on ROUTE"
	cont "19?"
	
	para "I tried to find it"
	line "once, but I got"
	cont "lost in a maze of"
	cont "trees."
	
	para "I was exhausted,"
	line "and was about to"
	cont "collapse when a"
	cont "brilliant light"
	cont "shone in the sky!"
	
	para "Next thing I knew,"
	line "I was at the entr-"
	cont "ance of the maze,"
	cont "but I felt great!"
	
	para "I don't know what"
	line "is really on ROUTE"
	cont "19, but I can say"
	cont "it is something"
	cont "truly magical!"
	done

AcroporaCastleHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, ACROPORA_CITY, 9
	warp_event  3,  7, ACROPORA_CITY, 9

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  5,  4, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, AcroporaCastleHouseSuperNerd, -1
