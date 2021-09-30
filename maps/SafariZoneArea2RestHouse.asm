	const_def 2 ; object constants

SafariZoneArea2RestHouse_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .RestHouse
	
.RestHouse:
	setflag ENGINE_SAFARI_REST_HOUSE
	return
	
SafariArea2RestHouseReceptionist:
	jumptextfaceplayer SafariArea2RestHouseReceptionistText

SafariArea2RestHouseLass:
	jumptextfaceplayer SafariArea2RestHouseLassText

SafariArea2RestHouseHiker:
	jumptextfaceplayer SafariArea2RestHouseHikerText
	
SafariArea2RestHouseReceptionistText:
	text "Welcome to the"
	line "AREA 2 REST HOUSE."
	
	para "Feel free to stay"
	line "as long as you"
	cont "like."
	done

SafariArea2RestHouseLassText:
	text "I think #MON"
	line "like to hide in"
	cont "the really tall"
	cont "grass more than"
	cont "anywhere else."
	
	para "They pop out much"
	line "more frequently"
	cont "here than in the"
	cont "other AREAs."
	done

SafariArea2RestHouseHikerText:
	text "I tried climing"
	line "ledges in this"
	cont "AREA, but was"
	cont "scolded by the"
	cont "WARDEN."
	
	para "He can see the"
	line "whole park, it"
	cont "seems. Must be"
	cont "how he knows your"
	cont "time runs out."
	done

SafariZoneArea2RestHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, SAFARI_ZONE_AREA_2, 1
	warp_event  3,  7, SAFARI_ZONE_AREA_2, 1

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  7,  1, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SafariArea2RestHouseReceptionist, -1
	object_event  6,  5, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SafariArea2RestHouseLass, -1
	object_event  2,  4, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 3, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SafariArea2RestHouseReceptionist, -1
