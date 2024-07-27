	const_def 2 ; object constants
	const ROUTE26GATE_OFFICER

Route26Gate_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .Computer

.Computer
	changeblock 6, 2, $27
	return

Route26GateOfficerMScript:
	opentext
	writetext Route26GateOfficerMText
	waitbutton
	closetext
	showemote EMOTE_QUESTION, ROUTE26GATE_OFFICER, 15
	faceplayer
	opentext
	writetext Route26GateOfficerMNoticeText
	waitbutton
	closetext
	turnobject ROUTE26GATE_OFFICER, RIGHT
	end

Route26GateComputer:
	jumptext Route26GateComputerText

Route26GateOfficerMText:
	text "……………"
	done

Route26GateOfficerMNoticeText:
	text "Oh! I didn't notice"
	line "you there."

	para "This GATE has such"
	line "little foot"
	cont "traffic that I"
	cont "spend most of my"
	cont "day just playing"
	cont "computer games."

	para "You can go on"
	line "ahead, I'm busy"
	cont "right now."
	done

Route26GateComputerText:
	text "The computer's"
	line "speakers are"
	cont "turned way up."

	para "There's sounds of"
	line "monsters hissing"
	cont "and explosions."
	done

Route26Gate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0,  4, ROUTE_22, 5
	warp_event  0,  5, ROUTE_22, 6
	warp_event  9,  4, ROUTE_23, 3
	warp_event  9,  5, ROUTE_23, 4

	db 0 ; coord events

	db 1 ; bg events
	bg_event  7,  2, BGEVENT_READ, Route26GateComputer

	db 1 ; object events
	object_event  6,  2, SPRITE_OFFICER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route26GateOfficerMScript, -1
