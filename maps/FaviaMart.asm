	const_def 2 ; object constants
	const FAVIAMART_CLERK
	const FAVIAMART_SUPER_NERD
	const FAVIAMART_GRANNY

FaviaMart_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

FaviaMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_FAVIA
	closetext
	end

FaviaMartTMClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_FAVIA_TM
	closetext
	end

FaviaMartSuperNerdScript:
	jumptextfaceplayer FaviaMartSuperNerdText

FaviaMartGrannyScript:
	jumptextfaceplayer FaviaMartGrannyText

FaviaMartSuperNerdText:
	text "When my #MON"
	line "used HEADBUTT on a"
	cont "tree, a RINRING"
	cont "fell out!"
	
	para "I wonder what it"
	line "was doing up in"
	cont "that tree."
	done

FaviaMartGrannyText:
	text "If you use REVIVE,"
	line "a #MON that's"

	para "fainted will wake"
	line "right up."
	done

FaviaMart_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, FAVIA_TOWN, 2
	warp_event  3,  7, FAVIA_TOWN, 2

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FaviaMartClerkScript, -1
	object_event  1,  2, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, FaviaMartTMClerkScript, -1
	object_event  5,  2, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, FaviaMartSuperNerdScript, -1
	object_event  6,  6, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FaviaMartGrannyScript, -1
