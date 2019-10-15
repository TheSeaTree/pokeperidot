	const_def 2 ; object constants

MahoganyApartment1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
MahoganyApartment1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  2,  7, MAHOGANY_TOWN,  9
	warp_event  3,  7, MAHOGANY_TOWN,  9
	warp_event  6,  0, MAHOGANY_APARTMENT_2F,  1

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
;	object_event  2,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, AzaleaApartmentLeftGuard1Script, -1
