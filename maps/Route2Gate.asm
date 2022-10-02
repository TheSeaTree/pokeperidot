	const_def 2 ; object constants
	const ROUTE2GATE_OFFICER

Route2Gate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Colton:
	faceplayer
	opentext
	trade NPC_TRADE_COLTON
	waitbutton
	closetext
	end

Route2Gate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0,  4, ROUTE_2, 3
	warp_event  0,  5, ROUTE_2, 4
	warp_event  9,  4, ROUTE_3, 8
	warp_event  9,  5, ROUTE_3, 9

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  5,  2, SPRITE_OFFICER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Colton, -1
