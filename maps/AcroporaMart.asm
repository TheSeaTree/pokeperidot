	const_def 2 ; object constants

AcroporaMart_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

AcroporaMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_BLACKTHORN
	closetext
	end
	
AcroporaMartTMClerkScript
	opentext
	pokemart MARTTYPE_STANDARD, MART_BLACKTHORN_TM
	closetext
	end

AcroporaMart_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, ACROPORA_CITY, 3
	warp_event  3,  7, ACROPORA_CITY, 3

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AcroporaMartClerkScript, -1
	object_event  1,  2, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, AcroporaMartTMClerkScript, -1
