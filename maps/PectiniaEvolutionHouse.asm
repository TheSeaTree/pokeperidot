	const_def 2 ; object constants

PectiniaEvolutionHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PectiniaEvolutionHouseCooltrainerScript:
	jumptextfaceplayer PectiniaEvolutionHouseCooltrainerText
	
PectiniaEvolutionHouseArcanineScript:
	opentext
	writetext PectiniaEvolutionHouseArcanineText
	cry ARCANINE
	waitbutton
	closetext
	end
	
PectiniaEvolutionHouseCooltrainerText:
	text "#MON can change"
	line "form in so many"
	cont "ways."
	
	para "I used an item on"
	line "my GROWLITHE and"
	cont "it evolved!"
	done
	
PectiniaEvolutionHouseArcanineText:
	text "ARCANINE:"
	line "Barr-arrk!"
	done

PectiniaEvolutionHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, PECTINIA_CITY, 14
	warp_event  3,  7, PECTINIA_CITY, 14

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  2, 4, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PectiniaEvolutionHouseCooltrainerScript, -1
	object_event  4, 5, SPRITE_GROWLITHE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PectiniaEvolutionHouseArcanineScript, -1
