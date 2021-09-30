	const_def 2 ; object constants

PectiniaApartmentRight_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PectiniaApartmentRightBuenaScript:
	jumptextfaceplayer PectiniaApartmentRightBuenaText
	
PectiniaApartmentRightGuard1Script:
	jumptextfaceplayer PectiniaApartmentRightGuard1Text

PectiniaApartmentRightGuard2Script:
	jumptextfaceplayer PectiniaApartmentRightGuard2Text
	
PectiniaApartmentRightGuard1Text:
	text "The building next"
	line "door had trouble"
	cont "with some vandals."
	
	para "It's strange, this"
	line "city is usually so"
	cont "quiet."
	done

PectiniaApartmentRightGuard2Text:
	text "Sorry, kid. I can"
	line "only let residents"
	cont "upstairs."
	
	para "It's just a safety"
	line "precaution."
	done
	
PectiniaApartmentRightBuenaText:
	text "The guards won't"
	line "let me upstairs to"
	cont "see my boyfriend!"
	
	para "I have to wait for"
	line "him to come down."
	done
	
PectiniaApartmentRight_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  8, 7, PECTINIA_CITY, 10
	warp_event  9, 7, PECTINIA_CITY, 10
	warp_event  5, 0, PECTINIA_APARTMENT_RIGHT_2F,  1

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  9,  2, SPRITE_OFFICER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PectiniaApartmentRightGuard1Script, -1
	object_event  5,  1, SPRITE_OFFICER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PectiniaApartmentRightGuard2Script, EVENT_AZALEA_RETURNED_BIKE
	object_event  7,  5, SPRITE_BUENA, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PectiniaApartmentRightBuenaScript, EVENT_AZALEA_RETURNED_BIKE
