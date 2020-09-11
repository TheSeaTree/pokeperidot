	const_def 2 ; object constants

CarnationTown_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint
	
.FlyPoint:
	setflag ENGINE_FLYPOINT_CARNATION
	return
	
CarnationKidScript:
	jumptextfaceplayer CarnationKidText
	
CarnationLassScript:
	jumptextfaceplayer CarnationLassText
	
CarnationFloristSign:
	jumptext CarnationFloristSignText
	
CarnationPokecenterSign:
	jumpstd pokecentersign
	
CarnationMailbox:
	jumpstd mailbox
	
CarnationKidText:
	text "I'm not allowed to"
	line "go swimming in the"
	cont "pond alone."
	done
	
CarnationLassText:
	text "It's surprising"
	line "this little town"
	cont "can still be so"
	cont "quiet with the"
	cont "SAFARI ZONE right"
	cont "next door."
	
	para "I'm thankful for"
	line "it. This town is"
	cont "perfect for me."
	done
	
CarnationFloristSignText:
	text "CARNATION FLORIST"
	
	para "Decorate your home"
	line "with our lovely"
	cont "plants."
	done

CarnationTown_MapEvents:
	db 0, 0 ; filler

	db 7 ; warp events
	warp_event 27,  6, ROUTE_18, 3
	warp_event 27,  7, ROUTE_18, 4
	warp_event  4, 10, CARNATION_ZOO, 1
	warp_event  4, 11, CARNATION_ZOO, 2
	warp_event 11, 13, WOBBUFFET_HOUSE, 1
	warp_event 19,  5, CARNATION_POKECENTER_1F, 1
	warp_event 13,  7, CARNATION_FLOWER_SHOP, 1

	db 0 ; coord events

	db 3 ; bg events
	bg_event  9, 13, BGEVENT_UP, CarnationMailbox
	bg_event 12,  8, BGEVENT_UP, CarnationFloristSign
	bg_event 20,  5, BGEVENT_READ, CarnationPokecenterSign

	db 2 ; object events
	object_event 19, 12, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CarnationKidScript, -1
	object_event  9,  9, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 3, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CarnationLassScript, -1
	