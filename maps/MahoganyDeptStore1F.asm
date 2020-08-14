	const_def 2 ; object constants
	const MAHOGANYDEPTSTORE1F_RECEPTIONIST
	const MAHOGANYDEPTSTORE1F_POKEFAN_F
	const MAHOGANYDEPTSTORE1F_BUG_CATCHER
	const MAHOGANYDEPTSTORE1F_GENTLEMAN

MahoganyDeptStore1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

MahoganyDeptStore1FReceptionistScript:
	jumptextfaceplayer MahoganyDeptStore1FReceptionistText

MahoganyDeptStore1FGentlemanScript:
	jumptextfaceplayer MahoganyDeptStore1FGentlemanText

MahoganyDeptStore1FPokefanFScript:
	jumptextfaceplayer MahoganyDeptStore1FPokefanFText

MahoganyDeptStore1FBugCatcherScript:
	jumptextfaceplayer MahoganyDeptStore1FBugCatcherText

MahoganyDeptStore1FDirectory:
	jumptext MahoganyDeptStore1FDirectoryText

MahoganyDeptStore1FElevatorButton:
	jumpstd elevatorbutton

MahoganyDeptStore1FReceptionistText:
	text "Welcome to the"
	line "RUGOSA DEPT.STORE."
	done

MahoganyDeptStore1FGentlemanText:
	text "The DEPT.STORE"
	line "has a decent se-"
	cont "lection."

	para "But some items"
	line "are only available"

	para "as GAME CORNER"
	line "prizes."
	done

MahoganyDeptStore1FPokefanFText:
	text "I'm raring to shop"
	line "again today!"
	done

MahoganyDeptStore1FBugCatcherText:
	text "Mom's good at"
	line "bargain hunting."

	para "She always buys"
	line "stuff at lower"
	cont "prices."
	done

MahoganyDeptStore1FDirectoryText:
	text "1F SERVICE COUNTER"

	para "2F TRAINER'S"
	line "   MARKET"

	para "3F BATTLE"
	line "   COLLECTION"

	para "4F MEDICINE BOX"

	para "5F ACCESSORIES"

	para "6F TRANQUIL SQUARE"

	para "ROOFTOP LOOKOUT"
	done

MahoganyDeptStore1F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  7,  7, MAHOGANY_TOWN, 5
	warp_event  8,  7, MAHOGANY_TOWN, 5
	warp_event 15,  0, MAHOGANY_DEPT_STORE_2F, 2
	warp_event  2,  0, MAHOGANY_DEPT_STORE_ELEVATOR, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event 14,  0, BGEVENT_READ, MahoganyDeptStore1FDirectory
	bg_event  3,  0, BGEVENT_READ, MahoganyDeptStore1FElevatorButton

	db 4 ; object events
	object_event 10,  1, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyDeptStore1FReceptionistScript, -1
	object_event  5,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyDeptStore1FPokefanFScript, -1
	object_event  5,  5, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, MahoganyDeptStore1FBugCatcherScript, -1
	object_event 11,  5, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyDeptStore1FGentlemanScript, -1
