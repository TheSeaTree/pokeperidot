	const_def 2 ; object constants
	const CHERRYGROVEGYMSPEECHHOUSE_POKEFAN_M
	const CHERRYGROVEGYMSPEECHHOUSE_POKEFAN_F
	const CHERRYGROVEGYMSPEECHHOUSE_BUG_CATCHER

CherrygroveGymSpeechHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CherrygroveGymSpeechHousePokefanMScript:
	faceplayer 
	opentext
	writetext CherrygroveGymSpeechHousePokefanMText
	waitbutton
	turnobject LAST_TALKED, LEFT
	closetext
	end
	
CherrygroveGymSpeechHousePokefanFScript:
	faceplayer 
	opentext
	writetext CherrygroveGymSpeechHousePokefanFText
	waitbutton
	turnobject LAST_TALKED, RIGHT
	closetext
	end

CherrygroveGymSpeechHouseBugCatcherScript:
	faceplayer
	opentext
	writetext CherrygroveGymSpeechHouseBugCatcherText
	waitbutton
	turnobject LAST_TALKED, UP
	closetext
	end

CherrygroveGymSpeechHouseBookshelf:
	jumpstd picturebookshelf
	
CherrygroveGymSpeechHouseDrawers:
	jumptext CherrygroveGymSApeechHouseDrawerText

CherrygroveGymSpeechHouseConsole:
	jumptext CherrygroveGymSApeechHouseConsoleText

CherrygroveGymSpeechHousePokefanMText:
	text "My daughter just"
	line "wants to hang out"
	cont "at the INN."
	
	para "She hardly spends"
	line "any time at home"
	cont "anymore."
	done

CherrygroveGymSpeechHousePokefanFText:
	text "A child can't stay"
	line "at home forever."
	
	para "My husband has a"
	line "hard time coming"
	cont "to terms with this"
	cont "fact."
	done

CherrygroveGymSpeechHouseBugCatcherText:
	text "Do you mind?"
	line "I'm busy with my"
	cont "new game."
	done
	
CherrygroveGymSApeechHouseDrawerText:
	text "It's full of so"
	line "many kinds of"
	cont "video games!"
	done
	
CherrygroveGymSApeechHouseConsoleText:
	text "It's the brand new"
	line "NINTENDO console!"
	done

CherrygroveGymSpeechHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, CHERRYGROVE_CITY, 1
	warp_event  3,  7, CHERRYGROVE_CITY, 1

	db 0 ; coord events

	db 4 ; bg events
	bg_event  6,  1, BGEVENT_READ, CherrygroveGymSpeechHouseBookshelf
	bg_event  7,  1, BGEVENT_READ, CherrygroveGymSpeechHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, CherrygroveGymSpeechHouseDrawers
	bg_event  0,  2, BGEVENT_READ, CherrygroveGymSpeechHouseConsole

	db 3 ; object events
	object_event  5,  4, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CherrygroveGymSpeechHousePokefanMScript, -1
	object_event  2,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, PAL_NPC_RED, CherrygroveGymSpeechHousePokefanFScript, -1
	object_event  0,  3, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_UP, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CherrygroveGymSpeechHouseBugCatcherScript, -1
