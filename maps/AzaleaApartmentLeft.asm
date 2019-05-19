	const_def 2 ; object constants

AzaleaApartmentLeft_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

AzaleaApartmentLeftGuard1Script:
	jumptextfaceplayer AzaleaApartmentLeftGuard1Text

AzaleaApartmentLeftGuard2Script:
	jumptextfaceplayer AzaleaApartmentLeftGuard2Text
	
AzaleaApartmentLeftGameboyKidScript:
	jumptextfaceplayer AzaleaApartmentLeftGameboyKidText
	
AzaleaApartmentLeftPikachu:
	opentext
	writetext AzaleaApartmentLeftPikachuText
	cry PIKACHU
	waitbutton
	closetext
	end
	
AzaleaApartmentLeftGuard1Text:
	text "Those hoodlums are"
	line "so lucky I wasn't"
	cont "on duty when they"
	cont "were here."
	
	para "I would have given"
	line "then such a"
	cont "beating."
	done
	
AzaleaApartmentLeftGuard2Text:
	text "There's graffiti"
	line "all over the halls"
	cont "upstairs! While we"
	cont "investigate, only"
	cont "residents are"
	cont "allowed past here."
	done
	
AzaleaApartmentLeftGameboyKidText:
	text "I lost my room key"
	line "and need to wait"
	cont "for my mom to get"
	cont "home."
	
	para "With PIKACHU here,"
	line "the batteries on"
	cont "my game will never"
	cont "run out!"
	done
	
AzaleaApartmentLeftPikachuText:
	text "PIKACHU: Chu!"
	done
	
AzaleaApartmentLeft_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, AZALEA_TOWN, 11
	warp_event  3,  7, AZALEA_TOWN, 11

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  2,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, AzaleaApartmentLeftGuard1Script, -1
	object_event  6,  1, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, AzaleaApartmentLeftGuard2Script, -1
	object_event  7,  3, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, AzaleaApartmentLeftGameboyKidScript, -1
	object_event  8,  3, SPRITE_PIKACHU, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaApartmentLeftPikachu, -1
