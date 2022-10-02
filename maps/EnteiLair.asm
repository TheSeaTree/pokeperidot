	const_def 2 ; object constants
	const ENTEILAIR_ENTEI

EnteiLair_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Entei:
	opentext
	writetext EnteiText
	cry ENTEI
	waitsfx
	closetext
	special LegendaryEvent_SetBattleType
	loadwildmon ENTEI, 40
	startbattle
	reloadmapafterbattle
	disappear ENTEILAIR_ENTEI
	setevent EVENT_HIDE_ENTEI
	special CheckCaughtCelebi
	iffalse .FailedCapture
	setevent EVENT_CAUGHT_ENTEI
.FailedCapture
	end

EnteiText:
	text "Enteiiiii!"
	done

EnteiLair_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  6,  7, ENTEI_CAVE_B1F, 2

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  7,  3, SPRITE_ENTEI, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Entei, EVENT_HIDE_ENTEI
