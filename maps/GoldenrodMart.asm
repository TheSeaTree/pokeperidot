	const_def 2 ; object constants
	const GOLDENRODMART_CLERK
	const GOLDENRODMART_SUPER_NERD
	const GOLDENRODMART_GRANNY

GoldenrodMart_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

GoldenrodMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_GOLDENROD
	closetext
	end

GoldenrodMartTMClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_GOLDENROD_TM
	closetext
	end

GoldenrodMartSuperNerdScript:
	jumptextfaceplayer GoldenrodMartSuperNerdText

GoldenrodMartGrannyScript:
	jumptextfaceplayer GoldenrodMartGrannyText

GoldenrodMartSuperNerdText:
	text "When my #MON"
	line "used HEADBUTT on a"
	cont "tree, a RINRING"
	cont "fell out!"
	
	para "I wonder what it"
	line "was doing up in"
	cont "that tree."
	done

GoldenrodMartGrannyText:
	text "If you use REVIVE,"
	line "a #MON that's"

	para "fainted will wake"
	line "right up."
	done

GoldenrodMart_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, GOLDENROD_CITY, 2
	warp_event  3,  7, GOLDENROD_CITY, 2

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodMartClerkScript, -1
	object_event  1,  2, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GoldenrodMartTMClerkScript, -1
	object_event  5,  2, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodMartSuperNerdScript, -1
	object_event  6,  6, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodMartGrannyScript, -1
