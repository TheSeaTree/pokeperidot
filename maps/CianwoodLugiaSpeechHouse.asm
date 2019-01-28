	const_def 2 ; object constants
	const CIANWOODLUGIASPEECHHOUSE_TEACHER

CianwoodLugiaSpeechHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CianwoodLugiaSpeechHouseTeacherScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM_FLY
	iftrue .GotFly
	writetext CianwoodLugiaSpeechHouseTeacherText
	waitbutton
	verbosegiveitem TM_FLY
	setevent EVENT_GOT_TM_FLY
	buttonsound

.GotFly:
	writetext GotFlyText
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

CianwoodLugiaSpeechHouseTeacherText:
	text "You made it all"
	line "the way up this"
	cont "mountain?"

	para "How do you expect"
	line "to make it down?"
	
	para "Oh, I know! You"
	line "could use this!"
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
	warp_event  2,  7, CIANWOOD_CITY, 6
	warp_event  3,  7, CIANWOOD_CITY, 6

	db 0 ; coord events

	db 2 ; bg events
	bg_event  0,  1, BGEVENT_READ, CianwoodLugiaSpeechHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, CianwoodLugiaSpeechHouseBookshelf

	db 3 ; object events
	object_event  2,  4, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodLugiaSpeechHouseTeacherScript, -1
	object_event  4,  5, SPRITE_MOLTRES, SPRITEMOVEDATA_POKEMON, 2, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, FlySpearow, -1
	object_event  3,  4, SPRITE_PAPER, SPRITEMOVEDATA_STILL, 2, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1 ; note explaining that she's at the church to see what's going on
	