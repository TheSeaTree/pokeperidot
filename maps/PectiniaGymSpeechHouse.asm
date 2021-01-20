	const_def 2 ; object constants

PectiniaGymSpeechHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
PectiniaGymSpeechGuy:
	jumptextfaceplayer PectiniaGymSpeechText
	
PectiniaGymSpeechText:
	text "Trainers from"
	line "other regions find"
	cont "GYM challenges"
	cont "here difficult."
	
	para "Not being able to"
	line "leave and heal"
	cont "their #MON is"
	cont "a new concept to"
	cont "them."
	done

PectiniaGymSpeechHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, PECTINIA_CITY, 12
	warp_event  3,  7, PECTINIA_CITY, 12

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  2, 4, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PectiniaGymSpeechGuy, -1
