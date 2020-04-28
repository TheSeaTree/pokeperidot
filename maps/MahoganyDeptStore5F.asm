	const_def 2 ; object constants
	const MAHOGANYDEPTSTORE5F_CLERK1
	const MAHOGANYDEPTSTORE5F_CLERK2
	const MAHOGANYDEPTSTORE5F_LASS
	const MAHOGANYDEPTSTORE5F_POKEFAN_M

MahoganyDeptStore5F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

MahoganyDeptStore5FEvolutionClerkScript:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_GOLDENROD_5F_1
	closetext
	end

MahoganyDeptStore5FBoostClerkScript:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_GOLDENROD_5F_2
	closetext
	end

MahoganyDeptStore5FLassScript:
	jumptextfaceplayer MahoganyDeptStore5FLassText

MahoganyDeptStore5FPokefanMScript:
	jumptextfaceplayer MahoganyDeptStore5FPokefanMText

MahoganyDeptStore5FDirectory:
	jumptext MahoganyDeptStore5FDirectoryText

MahoganyDeptStore5FElevatorButton:
	jumpstd elevatorbutton

MahoganyDeptStore5FAlreadyGotTMText:
	text "Oh, you already"
	line "have this TM…"
	done

UnknownText_0x56241:
	text "MYSTERY GIFT."

	para "With just a"
	line "little beep, you"
	cont "get a gift."
	done

UnknownText_0x56279:
	text "The MYSTERY GIFT"
	line "option requires a"
	cont "Game Boy Color."
	done

MahoganyDeptStore5FLassText:
	text "I gave my #MON"
	line "an item I bought"
	cont "from here and it"
	cont "evolved!"
	done

MahoganyDeptStore5FPokefanMText:
	text "You can't rename a"
	line "#MON you get in"
	cont "a trade."

	para "The name is a re-"
	line "flection of the"

	para "original trainer's"
	line "feelings for it."
	done

MahoganyDeptStore5FDirectoryText:
	text "Customize Your"
	line "#MON"

	para "5F TM CORNER"
	done

MahoganyDeptStore5F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 12,  0, MAHOGANY_DEPT_STORE_4F, 1
	warp_event 15,  0, MAHOGANY_DEPT_STORE_6F, 1
	warp_event  2,  0, MAHOGANY_DEPT_STORE_ELEVATOR, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event 14,  0, BGEVENT_READ, MahoganyDeptStore5FDirectory
	bg_event  3,  0, BGEVENT_READ, MahoganyDeptStore5FElevatorButton

	db 4 ; object events
	object_event  8,  5, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyDeptStore5FEvolutionClerkScript, -1
	object_event  7,  5, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyDeptStore5FBoostClerkScript, -1
	object_event  3,  6, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyDeptStore5FLassScript, -1
	object_event 13,  5, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyDeptStore5FPokefanMScript, -1
