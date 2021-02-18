	const_def 2 ; object constants

Route22HiddenCave_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route22SouthSabreFossil:
	itemball SABRE_FOSSIL

Route22HiddenCave_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 5, 11, ROUTE_22_SOUTH, 3

	db 0 ; coord events

	db 0 ; bg events
	
	db 0 ; object events
	object_event  5,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route22SouthSabreFossil, EVENT_ROUTE_22_SABRE_FOSSIL
