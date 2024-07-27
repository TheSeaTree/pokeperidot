	const_def 2 ; object constants
	const ROUTE23GATE_OFFICER
	const ROUTE23GATE_COOLTRAINERF

Route23Gate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route23GateOfficerScript:
	jumptextfaceplayer Route23GateOfficerText

Route23GateCooltrainerFScript:
	jumptextfaceplayer Route23GateCooltrainerFText

Route27GateNidoqueen:
	faceplayer
	opentext
	writetext Route27GateNidoqueenText
	cry NIDOQUEEN
	waitbutton
	closetext
	end

Route23GateOfficerText:
	text "A HIKER friend of"
	line "mine made the"
	cont "ledge on ROUTE 19."

	para "Haha! It saves me"
	line "the trouble of"
	cont "checking for"
	cont "trainers' BADGEs."
	done

Route23GateCooltrainerFText:
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

Route27GateNidoqueenText:
	text "NIDOQUEEN: BARAUA!"
	done

Route23Gate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  0, ROUTE_22, 3
	warp_event  5,  0, ROUTE_22, 4
	warp_event  4,  7, ROUTE_21, 2
	warp_event  5,  7, ROUTE_21, 2

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  0,  4, SPRITE_OFFICER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route23GateOfficerScript, -1
	object_event  7,  3, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route23GateCooltrainerFScript, -1
	object_event  7,  4, SPRITE_MONSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, Route27GateNidoqueen, EVENT_BEAT_ELITE_FOUR
