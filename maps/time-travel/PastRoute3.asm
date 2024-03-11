	const_def 2 ; object constants

PastRoute3_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

; Bug Catcher & Camper are absolutely brothers
; Lad might also be a brother, or just a friend.
;		Probably just a friend, or unrelated.

; "It's way easier to camp out where there's no grass. And that's why I need to defend my spot!"

; "Our grandpa doesn't like us camping out overnight. That's when all the best BUG-types come out!"

; Hiker mentions how tough it is to break up this rock.
;		Maybe retcon another hiker in the present to mention his work many years ago?

; Beauty mentions needing a boyfriend to find rare Pokemon for her.

; Lass complains about her stupid brothers(cousins?) hogging the best spot in the trees.

; Gentleman mentions keeping an eye on his grandkids, but can spare a moment to battle.
; "#MON can be dangerous, that's why I'm here to make sure everything is okay."

PastRoute3_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 29, 43, PAST_PECTINIA_GATE, 1 ; Pectinia Gate
	warp_event 30, 43, PAST_PECTINIA_GATE, 2 ; Pectinia Gate

	db 0 ; coord events

	db 4 ; bg events
	bg_event 16, 19, BGEVENT_ITEM, LugiaCaveB2FHiddenCoarseCharm
	bg_event 25, 33, BGEVENT_ITEM, LugiaCaveB2FHiddenCoarseCharm
	bg_event 17, 41, BGEVENT_ITEM, LugiaCaveB2FHiddenCoarseCharm
	bg_event 26, 18, BGEVENT_ITEM, LugiaCaveB2FHiddenCoarseCharm

	db 10 ; object events
	object_event 12,  8, SPRITE_BUENA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerBeautyReggie, -1 ; Beauty
	object_event 27, 28, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBeautyReggie, -1 ; Lass
	object_event 10, 33, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerBeautyReggie, -1 ; Camper (Brother 1)
	object_event 15, 31, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBeautyReggie, -1 ; Bug Catcher (Brother 2)
	object_event 13, 22, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBeautyReggie, -1 ; Lad (Brother 3?)
	object_event 33, 11, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 0, TrainerBeautyReggie, -1 ; Hiker
	object_event 27, 38, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBeautyReggie, -1 ; Gentleman
	object_event 31, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, FactoryB1Lemonade, EVENT_FACTORY_B1_LEMONADE
	object_event  6,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, FactoryB1Lemonade, EVENT_FACTORY_B1_LEMONADE
	object_event  1, 18, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, FactoryB1Lemonade, EVENT_FACTORY_B1_LEMONADE
