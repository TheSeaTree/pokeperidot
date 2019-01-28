	const_def 2 ; object constants
	const SPROUTTOWER2F_POKE_BALL

SproutTower2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SproutTower2FStatue:
	jumptext SproutTower2FStatueText

SproutTower2FXAccuracy:
	itemball X_ACCURACY

SproutTower2FStatueText:
	text "A #MON statue…"

	para "It looks very"
	line "distinguished."
	done

SproutTower2F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  6,  4, SPROUT_TOWER_1F, 3
	warp_event  2,  6, SPROUT_TOWER_1F, 4
	warp_event 17,  3, SPROUT_TOWER_1F, 5
	warp_event 10, 14, SPROUT_TOWER_3F, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event 12, 15, BGEVENT_READ, SproutTower2FStatue

	db 1 ; object events
	object_event  3,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SproutTower2FXAccuracy, EVENT_SPROUT_TOWER2F_X_ACCURACY
