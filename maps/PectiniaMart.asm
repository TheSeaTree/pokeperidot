	const_def 2 ; object constants
	const PECTINIAMART_CLERK
	const PECTINIAMART_COOLTRAINER_M
	const PECTINIAMART_BUG_CATCHER

PectiniaMart_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PectiniaMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_PECTINIA
	closetext
	end

PectiniaMartCooltrainerMScript:
	jumptextfaceplayer PectiniaMartCooltrainerMText

PectiniaMartBugCatcherScript:
	jumptextfaceplayer PectiniaMartBugCatcherText

PectiniaMartCooltrainerMText:
	text "I need some more"
	line "POTIONs before I"
	cont "try to take on the"
	cont "GYM here again."
	done

PectiniaMartBugCatcherText:
	text "A #MON holding"
	line "a BERRY may eat it"
	cont "in battle."
	
	para "It saves you the"
	line "time of getting a"
	cont "POTION from out of"
	cont "your PACK."
	done

PectiniaMart_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, PECTINIA_CITY, 3
	warp_event  3,  7, PECTINIA_CITY, 3

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PectiniaMartClerkScript, -1
	object_event  3,  2, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PectiniaMartCooltrainerMScript, -1
	object_event  7,  6, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PectiniaMartBugCatcherScript, -1
