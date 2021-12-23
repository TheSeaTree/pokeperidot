	const_def 2 ; object constants

PectiniaBattleItemStore_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PectiniaBattleItemMorningClerk1Script:
	faceplayer
	opentext
	writetext PectiniaBattleItemMorningClerk1Text
	pokemart MARTTYPE_STANDARD, MART_PECTINIA_BATTLE_3
	writetext PectiniaBattleItemBlankTextBox
	closetext
	end

PectiniaBattleItemMorningClerk2Script:
	faceplayer
	opentext
	writetext PectiniaBattleItemMorningClerk2Text
	pokemart MARTTYPE_STANDARD, MART_PECTINIA_BATTLE_2
	writetext PectiniaBattleItemBlankTextBox
	closetext
	end

PectiniaBattleItemDayClerk1Script:
	faceplayer
	opentext
	writetext PectiniaBattleItemDayClerk1Text
	pokemart MARTTYPE_STANDARD, MART_PECTINIA_BATTLE_1
	writetext PectiniaBattleItemBlankTextBox
	closetext
	end

PectiniaBattleItemDayClerk2Script:
	faceplayer
	opentext
	writetext PectiniaBattleItemDayClerk2Text
	pokemart MARTTYPE_STANDARD, MART_PECTINIA_BATTLE_3
	writetext PectiniaBattleItemBlankTextBox
	closetext
	end

PectiniaBattleItemNightClerk1Script:
	faceplayer
	opentext
	writetext PectiniaBattleItemNightClerk1Text
	pokemart MARTTYPE_STANDARD, MART_PECTINIA_BATTLE_2
	writetext PectiniaBattleItemBlankTextBox
	closetext
	end

PectiniaBattleItemNightClerk2Script:
	faceplayer
	opentext
	writetext PectiniaBattleItemNightClerk2Text
	pokemart MARTTYPE_STANDARD, MART_PECTINIA_BATTLE_1
	writetext PectiniaBattleItemBlankTextBox
	closetext
	end

PectiniaBattleItemCooltrainerMScript:
	jumptextfaceplayer PectiniaBattleItemCooltrainerMText

PectiniaBattleItemMorningClerk1Text:
	text "Yawn…"

	para "Excuse me, sorry."
	line "I'm exhausted."

	para "How may I help"
	line "you this morning?"
	done

PectiniaBattleItemMorningClerk2Text:
	text "We typically don't"
	line "see many customers"
	cont "this early in the"
	cont "morning."

	para "What can I do for"
	line "you today?"
	done

PectiniaBattleItemDayClerk1Text:
	text "Hiya!"

	para "We have lots of"
	line "rare items!"

	para "Do you want to buy"
	line "any of them?"
	done

PectiniaBattleItemDayClerk2Text:
	text "Welcome, and good"
	line "afternoon."

	para "Care to see what I"
	line "have for sale?"
	done

PectiniaBattleItemNightClerk1Text:
	text "Good evening."

	para "We have a fine"
	line "selection of items"
	cont "for trainers."

	para "What could I do to"
	line "help you tonight?"
	done

PectiniaBattleItemNightClerk2Text:
	text "Hey there!"

	para ""

	para "Text goes here."
	line "(Child)"
	done

PectiniaBattleItemBlankTextBox:
	text_start
	done

PectiniaBattleItemCooltrainerMText:
	text "The staff visits"
	line "the RUGOSA DEPT."
	cont "STORE when their"
	cont "shift is over."

	para "They bring differ-"
	line "ent items there."
	done

PectiniaBattleItemStore_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  8,  7, PECTINIA_MALL, 8
	warp_event  9,  7, PECTINIA_MALL, 8

	db 0 ; coord events

	db 0 ; bg events

	db 7 ; object events
	object_event  8,  2, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, MORN, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PectiniaBattleItemMorningClerk1Script, -1
	object_event  9,  2, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, MORN, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PectiniaBattleItemMorningClerk2Script, -1
	object_event  8,  2, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, DAY, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PectiniaBattleItemDayClerk1Script, -1
	object_event  9,  2, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, DAY, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PectiniaBattleItemDayClerk2Script, -1
	object_event  8,  2, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, NITE, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PectiniaBattleItemNightClerk1Script, -1
	object_event  9,  2, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, NITE, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PectiniaBattleItemNightClerk2Script, -1
	object_event  4,  3, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WANDER, 1, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PectiniaBattleItemCooltrainerMScript, -1
