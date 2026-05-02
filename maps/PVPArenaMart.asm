	const_def 2 ; object constants

PVPArenaMart_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

ArenaMart_TypeItems:
	faceplayer
	opentext
	writetext ArenaMart_TypeItemsText
	waitbutton
	writetext ArenaMart_ClearText
	pokemart MARTTYPE_ARENA, MART_ARENA_TYPE_ITEMS
	closetext
	end

ArenaMart_HeldItems:
	faceplayer
	opentext
	writetext ArenaMart_HeldItemsText
	waitbutton
	writetext ArenaMart_ClearText
	pokemart MARTTYPE_ARENA, MART_ARENA_HELD_ITEMS
	closetext
	end

ArenaMart_SpecificItems:
	faceplayer
	opentext
	writetext ArenaMart_SpecificItemsText
	waitbutton
	writetext ArenaMart_ClearText
	pokemart MARTTYPE_ARENA, MART_ARENA_SPECIFIC_ITEMS
	closetext
	end

ArenaMart_ConsumableItems:
	faceplayer
	opentext
	writetext ArenaMart_ConsumableItemsText
	waitbutton
	writetext ArenaMart_ClearText
	pokemart MARTTYPE_ARENA, MART_ARENA_CONSUMABLES
	closetext
	end

ArenaMart_Berries:
	faceplayer
	opentext
	writetext ArenaMart_BerriesItemsText
	waitbutton
	writetext ArenaMart_ClearText
	pokemart MARTTYPE_ARENA, MART_ARENA_BERRIES
	closetext
	end

ArenaMart_TypeItemsText:
	text "These items will"
	line "boost a single"
	cont "type's damage."
	done

ArenaMart_HeldItemsText:
	text "Let a #MON hold"
	line "onto these items."
	done

ArenaMart_SpecificItemsText:
	text "Certain #MON"
	line "will really like"
	cont "these items."
	done

ArenaMart_ConsumableItemsText:
	text "These items can"
	line "only be used once"
	cont "per battle."
	done

ArenaMart_BerriesItemsText:
	text "#MON will eat a"
	line "BERRY under cert-"
	cont "ain conditions."
	done

ArenaMart_ClearText:
	text ""
	done

PVPArenaMart_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  5, PVP_ARENA, 2
	warp_event  5,  5, PVP_ARENA, 2

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	object_event  1,  1, SPRITE_BUENA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ArenaMart_TypeItems, -1
	object_event  2,  1, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, ArenaMart_HeldItems, -1
	object_event  8,  1, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ArenaMart_SpecificItems, -1
	object_event  7,  1, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ArenaMart_ConsumableItems, -1
	object_event  9,  5, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ArenaMart_Berries, -1
