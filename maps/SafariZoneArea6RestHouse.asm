	const_def 2 ; object constants

SafariZoneArea6RestHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
SafariArea6RestHouseReceptionist:
	jumptextfaceplayer SafariArea5RestHouseReceptionistText

SafariArea6RestHouseGramps:
	opentext
	checkevent EVENT_GOT_SAFARI_PACK
	iftrue .GotPack
	writetext SafariArea6RestHouseGrampsBeforeText
	waitbutton
	verbosegiveitem SAFARI_PACK
	setevent EVENT_GOT_SAFARI_PACK
	writetext SafariArea6RestHouseGrampsGivePackText
	waitbutton
	closetext
	end

.GotPack
	writetext SafariArea6RestHouseGrampsAfterText
	waitbutton
	closetext
	end

SafariArea6RestHouseReceptionistText:
	text "Welcome to the"
	line "AREA 6 REST HOUSE."
	
	para "Feel free to stay"
	line "as long as you"
	cont "like."
	done

SafariArea6RestHouseGrampsBeforeText:
	text "Hey, youngster!"
	
	para "I can tell by just"
	line "looking at you"
	cont "that you're pretty"
	cont "active outdoors."
	
	para "Just the kind of"
	line "person I want to"
	cont "trust with this!"
	done

SafariArea6RestHouseGrampsGivePackText:
	text "I thought I could"
	line "make really good"
	cont "use of that SAFARI"
	cont "PACK, but those"
	cont "extra steps are"
	cont "just too much for"
	cont "me at this age."

	para "By the way, the"
	line "SAFARI PACK won't"
	cont "let you use any"
	cont "extra steps until"
	cont "the next time you"
	cont "start a SAFARI."
	done
	
SafariArea6RestHouseGrampsAfterText:
	text "I really gotta"
	line "rest my tired old"
	cont "bones here for a"
	cont "little while."
	done

SafariZoneArea6RestHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, SAFARI_ZONE_AREA_6, 1
	warp_event  3,  7, SAFARI_ZONE_AREA_6, 1

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  7,  1, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SafariArea6RestHouseReceptionist, -1
	object_event  3,  3, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SafariArea6RestHouseGramps, -1
