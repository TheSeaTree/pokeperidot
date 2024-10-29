	const_def 2 ; object constants
	const ORCHIDTEACHERSHOUSE_TEACHER_MORN
	const ORCHIDTEACHERSHOUSE_TEACHER_DAY

OrchidTeachersHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

OrchidTeacherDaytime:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .AlreadySeen
	checkevent EVENT_AMULET_COIN_FROM_ORCHID_TEACHER
	iftrue .GotAmuletCoin
	checkevent EVENT_MET_ORCHID_TEACHER_OUTSIDE
	iftrue .GiveAmuletCoin
	opentext
	writetext OrchidTeacherSighText
	waitbutton
	closetext
	faceplayer
	showemote EMOTE_QUESTION, ORCHIDTEACHERSHOUSE_TEACHER_DAY, 8
	opentext
	writetext OrchidTeacherNoticeText
	waitbutton
	writetext OrchidTeacherAfterNoticeText
	waitbutton
	setevent EVENT_MET_ORCHID_TEACHER_IN_HOUSE
	closetext
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	end

.GiveAmuletCoin
	faceplayer
	opentext
	writetext OrchidTeacherGiftText
	waitbutton
	verbosegiveitem AMULET_COIN
	iffalse .NoRoom
	setevent EVENT_AMULET_COIN_FROM_ORCHID_TEACHER
	writetext OrchidTeacherExplainGiftText
	waitbutton
	closetext
	end

.GotAmuletCoin
	jumptextfaceplayer OrchidCityAfterGiftText
	
.NoRoom
	writetext OrchidTeacherNoRoomText
	waitbutton
	closetext
	end

.AlreadySeen
	jumptextfaceplayer OrchidTeacherAfterNoticeText

OrchidTeacherMorning:
	showemote EMOTE_SLEEP, ORCHIDTEACHERSHOUSE_TEACHER_MORN, 15
	opentext
	writetext OrchidTeacherSleepingText
	waitbutton
	random 6
	ifequal 1, .SecondTextbox
	ifequal 2, .ThirdTextbox
	ifequal 3, .FourthTextbox
	ifequal 4, .FifthTextbox
	ifequal 5, .SixthTextbox

	writetext OrchidTeacherSleepingText1
	jump .CloseText

.SecondTextbox
	writetext OrchidTeacherSleepingText2
	jump .CloseText

.ThirdTextbox
	writetext OrchidTeacherSleepingText3
	jump .CloseText

.FourthTextbox
	writetext OrchidTeacherSleepingText4
	jump .CloseText

.FifthTextbox
	writetext OrchidTeacherSleepingText5
	jump .CloseText

.SixthTextbox
	writetext OrchidTeacherSleepingText6
.CloseText
	waitbutton
	closetext
	end
	
OrchidTeachersHouseMeowth:
	opentext
	writetext OrchidTeachersHouseMeowthText
	cry MEOWTH
	waitbutton
	closetext
	end

OrchidTeachersHouseBookshelf:
	jumpstd difficultbookshelf

OrchidTeacherSighText:
	text "Sigh…"
	done

OrchidTeacherNoticeText:
	text "Oh, I'm sorry!"
	line "I didn't notice"
	cont "you come in."
	
	para "I was just think-"
	line "ing about how much"
	cont "time I spend at"
	cont "home now."
	
	para "Ever since I moved"
	line "here to ORCHID, it"
	cont "has been tough to"
	cont "meet new friends."
	done

OrchidTeacherAfterNoticeText:
	text "You're not from"
	line "here, are you?"

	para "You should see the"
	line "lava at night, it's"
	cont "so pretty!"
	
	para "…Plus, I would"
	line "enjoy the company."
	done

OrchidTeacherSleepingText:
	text "…Zzzz…"

	para "………………………………"
	done

OrchidTeacherSleepingText1:
	text "…Not now mom,"
	line "I just got to"
	cont "sleep………"
	done

OrchidTeacherSleepingText2:
	text "…MEOWTH, put that"
	line "down right now………"
	done

OrchidTeacherSleepingText3:
	text "…Groan…………It's too"
	line "hot…………"

	para "…Someone turn down"
	line "the heat………"
	done

OrchidTeacherSleepingText4:
	text "…Someone stop that"
	line "MURKROW………"

	para "……It has my house"
	line "keys…………"
	done

OrchidTeacherSleepingText5:
	text "………Oh my goodness…"

	para "………I can't possibly"
	line "eat all of this"
	cont "cake by myself…………"

	para "………Mmmm…………"

	para "……But it's so"
	line "delicious………!"
	done

OrchidTeacherSleepingText6:
	text "Groan………"

	para "…………I'm not ready"
	line "for school…………"
	done

OrchidTeacherGiftText:
	text "Hi, <PLAYER>!"
	
	para "You know, I was so"
	line "glad to spend time"
	cont "with you the other"
	cont "night, I got you a"
	cont "gift!"
	
	para "Hehe! I don't"
	line "expect anything in"
	cont "return. Just think"
	cont "of it as a symbol"
	cont "of our friendship!"
	done
	
OrchidTeacherExplainGiftText:
	text "I hope you like"
	line "it!"
	
	para "I don't battle my-"
	line "self, but you look"
	cont "like someone who"
	cont "does. The extra"
	cont "prize money will"
	cont "help you out."
	
	para "Either way, I"
	line "think it looks"
	cont "super cute too!"
	done
	
OrchidCityAfterGiftText:
	text "Thanks for making"
	line "so much time for"
	cont "me, <PLAYER>."
	
	para "I know you're not"
	line "from around here,"
	cont "so that makes it" 
	cont "even more special!"
	done

OrchidTeacherNoRoomText:
	text "Aw… There's no room"
	line "left for you to"
	cont "carry this."
	
	para "I'll hold onto it,"
	line "but please make"
	cont "some room!"
	done
	
OrchidTeachersHouseMeowthText:
	text "MEOWTH: Meow!"
	done

OrchidTeachersHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, ORCHID_CITY, 5
	warp_event  3,  7, ORCHID_CITY, 5

	db 0 ; coord events

	db 2 ; bg events
	bg_event  0,  1, BGEVENT_READ, OrchidTeachersHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, OrchidTeachersHouseBookshelf

	db 5 ; object events
	object_event  8,  3, SPRITE_TEACHER_SLEEPING, SPRITEMOVEDATA_STILL, 0, 0, -1, MORN, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OrchidTeacherMorning, -1
	object_event  2,  3, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, DAY, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OrchidTeacherDaytime, -1
	object_event  4,  1, SPRITE_GROWLITHE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, MORN, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, OrchidTeachersHouseMeowth, -1
	object_event  6,  5, SPRITE_GROWLITHE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, DAY, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, OrchidTeachersHouseMeowth, -1
	object_event  9,  3, SPRITE_GROWLITHE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, NITE, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, OrchidTeachersHouseMeowth, -1
