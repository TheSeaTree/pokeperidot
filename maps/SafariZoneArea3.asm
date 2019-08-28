	const_def 2 ; object constants

SafariZoneArea3_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
SafariZoneTMSubmission:
	itemball TM_SUBMISSION

SafariZoneArea3Sign:
	jumptext SafariZoneArea3SignText
	
SafariZoneArea3SignText:
	text "SAFARI ZONE-"
	line "AREA 3"
	done

SafariZoneArea3_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 1 ; bg events
	bg_event  7, 25, BGEVENT_READ, SafariZoneArea3Sign

	db 1 ; object events
	object_event 19,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_SILVER, OBJECTTYPE_ITEMBALL, 0, SafariZoneTMSubmission, EVENT_GOT_TM_SUBMISSION
