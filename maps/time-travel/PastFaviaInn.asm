	const_def 2 ; object constants

PastFaviaInn_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PastFaviaNurse:
	faceplayer
	opentext
	writetext PastFaviaInnNurseText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	special StubbedTrainerRankings_Healings
	playmusic MUSIC_HEAL
	special HealParty
	pause 60
	special FadeInQuickly
	special RestartMapMusic
	opentext
	writetext PastFaviaInnNurseAfterText
	waitbutton
	closetext
	end

PastFaviaInnYoungster:
	jumptextfaceplayer PastFaviaInnYoungsterText

PastFaviaInnSailor:
	faceplayer
	opentext
	checkevent EVENT_EXCHANGED_SEA_MAP
	iftrue .AlreadyTraded
	checkitem OLD_SEA_MAP
	iffalse .NoSeaMap
	writetext PastFaviaInnSailorNoticeMapText
	waitbutton
	writetext PastFaviaInnPlayerExchangeMapText
	waitbutton
	takeitem OLD_SEA_MAP
	setevent EVENT_EXCHANGED_SEA_MAP
	verbosegiveitem SEA_MAP
.AlreadyTraded
	writetext PastFaviaInnSailorAfterMapText
	waitbutton
	closetext
	end

.NoSeaMap
	writetext PastFaviaInnSailorNoMapText
	waitbutton
	closetext
	end

PastFaviaInnNurseText:
	text "Hello, stranger."
	
	para "Your #MON must"
	line "be tired, please"
	cont "take a rest here."
	done

PastFaviaInnNurseAfterText:
	text "There, your"
	line "#MON look much"
	cont "better."

	para "I hope that you"
	line "feel rested too!"
	done

PastFaviaInnYoungsterText:
	text "You're not from"
	line "around these parts"
	cont "either, are you?"

	para "The people here"
	line "are polite, but"
	cont "you never get that"
	cont "feeling of belong-"
	cont "ing."
	done

PastFaviaInnSailorNoMapText:
	text "I be landlocked"
	line "right now."

	para "I dream of seeing"
	line "the open sea with"
	cont "me own two eyes."

	para "Some day I will"
	line "have a ship of"
	cont "me very own, and I"
	cont "will go where me"
	cont "SEA MAP points to."
	done

PastFaviaInnSailorNoticeMapText:
	text "Hm… That map ye'"
	line "got there…"

	para "I think I have one"
	line "just like it!"

	para "Have ye' ever"
	line "sailed upon the"
	cont "open sea?"

	para "……………………"

	para "Aye? Since I be"
	line "landlocked, I"
	cont "insist ye' take my"
	cont "SEA MAP."

	para "This old one ain't"
	line "gonna be doin' ye'"
	cont "any good!"

	para "Allow me to take"
	line "it off ye' hands."
	done

PastFaviaInnPlayerExchangeMapText:
	text "<PLAYER> gave away"
	line "the OLD SEA MAP."

	para "In exchange…"
	done

PastFaviaInnSailorAfterMapText:
	text "I hope ye' can get"
	line "plenty 'a use out"
	cont "of my old SEA MAP."

	para "You wouldn't 'a"
	line "gotten very far"
	cont "with that ragged"
	cont "old one."
	done

PastFaviaInn_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 2,  7, PAST_FAVIA_TOWN, 2
	warp_event 3,  7, PAST_FAVIA_TOWN, 2

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  2, 1, SPRITE_BUENA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PastFaviaNurse, -1
	object_event  7,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PastFaviaInnYoungster, -1
	object_event  4,  5, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PastFaviaInnSailor, -1
