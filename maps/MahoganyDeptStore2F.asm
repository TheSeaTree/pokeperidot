	const_def 2 ; object constants
	const MAHOGANYDEPTSTORE2F_CLERK1
	const MAHOGANYDEPTSTORE2F_CLERK2
	const MAHOGANYDEPTSTORE2F_YOUNGSTER
	const MAHOGANYDEPTSTORE2F_COOLTRAINER_F
	const MAHOGANYDEPTSTORE2F_GENTLEMAN

MahoganyDeptStore2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

MahoganyDeptStore2FClerk1Script:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_DEPT_STORE_2F_1
	closetext
	end

MahoganyDeptStore2FClerk2Script:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_DEPT_STORE_2F_2
	closetext
	end

MahoganyDeptStore2FTeacherScript:
	jumptextfaceplayer MahoganyDeptStore2FTeacherText

MahoganyDeptStore2FCooltrainerFScript:
	jumptextfaceplayer MahoganyDeptStore2FCooltrainerFText

MahoganyDeptStore2FGentlemanScript:
	jumptextfaceplayer MahoganyDeptStore2FGentlemanText

MahoganyDeptStore2FDirectory:
	jumptext MahoganyDeptStore2FDirectoryText

MahoganyDeptStore2FElevatorButton:
	jumpstd elevatorbutton

MahoganyDeptStore2FTeacherText:
	text "There's such a big"
	line "selection. I don't"
	cont "know what to buy!"
	done

MahoganyDeptStore2FCooltrainerFText:
	text "This DEPT.STORE is"
	line "huge. but it is"
	cont "really lacking in"
	cont "specialty items."

	para "I guess I'll just"
	line "have to go else-"
	cont "where for those."
	done

MahoganyDeptStore2FGentlemanText:
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

MahoganyDeptStore2FDirectoryText:
	text "Your Travel"
	line "Companion"

	para "2F TRAINER'S"
	line "   MARKET"
	done

MahoganyDeptStore2F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 12,  0, MAHOGANY_DEPT_STORE_3F, 1
	warp_event 15,  0, MAHOGANY_DEPT_STORE_1F, 3
	warp_event  2,  0, MAHOGANY_DEPT_STORE_ELEVATOR, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event 14,  0, BGEVENT_READ, MahoganyDeptStore2FDirectory
	bg_event  3,  0, BGEVENT_READ, MahoganyDeptStore2FElevatorButton

	db 5 ; object events
	object_event 13,  5, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyDeptStore2FClerk1Script, -1
	object_event 13,  6, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyDeptStore2FClerk2Script, -1
	object_event  9,  6, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MahoganyDeptStore2FTeacherScript, -1
	object_event  6,  2, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MahoganyDeptStore2FCooltrainerFScript, -1
	object_event  2,  6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyDeptStore2FGentlemanScript, -1
