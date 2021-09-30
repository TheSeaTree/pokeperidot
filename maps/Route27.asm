	const_def 2 ; object constants

Route27_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route27CooltrainerFScript:
	jumptext Route27CooltrainerFText

Route27CooltrainerMScript:
	jumptext Route27CooltrainerMText

Route27CooltrainerFText:
	text "C'mon NIDOQUEEN!"
	
	para "Let's show this"
	line "guy that we're not"
	cont "scared of his"
	cont "FLYING-types!"
	done

Route27CooltrainerMText:
	text "Ha! I have the"
	line "type advantage in"
	cont "this fight!"
	done

Route27_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4, 34, VICTORY_COAST, 3
	warp_event  4, 35, VICTORY_COAST, 4
	warp_event 31, 43, ROUTE_26, 2
	warp_event 32, 43, ROUTE_26, 3

	db 0 ; coord events

	db 0 ; bg events

	db 15 ; object events
	object_event 12, 35, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  6, 29, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 17, 39, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  7, 39, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 24, 39, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 26, 35, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 20, 41, SPRITE_OFFICER_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, NITE, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 32, 37, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route27CooltrainerFScript, -1
	object_event 29, 37, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route27CooltrainerMScript, -1
	object_event 31, 37, SPRITE_MONSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 30, 37, SPRITE_BIRD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 15, 28, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route27CooltrainerFScript, -1
	object_event 15, 31, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 15, 29, SPRITE_MONSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 15, 30, SPRITE_BIRD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
