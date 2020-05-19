	const_def 2 ; object constants

AzaleaGymSpeechHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
AzaleaGymSpeechGuy:
	jumptextfaceplayer AzaleaGymSpeechText
	
AzaleaGymSpeechText:
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

AzaleaGymSpeechHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, AZALEA_TOWN, 12
	warp_event  3,  7, AZALEA_TOWN, 12

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  2, 4, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaGymSpeechGuy, -1
