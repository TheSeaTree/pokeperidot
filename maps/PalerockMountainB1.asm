	const_def 2 ; object constants
	const PALEROCKB1_BOULDER1
	const PALEROCKB1_BOULDER2
	const PALEROCKB1_BOULDER3
	const PALEROCKB1_BOULDER4
	const PALEROCKB1_BOULDER5
	const PALEROCKB1_BOULDER6
	const PALEROCKB1_BOULDER7
	const PALEROCKB1_BOULDER8
	const PALEROCKB1_ITEMBALL1
	const PALEROCKB1_ITEMBALL2
	const PALEROCKB1_ITEMBALL3
	
PalerockMountainB1_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PalerockB1Hiker:
	faceplayer
	jumptext PalerockB1HikerText
	
PalerockMountainB1FFireStone:
	itemball FIRE_STONE

PalerockMountainB1FStardust:
	itemball STARDUST

PalerockMountainB1FRevive:
	itemball REVIVE
	
PalerockMountainB1Boulder:
	jumpstd strengthboulder
	
PalerockB1HikerText:
	text "What happened"
	line "down here?"
	
	para "I was minding my"
	line "own business."
	
	para "Suddenly these"
	line "boulders fell"
	cont "right down from"
	cont "the ceiling!"
	
	para "You did read the"
	line "sign in that room,"
	cont "didn't you kid?"
	done

PalerockMountainB1_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  31, 19, PALEROCK_MOUNTAIN_1F, 3
	warp_event   7,  3, PALEROCK_MOUNTAIN_STRENGTH_ROOM, 1
	warp_event  26,  5, PALEROCK_MOUNTAIN_B2, 2

	db 0 ; coord events

	db 0 ; bg events

	db 11 ; object events
	object_event   3,  4, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PalerockMountainB1Boulder, -1
	object_event   9, 16, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PalerockMountainB1Boulder, -1
	object_event   8,  5, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PalerockMountainB1Boulder, EVENT_BOULDER_IN_PALEROCK_B
	object_event   6,  9, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PalerockMountainB1Boulder, EVENT_BOULDER_IN_PALEROCK_B
	object_event  12, 12, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PalerockMountainB1Boulder, EVENT_BOULDER_IN_PALEROCK_B
	object_event  14, 11, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PalerockMountainB1Boulder, EVENT_BOULDER_IN_PALEROCK_B
	object_event  17,  6, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PalerockMountainB1Boulder, EVENT_BOULDER_IN_PALEROCK_B
	object_event  5,  5, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PalerockB1Hiker, EVENT_BOULDER_IN_PALEROCK_B
	object_event 15, 10, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PalerockMountainB1FFireStone, EVENT_PALEROCK_MOUNTAIN_B1F_FIRE_STONE
	object_event  6, 21, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PalerockMountainB1FStardust, EVENT_PALEROCK_MOUNTAIN_B1F_STARDUST
	object_event  2,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PalerockMountainB1FRevive, EVENT_PALEROCK_MOUNTAIN_B1F_REVIVE
	