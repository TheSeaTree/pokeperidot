	const_def 2 ; object constants

SafariZoneArea3_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

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

	db 0 ; object events
