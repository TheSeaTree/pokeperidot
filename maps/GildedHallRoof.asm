	const_def 2 ; object constants
	const GILDEDHALL_HO_OH

GildedHallRoof_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .Morning

.Morning:
	checktime MORN
	iffalse .CheckNight
	changeblock   2, 0, $1f
	changeblock   4, 0, $1f
	changeblock   6, 0, $1f
	changeblock   8, 0, $1f
	changeblock  10, 0, $1f
	changeblock  12, 0, $1f

	changeblock   0, 2, $1e
	changeblock   2, 2, $1d
	changeblock   6, 2, $35
	changeblock  10, 2, $1e
	changeblock  12, 2, $1e
	jump .skip
.CheckNight
	checktime NITE
	iffalse .skip
	changeblock   2, 0, $19
	changeblock   4, 0, $1b
	changeblock   6, 0, $19
	changeblock   8, 0, $1a
	changeblock  10, 0, $19
	changeblock  12, 0, $1b
.skip
	return

HoOh:
	opentext
	writetext HoOhText
	cry HO_OH
	waitsfx
	closetext
	special LegendaryEvent_SetBattleType
	loadwildmon HO_OH, 70
	startbattle
	reloadmapafterbattle
	disappear GILDEDHALL_HO_OH
	setevent EVENT_FOUGHT_HO_OH
	special CheckCaughtCelebi
	iffalse .FailedCapture
	setevent EVENT_CAUGHT_HO_OH
.FailedCapture
	end

GildedHallHiddenSacredAsh:
	hiddenitem SACRED_ASH, EVENT_GILDED_HALL_HIDDEN_SACRED_ASH
	
HoOhText:
	text "Shaoooh!"
	done

GildedHallRoof_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  6, 11, GILDED_HALL_3F, 7

	db 0 ; coord events

	db 1 ; bg events
	bg_event  7,  4, BGEVENT_ITEM, GildedHallHiddenSacredAsh

	db 1 ; object events
	object_event  7,  4, SPRITE_HO_OH, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 1, HoOh, EVENT_FOUGHT_HO_OH
