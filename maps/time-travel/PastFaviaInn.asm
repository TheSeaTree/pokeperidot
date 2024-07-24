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

PastFaviaInn_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 2,  7, PAST_FAVIA_TOWN, 2
	warp_event 3,  7, PAST_FAVIA_TOWN, 2

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  2, 1, SPRITE_BUENA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PastFaviaNurse, -1
	object_event  7,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PastFaviaInnYoungster, -1
