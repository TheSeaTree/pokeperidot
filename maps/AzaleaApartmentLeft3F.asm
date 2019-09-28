	const_def 2 ; object constants

AzaleaApartmentLeft3F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
MysteryGiftGirl:
	faceplayer
	opentext
	checkflag ENGINE_DAILY_MYSTERY_GIFT
	iftrue .NoGift
	writetext MysterGiftText
	waitbutton
	random LEMONADE - ULTRA_BALL + 1
	addvar ULTRA_BALL
	verbosegiveitem ITEM_FROM_MEM
	iffalse .NoRoom
	writetext MysteryGiftReceivedText
	waitbutton
	setflag ENGINE_DAILY_MYSTERY_GIFT
	closetext
	turnobject LAST_TALKED, DOWN
	end
	
.NoRoom
	writetext MysterGiftNoRoom
	waitbutton
	closetext
	turnobject LAST_TALKED, DOWN
	end

.NoGift
	writetext NoMysteryGiftText
	waitbutton
	closetext
	turnobject LAST_TALKED, DOWN
	end

MysterGiftText:
	text "MYSTERY GIFT!"
	line "MYSTERY GIFT!"
	
	para "Let's share a"
	line "MYSTERY GIFT!"
	done
	
MysterGiftNoRoom:
	text "I guess too many"
	line "people shared with"
	cont "you! Hehe!"
	done
	
MysteryGiftReceivedText:
	text "Wow, I got a"
	line "really cool item!"
	cont "I hope you got"
	cont "something good"
	cont "too!"
	
	para "Let's do this"
	line "again tomorrow!"
	done
	
NoMysteryGiftText:
	text "We've already"
	line "shared today."
	
	para "But I'd be happy"
	line "to share again"
	cont "tomorrow."
	done

AzaleaApartmentLeft3FGirlText:
	text "My DOLLY likes to"
	line "lay on the bed"
	cont "when I watch TV."
	
	para "MOMMY doesn't"
	line "believe me, but"
	cont "sometimes DOLLY"
	cont "will even move"
	cont "on its own late"
	cont "at night."
	done
	
AzaleaApartmentLeft3FMotherText:
	text "Children have such"
	line "vivid imagina-"
	cont "tions, don't you"
	cont "agree?"
	done

AzaleaApartmentLeft3F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  7,  0, AZALEA_APARTMENT_LEFT_2F, 2

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  5,  1, SPRITE_GAMEBOY_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MysteryGiftGirl, -1
	object_event  7,  7, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  6,  7, SPRITE_CLEFAIRY, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 11,  5, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
