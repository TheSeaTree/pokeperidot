	const_def 2 ; object constants

TentacruelsDen_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .OpenCave
	
.OpenCave
	setevent EVENT_KINGERS_DEN_OPEN
	return

TentacruelsDenBossFight:
	scall LightsOut
	opentext
	writetext KinglersDenBossText
	waitbutton
	closetext
	loadwildmon TENTACRUEL, 60
	writecode VAR_BATTLETYPE, BATTLETYPE_BOSS
	startbattle
	reloadmapafterbattle
	setevent EVENT_KINGERS_DEN_DEFEATED
	end

TentacruelsDenBossText:
	text "KINGLER: Kukie!"
	line "Kukie!"
	done

TentacruelsDen_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  6, 13, ROUTE_7_CAVE_B1F, 5

	db 0 ; coord events

	db 0 ; bg events
	
	db 1 ; object events
	object_event  7,  2, SPRITE_TENTACOOL, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, TentacruelsDenBossFight, EVENT_KINGERS_DEN_DEFEATED
