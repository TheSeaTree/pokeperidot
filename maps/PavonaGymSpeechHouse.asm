	const_def 2 ; object constants

PavonaGymSpeechHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PavonaGymSpeechHousePokefanMScript:
	faceplayer 
	opentext
	writetext PavonaGymSpeechHousePokefanMText
	waitbutton
	turnobject LAST_TALKED, LEFT
	closetext
	end
	
PavonaGymSpeechHousePokefanFScript:
	faceplayer 
	opentext
	writetext PavonaGymSpeechHousePokefanFText
	waitbutton
	turnobject LAST_TALKED, RIGHT
	closetext
	end

PavonaGymSpeechHouseBugCatcherScript:
	faceplayer
	opentext
	writetext PavonaGymSpeechHouseBugCatcherText
	waitbutton
	turnobject LAST_TALKED, UP
	closetext
	end

PavonaGymSpeechHouseBookshelf:
	jumpstd picturebookshelf
	
PavonaGymSpeechHouseDrawers:
	jumptext PavonaGymSApeechHouseDrawerText

PavonaGymSpeechHouseConsole:
	jumptext PavonaGymSApeechHouseConsoleText

PavonaGymSpeechHousePokefanMText:
	text "My daughter just"
	line "wants to hang out"
	cont "at the INN."
	
	para "She hardly spends"
	line "any time at home"
	cont "anymore."
	done

PavonaGymSpeechHousePokefanFText:
	text "A child can't stay"
	line "at home forever."
	
	para "My husband has a"
	line "hard time coming"
	cont "to terms with this"
	cont "fact."
	done

PavonaGymSpeechHouseBugCatcherText:
	text "Do you mind?"
	line "I'm busy with my"
	cont "new game."
	done
	
PavonaGymSApeechHouseDrawerText:
	text "It's full of so"
	line "many kinds of"
	cont "video games!"
	done
	
PavonaGymSApeechHouseConsoleText:
	text "It's the brand new"
	line "NINTENDO console!"
	done

PavonaGymSpeechHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, PAVONA_VILLAGE, 1
	warp_event  3,  7, PAVONA_VILLAGE, 1

	db 0 ; coord events

	db 4 ; bg events
	bg_event  6,  1, BGEVENT_READ, PavonaGymSpeechHouseBookshelf
	bg_event  7,  1, BGEVENT_READ, PavonaGymSpeechHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, PavonaGymSpeechHouseDrawers
	bg_event  0,  2, BGEVENT_READ, PavonaGymSpeechHouseConsole

	db 3 ; object events
	object_event  5,  4, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PavonaGymSpeechHousePokefanMScript, -1
	object_event  2,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, PAL_NPC_RED, PavonaGymSpeechHousePokefanFScript, -1
	object_event  0,  3, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_UP, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PavonaGymSpeechHouseBugCatcherScript, -1
