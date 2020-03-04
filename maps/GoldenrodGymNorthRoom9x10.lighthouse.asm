	const_def 2 ; object constants
	

GoldenrodGymNorthRoom_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
TrainerGuitaristTrevor:
	trainer GUITARIST, TREVOR, EVENT_BEAT_GUITARIST_TREVOR, GoldenrodNorthRoomPlaceholderText, GoldenrodNorthRoomPlaceholderText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GoldenrodNorthRoomPlaceholderText
	waitbutton
	closetext
	end	
	
TrainerPokemaniacCharlie:
	faceplayer
	playmusic MUSIC_POKEMANIAC_ENCOUNTER
	opentext
	writetext GoldenrodNorthRoomPlaceholderText
	winlosstext GoldenrodNorthRoomPlaceholderText, GoldenrodNorthRoomPlaceholderText
	loadtrainer POKEMANIAC, CHARLIE
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_POKEMANIAC_CHARLIE
	faceplayer
	opentext
	writetext GoldenrodNorthRoomPlaceholderText
	waitbutton
	closetext
	turnobject GOLDENRODGYM_SUPER_NERD, DOWN
	end
	
TrainerGuitaristMarcel:
	faceplayer
	checkevent EVENT_BEAT_GUITARIST_MARCEL
	iftrue .FightDone
	opentext
	writetext GoldenrodNorthRoomPlaceholderText
	waitbutton
	closetext
	winlosstext GoldenrodNorthRoomPlaceholderText, 0
	loadtrainer GUITARIST, MARCEL
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_GUITARIST_MARCEL
	end

.FightDone
	opentext
	writetext GoldenrodNorthRoomPlaceholderText
	waitbutton
	closetext
	end
	
TrainerGuitaristIvan:
	faceplayer
	checkevent EVENT_BEAT_GUITARIST_IVAN
	iftrue .FightDone
	opentext
	writetext GoldenrodNorthRoomPlaceholderText
	waitbutton
	closetext
	winlosstext GoldenrodNorthRoomPlaceholderText, 0
	loadtrainer GUITARIST, IVAN
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_GUITARIST_IVAN
	end

.FightDone
	opentext
	writetext GoldenrodNorthRoomPlaceholderText
	waitbutton
	closetext
	end

GoldenrodNorthRoomPlaceholderText:
	text "?"
	done

GoldenrodGymNorthRoom_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 17, GOLDENROD_GYM, 1
	warp_event 13, 17, GOLDENROD_GYM, 2

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event 13, 13, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, ObjectEvent, -1 ; TrainerGuitaristTrevor, -1
	object_event  4,  7, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 3, ObjectEvent, -1 ; TrainerPokemaniacCharlie, -1
	object_event 12,  5, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_FAST , 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1 ; TrainerGuitaristMarcel, -1
	object_event  7, 11, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_FAST , 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1 ; TrainerGuitaristIvan, -1
