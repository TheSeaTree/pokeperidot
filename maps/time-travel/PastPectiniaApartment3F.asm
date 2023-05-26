	const_def 2 ; object constants

PastPectiniaApartment3F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PastPectiniaApartments3FYoungster:


PastPectiniaApartments3FLass:
	faceplayer
	opentext
	writetext PastPectiniaApartments3FLass
	waitbutton
	closetext
	turnobject LAST_TALKED, UP
	end

PastPectiniaApartments3FYoungsterText:
	text "Our DAD just got"
	line "us this TV."

	para "Nobody else in town"
	line "has one."

	para "They always want"
	line "to come by and"
	cont "watch with us."
	done

PastPectiniaApartments3FLassText:
	text "TV is so much"
	line "better than the"
	cont "radio!"

	para "Now shhhh, please."

	para "I'm trying to watch"
	line "this program with"
	cont "my brother."
	done

PastPectiniaApartment3F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  7,  0, PAST_PECTINIA_APARTMENT_2F, 2

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event 11,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PastPectiniaApartments3FYoungster, -1
	object_event 11,  7, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PastPectiniaApartments3FLass, -1