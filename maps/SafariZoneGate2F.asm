	const_def 2 ; object constants
	const SAFARI_ZONE_GATE_LASS
	const SAFARI_ZONE_GATE_RAPHAEL

SafariZoneGate2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SafariZoneBinoculars:
	random 4
	ifequal 0, .Chansey
	ifequal 1, .Dodrio
	ifequal 2, .Nothing
	ifequal 3, .Nothing
	
.Nothing
	jumptext SafariZoneBinocularsNothing

.Dodrio
	jumptext SafariZoneBinocularsDodrio

.Chansey
	jumptext SafariZoneBinocularsChansey
	
SafariZoneGateLass:
	faceplayer
	opentext
	writetext SafariZoneGateLassText
	waitbutton
	closetext
	turnobject SAFARI_ZONE_GATE_LASS, UP
	end
	
Raphael:
	faceplayer
	opentext
	trade NPC_TRADE_RAPHAEL
	waitbutton
	closetext
	end
	
SafariZoneBinocularsNothing:
	text "Hm…"
	
	para "There doesn't seem"
	line "to be anything"
	cont "interesting going"
	cont "on outside."
	done
	
SafariZoneBinocularsChansey:
	text "There's a CHANSEY"
	line "outside!"
	
	para "It seems to be"
	line "chasing the egg it"
	cont "dropped."
	done
	
SafariZoneBinocularsDodrio:
	text "There's a DODRIO!"
	
	para "Its heads don't"
	line "look like they get"
	cont "along very well."
	done
	
SafariZoneGateLassText:
	text "I like to watch"
	line "all of the cute"
	cont "#MON outside!"
	done
	
SafariZoneMachokeText:
	text "…Did that MACHOKE"
	line "just throw a"
	cont "#BALL?"
	
	para "………"
	
	para "Oh! It was a"
	line "VOLTORB…?"
	done

SafariZoneGate2F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  0,  7, SAFARI_ZONE_GATE_1F, 4

	db 0 ; coord events

	db 1 ; bg events
	bg_event  2,  2, BGEVENT_UP, SafariZoneBinoculars

	db 2 ; object events
	object_event  5,  2, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SafariZoneGateLass, -1
	object_event  6,  4, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Raphael, -1
