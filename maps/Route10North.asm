	const_def 2 ; object constants
	const ROUTE_8_TUTOR

Route10North_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route10DigGuy:
	checkevent EVENT_GOT_TM_DIG
	iftrue .GotDig
	opentext
	writetext Route10DigGuyText
	waitbutton
	closetext
	wait 5
	showemote EMOTE_SHOCK, ROUTE_8_TUTOR, 15
	faceplayer
	opentext
	writetext Route10DigGuyNoticeText
	waitbutton
	checkitem FRESH_WATER
	iffalse .NoWater
	writetext Route10DigGuyGiveWaterText
	yesorno
	iffalse .RefuseWater

	playsound SFX_FULL_HEAL
	writetext PlayerGiveWaterText
	takeitem FRESH_WATER
	waitsfx
	waitbutton
	closetext
	opentext
	writetext Route10DigGuyGaveWaterText
	waitbutton
	verbosegiveitem TM_DIG
	setevent EVENT_GOT_TM_DIG
.ExplainDig
	writetext Route10DigGuyExplainDig
	waitbutton
	jump .NoWater

.RefuseWater
	writetext Route10DigGuyDenyWaterText
	waitbutton
	
.NoWater
	closetext
	turnobject ROUTE_8_TUTOR, LEFT
	end

.GotDig
	faceplayer
	opentext
	jump .ExplainDig

PowerPlantSign:
	jumptext PowerPlantSignText

PowerPlantSignText:
	text "PALEROCK CAVERN"
	done
	
Route10DigGuyText:
	text "Huff…"
	line "Puff…"
	
	para "…"
	done
	
Route10DigGuyNoticeText:
	text "Oh… Hello…"
	
	para "I'm sorry, please"
	line "give me a moment"
	cont "to catch my"
	cont "breath."

	para "Huff…"
	line "Puff…"
	
	para "Hiking can take a"
	line "lot out of you."
	
	para "I'd be pretty darn"
	line "thankful if"
	cont "someone handed me"
	cont "a water right now…"
	done
	
Route10DigGuyGiveWaterText:
	text "Would you mind if"
	line "I took that FRESH"
	cont "WATER? I could"
	cont "really use it…"
	done
	
Route10DigGuyDenyWaterText:
	text "Aw, come on kid."
	
	para "Can't you see I"
	line "need it?"
	done
	
PlayerGiveWaterText:
	text "<PLAYER> gave"
	line "the man a bottle"
	cont "of FRESH WATER."
	done
	
Route10DigGuyGaveWaterText:
	text "Oh, thank you so"
	line "much!"
	
	para "Glug… Glug… Glug…"
	line "Ah!"
	
	para "That really hit"
	line "the spot! I feel"
	cont "much better now!"
	
	para "Here, let me give"
	line "something back for"
	cont "your generosity."
	
	para "None of my #MON"
	line "have been able to"
	cont "use this anyway,"
	cont "maybe yours could."	
	done
	
Route10DigGuyExplainDig:
	text "That move is "
	line "called DIG."
	
	para "Your #MON will"
	line "burrow underground"
	cont "for a turn before"
	cont "striking an"
	cont "unsuspecting foe!"
	
	para "The beauty of it?"
	line "Your #MON can't"
	cont "even be hit while"
	cont "they are in the"
	cont "ground!"
	
	para "Wait!"
	line "It gets better!"
	
	para "You can even use"
	line "DIG to escape"
	cont "caves quickly."
	
	para "Trust me, kid, you"
	line "would want to save"
	cont "your legs the"
	cont "trouble."
	done

Route10North_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  4,  2, ROUTE_7_ROUTE_8_GATE, 3
	warp_event  4,  3, ROUTE_7_ROUTE_8_GATE, 4
	warp_event 22, 13, PALEROCK_CAVE_1F, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event 24, 14, BGEVENT_READ, PowerPlantSign

	db 1 ; object events
	object_event 14, 21, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Route10DigGuy, -1
