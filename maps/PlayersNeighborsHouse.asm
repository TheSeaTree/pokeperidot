	const_def 2 ; object constants
	const PLAYERSNEIGHBORSHOUSE_GRANNY
	const PLAYERSNEIGHBORSHOUSE_GRAMPS

PlayersNeighborsHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PlayersNeighborScript:
	jumptextfaceplayer PlayersNeighborText

PlayersNeighborsHouseBookshelfScript:
	jumpstd magazinebookshelf

PlayersNeighborsHouseRadioScript:
	opentext
	writetext PlayerNeighborRadioText1
	waitbutton
	playmusic MUSIC_POKEMON_TALK
	playmusic MUSIC_GAME_CORNER
	writetext PlayerNeighborRadioText2
	waitbutton
	writetext PlayerNeighborRadioText3
	waitbutton
	musicfadeout MUSIC_NEW_BARK_TOWN, 16
	closetext
	end
	end

PlayersNeighborText:
	text "This lakeside pro-"
	line "perty lets me see"
	cont "so many WATER-type"
	cont "#MON!"
	done

PlayerNeighborRadioText1:
	text "It's a RADIO."
	
	para "Let's see what's"
	line "on…"
	done

PlayerNeighborRadioText2:
	text "Oh, this station"
	line "sounds nice."
	done

PlayerNeighborRadioText3:
	text "Okay, that's"
	line "enough."
	done


PlayersNeighborsHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, ELKHORN_TOWN, 2
	warp_event  3,  7, ELKHORN_TOWN, 2

	db 0 ; coord events

	db 3 ; bg events
	bg_event  0,  1, BGEVENT_READ, PlayersNeighborsHouseBookshelfScript
	bg_event  1,  1, BGEVENT_READ, PlayersNeighborsHouseBookshelfScript
	bg_event  7,  1, BGEVENT_READ, PlayersNeighborsHouseRadioScript

	db 1 ; object events
	object_event  2,  3, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PlayersNeighborScript, -1
