	const_def 2 ; object constants

SafariZoneArea1RestHouse_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .RestHouse
	
.RestHouse:
	setflag ENGINE_SAFARI_REST_HOUSE
	return
	
SafariArea1RestHouseReceptionist:
	jumptextfaceplayer SafariArea1RestHouseReceptionistText
	
SafariArea1RestHousePokefan:
	jumptextfaceplayer SafariArea1RestHousePokefanText
	
SafariArea1RestHouseLass:
	jumptextfaceplayer SafariArea1RestHouseLassText
	
SafariArea1RestHouseReceptionistText:
	text "Welcome to the"
	line "AREA 1 REST HOUSE."
	
	para "Feel free to stay"
	line "as long as you"
	cont "like."
	done
	
SafariArea1RestHousePokefanText:
	text "WAHOO!"
	line "I did it!"
	
	para "I finally caught a"
	line "CHANSEY all of my"
	cont "own!"
	
	para "And it was green!"
	line "I've never seen one"
	cont "like that."
	done
	
SafariArea1RestHouseLassText:
	text "Your step count"
	line "won't go down in-"
	cont "side a REST HOUSE."
	
	para "Trainers come here"
	line "for a break during"
	cont "their SAFARI GAME."
	done

SafariZoneArea1RestHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, SAFARI_ZONE_AREA_1, 3
	warp_event  3,  7, SAFARI_ZONE_AREA_1, 3

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  7,  1, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SafariArea1RestHouseReceptionist, -1
	object_event  4,  5, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SafariArea1RestHouseLass, -1
	object_event  3,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SafariArea1RestHousePokefan, -1
