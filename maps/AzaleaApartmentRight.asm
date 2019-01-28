	const_def 2 ; object constants

AzaleaApartmentRight_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

AzaleaApartmentRightBuenaScript:
	jumptextfaceplayer AzaleaApartmentRightBuenaText
	
AzaleaApartmentRightGuard1Script:
	jumptextfaceplayer AzaleaApartmentRightGuard1Text

AzaleaApartmentRightGuard2Script:
	jumptextfaceplayer AzaleaApartmentRightGuard2Text
	
AzaleaApartmentRightGuard1Text:
	text "The building next"
	line "door had trouble"
	cont "with some vandals."
	
	para "It's strange, this"
	line "city is usually so"
	cont "quiet."
	done

AzaleaApartmentRightGuard2Text:
	text "Sorry, kid. I can"
	line "only let residents"
	cont "upstairs."
	
	para "It's just a safety"
	line "precaution."
	done
	
AzaleaApartmentRightBuenaText:
	text "The guards won't"
	line "let me upstairs to"
	cont "see my boyfriend!"
	
	para "I have to wait for"
	line "him to come down."
	done
	
AzaleaApartmentRight_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  8, 7, AZALEA_TOWN, 10
	warp_event  9, 7, AZALEA_TOWN, 10
	
	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  9,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, AzaleaApartmentRightGuard1Script, -1
	object_event  5,  1, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, AzaleaApartmentRightGuard2Script, -1
	object_event  7,  5, SPRITE_BUENA, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, AzaleaApartmentRightBuenaScript, -1