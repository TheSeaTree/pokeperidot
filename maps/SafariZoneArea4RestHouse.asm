	const_def 2 ; object constants

SafariZoneArea4RestHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SafariArea4RestHouseReceptionist:
	jumptextfaceplayer SafariArea4RestHouseReceptionistText
	
SafariArea4RestHouseSuperNerd:
	jumptextfaceplayer SafariArea4RestHouseSuperNerdText
	
SafariArea4RestHouseReceptionistText:
	text "Welcome to the"
	line "AREA 4 REST HOUSE."
	
	para "Feel free to stay"
	line "as long as you"
	cont "like."
	done
	
SafariArea4RestHouseSuperNerdText:
	text "I heard there is a"
	line "strong TM in this"
	cont "area."
	
	para "I was searching"
	line "for it, but I am"
	cont "at 0 steps."
	
	para "The WARDEN will"
	line "call me back to"
	cont "the gate if I"
	cont "leave this REST"
	cont "HOUSE."
	done

SafariZoneArea4RestHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, SAFARI_ZONE_AREA_4, 1
	warp_event  3,  7, SAFARI_ZONE_AREA_4, 1

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  7,  1, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SafariArea4RestHouseReceptionist, -1
	object_event  6,  5, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SafariArea4RestHouseSuperNerd, -1
