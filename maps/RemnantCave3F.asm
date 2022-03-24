	const_def 2 ; object constants
	
RemnantCave3F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

RemnantCave3FSkillBelt:
	itemball SKILL_BELT

RemnantCave3FHiddenLemonade:
	hiddenitem LEMONADE, EVENT_REMNANT_CAVE_3F_HIDDEN_LEMONADE

RemnantCave3FHiddenMoonStone:
	hiddenitem MOON_STONE, EVENT_REMNANT_CAVE_3F_HIDDEN_MOON_STONE

RemnantCave3FHiddenIron:
	hiddenitem IRON, EVENT_REMNANT_CAVE_3F_HIDDEN_IRON

RemnantCave3FHiddenBrickPiece:
	hiddenitem BRICK_PIECE, EVENT_REMNANT_CAVE_3F_HIDDEN_BRICK_PIECE

RemnantCave3FHiddenHeatCharm:
	hiddenitem HEAT_CHARM, EVENT_REMNANT_CAVE_3F_HIDDEN_HEAT_CHARM

RemnantCave3FSmashRock:
	jumpstd smashrock

RemnantCave3F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  5, 13, REMNANT_CAVE_OUTSIDE, 2
	warp_event 23,  4, REMNANT_CAVE_3F, 3
	warp_event 36, 15, REMNANT_CAVE_3F, 2
	warp_event 51,  5, LOST_LAND, 1

	db 0 ; coord events

	db 5 ; bg events
	bg_event 18, 11, BGEVENT_ITEM, RemnantCave3FHiddenLemonade
	bg_event 26,  7, BGEVENT_ITEM, RemnantCave3FHiddenMoonStone
	bg_event 18,  5, BGEVENT_ITEM, RemnantCave3FHiddenIron
	bg_event 26, 16, BGEVENT_ITEM, RemnantCave3FHiddenBrickPiece
	bg_event 19, 11, BGEVENT_ITEM, RemnantCave3FHiddenHeatCharm

	db 2 ; object events
	object_event 41, 10, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RemnantCave3FSmashRock, -1
	object_event 17,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RemnantCave3FSkillBelt, EVENT_REMNANT_CAVE_3F_SKILL_BELT
