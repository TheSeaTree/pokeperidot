	const_def 2 ; object constants

PectiniaApartmentLeft3F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
MysteryGiftGirl:
	faceplayer
	opentext
	checkflag ENGINE_DAILY_MYSTERY_GIFT
	iftrue .NoGift
	writetext MysterGiftText
	yesorno
	iffalse .Decline
	checkcode VAR_ITEM_POCKET
	ifgreater 16, .ItemsNearlyFull
	checkcode VAR_BALL_POCKET
	ifgreater  8, .BallsNearlyFull
.AskSave
	setflag ENGINE_DAILY_MYSTERY_GIFT
	writetext MysteryGift_SaveGame
	yesorno
	iffalse .Decline
	special TryQuickSave
	iffalse .Decline
	writetext MysteryGiftLinkUp
	playsound SFX_MOVE_DELETED
	waitsfx
	scall FindMysteryGiftItem
	iffalse .NoRoom
	scall FindMysteryGiftItem
	iffalse .NoRoom
	scall FindMysteryGiftItem
	iffalse .NoRoom
	writetext MysteryGiftReceivedText
	waitbutton
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
	
.Decline
	clearflag ENGINE_DAILY_MYSTERY_GIFT
	writetext DeclineMysteryGiftText
	waitbutton
	closetext
	turnobject LAST_TALKED, DOWN
	end

.ItemsNearlyFull
	writetext MysteryGiftItemPocketWarningText
	waitbutton
	jump .AskContinueAnyway

.BallsNearlyFull
	writetext MysteryGiftBallPocketWarningText
	waitbutton
.AskContinueAnyway
	writetext MysteryGiftAnywayText
	yesorno
	iffalse .Decline
	jump .AskSave

FindMysteryGiftItem:
	jumpstd mysterygiftgirl
	end

PectiniaApartmentLeft3FSuperNerd:
	jumptextfaceplayer PectiniaApartmentLeft3FSuperNerdText

MysterGiftText:
	text "MYSTERY GIFT!"
	line "MYSTERY GIFT!"
	
	para "Do you want to"
	line "share a MYSTERY"
	cont "GIFT?"
	done
	
MysteryGift_SaveGame:
	text "You need to save"
	line "your game before"
	cont "we share, 'kay?"
	done
	
MysteryGiftLinkUp:
	text "Okay! Let's link"
	line "up for a sec!"
	done

MysterGiftNoRoom:
	text "I guess too many"
	line "people shared with"
	cont "you! Hehe!"
	done
	
MysteryGiftItemPocketWarningText:
	text "…You don't have"
	line "much space in your"
	cont "ITEM POCKET."
	done

MysteryGiftBallPocketWarningText:
	text "…You don't have"
	line "much space in your"
	cont "BALL POCKET."
	done

MysteryGiftAnywayText:
	text "Do you want to"
	line "use MYSTERY GIFT"
	cont "anyway?"
	done
	
MysteryGiftReceivedText:
	text "Wow, I got really"
	line "cool items today!"
	cont "I hope you got"
	cont "something good!"
	
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
	
DeclineMysteryGiftText:
	text "Oh..."
	
	para "Some other time,"
	line "okay?"
	done
	
PectiniaApartmentLeft3FSuperNerdText:
	text "I make a habit of"
	line "trading items with"
	cont "MYSTERY GIFT every"
	cont "day."
	
	para "Sometimes I get"
	line "some really cool"
	cont "items."
	done

PectiniaApartmentLeft3F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  7,  0, PECTINIA_APARTMENT_LEFT_2F, 2

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  7,  5, SPRITE_GAMEBOY_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MysteryGiftGirl, -1
	object_event  0,  3, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PectiniaApartmentLeft3FSuperNerd, -1
