	const_def 2 ; object constants
	const SKARMORYSDEN_SKARMORY
	const SKARMORYSDEN_ITEMBALL

SkarmorysDen_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .ItemBall
	
.ItemBall
	checkevent EVENT_SKARMORYS_DEN_BEAT_SKARMORY
	iftrue .Appear
	return

.Appear:
	moveobject SKARMORYSDEN_ITEMBALL,  10,  5
	return

SkarmorysDenSkarmory:
	opentext
	writetext SkarmorysDenSkarmoryText
	cry SKARMORY
	waitbutton
	closetext
	loadwildmon SKARMORY, 60
	writecode VAR_BATTLETYPE, BATTLETYPE_BOSS
	startbattle
	reloadmapafterbattle
	pause 4
	special FadeBlackQuickly
	disappear SKARMORYSDEN_SKARMORY
	moveobject SKARMORYSDEN_ITEMBALL, 10, 5
	appear SKARMORYSDEN_ITEMBALL
	pause 4
	special FadeInQuickly
	setevent EVENT_SKARMORYS_DEN_BEAT_SKARMORY
	end

SkarmorysDenTreasure:
	itemball QUARTZ_BEADS

SkarmorysDenSkarmoryText:
	text "SKARMORY: Scree!"
	done

SkarmorysDen_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  9, 15, PALEROCK_MOUNTAIN_HIDDEN_CAVE, 2

	db 0 ; coord events

	db 0 ; bg events
	
	db 2 ; object events
	object_event 10,  5, SPRITE_MOLTRES, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_SILVER, OBJECTTYPE_SCRIPT, 0, SkarmorysDenSkarmory, EVENT_SKARMORYS_DEN_BEAT_SKARMORY
	object_event  0,  0, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SkarmorysDenTreasure, EVENT_SKARMORYS_DEN_TREASURE
