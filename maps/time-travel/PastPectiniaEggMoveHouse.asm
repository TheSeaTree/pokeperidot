	const_def 2 ; object constants
	const PAST_PECTINIA_EGG_MOVE_HOUSE_ROCKER
	const PAST_PECTINIA_EGG_MOVE_HOUSE_PSYDUCK

PastPectiniaEggMoveHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PastPectiniaEggMoveHouseRocker:
	jumptextfaceplayer PastPectiniaEggMoveHouseRockerText

PastPectiniaEggMoveHousePsyduck:
	faceplayer
	opentext
	writetext PastPectiniaEggMoveHousePsyduckText
	cry PSYDUCK
	waitbutton
	closetext
	applymovement PAST_PECTINIA_EGG_MOVE_HOUSE_PSYDUCK, PastPectiniaEggMoveHousePsyduckDance
	applymovement PAST_PECTINIA_EGG_MOVE_HOUSE_PSYDUCK, PastPectiniaEggMoveHousePsyduckDance
	applymovement PAST_PECTINIA_EGG_MOVE_HOUSE_PSYDUCK, PastPectiniaEggMoveHousePsyduckDance
	faceplayer
	opentext
	writetext PastPectiniaEggMoveHousePsyduckPetalDanceText
	waitbutton
	closetext
	end

PastPectiniaEggMoveHouseTurntable:
	jumptext PastPectiniaEggMoveHouseTurntableText

PastPectiniaEggMoveHousePsyduckDance:
	turn_head DOWN
	step_sleep 8
	turn_head LEFT
	step_sleep 8
	turn_head UP
	step_sleep 8
	turn_head RIGHT
	step_sleep 8
	step_resume

PastPectiniaEggMoveHouseRockerText:
	text "Have you been to"
	line "FAVIA TOWN yet?"

	para "There's a lady"
	line "there that can"
	cont "teach your #MON"
	cont "some really cool"
	cont "moves it wouldn't"
	cont "otherwise learn on"
	cont "its own."

	para "She was able to"
	line "teach PETAL DANCE"
	cont "to my PSYDUCK."

	para "Now he's always"
	line "rocking out!"
	done

PastPectiniaEggMoveHousePsyduckText:
	text "PSYDUCK: Gwappa!"
	done

PastPectiniaEggMoveHousePsyduckPetalDanceText:
	text "Flower petals sur-"
	line "round PSYDUCK as"
	cont "it spins around."
	done

PastPectiniaEggMoveHouseTurntableText:
	text "The music on this"
	line "record is catchy!"

	para "You can really"
	line "dance to it."
	done

PastPectiniaEggMoveHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 2,  7, PAST_PECTINIA_CITY, 9
	warp_event 3,  7, PAST_PECTINIA_CITY, 9

	db 0 ; coord events

	db 1 ; bg events
	bg_event  5,  1, BGEVENT_READ, PastPectiniaEggMoveHouseTurntable

	db 2 ; object events
	object_event  5,  5, SPRITE_ROCKER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PastPectiniaEggMoveHouseRocker, -1
	object_event  3,  2, SPRITE_MONSTER, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PastPectiniaEggMoveHousePsyduck, -1
