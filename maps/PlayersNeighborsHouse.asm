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
	checkevent EVENT_GOT_A_POKEMON_FROM_MAPLE
	iftrue .NormalRadio
	checkevent EVENT_LISTENED_TO_INITIAL_RADIO
	iftrue .AbbreviatedRadio
	playmusic MUSIC_POKEMON_TALK
	opentext
	writetext PlayerNeighborRadioText1
	pause 45
	writetext PlayerNeighborRadioText2
	pause 45
	writetext PlayerNeighborRadioText3
	pause 45
	musicfadeout MUSIC_NEW_BARK_TOWN, 16
	writetext PlayerNeighborRadioText4
	pause 45
	closetext
	setevent EVENT_LISTENED_TO_INITIAL_RADIO
	end
.NormalRadio:
	jumpstd radio1
.AbbreviatedRadio:
	opentext
	writetext PlayerNeighborRadioText4
	pause 45
	closetext
	end

PlayersNeighborText:
	text "This lakeside pro-"
	line "perty lets me see"
	cont "so many WATER-type"
	cont "#MON!"
	done

PlayerNeighborRadioText1:
	text "PROF.OAK'S #MON"
	line "TALK! Please tune"
	cont "in next time!"
	done

PlayerNeighborRadioText2:
	text "#MON CHANNEL!"
	done

PlayerNeighborRadioText3:
	text "This is DJ MARY,"
	line "your co-host!"
	done

PlayerNeighborRadioText4:
	text "#MON!"
	line "#MON CHANNEL…"
	done

PlayersNeighborsHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, NEW_BARK_TOWN, 2
	warp_event  3,  7, NEW_BARK_TOWN, 2

	db 0 ; coord events

	db 3 ; bg events
	bg_event  0,  1, BGEVENT_READ, PlayersNeighborsHouseBookshelfScript
	bg_event  1,  1, BGEVENT_READ, PlayersNeighborsHouseBookshelfScript
	bg_event  7,  1, BGEVENT_READ, PlayersNeighborsHouseRadioScript

	db 1 ; object events
	object_event  2,  3, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PlayersNeighborScript, -1
