	const_def 2 ; object constants
	const ROUTE23GATE_OFFICER

Route23Gate_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .Computer

.Computer
	changeblock 6, 2, $27
	return

Route23GateOfficerMScript:
	opentext
	writetext Route23GateOfficerMText
	waitbutton
	closetext
	showemote EMOTE_QUESTION, ROUTE23GATE_OFFICER, 15
	faceplayer
	opentext
	writetext Route23GateOfficerMNoticeText
	waitbutton
	closetext
	turnobject ROUTE23GATE_OFFICER, RIGHT
	end

Route23GateComputer:
	jumptext Route23GateComputerText

Route23GateOfficerMText:
	text "……………"
	done

Route23GateOfficerMNoticeText:
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

Route23GateComputerText:
	text "The computer's"
	line "speakers are"
	cont "turned way up."

	para "There's sounds of"
	line "monsters hissing"
	cont "and explosions."
	done

Route23Gate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0,  4, ROUTE_22, 5
	warp_event  0,  5, ROUTE_22, 6
	warp_event  9,  4, ROUTE_23, 3
	warp_event  9,  5, ROUTE_23, 4

	db 0 ; coord events

	db 1 ; bg events
	bg_event  7,  2, BGEVENT_READ, Route23GateComputer

	db 1 ; object events
	object_event  6,  2, SPRITE_OFFICER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route23GateOfficerMScript, -1
