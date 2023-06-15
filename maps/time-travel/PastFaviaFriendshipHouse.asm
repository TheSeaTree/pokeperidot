	const_def 2 ; object constants

PastFaviaFriendshipHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PastFaviaFriendshipHouseBeauty:
	jumptextfaceplayer PastFaviaFriendshipHouseBeautyText

PastFaviaFriendshipHouseBeautyText:
	text "Our neighbors to"
	line "the north are ex-"
	cont "cellent #MON"
	cont "trainers."

	para "Their schoolhouse"
	line "teaches all about"
	cont "the different"
	cont "#MON types."

	para "It feels a little"
	line "bit silly to be in"
	cont "a class with so"
	cont "many children, but"
	cont "there are some"
	cont "other adults in"
	cont "those classes!"
	done

PastFaviaFriendshipHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 2,  7, PAST_FAVIA_TOWN, 3
	warp_event 3,  7, PAST_FAVIA_TOWN, 3

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  2,  3, SPRITE_BUENA, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PastFaviaFriendshipHouseBeauty, -1
