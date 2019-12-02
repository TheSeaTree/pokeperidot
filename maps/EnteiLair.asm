	const_def 2 ; object constants
	const ENTEILAIR_ENTEI

EnteiLair_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Entei:
	cry ENTEI
	waitsfx
	loadwildmon ENTEI, 30
	writecode VAR_BATTLETYPE, BATTLETYPE_LEGENDARY
	startbattle
	reloadmapafterbattle
	disappear ENTEILAIR_ENTEI
	setevent EVENT_HIDE_ENTEI
	end

EnteiLair_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  7,  7, ORCHID_CITY, 1

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  7,  3, SPRITE_ENTEI, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Entei, EVENT_HIDE_ENTEI
