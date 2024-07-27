	const_def 2 ; object constants

Route7SilkScarfHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route7SilkScarfLady:
	faceplayer
	opentext
	checkevent ROUTE_7_SILK_SCARF
	iftrue .After
	checkevent ROUTE_7_ASKED_FOR_TEDDIURSA
	iftrue .TeddiursaCheck
	writetext Route7SilkScarfLadyText
	waitbutton
	setevent ROUTE_7_ASKED_FOR_TEDDIURSA
	closetext
	end
	
.TeddiursaCheck
	writetext Route7SilkScarfLadyAsksAboutTeddiursa
	waitbutton
	writebyte TEDDIURSA
	special FindPartyMonThatSpecies
	iffalse .No
	writetext Route7SilkScarfLadyHaveTeddiursaText
	waitbutton
	verbosegiveitem SILK_SCARF
	iffalse .NoRoom
	setevent ROUTE_7_SILK_SCARF
	writetext Route7SilkScarfLadyAfterText
	waitbutton
	closetext
	end
	
.No
	writetext Route7SilkScarfLadyNoTeddiursaText
	waitbutton
	turnobject LAST_TALKED, RIGHT
	closetext
	end
	
.After
	writetext Route7SilkScarfLadyAfterText
	waitbutton
	closetext
	end
	
.NoRoom
	writetext Route7SilkScarfLadyNoRoomText
	waitbutton
	closetext
	end

Route7SilkScarfLadyText:
	text "Hello there!"
	
	para "Please don't mind"
	line "me asking, but you"
	cont "wouldn't happen to"
	cont "be a trainer,"
	cont "would you?"
	
	para "All of my life I"
	line "have wanted to see"
	cont "a TEDDIURSA."
	
	para "If you ever meet"
	line "one, could you"
	cont "please show me?"
	done
	
Route7SilkScarfLadyAsksAboutTeddiursa:
	text "Were you able to"
	line "find a TEDDIURSA"
	cont "to show me?"
	done
	
Route7SilkScarfLadyNoTeddiursaText:
	text "Nothing yet?"
	
	para "I understand…"
	
	para "Please come back"
	line "if you find one?"
	done

Route7SilkScarfLadyHaveTeddiursaText:
	text "Oh, my! You were?"
	
	para "Ahh! It's even"
	line "more precious in"
	cont "person!"
	
	para "For all of the"
	line "trouble you must"
	cont "have gone through,"
	cont "please take this."
	done

Route7SilkScarfLadyAfterText
	text "The SILK SCARF"
	line "boost NORMAL-TYPE"
	cont "moves."
	
	para "It's a perfect fit"
	line "for a lovely"
	cont "little TEDDIURSA!"
	done
	
Route7SilkScarfLadyNoRoomText:
	text "Oh, hon. You can't"
	line "put this anywhere."
	
	para "I'll hold onto it,"
	line "pick it up later."
	done

Route7SilkScarfHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, ROUTE_7, 6
	warp_event  3,  7, ROUTE_7, 6

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  2,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route7SilkScarfLady, -1
