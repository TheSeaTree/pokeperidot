	const_def 2 ; object constants
	const MAHOGANYDEPTSTORE3F_CLERK1
	const MAHOGANYDEPTSTORE3F_CLERK2
	const MAHOGANYDEPTSTORE3F_BLACK_BELT
	const MAHOGANYDEPTSTORE3F_ROCKER

RugosaDeptStore3F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

RugosaDeptStore3FTMClerkScript:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_DEPT_STORE_3F_1
	closetext
	end

RugosaDeptStore3FClerkScript:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_DEPT_STORE_3F_2
	closetext
	end

RugosaDeptStore3FBlackbeltScript:
	jumptextfaceplayer RugosaDeptStore3FBlackbeltText

RugosaDeptStore3FRockerScript:
	jumptextfaceplayer RugosaDeptStore3FRockerText

RugosaDeptStore3FDirectory:
	jumptext RugosaDeptStore3FDirectoryText

RugosaDeptStore3FElevatorButton:
	jumpstd elevatorbutton

RugosaDeptStore3FBlackbeltText:
	text "Hi-yah!"
	
	para "This shop made me"
	line "broke, but now all"
	cont "of my #MON are"
	cont "punching fiends!"
	
	para "You don't wanna"
	line "mess with me!"
	done

RugosaDeptStore3FRockerText:
	text "Have you given"
	line "your #MON an"
	cont "item to hold?"
	
	para "I hear the ones"
	line "sold here are very"
	cont "powerful!"
	done

RugosaDeptStore3FDirectoryText:
	text "For Victory"
	line "Seekers"

	para "3F BATTLE"
	line "   COLLECTION"
	done

RugosaDeptStore3F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 12,  0, RUGOSA_DEPT_STORE_2F, 1
	warp_event 15,  0, RUGOSA_DEPT_STORE_4F, 2
	warp_event  2,  0, RUGOSA_DEPT_STORE_ELEVATOR, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event 14,  0, BGEVENT_READ, RugosaDeptStore3FDirectory
	bg_event  3,  0, BGEVENT_READ, RugosaDeptStore3FElevatorButton

	db 4 ; object events
	object_event  6,  1, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RugosaDeptStore3FTMClerkScript, -1
	object_event  7,  1, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RugosaDeptStore3FClerkScript, -1
	object_event  4,  6, SPRITE_BLACK_BELT, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RugosaDeptStore3FBlackbeltScript, -1
	object_event 11,  5, SPRITE_ROCKER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RugosaDeptStore3FRockerScript, -1
