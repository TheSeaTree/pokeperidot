	const_def 2 ; object constants
	const POKESEERSHOUSE_GRANNY

PokeSeersHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SeerScript:
	faceplayer
	opentext
	special PokeSeer
	waitbutton
	closetext
	end

PokeSeersHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, HEPATICA_TOWN, 4
	warp_event  3,  7, HEPATICA_TOWN, 4

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  2,  3, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SeerScript, -1
