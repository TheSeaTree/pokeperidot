	const_def 2 ; object constants
	const ROUTE21GATE_OFFICER
	const ROUTE21GATE_COOLTRAINERF
	const ROUTE21GATE_MONSTER

Route21Gate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route21GateOfficerScript:
	jumptextfaceplayer Route21GateOfficerText

Route21GateCooltrainerFScript:
	jumptextfaceplayer Route21GateCooltrainerFText

Route21GateNidoqueen:
	faceplayer
	opentext
	writetext Route21GateNidoqueenText
	cry NIDOQUEEN
	waitbutton
	closetext
	end

Route21GateOfficerText:
	text "A HIKER friend of"
	line "mine made the"
	cont "ledge on ROUTE 19."

	para "Haha! It saves me"
	line "the trouble of"
	cont "checking for"
	cont "trainers' BADGEs."
	done

Route21GateCooltrainerFText:
	text "Did you see the"
	line "#MON battle"
	cont "NIDOQUEEN and I"
	cont "had on ROUTE 21?"

	para "It was totally"
	line "cool! We won even"
	cont "though we were"
	cont "against a FLYING-"
	cont "type #MON!"
	done

Route21GateNidoqueenText:
	text "NIDOQUEEN: BARAUA!"
	done

Route21Gate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  0, ROUTE_22, 3
	warp_event  5,  0, ROUTE_22, 4
	warp_event  4,  7, ROUTE_21, 2
	warp_event  5,  7, ROUTE_21, 2

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  0,  4, SPRITE_OFFICER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route21GateOfficerScript, -1
	object_event  7,  3, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route21GateCooltrainerFScript, -1
	object_event  7,  4, SPRITE_MONSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, Route21GateNidoqueen, -1
