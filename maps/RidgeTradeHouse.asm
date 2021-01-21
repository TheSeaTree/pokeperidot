	const_def 2 ; object constants

RidgeTradeHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

RidgeTrader1:
	jumptextfaceplayer RidgeTrader1Text
	
RidgeTrader2:
	jumptextfaceplayer RidgeTrader2Text
	
RidgeTrader1Text:
	text "Awesome!"
	
	para "The #MON I was"
	line "traded leveled up"
	cont "so much faster"
	cont "than the one I"
	cont "caught myself!"
	done
	
RidgeTrader2Text:
	text "I gave my #MON"
	line "an item before"
	cont "trading it."
	
	para "The person I"
	line "traded with got to"
	cont "keep the item!"
	done
	
RidgeTradeHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, RIDGE_VILLAGE, 7
	warp_event  3,  7, RIDGE_VILLAGE, 7
	
	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  5, 4, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RidgeTrader1, -1
	object_event  2, 3, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RidgeTrader2, -1
	