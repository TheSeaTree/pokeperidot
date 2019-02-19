	const_def 2 ; object constants

VioletTradeHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

VioletTrader1:
	jumptextfaceplayer VioletTrader1Text
	
VioletTrader2:
	jumptextfaceplayer VioletTrader2Text
	
VioletTrader1Text:
	text "Awesome!"
	
	para "The #MON I was"
	line "traded leveled up"
	cont "so much faster"
	cont "than the one I"
	cont "caught myself!"
	done
	
VioletTrader2Text:
	text "I gave my #MON"
	line "an item before"
	cont "trading it."
	
	para "The person I"
	line "traded with got to"
	cont "keep the item!"
	done
	
VioletTradeHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, VIOLET_CITY, 7
	warp_event  3,  7, VIOLET_CITY, 7
	
	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  5, 4, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VioletTrader1, -1
	object_event  2, 3, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, VioletTrader2, -1
	