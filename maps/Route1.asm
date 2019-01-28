	const_def 2 ; object constants
	const ROUTE1_GRANNY
	const ROUTE1_COOLTRAINER_F
	const ROUTE1_FRUIT_TREE

Route1_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerCooltrainerfQuinn:
	opentext
	writetext CooltrainerfQuinnAfterBattleText
	waitbutton
	closetext
	end
	
TrainerFisherLeo:
	trainer FISHER, LEO, EVENT_BEAT_FISHER_LEO, FisherLeoText, FisherLeoWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherLeoAfterText
	waitbutton
	closetext
	end
	
TrainerFisherMarshall:
	trainer FISHER, MARSHALL, EVENT_BEAT_FISHER_MARSHALL, FisherMarshallText, FisherMarshallWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherMarshallAfterText
	waitbutton
	closetext
	end

Route1Sign:
	jumptext Route1SignText

Route1FruitTree:
	fruittree FRUITTREE_ROUTE_1

CooltrainerfQuinnAfterBattleText:
	text "I have nothing to"
	line "say right now."
	done
	
FisherLeoText:
	text "I am a"
	line "#MON trainer!"
	done
	
FisherLeoWinText:
	text "I lost."
	done
	
FisherLeoAfterText:
	text "I lost."
	done
	
FisherMarshallText:
	text "I am a"
	line "#MON trainer!"
	done
	
FisherMarshallWinText:
	text "I lost."
	done
	
FisherMarshallAfterText:
	text "I lost."
	done

Route1SignText:
	text "ROUTE 1"

	para "NEW BARK TOWN -"
	line "CHERRYGROVE CITY"
	done

Route1_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event  23,  3, ROUTE_1_NEW_BARK_GATE, 3
	warp_event   9, 29, ROUTE_1_CHERRYGROVE_GATE, 1
	warp_event  10, 29, ROUTE_1_CHERRYGROVE_GATE, 2
	warp_event  61,  5, ROUTE_1_GOLDENROD_GATE, 3
	warp_event  39,  7, CHARCOAL_KILN, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event  12, 26, BGEVENT_READ, Route1Sign

	db 9 ; object events
	object_event  19, 18, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  28, 9, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 2, TrainerCooltrainerfQuinn, -1
	object_event   9,  4, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event   4,  7, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  13,  5, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  13, 10, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  16,  6, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  40, 13, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerFisherMarshall, -1
	object_event  62, 13, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerFisherLeo, -1
	object_event  57, 20, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route1FruitTree, -1
