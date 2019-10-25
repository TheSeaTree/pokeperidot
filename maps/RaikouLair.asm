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
	waitbutton
	closetext
	loadwildmon RAIKOU, 35
	writecode VAR_BATTLETYPE, BATTLETYPE_SUICUNE
	startbattle
	reloadmapafterbattle
	disappear RAIKOULAIR_RAIKOU
	setevent EVENT_HIDE_RAIKOU
	end
	
RaikouText:
	text "Rararaiiiiii!"
	done

RaikouLair_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  5, EAST_FOREST, 5
	warp_event  5,  5, EAST_FOREST, 5

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  5,  2, SPRITE_RAIKOU, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Raikou, EVENT_HIDE_RAIKOU
