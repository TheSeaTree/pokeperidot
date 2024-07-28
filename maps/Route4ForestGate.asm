	const_def 2 ; object constants
	const ROUTE4FORESTGATE_OFFICER

Route4ForestGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route4ForestGateOfficerScript:
	jumptextfaceplayer Route4ForestGateOfficerText

Route4ForestGateScientistScript:
	faceplayer
	opentext
	checkevent EVENT_SHOWED_PORYGON2
	iftrue .porygon2after
	checkevent EVENT_GOT_UP_GRADE
	iftrue .gotupgrade
	writebyte PORYGON2
	special FindPartyMonThatSpecies
	iftrue .haveporygon2
	writetext Route4ForestGateScientistText
	waitbutton
	writebyte PORYGON
	special FindPartyMonThatSpecies
	iftrue .haveporygon
	writetext Route4ForestGateScientistNoPorygonText
	waitbutton
	closetext
	end
	
.haveporygon:
	writetext Route4ForestGateScientistHavePorygonText
	waitbutton
	verbosegiveitem UP_GRADE
	iffalse .noroom
	setevent EVENT_GOT_UP_GRADE

.gotupgrade:
	writetext Route4ForestGateScientistAfterText
	waitbutton
	closetext
	end

.noroom:
	writetext Route4ForestGateScientistNoRoomText
	waitbutton
	closetext
	end

.haveporygon2:
	writetext Route4ForestGateScientistHavePorygon2Text
	setevent EVENT_SHOWED_PORYGON2
	waitbutton
	
.porygon2after:
	writetext Route4ForestGateScientistHavePorygon2AfterText
	waitbutton
	closetext
	end

Route4ForestGateOfficerText:
	text "There is some sort"
	line "of electrical dis-"
	cont "turbance going on."

	para "The portable TV I"
	line "bring isn't picking"
	cont "anything up today."
	done
	
Route4ForestGateScientistText:
	text "There are rumors"
	line "of an abandoned"
	cont "lab in the forest"
	cont "where PORYGON were"
	cont "produced."
	
	para "I've always wanted"
	line "to see a PORYGON,"
	cont "but I'm not brave"
	cont "enough to go out"
	cont "to find that lab."
	done
	
Route4ForestGateScientistNoPorygonText:
	text "If you ever come"
	line "across a PORYGON,"
	cont "I have some"
	cont "software that may"
	cont "be compatible"
	cont "with it."
	done
	
Route4ForestGateScientistHavePorygonText:
	text "Wow! It's a real"
	line "PORYGON!"
	
	para "Here, please test"
	line "out this software"
	cont "on it."
	done
	
Route4ForestGateScientistNoRoomText:
	text "There's not enough"
	line "room in your BAG"
	cont "for this item."
	done
	
Route4ForestGateScientistAfterText:
	text "Just let your"
	line "PORYGON hold onto"
	cont "the UP-GRADE, and"
	cont "something special"
	cont "might happen."
	done
	
Route4ForestGateScientistHavePorygon2Text:
	text "Amazing!"
	
	para "Your PORYGON"
	line "evolved from using"
	cont "the UP-GRADE!"
	done
	
Route4ForestGateScientistHavePorygon2AfterText:
	text "I wonder if a"
	line "PORYGON2 will ever"
	cont "evolve further…"
	
	para "I guess we'll"
	line "never know."
	done

Route4ForestGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0,  4, ROUTE_4, 3
	warp_event  0,  5, ROUTE_4, 4
	warp_event  9,  4, ORIENTEM_FOREST, 1
	warp_event  9,  5, ORIENTEM_FOREST, 2

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  5,  2, SPRITE_OFFICER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route4ForestGateOfficerScript, -1
	object_event  8,  3, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Route4ForestGateScientistScript, -1
