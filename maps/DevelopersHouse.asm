	const_def 2 ; object constants

DevelopersHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

DeveloperScript:
	; ENGINE_BATTLED_DEVELOPER for the eventual battle.
	jumptextfaceplayer DeveloperText

DevelopersPeridotTrophy:
	jumptext DevelopersPeridotTrophyText

DevelopersGameShelf:
	opentext
	writetext DevelopersGameShelfText
	waitbutton
	writetext DevelopersNoteText
	waitbutton
	closetext
	end

DevelopersHouseStarPiece:
	itemball STAR_PIECE

DevelopersGameShelf2:
	jumptext DevelopersGameShelfText

DevelopersTV:
	jumptext DevelopersTVText

DeveloperText:
	text "Hello! I made this"
	line "game."

	para "Do you think you"
	line "can beat all of"
	cont "the GYM and LEAGUE"
	cont "rematches?"

	para "They go all the"
	line "way to LEVEL 100!"
	done

DevelopersPeridotTrophyText:
	text "It's a PERIDOT"
	line "TROPHY."

	para "It says here it is"
	line "awarded for win-"
	cont "ning against a"
	cont "SUBWAY ACE at the"
	cont "BATTLE SUBWAY."
	done

DevelopersGameShelfText:
	text "There's all sorts"
	line "of games for PC"
	cont "and console on"
	cont "this shelf."
	done

DevelopersNoteText:
	text "There's note, too…"

	para "“Check out my DOOM"
	line "maps featured in"
	cont "AD MORTEM, 400"
	cont "Minutes of /vr/,"
	cont "and HFFM.”"
	done

DevelopersTVText:
	text "There's a movie on"
	line "the TV."

	para "A jeep is being"
	line "pushed over a"
	cont "cliff by some"
	cont "gigantic creature."

	para "It doesn't look"
	line "like a #MON…"
	done

DevelopersHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, ROUTE_27, 7
	warp_event  5,  7, ROUTE_27, 7

	db 0 ; coord events

	db 3 ; bg events
	bg_event  8,  1, BGEVENT_READ, DevelopersGameShelf
	bg_event  9,  1, BGEVENT_READ, DevelopersGameShelf2
	bg_event  6,  1, BGEVENT_UP, DevelopersTV

	db 3 ; object events
	object_event  3,  2, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_UP, 0, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, DeveloperScript, -1
	object_event  7,  1, SPRITE_PERIDOT_TROPHY, SPRITEMOVEDATA_STILL, 0, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DevelopersPeridotTrophy, -1
	object_event  8,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 2, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DevelopersHouseStarPiece, EVENT_DEVELOPERS_HOUSE_STAR_PIECE
