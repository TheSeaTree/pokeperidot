	const_def 2 ; object constants
	const TENTACRUELSDEN_TENTACRUEL
	const TENTACRUELSDEN_ITEMBALL

TentacruelsDen_MapScripts:
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, .OpenCave
	callback MAPCALLBACK_OBJECTS, .ItemBall
	
.OpenCave
	setevent EVENT_KINGERS_DEN_OPEN
	return

	
.ItemBall
	checkevent EVENT_KINGERS_DEN_DEFEATED
	iftrue .Appear
	return

.Appear:
	moveobject TENTACRUELSDEN_ITEMBALL,   7,  2
	appear TENTACRUELSDEN_ITEMBALL
	return

TentacruelsDenBossFight:
	opentext
	writetext TentacruelsDenBossText
	cry TENTACRUEL
	waitbutton
	closetext
	loadwildmon TENTACRUEL, 60
	writecode VAR_BATTLETYPE, BATTLETYPE_BOSS
	startbattle
	reloadmapafterbattle

	pause 4
	special FadeBlackQuickly
	disappear TENTACRUELSDEN_TENTACRUEL
	moveobject TENTACRUELSDEN_ITEMBALL,   7,  2
	appear TENTACRUELSDEN_ITEMBALL
	pause 4
	special FadeInQuickly

	opentext
	writetext TentacruelsDenBossAfterText
	waitbutton
	closetext

	setevent EVENT_KINGERS_DEN_DEFEATED
	end

TentacruelsDenTreasure:
	itemball SPINEL_CHAIN

TentacruelsDenBossText:
	text "TENTACRUEL:"
	line "Tennnn-ta!"
	done

TentacruelsDenBossAfterText:
	text "An ITEM bubbled up"
	line "to the surface."
	done

TentacruelsDen_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  6, 13, ROUTE_7_CAVE_B1F, 5

	db 0 ; coord events

	db 0 ; bg events
	
	db 2 ; object events
	object_event  7,  2, SPRITE_TENTACOOL, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, TentacruelsDenBossFight, EVENT_KINGERS_DEN_DEFEATED
	object_event  0,  0, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TentacruelsDenTreasure, EVENT_TENTACRUELS_DEN_TREASURE
