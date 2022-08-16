	const_def 2 ; object constants

NorthForest_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PostgameRivalAfterText:
	text "…What?"

	para "After all this"
	line "time and effort-"

	para "After capturing"
	line "the most powerful"
	cont "#MON ever made."

	para "It wasn't enough…"

	para "Could it have been"
	line "that I was a weak"
	cont "trainer all along?"

	para "Could MEWTWO have"
	line "sensed this?"

	para "…………………………………"

	para "Instead of making"
	line "use of what I had,"
	cont "I sought nothing"
	cont "but power."

	para "Is… Is that what"
	line "has made the bond"
	cont "you have with your"
	cont "#MON so strong?"

	para "I'm… I'm sorry."

	para "For how I acted"
	line "since we met."

	para "I'll learn how to"
	line "grow stronger with"
	cont "what I have, just"
	cont "like you."

	para "See you around,"
	line "<PLAYER>."
	done

NorthForest_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 17, 25, ROUTE_28_GATE, 1
	warp_event 18, 25, ROUTE_28_GATE, 2
	warp_event 24,  4, MEWTWO_LAB_1F, 1
	warp_event 25,  4, MEWTWO_LAB_1F, 2

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
