	const_def 2 ; object constants
	const MAHOGANYDEPTSTORE2F_CLERK1
	const MAHOGANYDEPTSTORE2F_CLERK2
	const MAHOGANYDEPTSTORE2F_YOUNGSTER
	const MAHOGANYDEPTSTORE2F_COOLTRAINER_F
	const MAHOGANYDEPTSTORE2F_GENTLEMAN

RugosaDeptStore2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

RugosaDeptStore2FClerk1Script:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_DEPT_STORE_2F_1
	closetext
	end

RugosaDeptStore2FClerk2Script:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_DEPT_STORE_2F_2
	closetext
	end

RugosaDeptStore2FTeacherScript:
	jumptextfaceplayer RugosaDeptStore2FTeacherText

RugosaDeptStore2FCooltrainerFScript:
	jumptextfaceplayer RugosaDeptStore2FCooltrainerFText

RugosaDeptStore2FGentlemanScript:
	jumptextfaceplayer RugosaDeptStore2FGentlemanText

RugosaDeptStore2FDirectory:
	jumptext RugosaDeptStore2FDirectoryText

RugosaDeptStore2FElevatorButton:
	jumpstd elevatorbutton

RugosaDeptStore2FTeacherText:
	text "There's such a big"
	line "selection. I don't"
	cont "know what to buy!"
	done

RugosaDeptStore2FCooltrainerFText:
	text "This DEPT.STORE is"
	line "huge. but it is"
	cont "really lacking in"
	cont "specialty items."

	para "I guess I'll just"
	line "have to go else-"
	cont "where for those."
	done

RugosaDeptStore2FGentlemanText:
	text "Can you believe"
	line "this building used"
	cont "to be a TRAIN"
	cont "STATION?"

	para "The POWER PLANT"
	line "ADMIN decided a"
	cont "DEPT.STORE would"
	cont "use up much less"
	cont "energy."

	para "Most trainers just"
	line "FLY here, anyway."
	done

RugosaDeptStore2FDirectoryText:
	text "Your Travel"
	line "Companion"

	para "2F TRAINER'S"
	line "   MARKET"
	done

RugosaDeptStore2F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 12,  0, RUGOSA_DEPT_STORE_3F, 1
	warp_event 15,  0, RUGOSA_DEPT_STORE_1F, 3
	warp_event  2,  0, RUGOSA_DEPT_STORE_ELEVATOR, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event 14,  0, BGEVENT_READ, RugosaDeptStore2FDirectory
	bg_event  3,  0, BGEVENT_READ, RugosaDeptStore2FElevatorButton

	db 5 ; object events
	object_event 13,  5, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RugosaDeptStore2FClerk1Script, -1
	object_event 13,  6, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RugosaDeptStore2FClerk2Script, -1
	object_event  9,  6, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RugosaDeptStore2FTeacherScript, -1
	object_event  6,  2, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RugosaDeptStore2FCooltrainerFScript, -1
	object_event  2,  6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RugosaDeptStore2FGentlemanScript, -1
