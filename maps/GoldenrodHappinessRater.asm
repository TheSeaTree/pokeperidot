	const_def 2 ; object constants
	const GOLDENRODHAPPINESSRATER_TEACHER
	const GOLDENRODHAPPINESSRATER_POKEFAN_M
	const GOLDENRODHAPPINESSRATER_TWIN

GoldenrodHappinessRater_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

GoldenrodHappinessRaterTeacherScript:
	faceplayer
	opentext
	special GetFirstPokemonHappiness
	writetext GoldenrodHappinessRaterTeacherText
	buttonsound
	ifgreater 250 - 1, .LovesYouALot
	ifgreater 200 - 1, .ReallyTrustsYou
	ifgreater 150 - 1, .SortOfHappy
	ifgreater 100 - 1, .QuiteCute
	ifgreater  50 - 1, .NotUsedToYou
	jump .LooksMean

.LovesYouALot:
	writetext GoldenrodHappinessRatingText_LovesYouALot
	waitbutton
	closetext
	end

.ReallyTrustsYou:
	writetext GoldenrodHappinessRatingText_ReallyTrustsYou
	waitbutton
	closetext
	end

.SortOfHappy:
	writetext GoldenrodHappinessRatingText_SortOfHappy
	waitbutton
	closetext
	end

.QuiteCute:
	writetext GoldenrodHappinessRatingText_QuiteCute
	waitbutton
	closetext
	end

.NotUsedToYou:
	writetext GoldenrodHappinessRatingText_NotUsedToYou
	waitbutton
	closetext
	end

.LooksMean:
	writetext GoldenrodHappinessRatingText_LooksMean
	waitbutton
	closetext
	end

GoldenrodHappinessRaterPokefanMScript:
	checkevent EVENT_GOT_TM_RETURN
	iftrue .gotit
	faceplayer
	opentext
	writetext GoldenrodHappinessRaterGiveTMReturn
	waitbutton
	verbosegiveitem TM_RETURN
	waitbutton
	setevent EVENT_GOT_TM_RETURN
	writetext GoldenrodHappinessRaterPokefanMText
	waitbutton
	turnobject LAST_TALKED, LEFT
	closetext
	end
	
.gotit
	jumptextfaceplayer GoldenrodHappinessRaterPokefanMText
	turnobject LAST_TALKED, LEFT
	end

GoldenrodHappinessRaterYoungsterScript:
	jumptextfaceplayer GoldenrodHappinessRaterYoungsterText

HappinessRatersHouseBookshelf:
	jumpstd difficultbookshelf

GoldenrodHappinessRaterTeacherText:
	text "If you treat your"
	line "#MON nicely,"

	para "they will love you"
	line "in return."

	para "Oh? Let me see"
	line "your @"
	text_ram wStringBuffer3
	text "…"
	done

GoldenrodHappinessRatingText_LovesYouALot:
	text "It looks really"
	line "happy! It must"
	cont "love you a lot."
	done

GoldenrodHappinessRatingText_ReallyTrustsYou:
	text "I get the feeling"
	line "that it really"
	cont "trusts you."
	done

GoldenrodHappinessRatingText_SortOfHappy:
	text "It's friendly to-"
	line "ward you. It looks"
	cont "sort of happy."
	done

GoldenrodHappinessRatingText_QuiteCute:
	text "It's quite cute."
	done

GoldenrodHappinessRatingText_NotUsedToYou:
	text "You should treat"
	line "it better. It's"
	cont "not used to you."
	done

GoldenrodHappinessRatingText_LooksMean:
	text "It doesn't seem to"
	line "like you at all."
	cont "It looks mean."
	done

GoldenrodHappinessRaterYoungsterText:
	text "I keep losing in"
	line "battles, and my"

	para "#MON end up"
	line "fainting…"

	para "Maybe that's why"
	line "my #MON don't"
	cont "like me much…"
	done

GoldenrodHappinessRaterPokefanMText:
	text "That TM will teach"
	line "the move RETURN."
	
	para "It may not seem"
	line "like much now, but"
	cont "it will pack quite"
	cont "a wallop if your"
	cont "#MON is happy"
	cont "with you."
	done
	
GoldenrodHappinessRaterGiveTMReturn:
	text "It can be very"
	line "rewarding to make"
	cont "your #MON happy"
	cont "to be with you."
	
	para "It can be very"
	line "rewarding to talk"
	cont "to the right"
	cont "people as well."
	
	para "I have just the"
	line "reward for you"
	cont "right here!"
	done

GoldenrodHappinessRater_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  7, GOLDENROD_CITY, 5
	warp_event  4,  7, GOLDENROD_CITY, 5

	db 0 ; coord events

	db 2 ; bg events
	bg_event  6,  1, BGEVENT_READ, HappinessRatersHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, HappinessRatersHouseBookshelf

	db 3 ; object events
	object_event  2,  3, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GoldenrodHappinessRaterTeacherScript, -1
	object_event  5,  2, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodHappinessRaterPokefanMScript, -1
	object_event  5,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodHappinessRaterYoungsterScript, -1
