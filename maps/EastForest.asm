	const_def 2 ; object constants

EastForest_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

EastForestMoveTutor:
	faceplayer
	opentext
	writetext EastForestTutorText
	yesorno
	iffalse .Refused
	checkitem GOLD_LEAF
	iffalse .NoLeaf
	writetext EastForestTutorTeach
	loadmenu .MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .Nightmare
	ifequal 2, .DreamEater
	jump .Refused
	end
	
.Nightmare
	writebyte NIGHTMARE
	special MoveTutor
	ifequal $0, .TeachMove
	jump .Refused

.DreamEater
	writebyte DREAM_EATER
	special MoveTutor
	ifequal $0, .TeachMove
	jump .Refused

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 15, 6
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 2 ; items
	db "NIGHTMARE@"
	db "DREAM EATER@"

.TeachMove
	takeitem GOLD_LEAF
	writetext EastForestTutorThankYou
	waitbutton
	closetext
	end
	
.Refused
	writetext EastForestTutorRefused
	waitbutton
	closetext
	end
	
.NoLeaf
	writetext EastForestTutorExplainGoldLeaf
	waitbutton
	closetext
	giveitem GOLD_LEAF
	end

EastForestHypnoScript:
	opentext
	writetext EastForestHypnoText
	cry HYPNO
	waitsfx
	waitbutton
	writetext EastForestHypnoAfterText
	waitbutton
	closetext
	end

EastForestTutorText:
	text "I can teach your"
	line "#MON some moves"
	cont "that work great on"
	cont "a sleeping foe."
	
	para "All fun comes at a"
	line "cost, though."
	
	para "One GOLD LEAF"
	line "each. Deal?"
	done
	
EastForestTutorExplainGoldLeaf:
	text "No payment?"
	
	para "I hope you don't"
	line "start feeling"
	cont "drowsy out here."
	
	para "You might be able"
	line "to experience my"
	cont "moves first hand…"
	done
	
EastForestTutorTeach:
	text "What move shall I"
	line "teach?"
	done
	
EastForestTutorRefused:
	text "You aren't inter-"
	line "ested in causing"
	cont "trouble to anyone"
	cont "trying to get some"
	cont "rest in this"
	cont "forest? Shame…"
	done
	
EastForestTutorThankYou:
	text "It's always dark"
	line "in this forest."
	
	para "That means lots of"
	line "people and #MON"
	cont "are going to start"
	cont "getting tired when"
	cont "they're not from"
	cont "around here."
	
	para "Hehehe…"
	done
	
EastForestHypnoText:
	text "HYPNO: Hiiiip…"
	line "no…"
	
	para "Hip…"
	line "no…"
	done
	
EastForestHypnoAfterText:
	text "The way HYPNO is" 
	line "swinging its"
	cont "pendulum…"
	
	para "It's mesmerizing…"
	done
	
EastForest_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event  4,  6, ROUTE_4_FOREST_GATE, 3
	warp_event  4,  7, ROUTE_4_FOREST_GATE, 4
	warp_event 50,  9, FACTORY_1F, 1
	warp_event 51,  5, FACTORY_BACK, 3
	warp_event 55,  1, RAIKOU_LAIR, 1

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event 12, 18, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EastForestMoveTutor, -1
	object_event 13, 18, SPRITE_JYNX, SPRITEMOVEDATA_POKEMON, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
