	const_def 2 ; object constants

PastElkhornTown_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PastElkhornTownLass:
	jumptextfaceplayer PastElkhornTownLassText

PastElkhornTownSuperNerd:
	jumptextfaceplayer PastElkhornTownSuperNerdText

PastElkhornTownSign:
	jumptext PastElkhornTownSignText

PastElkhornTownMailbox:
	jumpstd mailbox

PastElkhornTownLassText:
	text "My dad has a big"
	line "collection of"
	cont "BUG-type #MON."

	para "I want to find a"
	line "SCYTHER in the"
	cont "forest some day"
	cont "to show him."
	done

PastElkhornTownSuperNerdText:
	text "There has been"
	line "weird things going"
	cont "on in the forest"
	cont "as of late."

	para "A few nights ago"
	line "my friend saw a"
	cont "#MON appear out"
	cont "of thin air."

	para "It wasn't like"
	line "anything he's ever"
	cont "seen, and he"
	cont "studies #MON"
	cont "for a living!"
	done

PastElkhornTownSignText:
	text "ELKHORN TOWN"

	para "The small town"
	line "pointing out in"
	cont "all directions."
	done

PastElkhornTown_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 21,  9, PAST_ELKHORN_MOMS_HOUSE, 1
	warp_event 15,  7, PAST_ELKHORN_LAKESIDE_HOUSE, 1
	warp_event 14, 15, PAST_ELKHORN_RICHARDS_HOUSE, 1
	warp_event  4, 10, PAST_FOREST_GATE, 3
	warp_event  4, 11, PAST_FOREST_GATE, 4

	db 0 ; coord events

	db 2 ; bg events
	bg_event 13, 10, BGEVENT_READ, PastElkhornTownSign
	bg_event 11, 11, BGEVENT_UP,   PastElkhornTownMailbox

	db 2 ; object events
	object_event  7,  7, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PastElkhornTownLass, -1
	object_event 17, 12, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WANDER, 3, 3, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PastElkhornTownSuperNerd, -1
