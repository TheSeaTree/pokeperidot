	const_def 2 ; object constants

AcroporaPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

AcroporaPokecenter1FNurseScript:
	jumpstd pokecenternurse
	
AcroporaPokecenter1FGramps:
	jumptextfaceplayer AcroporaPokecenter1FGrampsText
	
AcroporaPokecenter1FPokefanF:
	jumptextfaceplayer AcroporaPokecenter1FPokefanFText
	
AcroporaPokecenter1FGrampsText:
	text "Did you know that"
	line "we are at the foot"
	cont "of a volcano?"
	
	para "Oh, don't worry!"
	line "It's not active!"
	
	para "It hasn't erupted"
	line "since before I was"
	cont "born."
	done

AcroporaPokecenter1FPokefanFText:
	text "Have you ever"
	line "heard the FLUTE"
	cont "MASTER's music?"

	para "You simply must!"

	para "The man is like a"
	line "sorcerer, with a"
	cont "FLUTE as his wand." 
	done

AcroporaPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3,  7, ACROPORA_CITY, 2
	warp_event  4,  7, ACROPORA_CITY, 2
	warp_event  0,  7, POKECENTER_2F, 1	

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AcroporaPokecenter1FNurseScript, -1
	object_event  1,  4, SPRITE_GRAMPS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AcroporaPokecenter1FGramps, -1
	object_event  6,  5, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AcroporaPokecenter1FPokefanF, -1
