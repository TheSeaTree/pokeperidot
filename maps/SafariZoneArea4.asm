	const_def 2 ; object constants

SafariZoneArea4_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SafariZoneArea4Sign:
	jumptext SafariZoneArea4SignText
	
SafariZoneArea4SignText:
	text "SAFARI ZONE-"
	line "AREA 4"
	done

SafariZoneArea4_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 1 ; bg events
	bg_event 13, 23, BGEVENT_READ, SafariZoneArea4Sign

	db 0 ; object events
