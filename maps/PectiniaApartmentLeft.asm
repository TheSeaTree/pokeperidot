	const_def 2 ; object constants

PectiniaApartmentLeft_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PectiniaApartmentLeftGuardMScript:
	jumptextfaceplayer PectiniaApartmentLeftGuardMText

PectiniaApartmentLeftGuardFScript:
	jumptextfaceplayer PectiniaApartmentLeftGuardFText
	
PectiniaApartmentLeftGameboyKidScript:
	jumptextfaceplayer PectiniaApartmentLeftGameboyKidText
	
PectiniaApartmentLeftPikachu:
	opentext
	writetext PectiniaApartmentLeftPikachuText
	cry PIKACHU
	waitbutton
	closetext
	end
	
PectiniaApartmentLeftGuardMText:
	text "Those hoodlums are"
	line "so lucky I wasn't"
	cont "on duty when they"
	cont "were here."
	
	para "I would have given"
	line "then such a"
	cont "beating."
	done
	
PectiniaApartmentLeftGuardFText:
	text "There's graffiti"
	line "all over the halls"
	cont "upstairs! While we"
	cont "investigate, only"
	cont "residents are"
	cont "allowed past here."
	done
	
PectiniaApartmentLeftGameboyKidText:
	text "I lost my room key"
	line "and need to wait"
	cont "for my mom to get"
	cont "home."
	
	para "With PIKACHU here,"
	line "the batteries on"
	cont "my game will never"
	cont "run out!"
	done
	
PectiniaApartmentLeftPikachuText:
	text "PIKACHU: Chu!"
	done
	
PectiniaApartmentLeft_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  2,  7, PECTINIA_CITY, 11
	warp_event  3,  7, PECTINIA_CITY, 11
	warp_event  6,  0, PECTINIA_APARTMENT_LEFT_2F,  1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  2,  2, SPRITE_OFFICER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PectiniaApartmentLeftGuardMScript, -1
	object_event  6,  1, SPRITE_OFFICER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PectiniaApartmentLeftGuardFScript, EVENT_AZALEA_RETURNED_BIKE
	object_event  7,  3, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PectiniaApartmentLeftGameboyKidScript, EVENT_AZALEA_RETURNED_BIKE
	object_event  8,  3, SPRITE_PIKACHU, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PectiniaApartmentLeftPikachu, EVENT_AZALEA_RETURNED_BIKE
