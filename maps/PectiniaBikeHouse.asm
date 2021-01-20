	const_def 2 ; object constants

PectiniaBikeHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
PectiniaBikeDad:
	jumptextfaceplayer PectiniaBikeDadText
	
PectiniaBikeKid:
	faceplayer
	opentext
	checkevent EVENT_AZALEA_RETURNED_BIKE
	iftrue .ReturnedBike
	checkevent EVENT_AZALEA_BIKE_THIEF
	iftrue .AlreadyIntroduced
	writetext PectiniaBikeKidIntroText
	waitbutton
	closetext
	setevent EVENT_AZALEA_BIKE_THIEF
	end
	
.AlreadyIntroduced
	writetext PectiniaBikeKidText
	waitbutton
	closetext
	end

.ReturnedBike
	writetext PectiniaBikeKidNotMineText
	waitbutton
	closetext
	end
	
PectiniaBikeKidIntroText:
	text "Unbelievable!"
	
	para "I came home from"
	line "school today, and"	
	cont "my BICYCLE was"
	cont "gone!"
	
	para "We've always been"
	line "able to trust our"
	cont "stuff outside."
	done
	
PectiniaBikeKidText:
	text "Usually nothing"
	line "bad ever happens"
	cont "around here."

	para "This is the first"
	line "time anything has"
	cont "been stolen."
	done
	
PectiniaBikeKidNotMineText:
	text "You found a"
	line "BICYCLE?"
	
	para "…That's not mine."
	
	para "The guy you took"
	line "this from ran off?"
	
	para "You might as well"
	line "keep it if you"
	cont "can't find him."
	done

PectiniaBikeDadText:
	text "Whoever took my"
	line "son's BICYCLE is"
	cont "going to see stars"
	cont "when I catch him!"
	done
	
PectiniaBikeHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, PECTINIA_CITY, 13
	warp_event  3,  7, PECTINIA_CITY, 13
	
	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event   2,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PectiniaBikeDad, -1
	object_event   5,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PectiniaBikeKid, -1
	