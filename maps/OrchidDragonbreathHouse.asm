	const_def 2 ; object constants

OrchidDragonbreathHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

OrchidDragonbreathTMGuy:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM_DRAGONBREATH
	iftrue .GotTM
	writetext OrchidDragonbreathTMGuyText
	waitbutton
	verbosegiveitem TM_DRAGONBREATH
	setevent EVENT_GOT_TM_DRAGONBREATH
.GotTM
	writetext OrchidDragonbreathTMGuyAfterText
	waitbutton
	closetext
	end

OrchidDragonbreathHouseBookshelf:
	jumpstd difficultbookshelf
	
OrchidDragonbreathTMGuyText:
	text "Has ENYA's GYM"
	line "given you trouble?"
	
	para "Take this TM,"
	line "and use it well."
	
	para "It is one of the"
	line "few moves that is"
	cont "powerful enough to"
	cont "pierce a DRAGON's"
	cont "scales."
	done
	
OrchidDragonbreathTMGuyAfterText:
	text "How ironic that a"
	line "DRAGON's own move"
	cont "will hurt one the"
	cont "most!"
	done

OrchidDragonbreathHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, ORCHID_CITY, 2
	warp_event  3,  7, ORCHID_CITY, 2

	db 0 ; coord events

	db 2 ; bg events
	bg_event  0,  1, BGEVENT_READ, OrchidDragonbreathHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, OrchidDragonbreathHouseBookshelf

	db 1 ; object events
	object_event  2,  3, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, OrchidDragonbreathTMGuy, -1
