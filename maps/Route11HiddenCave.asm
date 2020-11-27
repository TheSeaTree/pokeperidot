	const_def 2 ; object constants
	const ROUTE11CAVE_GENGAR
	const ROUTE11CAVE_ITEMBALL

Route11HiddenCave_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .OpenCave
	callback MAPCALLBACK_OBJECTS, .ItemBall
	
.OpenCave
	setevent EVENT_ROUTE_11_HIDDEN_CAVE_OPEN
	return
	
.ItemBall
	checkevent EVENT_ROUTE_11_CAVE_BEAT_GENGAR
	iftrue .Appear
	return

.Appear:
	moveobject ROUTE11CAVE_ITEMBALL,   5,  3
	return

Route11CaveGengar:
	opentext
	writetext Route11CaveGengarText
	cry GENGAR
	waitbutton
	closetext
	loadwildmon GENGAR, 45
	writecode VAR_BATTLETYPE, BATTLETYPE_BOSS
	startbattle
	reloadmapafterbattle
	pause 4
	special FadeBlackQuickly
	disappear ROUTE11CAVE_GENGAR
	moveobject ROUTE11CAVE_ITEMBALL, 5, 3
	appear ROUTE11CAVE_ITEMBALL
	pause 4
	special FadeInQuickly
	setevent EVENT_ROUTE_11_CAVE_BEAT_GENGAR
	end

Route11CaveXSpAtk:
	itemball X_SP_ATK
	
Route11CaveGengarText:
	text "GENGAR: Hehehe!"
	done

Route11HiddenCave_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 5, 11, ROUTE_11, 6

	db 0 ; coord events

	db 0 ; bg events
	
	db 2 ; object events
	object_event   5,  3, SPRITE_GENGAR, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, Route11CaveGengar, EVENT_ROUTE_11_CAVE_BEAT_GENGAR
	object_event  -3, -3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route11CaveXSpAtk, EVENT_ROUTE_11_CAVE_X_SP_ATK