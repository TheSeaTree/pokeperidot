	const_def 2 ; object constants
	const MAHOGANYDEPTSTORE4F_CLERK
	const MAHOGANYDEPTSTORE4F_COOLTRAINER_M
	const MAHOGANYDEPTSTORE4F_SUPER_NERD

MahoganyDeptStore4F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

MahoganyDeptStore4FClerkScript:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_DEPT_STORE_4F
	closetext
	end

MahoganyDeptStore4FCooltrainerMScript:
	jumptextfaceplayer MahoganyDeptStore4FCooltrainerMText

MahoganyDeptStore4FSuperNerdScript:
	jumptextfaceplayer MahoganyDeptStore4FSuperNerdText

MahoganyDeptStore4FTwinScript:
	jumptextfaceplayer MahoganyDeptStore4FTwinText

MahoganyDeptStore4FDirectory:
	jumptext MahoganyDeptStore4FDirectoryText

MahoganyDeptStore4FElevatorButton:
	jumpstd elevatorbutton

MahoganyDeptStore4FCooltrainerMText:
	text "Hey! What gives?"
	
	para "I spent all of"
	line "this money on"
	cont "VITAMINs, and they"
	cont "barely did a thing"
	cont "for my #MON!"
	done

MahoganyDeptStore4FSuperNerdText:
	text "I feed my #MON"
	line "VITAMINS all the"
	cont "time!"
	
	para "It may not be app-"
	line "arant right away,"
	cont "but the stat boost"
	cont "they give really"
	cont "adds up over time."
	done
	
MahoganyDeptStore4FTwinText:
	text "I heard about a"
	line "man in this city"
	cont "that will change"
	cont "VITAMINs into some"
	cont "cool battle items!"
	
	para "I think he works"
	line "at the POWER"
	cont "PLANT."
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
	object_event 11,  6, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyDeptStore4FCooltrainerMScript, -1
	object_event  7,  2, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyDeptStore4FSuperNerdScript, -1
	object_event  2,  6, SPRITE_TWIN, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, MahoganyDeptStore4FTwinScript, -1
