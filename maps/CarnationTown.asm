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
	
CarnationTeacherScript:
	jumptextfaceplayer CarnationTeacherText
	
CarnationTownSign:
	jumptext CarnationTownSignText
	
CarnationFloristSign:
	jumptext CarnationFloristSignText
	
CarnationZooSign:
	jumptext CarnationZooSignText
	
CarnationTownFruitTree:
	fruittree FRUITTREE_CARNATION_TOWN

CarnationPokecenterSign:
	jumpstd pokecentersign
	
CarnationMailbox:
	jumpstd mailbox
	
CarnationKidText:
	text "I'm not allowed to"
	line "go swimming in the"
	cont "pond alone."
	
	para "I just want to see"
	line "what's on the other"
	cont "side of it."
	done
	
CarnationLassText:
	text "It's surprising."
	
	para "This little town"
	line "is so quiet even"
	cont "with the SAFARI"
	cont "ZONE so close by."
	
	para "I'm thankful for"
	line "it. This town is"
	cont "perfect for me."
	done
	
CarnationTeacherText:
	text "Did you visit the"
	line "farm on ROUTE 15?"
	
	para "I go there all the"
	line "time. MOOMOO MILK"
	cont "is my favorite"
	cont "drink!"
	
	para "I could catch a"
	line "MILTANK of my own,"
	cont "but I like to sup-"
	cont "port small busin-"
	cont "esses."
	done
	
CarnationTownSignText:
	text "CARNATION TOWN"
	
	para "A quiet detour to"
	line "admire nature."
	done

CarnationFloristSignText:
	text "CARNATION FLORIST"

	para "Decorate your home"
	line "with our lovely"
	cont "plants."
	done

CarnationZooSignText:
	text "CARNATION ZOO-"
	line "SAFARI ZONE"
	done

CarnationTown_MapEvents:
	db 0, 0 ; filler

	db 7 ; warp events
	warp_event 27,  6, ROUTE_14_CARNATION_GATE, 1
	warp_event 27,  7, ROUTE_14_CARNATION_GATE, 2
	warp_event  4, 10, CARNATION_ZOO_GATE, 3
	warp_event  4, 11, CARNATION_ZOO_GATE, 4
	warp_event 11, 13, WOBBUFFET_HOUSE, 1
	warp_event 19,  5, CARNATION_POKECENTER_1F, 1
	warp_event 13,  7, CARNATION_FLOWER_SHOP, 1

	db 0 ; coord events

	db 5 ; bg events
	bg_event 16, 10, BGEVENT_READ, CarnationTownSign
	bg_event  9, 13, BGEVENT_UP, CarnationMailbox
	bg_event 12,  8, BGEVENT_READ, CarnationFloristSign
	bg_event  6,  9, BGEVENT_READ, CarnationZooSign
	bg_event 20,  5, BGEVENT_READ, CarnationPokecenterSign

	db 4 ; object events
	object_event 19, 12, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CarnationKidScript, -1
	object_event  9,  9, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 3, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CarnationLassScript, -1
	object_event 21,  8, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 3, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CarnationTeacherScript, -1
	object_event 27, 14, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CarnationTownFruitTree, -1
	