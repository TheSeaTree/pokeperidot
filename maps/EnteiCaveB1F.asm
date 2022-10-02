	const_def 2 ; object constants

EnteiCaveB1F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .Boulders

.Boulders:
	checkevent EVENT_ENTEI_CAVE_1F_BOULDER_1
	iffalse .skip1
	changeblock 20, 26, $b2 ; fallen boulder 1
.skip1
	checkevent EVENT_ENTEI_CAVE_1F_BOULDER_2
	iffalse .skip2
	changeblock 22, 14, $b2 ; fallen boulder 2
.skip2
	checkevent EVENT_ENTEI_CAVE_1F_BOULDER_3
	iffalse .skip3
	changeblock 12, 16, $b2 ; fallen boulder 3
.skip3
	checkevent EVENT_ENTEI_CAVE_1F_BOULDER_4
	iffalse .skip4
	changeblock  6, 22, $b2 ; fallen boulder 4
.skip4
	return
	
EnteiCaveB1FBoulder1Script:
	checkevent EVENT_ENTEI_CAVE_1F_BOULDER_1
	iftrue EnteiCaveB1FGapFilledScript
	jump EnteiCaveB1FGapEmptyScript

EnteiCaveB1FBoulder2Script:
	checkevent EVENT_ENTEI_CAVE_1F_BOULDER_2
	iftrue EnteiCaveB1FGapFilledScript
	jump EnteiCaveB1FGapEmptyScript

EnteiCaveB1FBoulder3Script:
	checkevent EVENT_ENTEI_CAVE_1F_BOULDER_3
	iftrue EnteiCaveB1FGapFilledScript
	jump EnteiCaveB1FGapEmptyScript

EnteiCaveB1FBoulder4Script:
	checkevent EVENT_ENTEI_CAVE_1F_BOULDER_4
	iftrue EnteiCaveB1FGapFilledScript

EnteiCaveB1FGapEmptyScript:
	jumptext EnteiCaveB1FGapEmptyText
	
EnteiCaveB1FGapFilledScript:
	jumptext EnteiCaveB1FGapFilledText
	
EnteiCaveB1FRullRestore:
	itemball FULL_RESTORE
	
EnteiCaveB1FRareCandy1:
EnteiCaveB1FRareCandy2:
	itemball RARE_CANDY

EnteiCaveB1FGapEmptyText:
	text "This gap looks a"
	line "little too wide to"
	cont "jump across."
	done

EnteiCaveB1FGapFilledText:
	text "…Better be careful"
	line "on this boulder!"
	done

EnteiCaveB1F_MapEvents:
	db 0, 0 ; filler

	db 7 ; warp events
	warp_event  7, 31, ENTEI_CAVE_1F, 1
	warp_event  9,  5, ENTEI_LAIR, 1
	warp_event 23, 19, ENTEI_CAVE_1F, 3
	warp_event 21, 28, ENTEI_CAVE_B1F, -1 ; Pit
	warp_event 13, 18, ENTEI_CAVE_B1F, -1 ; Pit
	warp_event 23, 16, ENTEI_CAVE_B1F, -1 ; Item Pit
	warp_event  7, 22, ENTEI_CAVE_B1F, -1 ; Item Pit

	db 0 ; coord events

	db 4 ; bg events
	bg_event 21, 27, BGEVENT_UP, EnteiCaveB1FBoulder1Script
	bg_event 13, 17, BGEVENT_UP, EnteiCaveB1FBoulder2Script
	bg_event 23, 15, BGEVENT_UP, EnteiCaveB1FBoulder3Script
	bg_event  7, 23, BGEVENT_UP, EnteiCaveB1FBoulder4Script

	db 3 ; object events
	object_event  4, 25, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, EnteiCaveB1FRullRestore, EVENT_ENTEI_CAVE_B1F_FULL_RESTORE
	object_event 21,  6, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, EnteiCaveB1FRareCandy1, EVENT_ENTEI_CAVE_B1F_RARE_CANDY_1
	object_event 11, 24, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, EnteiCaveB1FRareCandy2, EVENT_ENTEI_CAVE_B1F_RARE_CANDY_2
