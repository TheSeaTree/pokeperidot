	const_def 2 ; object constants

PastPectiniaApartment3F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PastPectiniaApartmentBlockingTV:
	opentext
	writetext PastPectiniaApartments3FBlockingTVText
	waitbutton
	closetext
	applymovement PLAYER, PastPectiniaApartments3FBlockingTVMovement
	end

PastPectiniaApartments3FYoungster:
	faceplayer
	opentext
	writetext PastPectiniaApartments3FYoungsterText
	waitbutton
	closetext
	turnobject LAST_TALKED, UP
	end

PastPectiniaApartments3FLass:
	faceplayer
	opentext
	writetext PastPectiniaApartments3FLass
	waitbutton
	closetext
	turnobject LAST_TALKED, UP
	end

PastPectiniaApartments3FBlockingTVMovement:
	step RIGHT
	step_end

PastPectiniaApartments3FYoungsterText:
	text "Our DAD just got"
	line "us CABLE TV."

	para "Nobody else in"
	line "town has it."

	para "They always want"
	line "to come by and"
	cont "watch with us."
	done

PastPectiniaApartments3FLassText:
	text "CABLE is so much"
	line "better than"
	cont "regular TV!"

	para "Now shhhh, please."

	para "I'm trying to watch"
	line "this program with"
	cont "my brother."
	done

PastPectiniaApartments3FBlockingTVText:
	text "Can you move,"
	line "please?"

	para "You're blocking the"
	line "television set!"
	done

PastPectiniaApartment3F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  7,  0, PAST_PECTINIA_APARTMENT_2F, 2

	db 2 ; coord events
	coord_event 1, 3, -1, PastPectiniaApartmentBlockingTV
	coord_event  1,  4, -1, PastPectiniaApartmentBlockingTV

	db 0 ; bg events

	db 2 ; object events
	object_event  1,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PastPectiniaApartments3FYoungster, -1
	object_event  0,  6, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PastPectiniaApartments3FLass, -1
