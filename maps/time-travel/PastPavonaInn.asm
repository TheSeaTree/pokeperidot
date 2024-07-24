	const_def 2 ; object constants

PastPavonaInn_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PastPavonaNurse:
	faceplayer
	opentext
	writetext PastPavonaInnNurseText
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
	writetext PastPavonaInnNurseAfterText
	waitbutton
	closetext
	end

PastPavonaInnFisher:
	jumptextfaceplayer PastPavonaInnFisherText

PastPavonaInnNurseText:
	text "Hello, stranger."
	
	para "Your #MON must"
	line "be tired, please"
	cont "take a rest here."
	done

PastPavonaInnNurseAfterText:
	text "There, your"
	line "#MON look much"
	cont "better."

	para "I hope that you"
	line "feel rested too!"
	done

PastPavonaInnFisherText:
	text "Have you heard of"
	line "a #MON being"
	cont "able to travel"
	cont "through time?"

	para "I met a young"
	line "man who was talk-"
	cont "ing about one."

	para "He was heading to"
	line "OCCIENT FOREST to"
	cont "go find it."
	done

PastPavonaInn_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 2,  7, PAST_PAVONA_VILLAGE, 1
	warp_event 3,  7, PAST_PAVONA_VILLAGE, 1

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  2, 1, SPRITE_BUENA, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PastPavonaNurse, -1
	object_event  7, 4, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PastPavonaInnFisher, -1
