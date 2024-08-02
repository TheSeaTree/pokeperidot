	const_def 2 ; object constants
	const ROUTE10CAVE_GENGAR
	const ROUTE10CAVE_ITEMBALL

Route10HiddenCave_MapScripts:
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, .OpenCave
	callback MAPCALLBACK_OBJECTS, .ItemBall
	
.OpenCave
	setevent EVENT_ROUTE_10_HIDDEN_CAVE_OPEN
	return
	
.ItemBall
	checkevent EVENT_ROUTE_10_CAVE_BEAT_GENGAR
	iftrue .Appear
	return

.Appear:
	moveobject ROUTE10CAVE_ITEMBALL,   5,  3
	return

Route10CaveGengar:
	scall LightsOut

	scall LoadHaunterBattle

	scall LightsOut
;	reloadmapafterbattle
	pause 4

	scall LoadHaunterBattle

	scall LightsOut
;	reloadmapafterbattle
	pause 4

	scall LoadHaunterBattle

	reloadmapafterbattle
	pause 4
	scall LightsOn
	special FadeInQuickly
	opentext
	writetext Route10CaveGengarText
	cry GENGAR
	waitbutton
	closetext
	loadwildmon GENGAR, 60
	writecode VAR_BATTLETYPE, BATTLETYPE_BOSS
	startbattle
	reloadmapafterbattle
	pause 4
	special FadeBlackQuickly
	disappear ROUTE10CAVE_GENGAR
	moveobject ROUTE10CAVE_ITEMBALL, 5, 3
	appear ROUTE10CAVE_ITEMBALL
	pause 4
	special FadeInQuickly
	setevent EVENT_ROUTE_10_CAVE_BEAT_GENGAR
	end

LoadHaunterBattle:
	opentext
	writetext Route10CaveHaunterText
	cry HAUNTER
	waitbutton
	closetext
	loadwildmon HAUNTER, 40
	writecode VAR_BATTLETYPE, BATTLETYPE_TRAP
	startbattle
	end

LightsOut:
	jumpstd darkenroom
	end
	
LightsOn:
	jumpstd lightuproom
	end

Route10CaveXSpAtk:
	itemball SAPPHIRE_PIN

Route10CaveHaunterText:
	text "GENGAR: Hehe!"
	done

Route10CaveGengarText:
	text "GENGAR: Hehehe!"
	done

Route10HiddenCave_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 5, 11, ROUTE_10, 6

	db 0 ; coord events

	db 0 ; bg events
	
	db 2 ; object events
	object_event   5,  3, SPRITE_GENGAR, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, Route10CaveGengar, EVENT_ROUTE_10_CAVE_BEAT_GENGAR
	object_event  -3, -3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route10CaveXSpAtk, EVENT_ROUTE_10_CAVE_X_SP_ATK