	const_def 2 ; object constants
	const CIANWOODLUGIASPEECHHOUSE_TEACHER

CianwoodLugiaSpeechHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CianwoodLugiaSpeechHouseTeacherScript:
	faceplayer
	opentext
	checkevent EVENT_CIANWOOD_FLY_GUY
	iftrue .BoyfriendGone
	checkevent EVENT_GOT_TM_FLY
	iftrue .GotFly
	checkevent EVENT_CLEARED_CHURCH
	iffalse .NoRobbery
	writetext CianwoodFlyHouseTeacherSaved
	waitbutton
	verbosegiveitem TM_FLY
	setevent EVENT_GOT_TM_FLY
	clearevent EVENT_HIDE_TELEPORT_GUY

.GotFly:
	writetext GotFlyText
	waitbutton
	closetext
	end
	
.BoyfriendGone:
	writetext CianwoodLugiaSpeechHouseTeacherText
	waitbutton
	closetext
	end
	
.NoRobbery:
	writetext CianwoodFlyHouseTeacherBeforeText
	waitbutton
	closetext
	end

CianwoodLugiaSpeechHouseHikerScript:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_CHURCH
	iffalse .NoRobbery
	writetext CianwoodFlyHouseHikerText
	waitbutton
	closetext
	end
	
.NoRobbery:
	writetext CianwoodFlyHouseHikerBeforeText
	waitbutton
	closetext
	end
	
FlySpearow:
	opentext
	writetext FlySpearowText
	cry SPEAROW
	waitbutton
	closetext
	end

CianwoodLugiaSpeechHouseBookshelf:
	jumpstd picturebookshelf
	
CianwoodFlyHouseTeacherBeforeText:
	text "This town is great"
	line "for a couple to"
	cont "settle down."
	
	para "It's so peaceful"
	line "up here."
	done
	
CianwoodFlyHouseHikerBeforeText:
	text "I took my girl-"
	line "friend up here for"
	cont "a vacation once."
	
	para "She fell in love"
	line "with this mountain"
	cont "and demanded we"
	cont "move up here."
	done
	
CianwoodFlyHouseHikerText:
	text "Thanks a lot for"
	line "backing me up out"
	cont "there, kid."

	para "It's been a long"
	line "time since I've"
	cont "had to battle like"
	cont "that."
	done
	
CianwoodLugiaSpeechHouseTeacherText:
	text "Did you hear about"
	line "the robbery?"
	
	para "My boyfriend went"
	line "to check it out."
	
	para "I hope he doesn't"
	line "get into any"
	cont "trouble."
	done
	
CianwoodFlyHouseTeacherSaved:
	text "Thank you so much"
	line "for helping out my"
	cont "boyfriend!"
	
	para "Here is a rare"
	line "item those thieves"
	cont "couldn't get their"
	cont "hands on."

	para "I know we can"
	line "trust it with you."
	done
	
GotFlyText:
	text "With that TM, your"
	line "bird #MON can"
	cont "take you to any"
	cont "place you have"
	cont "already visited."
	
	para "It really grants a"
	line "lot of freedom!"
	done
	
FlySpearowText:
	text "SPEAROW: Ch-chun!"
	done

CianwoodLugiaSpeechHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, CIANWOOD_CITY, 3
	warp_event  3,  7, CIANWOOD_CITY, 3

	db 0 ; coord events

	db 2 ; bg events
	bg_event  0,  1, BGEVENT_READ, CianwoodLugiaSpeechHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, CianwoodLugiaSpeechHouseBookshelf

	db 3 ; object events
	object_event  2,  4, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodLugiaSpeechHouseTeacherScript, -1
	object_event  4,  5, SPRITE_MOLTRES, SPRITEMOVEDATA_POKEMON, 2, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, FlySpearow, -1
	object_event  5,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STILL, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CianwoodLugiaSpeechHouseHikerScript, EVENT_CIANWOOD_FLY_GUY
