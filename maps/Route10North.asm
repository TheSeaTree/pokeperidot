	const_def 2 ; object constants
	const ROUTE_10_TUTOR

Route10North_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
Route10MoveTutor:
	checkevent EVENT_GAVE_DIG_TUTOR_WATER
	iftrue .GaveWater
	opentext
	writetext Route10TutorText
	waitbutton
	closetext
	wait 5
	showemote EMOTE_SHOCK, ROUTE_10_TUTOR, 15
	faceplayer
	opentext
	writetext Route10TutorNoticeText
	waitbutton
	checkitem FRESH_WATER
	iffalse .NoWater
	writetext Route10TutorGiveWaterText
	yesorno
	iffalse .RefuseWater

	playsound SFX_FULL_HEAL
	writetext PlayerGiveWaterText
	takeitem FRESH_WATER
	setevent EVENT_GAVE_DIG_TUTOR_WATER
	waitsfx
	waitbutton
	closetext
	opentext
	writetext Route10TutorGaveWaterText
	waitbutton
	writetext Route10TutorExplainDig
	waitbutton
	closetext
.GaveWater
	faceplayer
	opentext
	writetext Route10TutorTeachDig
	yesorno
	iftrue .Dig
	jump .Refused
	
.Dig
	writetext Route10TutorWhichOne
	buttonsound
	writebyte DIG
	special MoveTutor
	ifequal $0, .TeachMove
	jump .Refused
	
.TeachMove
	writetext Route10TutorAfterTeaching
	waitbutton
	closetext
	end
	
.Refused
	writetext Route10TutorRefused
	waitbutton
	closetext
	turnobject ROUTE_10_TUTOR, LEFT
	end
	
.RefuseWater
	writetext Route10TutorDenyWaterText
	waitbutton
	
.NoWater
	closetext
	turnobject ROUTE_10_TUTOR, LEFT
	end

PowerPlantSign:
	jumptext PowerPlantSignText

PowerPlantSignText:
	text "PALEROCK CAVERN"
	done
	
Route10TutorText:
	text "Huff…"
	line "Puff…"
	
	para "…"
	done
	
Route10TutorNoticeText:
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
	
Route10TutorGiveWaterText:
	text "Would you mind if"
	line "I took that FRESH"
	cont "WATER? I could"
	cont "really use it…"
	done
	
Route10TutorDenyWaterText:
	text "Aw, come on kid."
	
	para "Can't you see I"
	line "need it?"
	done
	
PlayerGiveWaterText:
	text "<PLAYER> gave"
	line "the man a bottle"
	cont "of FRESH WATER."
	done
	
Route10TutorGaveWaterText:
	text "Oh, thank you so"
	line "much!"
	
	para "Glug… Glug… Glug…"
	line "Ah!"
	
	para "That really hit"
	line "the spot! I feel"
	cont "much better now!"
	done
	
Route10TutorExplainDig:
	text "After taking that"
	line "break, I feel"
	cont "ready to teach my"
	cont "special move once"
	cont "again."
	
	para "None of my #MON"
	line "have been able to"
	cont "learn it, but"
	cont "maybe yours could."
	
	para "It's called DIG."
	
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
	
Route10TutorTeachDig:
	text "So do you want me"
	line "to teach DIG to"
	cont "your #MON?"
	done
	
Route10TutorWhichOne:
	text "Which #MON"
	line "am I tutoring?"
	done
	
Route10TutorAfterTeaching:
	text "I hope that move"
	line "will help you out"
	cont "there."
	
	para "I know it would"
	line "have helped me a"
	cont "ton."
	done
	
Route10TutorRefused:
	text "I'm not tutoring"
	line "anything? Alright."
	
	para "Come back some"
	line "other time."
	done

Route10North_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  4,  2, ROUTE_8_ROUTE_10_GATE, 3
	warp_event  4,  3, ROUTE_8_ROUTE_10_GATE, 4
	warp_event 22, 13, PALEROCK_CAVE_1F, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event 24, 14, BGEVENT_READ, PowerPlantSign

	db 1 ; object events
	object_event 14, 21, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Route10MoveTutor, -1
