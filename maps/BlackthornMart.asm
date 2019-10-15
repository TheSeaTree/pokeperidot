	const_def 2 ; object constants
	const BLACKTHORNMART_CLERK

BlackthornMart_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

BlackthornMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_BLACKTHORN
	closetext
	end
	
BlackthornMartTMClerkScript
	opentext
	pokemart MARTTYPE_STANDARD, MART_BLACKTHORN_TM
	closetext
	end

BlackthornMart_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, BLACKTHORN_CITY, 3
	warp_event  3,  7, BLACKTHORN_CITY, 3

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornMartClerkScript, -1
	object_event  1,  2, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BlackthornMartTMClerkScript, -1
