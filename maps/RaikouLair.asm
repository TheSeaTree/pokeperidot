	const_def 2 ; object constants
	const RAIKOULAIR_RAIKOU

RaikouLair_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Raikou:
	opentext
	writetext RaikouText
	cry RAIKOU
	waitsfx
;	waitbutton
	closetext
	special LegendaryEvent_SetBattleType
	loadwildmon RAIKOU, 40
	startbattle
	reloadmapafterbattle
	disappear RAIKOULAIR_RAIKOU
	setevent EVENT_HIDE_RAIKOU
	special CheckCaughtCelebi
	iffalse .FailedCapture
	setevent EVENT_CAUGHT_RAIKOU
.FailedCapture
	end

RaikouText:
	text "Rararaiiiiii!"
	done

RaikouLair_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  6,  5, ORIENTEM_FOREST, 6
	warp_event  7,  5, ORIENTEM_FOREST, 6

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  7,  2, SPRITE_RAIKOU, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Raikou, EVENT_HIDE_RAIKOU
