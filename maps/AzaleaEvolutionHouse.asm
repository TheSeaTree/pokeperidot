	const_def 2 ; object constants

AzaleaEvolutionHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

AzaleaEvolutionHouseCooltrainerScript:
	jumptextfaceplayer AzaleaEvolutionHouseCooltrainerText
	
AzaleaEvolutionHouseArcanineScript:
	opentext
	writetext AzaleaEvolutionHouseArcanineText
	cry ARCANINE
	waitbutton
	closetext
	end
	
AzaleaEvolutionHouseCooltrainerText:
	text "#MON can change"
	line "form in so many"
	cont "ways."
	
	para "I used an item on"
	line "my GROWLITHE and"
	cont "it evolved!"
	done
	
AzaleaEvolutionHouseArcanineText:
	text "ARCANINE:"
	line "Barr-arrk!"
	done

AzaleaEvolutionHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, AZALEA_TOWN, 14
	warp_event  3,  7, AZALEA_TOWN, 14

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  2, 4, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, AzaleaEvolutionHouseCooltrainerScript, -1
	object_event  4, 5, SPRITE_GROWLITHE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaEvolutionHouseArcanineScript, -1
