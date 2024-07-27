	const_def 2 ; object constants

PastRoute11Inn_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PastRoute11Nurse:
	faceplayer
	opentext
	writetext PastRoute11InnNurseText
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
	writetext PastRoute11InnNurseAfterText
	waitbutton
	closetext
	end

PastRoute11InnCooltrainer:
	jumptextfaceplayer PastRoute11InnCooltrainerText

PastRoute11InnRocker:
	jumptextfaceplayer PastRoute11InnRockerText

PastRoute11InnNurseText:
	text "Hello, stranger."
	
	para "Your #MON must"
	line "be tired, please"
	cont "take a rest here."
	done

PastRoute11InnNurseAfterText:
	text "There, your"
	line "#MON look much"
	cont "better."

	para "I hope that you"
	line "feel rested too!"
	done

PastRoute11InnCooltrainerText:
	text "Have you heard of"
	line "the rare #MON"
	cont "named GASTLY?"

	para "I saw one by the"
	line "lake after dark."

	para "None of my #MON"
	line "could touch it."

	para "It's a little scary"
	line "that a #MON"
	cont "can be so strong."
	done

PastRoute11InnRockerText:
	text "I had such a good"
	line "nap just now!"

	para "I need a nice"
	line "stretch before I"
	cont "head out."
	done

PastRoute11Inn_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 2,  7, PAST_ROUTE_10, 6
	warp_event 3,  7, PAST_ROUTE_10, 6

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  2, 1, SPRITE_BUENA, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PastRoute11Nurse, -1
	object_event  4,  5, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PastRoute11InnCooltrainer, -1
	object_event  5,  1, SPRITE_ROCKER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PastRoute11InnRocker, -1
