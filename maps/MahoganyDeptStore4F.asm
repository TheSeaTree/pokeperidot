	const_def 2 ; object constants
	const MAHOGANYDEPTSTORE4F_CLERK
	const MAHOGANYDEPTSTORE4F_COOLTRAINER_M
	const MAHOGANYDEPTSTORE4F_BUG_CATCHER
	const MAHOGANYDEPTSTORE4F_GAMEBOY_KID

MahoganyDeptStore4F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

MahoganyDeptStore4FClerkScript:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_GOLDENROD_4F
	closetext
	end

MahoganyDeptStore4FCooltrainerMScript:
	jumptextfaceplayer MahoganyDeptStore4FCooltrainerMText

MahoganyDeptStore4FBugCatcherScript:
	jumptextfaceplayer MahoganyDeptStore4FBugCatcherText

MahoganyDeptStore4FGameboyKidScript:
	faceplayer
	opentext
	writetext MahoganyDeptStore4FGameboyKidText
	waitbutton
	closetext
	turnobject MAHOGANYDEPTSTORE4F_GAMEBOY_KID, DOWN
	end

MahoganyDeptStore4FDirectory:
	jumptext MahoganyDeptStore4FDirectoryText

MahoganyDeptStore4FElevatorButton:
	jumpstd elevatorbutton

MahoganyDeptStore4FCooltrainerMText:
	text "Hey. I love strong"
	line "#MON."

	para "I feed them PRO-"
	line "TEIN to crank up"
	cont "their ATTACK."
	done

MahoganyDeptStore4FBugCatcherText:
	text "IRON adds to your"
	line "#MON's DEFENSE."
	done

MahoganyDeptStore4FGameboyKidText:
	text "Some #MON"
	line "evolve only by"

	para "being traded via a"
	line "Game Link cable."

	para "I know of four:"
	line "MACHOKE, KADABRA,"

	para "HAUNTER and, um,"
	line "GRAVELER."

	para "I heard there are"
	line "others too."
	done

MahoganyDeptStore4FDirectoryText:
	text "Let Us Pump Up"
	line "Your #MON!"

	para "4F MEDICINE BOX"
	done

MahoganyDeptStore4F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 12,  0, MAHOGANY_DEPT_STORE_5F, 1
	warp_event 15,  0, MAHOGANY_DEPT_STORE_3F, 2
	warp_event  2,  0, MAHOGANY_DEPT_STORE_ELEVATOR, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event 14,  0, BGEVENT_READ, MahoganyDeptStore4FDirectory
	bg_event  3,  0, BGEVENT_READ, MahoganyDeptStore4FElevatorButton

	db 4 ; object events
	object_event 13,  5, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyDeptStore4FClerkScript, -1
	object_event 11,  7, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyDeptStore4FCooltrainerMScript, -1
	object_event  7,  2, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyDeptStore4FBugCatcherScript, -1
	object_event  5,  1, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyDeptStore4FGameboyKidScript, -1
