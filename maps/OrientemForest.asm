	const_def 2 ; object constants

OrientemForest_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .BackRoomWall

.BackRoomWall:
	checkcode VAR_XCOORD
	ifnotequal 52, .nope
	checkcode VAR_YCOORD
	ifnotequal  4, .nope
	setevent EVENT_FACTORY_BACK_ROOM_SMASH_WALL
.nope
	return

TrainerTeacherBea:
	trainer TEACHER, BEA, EVENT_BEAT_TEACHER_BEA, TeacherBeaText, TeacherBeaWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TeacherBeaWinText
	waitbutton
	closetext
	end

OrientemForestMoveTutor:
	faceplayer
	opentext
	writetext OrientemForestTutorText
	yesorno
	iffalse .Refused
	checkitem GOLD_LEAF
	iffalse .NoLeaf
	writetext OrientemForestTutorTeach
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
	writetext OrientemForestTutorThankYou
	waitbutton
	closetext
	end
	
.Refused
	writetext OrientemForestTutorRefused
	waitbutton
	closetext
	end
	
.NoLeaf
	writetext OrientemForestTutorExplainGoldLeaf
	waitbutton
	closetext
	end

OrientemForestHypnoScript:
	opentext
	writetext OrientemForestHypnoText
	cry HYPNO
	waitsfx
	waitbutton
	writetext OrientemForestHypnoAfterText
	waitbutton
	closetext
	end

OrientemForestBrightpowder:
	itemball BRIGHTPOWDER

OrientemForestFruitTree:
	fruittree FRUITTREE_ORIENTEM_FOREST

OrientemForestPowerPlantSign:
	jumptext OrientemForestPowerPlantSignText
	
OrientemForestPowerPlantFence:
	jumptext OrientemForestPowerPlantFenceText

TeacherBeaText:
	text "Yaaaaawn…"
	
	para "Gosh, I'm sorry."
	
	para "A battle? Okay."
	done
	
TeacherBeaWinText:
	text "Oh my, is our"
	line "battle over…?"
	done
	
TeacherBeaAfterText:
	text "Normally I'm quite"
	line "alert, but some-"
	cont "thing about this"
	cont "forest has gotten"
	cont "me so sleepy…"

	para "I think my #MON"
	line "feel it too."
	done

OrientemForestTutorText:
	text "I can teach your"
	line "#MON some moves"
	cont "that work great on"
	cont "a sleeping foe."

	para "All fun comes at a"
	line "cost, though."

	para "One GOLD LEAF"
	line "each. Deal?"
	done

OrientemForestTutorExplainGoldLeaf:
	text "No payment?"

	para "I hope you don't"
	line "start feeling"
	cont "drowsy out here."

	para "You might be able"
	line "to experience my"
	cont "moves first hand…"
	done

OrientemForestTutorTeach:
	text "What move shall I"
	line "teach?"
	done

OrientemForestTutorRefused:
	text "You aren't inter-"
	line "ested in causing"
	cont "trouble to any-"
	cont "thing trying to"
	cont "get some rest in"
	cont "this forest?"

	para "Shame…"
	done

OrientemForestTutorThankYou:
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

OrientemForestHypnoText:
	text "HYPNO: Hiiiip…"
	line "no…"

	para "Hip…"
	line "no…"
	done

OrientemForestHypnoAfterText:
	text "The way HYPNO is" 
	line "swinging its"
	cont "pendulum…"

	para "It's…"
	line "mesmerizing…"
	done

OrientemForestPowerPlantSignText:
	text "No tr…  pas…  g!"

	para "…This sign is too"
	line "weathered to make"
	cont "out. It must be"
	cont "very old."
	done

OrientemForestPowerPlantFenceText:
	text "Something must"
	line "have torn this"
	cont "fence open."

	para "…But what?"
	done

OrientemForest_MapEvents:
	db 0, 0 ; filler

	db 6 ; warp events
	warp_event  4,  6, ROUTE_4_FOREST_GATE, 3
	warp_event  4,  7, ROUTE_4_FOREST_GATE, 4
	warp_event 50, 10, FACTORY_1F, 1
	warp_event 51, 10, FACTORY_1F, 2
	warp_event 52,  4, FACTORY_BACK, 3
	warp_event 55,  1, RAIKOU_LAIR, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event 47, 14, BGEVENT_UP, OrientemForestPowerPlantSign
	bg_event 45, 13, BGEVENT_READ, OrientemForestPowerPlantFence

	db 5 ; object events
	object_event 16, 10, SPRITE_TEACHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerTeacherBea, -1
	object_event 12, 18, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OrientemForestMoveTutor, -1
	object_event 13, 18, SPRITE_JYNX, SPRITEMOVEDATA_POKEMON, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OrientemForestHypnoScript, -1
	object_event 24, 28, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, OrientemForestBrightpowder, EVENT_ORIENTEM_FOREST_BRIGHTPOWDER
	object_event 27, 11, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OrientemForestFruitTree, -1
