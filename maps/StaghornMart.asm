	const_def 2 ; object constants
	const ECRUTEAKMART_CLERK
	const ECRUTEAKMART_TM_CLERK
	const ECRUTEAKMART_SUPER_NERD
	const ECRUTEAKMART_GRANNY

StaghornMart_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

StaghornMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_ECRUTEAK
	closetext
	end
	
StaghornMartTMClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_ECRUTEAK_TM
	closetext
	end

StaghornMartSuperNerdScript:
	jumptextfaceplayer StaghornMartSuperNerdText
	
StaghornMartLassScript:
	jumptextfaceplayer StaghornMartLassText

StaghornMartSuperNerdText:
	text "There is a long"
	line "stretch of road"
	cont "before the next"
	cont "#MON CENTER."
	
	para "I'd better stock"
	line "up on as many"
	cont "healing items as I"
	cont "can carry."
	done
	
StaghornMartLassText:
	text "It can't be good"
	line "business to sell"
	cont "TMs that don't"
	cont "break."
	
	para "How to they make"
	line "money on them?"
	done


StaghornMart_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, STAGHORN_TOWN, 4
	warp_event  3,  7, STAGHORN_TOWN, 4

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, StaghornMartClerkScript, -1
	object_event  1,  2, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, StaghornMartTMClerkScript, -1
	object_event  5,  2, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, StaghornMartSuperNerdScript, -1
	object_event  6,  6, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, StaghornMartLassScript, -1
