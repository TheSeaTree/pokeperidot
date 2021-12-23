	const_def 2 ; object constants

PectiniaDollStore_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


BigDollSalesmanIntroText:
	text "Hello!"
	
	para "If you would like"
	line "to purchase a BIG"
	cont "DOLL, please let"
	cont "me know."
	done
	
BigDollSalesmanAlreadyHaveText:
	text "Are you sure you"
	line "have the space for"
	cont "another one of"
	cont "those?"
	done
	
BigDollSalesmanBuyText:
	text "Would you like the"
	line "BIG @"
	text_ram wStringBuffer3
	text " DOLL?"
	
	para "It costs ¥12000."
	done

BigDollSalesmanDeclineText:
	text "You're welcome to"
	line "browse as much as"
	cont "you like."
	done

PectiniaDollStore_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  5, PECTINIA_MALL, 5
	warp_event  5,  5, PECTINIA_MALL, 5

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  2,  1, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  6,  1, SPRITE_BIG_LAPRAS, SPRITEMOVEDATA_BIGDOLLSYM, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  0,  4, SPRITE_BIG_ONIX, SPRITEMOVEDATA_BIGDOLL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
