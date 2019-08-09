	const_def 2 ; object constants

SafariZoneArea2_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SafariZoneArea2Sign:
	jumptext SafariZoneArea2SignText
	
SafariZoneArea2SignText:
	text "SAFARI ZONE-"
	line "AREA 2"
	done

SafariZoneArea2_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 1 ; bg events
	bg_event  8, 22, BGEVENT_READ, SafariZoneArea2Sign

	db 0 ; object events
