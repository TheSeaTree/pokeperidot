	const_def 2 ; object constants
	const ROUTE10CAVE_GENGAR
	const ROUTE10CAVE_ITEMBALL
	const ROUTE10CAVE_HAUNTER1
	const ROUTE10CAVE_HAUNTER2
	const ROUTE10CAVE_HAUNTER3

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
	moveobject ROUTE10CAVE_ITEMBALL,   5,  4
	return

Route10CaveGengar:
	showemote EMOTE_SHOCK, ROUTE10CAVE_GENGAR, 15
	cry GENGAR
	waitsfx

	checkcode VAR_FACING
	ifequal LEFT, .FacingLeft
	ifequal RIGHT, .FacingRight
	ifequal DOWN, .FacingDown

	moveobject ROUTE10CAVE_HAUNTER1, 4, 5
	scall HaunterBattle1
	moveobject ROUTE10CAVE_HAUNTER2, 6, 5
	scall HaunterBattle2
	moveobject ROUTE10CAVE_HAUNTER3, 5, 6
	scall HaunterBattle3
	jump .DoBossEncounter

.FacingLeft
	moveobject ROUTE10CAVE_HAUNTER1, 6, 5
	scall HaunterBattle1
	moveobject ROUTE10CAVE_HAUNTER2, 6, 3
	scall HaunterBattle2
	moveobject ROUTE10CAVE_HAUNTER3, 7, 4
	scall HaunterBattle3
	jump .DoBossEncounter

.FacingRight
	moveobject ROUTE10CAVE_HAUNTER1, 4, 3
	scall HaunterBattle1
	moveobject ROUTE10CAVE_HAUNTER2, 4, 5
	scall HaunterBattle2
	moveobject ROUTE10CAVE_HAUNTER3, 3, 4
	scall HaunterBattle3
	jump .DoBossEncounter

.FacingDown
	moveobject ROUTE10CAVE_HAUNTER1, 6, 3
	scall HaunterBattle1
	moveobject ROUTE10CAVE_HAUNTER2, 4, 3
	scall HaunterBattle2
	moveobject ROUTE10CAVE_HAUNTER3, 5, 2
	scall HaunterBattle3
.DoBossEncounter
	playsound SFX_POWDER
	applymovement ROUTE10CAVE_HAUNTER1, Route10CaveHaunterFadeMovement
	disappear ROUTE10CAVE_HAUNTER1
	waitsfx
	playsound SFX_POWDER
	applymovement ROUTE10CAVE_HAUNTER2, Route10CaveHaunterFadeMovement
	disappear ROUTE10CAVE_HAUNTER2
	waitsfx
	playsound SFX_POWDER
	applymovement ROUTE10CAVE_HAUNTER3, Route10CaveHaunterFadeMovement
	disappear ROUTE10CAVE_HAUNTER3
	waitsfx

	faceobject PLAYER, ROUTE10CAVE_GENGAR
	opentext
	writetext Route10CaveGengarText
	cry GENGAR
	waitsfx
	closetext
	loadwildmon GENGAR, 60
	writecode VAR_BATTLETYPE, BATTLETYPE_BOSS
	startbattle
	reloadmapafterbattle
	pause 4
	special FadeBlackQuickly
	playsound SFX_WARP_TO
	disappear ROUTE10CAVE_GENGAR
	moveobject ROUTE10CAVE_ITEMBALL, 5, 4
	appear ROUTE10CAVE_ITEMBALL
	waitsfx
	pause 4
	special FadeInQuickly
	setevent EVENT_ROUTE_10_CAVE_BEAT_GENGAR
	end

HaunterBattle1:
	playsound SFX_UNKNOWN_63
	appear ROUTE10CAVE_HAUNTER1
	applymovement ROUTE10CAVE_HAUNTER1, Route10CaveHaunterFadeMovement
	setlasttalked ROUTE10CAVE_HAUNTER1
	jump LoadHaunterBattle
HaunterBattle2:
	playsound SFX_UNKNOWN_63
	appear ROUTE10CAVE_HAUNTER2
	setlasttalked ROUTE10CAVE_HAUNTER2
	applymovement ROUTE10CAVE_HAUNTER2, Route10CaveHaunterFadeMovement
	jump LoadHaunterBattle
HaunterBattle3:
	playsound SFX_UNKNOWN_63
	appear ROUTE10CAVE_HAUNTER3
	setlasttalked ROUTE10CAVE_HAUNTER3
	applymovement ROUTE10CAVE_HAUNTER3, Route10CaveHaunterFadeMovement
LoadHaunterBattle:
	waitsfx
	faceobject PLAYER, LAST_TALKED
	opentext
	writetext Route10CaveHaunterText
	cry HAUNTER
	waitsfx
	closetext
	loadwildmon HAUNTER, 40
	writecode VAR_BATTLETYPE, BATTLETYPE_FORCEITEM
	startbattle
	reloadmapafterbattle
	end

LightsOut:
	jumpstd darkenroom
	end
	
LightsOn:
	jumpstd lightuproom
	end

Route10CaveXSpAtk:
	itemball SAPPHIRE_PIN

Route10CaveHaunterFadeMovement:
	hide_person
	step_sleep 2
	show_person
	step_sleep 2
	hide_person
	step_sleep 2
	show_person
	step_sleep 2
	hide_person
	step_sleep 2
	show_person
	step_sleep 2
	step_end

Route10CaveHaunterText:
	text "HAUNTER: Hehe!"
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
	
	db 5 ; object events
	object_event   5,  4, SPRITE_GENGAR, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, Route10CaveGengar, EVENT_ROUTE_10_CAVE_BEAT_GENGAR
	object_event  -3, -3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route10CaveXSpAtk, EVENT_ROUTE_10_CAVE_X_SP_ATK
	object_event  -3, -3, SPRITE_GENGAR, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  -3, -3, SPRITE_GENGAR, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  -3, -3, SPRITE_GENGAR, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
