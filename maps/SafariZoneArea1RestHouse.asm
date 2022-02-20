	const_def 2 ; object constants

SafariZoneArea1RestHouse_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .RestHouse
	
.RestHouse:
	setflag ENGINE_EXP_ALL_ACTIVE
	return
	
SafariArea1RestHouseReceptionist:
	jumptextfaceplayer SafariArea1RestHouseReceptionistText
	
SafariArea1RestHouseCooltrainer
	jumptextfaceplayer SafariArea1RestHouseCooltrainerText
	
SafariArea1RestHouseLass:
	jumptextfaceplayer SafariArea1RestHouseLassText
	
SafariArea1RestHouseReceptionistText:
	text "Welcome to the"
	line "AREA 1 REST HOUSE."
	
	para "Feel free to stay"
	line "as long as you"
	cont "like."
	done
	
SafariArea1RestHouseCooltrainerText:
	text "I've heard rumors"
	line "of the SAFARI ZONE"
	cont "getting an expan-"
	cont "sion soon."
	
	para "They must be get-"
	line "ting new #MON"
	cont "for the park."
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
	object_event  3,  3, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SafariArea1RestHouseCooltrainer, -1
