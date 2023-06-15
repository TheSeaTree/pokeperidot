	const_def 2 ; object constants

PastPectiniaGym_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PastPectiniaGymOfficer:
	jumptextfaceplayer PastPectiniaGymOfficerText

PastPectiniaGymReceptionist:
	jumptextfaceplayer PastPectiniaGymReceptionistText

PastPectiniaGymOfficerText:
	text "The boss is always"
	line "out training his"
	cont "#MON to better"
	cont "take on criminals."

	para "I try to tell him"
	line "that nobody causes"
	cont "problems in this"
	cont "city, but he won't"
	cont "hear any of it."

	para "Just the occasion-"
	line "al punk kid who"
	cont "gets a little too"
	cont "rowdy."
	done

PastPectiniaGymReceptionistText:
	text "Welcome to the"
	line "PECTINIA SHERIFF's"
	cont "DEPARTMENT."

	para "Captain MURPHY is"
	line "not here at the"
	cont "moment, but may I"
	cont "schedule an appoi-"
	cont "ntment for later?"
	done

PastPectiniaGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 19, PAST_PECTINIA_CITY, 8
	warp_event  5, 19, PAST_PECTINIA_CITY, 8

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  7,  4, SPRITE_OFFICER_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PastPectiniaGymOfficer, -1
	object_event  4, 11, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PastPectiniaGymReceptionist, -1
	object_event  2,  1, SPRITE_ROCKER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
