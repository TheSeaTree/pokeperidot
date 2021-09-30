	const_def 2 ; object constants

Route27Gate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route27GateOfficerMScript:
	jumptext Route27GateOfficerMText

Route27GateOfficerFScript:
	jumptext Route27GateOfficerFText

Route27GateCooltrainerMScript:
	jumptextfaceplayer Route27GateCooltrainerMText

Route27GateOfficerMText:
	text "You won't find any"
	line "#MON on ROUTE"
	cont "27, but there are"
	cont "always trainers"
	cont "around looking for"
	cont "a good battle!"

	para "I even take part"
	line "myself when I'm"
	cont "off duty!"
	done

Route27GateOfficerFText:
	text "Going to ROUTE 27"
	line "for some battles?"

	para "The man who works"
	line "here during the"
	cont "day is quite good!"
	done

Route27GateCooltrainerMText:
	text "The NURSE on ROUTE"
	line "27 is sorta cute,"
	cont "don't you think?"

	para "Something about"
	line "is… different."

	para "I would talk to"
	line "her, but she is"
	cont "always so busy"
	cont "healing everyone's"
	cont "#MON."
	done

Route27Gate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0,  4, VICTORY_COAST, 3
	warp_event  0,  5, VICTORY_COAST, 4
	warp_event  9,  4, ROUTE_27, 1
	warp_event  9,  5, ROUTE_27, 2

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  5,  2, SPRITE_OFFICER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, 3, 17, 0, OBJECTTYPE_SCRIPT, 0, Route27GateOfficerMScript, -1
	object_event  5,  2, SPRITE_OFFICER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, NITE, 0, OBJECTTYPE_SCRIPT, 0, Route27GateOfficerFScript, -1
	object_event  9,  2, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route27GateCooltrainerMScript, -1
