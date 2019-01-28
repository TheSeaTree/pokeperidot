	const_def 2 ; object constants


CherrygroveInn_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
CherrygroveInnNurse:
	faceplayer
	opentext
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iffalse .CherrygroveInnNoMons
	writetext CherrygroveInnNurseText
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
	writetext CherrygroveInnNurseAfterText
	waitbutton
	closetext
	end
	
.CherrygroveInnNoMons
	writetext CherrygroveInnNoMonsText
	waitbutton
	closetext
	end
	
CherrygroveInnLass:
	jumptextfaceplayer CherrygroveInnLassText

CherrygroveInnFisher:
	jumptextfaceplayer CherrygroveInnFisherText
	
CherrygroveInnBed:
	jumptext CherrygroveInnBedText
	
CherrygroveInnPC:
	opentext
	special PlayersHousePC
	iftrue .Warp
	closetext
	end
.Warp:
	warp NONE, 0, 0
	end
	
CherrygroveInnNoMonsText:
	text "Hello! I am a"
	line "nurse in training."
	
	para "Please do return"
	line "if you get a"
	cont "#MON. I would"
	cont "be happy to take"
	cont "care of it."
	done
	
CherrygroveInnNurseText:
	text "Your #MON look"
	line "tired, please take"
	cont "a rest here."
	done
	
CherrygroveInnNurseAfterText:
	text "There, your"
	line "#MON look much"
	cont "better."

	para "Good luck on your"
	line "adventure!"
	done
	
CherrygroveInnLassText:
	text "I'm not a trainer,"
	line "but I love our"
	cont "cozy little inn."
	
	para "You meet so many"
	line "interesting"
	cont "people and"
	cont "#MON."
	done

CherrygroveInnFisherText:
	text "This town isn't"
	line "big enough for a"
	cont "#MON center of"
	cont "its own."
	done
	
CherrygroveInnBedText:
	text "This bed looks"
	line "comfy!"
	done

CherrygroveInn_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, CHERRYGROVE_CITY, 6
	warp_event  3,  7, CHERRYGROVE_CITY, 6

	db 0 ; coord events

	db 4 ; bg events
	bg_event  6,  1, BGEVENT_READ, CherrygroveInnBed
	bg_event  6,  2, BGEVENT_READ, CherrygroveInnBed
	bg_event  8,  1, BGEVENT_READ, CherrygroveInnBed
	bg_event  8,  2, BGEVENT_READ, CherrygroveInnBed

	db 3 ; object events
	object_event  2, 1, SPRITE_BUENA, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CherrygroveInnNurse, -1
	object_event  7, 5, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CherrygroveInnLass, -1
	object_event  4, 4, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CherrygroveInnFisher, -1