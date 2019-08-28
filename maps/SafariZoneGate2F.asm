	const_def 2 ; object constants
	const SAFARI_ZONE_GATE_LASS
	const SAFARI_ZONE_GATE_RAPHAEL

SafariZoneGate2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SafariZoneBinoculars1:
	random 12
	ifequal 0, .Venomoth
	ifequal 1, .Venomoth
	ifequal 2, .Dodrio
	ifequal 3, .Dodrio
	ifequal 4, .NidorinoNidorina
	ifequal 5, .NidorinoNidorina
	ifequal 6, .Bellossom
	ifequal 7, .Chansey
	jumptext SafariZoneBinocularsNothing

.Venomoth
	jumptext SafariZoneBinocularsVenomoth

.Dodrio
	jumptext SafariZoneBinocularsDodrio
	
.Bellossom
	jumptext SafariZoneBinocularsBellossom

.Chansey
	jumptext SafariZoneBinocularsChansey
	
.NidorinoNidorina
	jumptext SafariZoneBinocularsNidorinoNidorina

SafariZoneBinoculars2:
	random 12
	ifequal 0, .Machoke
	ifequal 1, .Machoke
	ifequal 2, .Rhyhorn
	ifequal 3, .Rhyhorn
	ifequal 4, .Kangaskhan
	ifequal 5, .Clefable
	ifequal 6, .Clefable
	ifequal 7, .Sunflora
	jumptext SafariZoneBinocularsNothing
	
.Machoke
	jumptext SafariZoneBinocularsMachoke
	
.Rhyhorn
	jumptext SafariZoneBinocularsRhyhorn	

.Kangaskhan
	jumptext SafariZoneBinocularsKangaskhan
	
.Clefable
	jumptext SafariZoneBinocularsClefable
	
.Sunflora
	checktime NITE
	iftrue .Nite
	jumptext SafariZoneBinocularsSunfloraDay
	
.Nite
	jumptext SafariZoneBinocularsSunfloraNight
	
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
	text "Woah!"
	
	para "There's a CHANSEY"
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
	
SafariZoneBinocularsNidorinoNidorina:
	text "A NIDORINA and"
	line "NIDORINO are"
	cont "having a battle!"
	done
	
SafariZoneBinocularsVenomoth:
	text "Oh, a VENOMOTH!"
	
	para "The dust coming"
	line "from its wings"
	cont "shimmers like"
	cont "glitter."
	done
	
SafariZoneBinocularsBellossom:
	text "There's a group of"
	line "BELLOSSOM outside!"
	
	para "They're dancing in"
	line "sync perfectly."
	done
	
SafariZoneGateLassText:
	text "I like to watch"
	line "all of the cute"
	cont "#MON outside!"
	
	para "Sometimes I see a"
	line "really rare one!"
	done
	
SafariZoneBinocularsMachoke:
	text "…Did that MACHOKE"
	line "just throw a"
	cont "#BALL?"
	
	para "………"
	
	para "Oh! It was a"
	line "VOLTORB…?"
	done
	
SafariZoneBinocularsRhyhorn:
	text "A stampeding"
	line "RHYHORN is chasing"
	cont "a trainer away!"
	done
	
SafariZoneBinocularsKangaskhan:
	text "A KANGASKHAN is"
	line "babying a LARVITAR"
	cont "it found."
	
	para "…LARVITAR seems to"
	line "want none of it."
	done
	
SafariZoneBinocularsClefable:
	text "CLEFABLE are"
	line "wagging their"
	cont "fingers in unison."
	
	para "Oh…?"
	
	para "………"
	
	para "One of them used"
	line "EXPLOSION…"
	done

SafariZoneBinocularsSunfloraDay:
	text "Wow, that SUNFLORA"
	line "seems to be very"
	cont "happy soaking up"
	cont "sunlight!"
	done
	
SafariZoneBinocularsSunfloraNight:
	text "Is that a"
	line "SUNFLORA?"
	
	para "…It doesn't seem"
	line "to be moving at"
	cont "all now that the"
	cont "sun has set."
	done

SafariZoneGate2F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  0,  7, SAFARI_ZONE_GATE_1F, 4

	db 0 ; coord events

	db 2 ; bg events
	bg_event  2,  2, BGEVENT_UP, SafariZoneBinoculars1
	bg_event  6,  2, BGEVENT_UP, SafariZoneBinoculars2

	db 2 ; object events
	object_event  1,  2, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SafariZoneGateLass, -1
	object_event  6,  4, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Raphael, -1
