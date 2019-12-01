	const_def 2 ; object constants
	const ORCHIDMART_CLERK
	const ORCHIDMART_COOLTRAINER_M
	const ORCHIDMART_YOUNGSTER

OrchidMart_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

OrchidMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_ORCHID
	closetext
	end

OrchidMartCooltrainerMScript:
	jumptextfaceplayer OrchidMartCooltrainerMText
	end

OrchidMartYoungsterScript:
	jumptextfaceplayer OrchidMartYoungsterText

OrchidMartCooltrainerMText:
	text "They're fresh out"
	line "of # BALLS!"

	para "When will they get"
	line "more of them?"
	done

OrchidMartYoungsterText:
	text "When I was walking"
	line "in the grass, a"

	para "bug #MON poi-"
	line "soned my #MON!"

	para "I just kept going,"
	line "but then my"
	cont "#MON fainted."

	para "You should keep an"
	line "ANTIDOTE with you."
	done

OrchidMart_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, ORCHID_CITY, 3
	warp_event  3,  7, ORCHID_CITY, 3

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OrchidMartClerkScript, -1
	object_event  7,  6, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OrchidMartCooltrainerMScript, -1
	object_event  2,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OrchidMartYoungsterScript, -1
