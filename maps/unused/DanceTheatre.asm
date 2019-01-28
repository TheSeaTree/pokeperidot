	const_def 2 ; object constants
	const DANCETHEATRE_GENTLEMAN
	const DANCETHEATRE_RHYDON
	const DANCETHEATRE_COOLTRAINER_M
	const DANCETHEATRE_GRANNY

DanceTheatre_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


DanceTheaterSurfGuy:
	faceplayer
	opentext
	writetext SurfGuyNeverLeftAScratchText
	buttonsound
	checkevent EVENT_GOT_HM03_SURF
	iftrue SurfGuyAlreadyGaveSurf
	jump .GetSurf

.KimonoGirlsUndefeated:
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .PlayerIsFemale
	writetext SurfGuyLadGiftText
	waitbutton
	closetext
	end

.PlayerIsFemale:
	writetext SurfGuyLassieGiftText
	waitbutton
	closetext
	end

.GetSurf:
	writetext SurfGuyLikeADanceText
	buttonsound
	verbosegiveitem HM_SURF
	setevent EVENT_GOT_HM03_SURF
	writetext SurfGuySurfExplanationText
	waitbutton
	closetext
	end

SurfGuyAlreadyGaveSurf:
	writetext SurfGuyElegantKimonoGirlsText
	waitbutton
	closetext
	end

DanceTheaterRhydon:
	opentext
	writetext RhydonText
	cry RHYDON
	waitbutton
	closetext
	end

DanceTheatreCooltrainerMScript:
	jumptextfaceplayer DanceTheatreCooltrainerMText

DanceTheatreGrannyScript:
	jumptextfaceplayer DanceTheatreGrannyText

DanceTheatreFancyPanel:
	jumptext DanceTheatreFancyPanelText

SurfGuyNeverLeftAScratchText:
	text "Not only are the"
	line "KIMONO GIRLS great"

	para "dancers, they're"
	line "also skilled at"
	cont "#MON."

	para "I always challenge"
	line "them, but I've"

	para "never even left a"
	line "scratch…"
	done

SurfGuyLadGiftText:
	text "Lad! If you can"
	line "defeat all the"

	para "KIMONO GIRLS, I'll"
	line "give you a gift."
	done

SurfGuyLassieGiftText:
	text "Lassie, if you can"
	line "defeat all the"

	para "KIMONO GIRLS, I'll"
	line "give you a gift."
	done

SurfGuyLikeADanceText:
	text "The way you bat-"
	line "tled, it was like"
	cont "watching a dance."

	para "It was a rare"
	line "treat to see!"

	para "I want you to have"
	line "this. Don't worry"
	cont "--take it!"
	done

SurfGuySurfExplanationText:
	text "That's SURF."

	para "It's a move that"
	line "lets #MON swim"
	cont "across water."
	done

SurfGuyElegantKimonoGirlsText:
	text "I wish my #MON"
	line "were as elegant as"
	cont "the KIMONO GIRLS…"
	done

RhydonText:
	text "RHYDON: Gugooh"
	line "gugogooh!"
	done

DanceTheatreCooltrainerMText:
	text "That man's always"
	line "with his RHYDON."

	para "Says he wants a"
	line "#MON that can"
	cont "SURF and dance."

	para "Is he trying to"
	line "make a synchro-"
	cont "nized swimming"
	cont "#MON?"
	done

DanceTheatreGrannyText:
	text "The KIMONO GIRLS"
	line "are so beautiful…"

	para "But they have to"
	line "go through rigor-"
	cont "ous training."

	para "And they have to"
	line "learn to follow"

	para "customs before ap-"
	line "pearing in public."

	para "But if you love"
	line "something, any-"
	cont "thing is possible."
	done

DanceTheatreFancyPanelText:
	text "It's a fancy panel"
	line "that's decorated"
	cont "with flowers."
	done

DanceTheatre_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  5, 13, ECRUTEAK_CITY, 8
	warp_event  6, 13, ECRUTEAK_CITY, 8

	db 0 ; coord events

	db 2 ; bg events
	bg_event  5,  6, BGEVENT_UP, DanceTheatreFancyPanel
	bg_event  6,  6, BGEVENT_UP, DanceTheatreFancyPanel

	db 4 ; object events
	object_event  7, 10, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DanceTheaterSurfGuy, -1
	object_event  6,  8, SPRITE_RHYDON, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, DanceTheaterRhydon, -1
	object_event 10, 10, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, DanceTheatreCooltrainerMScript, -1
	object_event  3,  6, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DanceTheatreGrannyScript, -1
