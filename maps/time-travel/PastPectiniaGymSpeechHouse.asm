	const_def 2 ; object constants

PastPectiniaGymSpeechHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PastPectiniaGymSpeechHouseGymGuy:
	jumptextfaceplayer PastPectiniaGymSpeechHouseGymGuyText

PastPectiniaGymSpeechHouseBugCatcher:
	jumptextfaceplayer PastPectiniaGymSpeechHouseBugCatcherText

PastPectiniaGymSpeechHouseGymGuyText:
	text "I've heard talks of"
	line "Captain MURPHY"
	cont "using the SHERIFF's"
	cont "DEPARTMENT as a"
	cont "place to teach"
	cont "#MON training."

	para "Competitive battl-"
	line "ing has become"
	cont "very popular in"
	cont "other parts of the"
	cont "world."

	para "Attracting all"
	line "kinds of trainers"
	cont "would be great for"
	cont "our economy!"
	done

PastPectiniaGymSpeechHouseBugCatcherText:
	text "I love listening"
	line "to #MON battles"
	cont "on the radio."

	para "I hope I can watch"
	line "them for real some"
	cont "day soon!"
	done

PastPectiniaGymSpeechHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 2,  7, PAST_PECTINIA_CITY, 5
	warp_event 3,  7, PAST_PECTINIA_CITY, 5

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  2,  4, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PastPectiniaGymSpeechHouseGymGuy, -1
	object_event  6,  2, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PastPectiniaGymSpeechHouseBugCatcher, -1
