	const_def 2 ; object constants
	const FAVIAHAPPINESSRATER_TEACHER
	const FAVIAHAPPINESSRATER_POKEFAN_M
	const FAVIAHAPPINESSRATER_TWIN

FaviaHappinessRater_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

FaviaHappinessRaterTeacherScript:
	faceplayer
	opentext
	special GetFirstPokemonHappiness
	writetext FaviaHappinessRaterTeacherText
	buttonsound
	ifgreater 250 - 1, .LovesYouALot
	ifgreater 200 - 1, .ReallyTrustsYou
	ifgreater 150 - 1, .SortOfHappy
	ifgreater 100 - 1, .QuiteCute
	ifgreater  50 - 1, .NotUsedToYou
	jump .LooksMean

.LovesYouALot:
	writetext FaviaHappinessRatingText_LovesYouALot
	waitbutton
	closetext
	end

.ReallyTrustsYou:
	writetext FaviaHappinessRatingText_ReallyTrustsYou
	waitbutton
	closetext
	end

.SortOfHappy:
	writetext FaviaHappinessRatingText_SortOfHappy
	waitbutton
	closetext
	end

.QuiteCute:
	writetext FaviaHappinessRatingText_QuiteCute
	waitbutton
	closetext
	end

.NotUsedToYou:
	writetext FaviaHappinessRatingText_NotUsedToYou
	waitbutton
	closetext
	end

.LooksMean:
	writetext FaviaHappinessRatingText_LooksMean
	waitbutton
	closetext
	end

FaviaHappinessRaterPokefanMScript:
	checkevent EVENT_GOT_TM_RETURN
	iftrue .gotit
	faceplayer
	opentext
	writetext FaviaHappinessRaterGiveTMReturn
	waitbutton
	verbosegiveitem TM_RETURN
	waitbutton
	setevent EVENT_GOT_TM_RETURN
	writetext FaviaHappinessRaterPokefanMText
	waitbutton
	turnobject LAST_TALKED, LEFT
	closetext
	end
	
.gotit
	jumptextfaceplayer FaviaHappinessRaterPokefanMText
	turnobject LAST_TALKED, LEFT
	end

FaviaHappinessRaterYoungsterScript:
	jumptextfaceplayer FaviaHappinessRaterYoungsterText

HappinessRatersHouseBookshelf:
	jumpstd difficultbookshelf

FaviaHappinessRaterTeacherText:
	text "If you treat your"
	line "#MON nicely,"

	para "they will love you"
	line "in return."

	para "Oh? Let me see"
	line "your @"
	text_ram wStringBuffer3
	text "…"
	done

FaviaHappinessRatingText_LovesYouALot:
	text "It looks really"
	line "happy! It must"
	cont "love you a lot."
	done

FaviaHappinessRatingText_ReallyTrustsYou:
	text "I get the feeling"
	line "that it really"
	cont "trusts you."
	done

FaviaHappinessRatingText_SortOfHappy:
	text "It's friendly to-"
	line "ward you. It looks"
	cont "sort of happy."
	done

FaviaHappinessRatingText_QuiteCute:
	text "It's quite cute."
	done

FaviaHappinessRatingText_NotUsedToYou:
	text "You should treat"
	line "it better. It's"
	cont "not used to you."
	done

FaviaHappinessRatingText_LooksMean:
	text "It doesn't seem to"
	line "like you at all."
	cont "It looks mean."
	done

FaviaHappinessRaterYoungsterText:
	text "I keep losing in"
	line "battles, and my"

	para "#MON end up"
	line "fainting…"

	para "Maybe that's why"
	line "my #MON don't"
	cont "like me much…"
	done

FaviaHappinessRaterPokefanMText:
	text "That TM will teach"
	line "the move RETURN."
	
	para "It may not seem"
	line "like much now, but"
	cont "it will pack quite"
	cont "a wallop if your"
	cont "#MON is happy"
	cont "with you."
	done
	
FaviaHappinessRaterGiveTMReturn:
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

FaviaHappinessRater_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  7, FAVIA_TOWN, 5
	warp_event  4,  7, FAVIA_TOWN, 5

	db 0 ; coord events

	db 2 ; bg events
	bg_event  6,  1, BGEVENT_READ, HappinessRatersHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, HappinessRatersHouseBookshelf

	db 3 ; object events
	object_event  2,  3, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, FaviaHappinessRaterTeacherScript, -1
	object_event  5,  2, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FaviaHappinessRaterPokefanMScript, -1
	object_event  5,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, FaviaHappinessRaterYoungsterScript, -1
