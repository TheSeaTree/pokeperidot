	const_def 2 ; object constants

Route11_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route11TMGigaDrain:
	itemball TM_GIGA_DRAIN

Route11_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 29, 27, ROUTE_11_GOLDENROD_GATE, 1
	warp_event 30, 27, ROUTE_11_GOLDENROD_GATE, 2
	warp_event 21,  3, ROUTE_11_ROUTE_12_GATE, 1

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event 53,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_SILVER, OBJECTTYPE_ITEMBALL, 0, Route11TMGigaDrain, EVENT_GOT_TM_GIGA_DRAIN