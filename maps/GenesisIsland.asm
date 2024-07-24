	const_def 2 ; object constants
	const GENESISISLAND_CAPTAIN

GenesisIsland_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

GenesisIslandCaptain:
	faceplayer
	opentext
	writetext GenesisIslandCaptainText
	yesorno
	iffalse .Decline
	writetext GenesisIslandCaptainAcceptText
	waitbutton
	closetext
	special FadeOutPalettes
	playsound SFX_RAIN_DANCE
	waitsfx
	warpfacing DOWN, VICTORY_PORT, 6, 6
	end

.Decline
	writetext GenesisIslandCaptainDeclineText
	waitbutton
	closetext
	end

GenesisIslandHiddenStarPiece:
	hiddenitem STAR_PIECE, EVENT_GENESIS_ISLAND_HIDDEN_STAR_PIECE

GenesisIslandCaptainText:
	text "Have ye' found"
	line "anythin' good?"

	para "Or would ye' like"
	line "to head back?"
	done

GenesisIslandCaptainAcceptText:
	text "Aye! We set off"
	line "for VICTORY COAST"
	cont "right away!"
	done

GenesisIslandCaptainDeclineText:
	text "Suit ye'self."

	para "If ye' ask me,"
	line "this place is"
	cont "lookin' deserted."
	done

GenesisIsland_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 33, 31, GENESIS_ISLAND, 1
	warp_event 20,  4, GENESIS_ISLAND_INSIDE, 1
	warp_event 21,  4, GENESIS_ISLAND_INSIDE, 2

	db 0 ; coord events

	db 1 ; bg events
	bg_event 12, 23, BGEVENT_ITEM, GenesisIslandHiddenStarPiece

	db 1 ; object events
	object_event 34, 31, SPRITE_CAPTAIN, SPRITEMOVEDATA_STANDING_LEFT, 0, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GenesisIslandCaptain, -1
