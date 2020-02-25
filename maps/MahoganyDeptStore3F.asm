	const_def 2 ; object constants
	const MAHOGANYDEPTSTORE3F_CLERK
	const MAHOGANYDEPTSTORE3F_SUPER_NERD
	const MAHOGANYDEPTSTORE3F_ROCKER

MahoganyDeptStore3F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

MahoganyDeptStore3FClerkScript:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_GOLDENROD_3F
	closetext
	end

MahoganyDeptStore3FSuperNerdScript:
	jumptextfaceplayer MahoganyDeptStore3FSuperNerdText

MahoganyDeptStore3FRockerScript:
	jumptextfaceplayer MahoganyDeptStore3FRockerText

MahoganyDeptStore3FDirectory:
	jumptext MahoganyDeptStore3FDirectoryText

MahoganyDeptStore3FElevatorButton:
	jumpstd elevatorbutton

MahoganyDeptStore3FSuperNerdText:
	text "I, I, I'm really"
	line "impatient!"

	para "I use X SPEED in"
	line "battle to speed up"
	cont "my #MON."
	done

MahoganyDeptStore3FRockerText:
	text "Hey! When you bat-"
	line "tle, do you use X"
	cont "SPECIAL?"

	para "It's awesome. It"
	line "really jacks up"
	cont "SPECIAL ATTACK!"
	done

MahoganyDeptStore3FDirectoryText:
	text "For Victory"
	line "Seekers"

	para "3F BATTLE"
	line "   COLLECTION"
	done

MahoganyDeptStore3F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 12,  0, MAHOGANY_DEPT_STORE_2F, 1
	warp_event 15,  0, MAHOGANY_DEPT_STORE_4F, 2
	warp_event  2,  0, MAHOGANY_DEPT_STORE_ELEVATOR, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event 14,  0, BGEVENT_READ, MahoganyDeptStore3FDirectory
	bg_event  3,  0, BGEVENT_READ, MahoganyDeptStore3FElevatorButton

	db 3 ; object events
	object_event  6,  1, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyDeptStore3FClerkScript, -1
	object_event 12,  5, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MahoganyDeptStore3FSuperNerdScript, -1
	object_event  2,  5, SPRITE_ROCKER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyDeptStore3FRockerScript, -1
