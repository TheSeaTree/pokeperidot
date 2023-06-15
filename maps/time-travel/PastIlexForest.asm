	const_def 2 ; object constants
	const PASTILEXFOREST_CELEBI

PastIlexForest_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .Restless

.Restless
	setflag ENGINE_FOREST_IS_RESTLESS
	return

PastCelebiTest:
	moveobject PASTILEXFOREST_CELEBI, 47, 3
	special CelebiShrineEvent
	appear PASTILEXFOREST_CELEBI
	turnobject PLAYER, LEFT
	setlasttalked PASTILEXFOREST_CELEBI
	loadwildmon CELEBI, 70
	startbattle
	reloadmapafterbattle
	setevent EVENT_FOUGHT_BOSS_CELEBI
	; Event to return the player back to the present.
	special FadeOutMusic
	scall .PitchBlack
	cry CELEBI
	wait 8
	opentext
	writetext PastCelebiEnergyText
	waitbutton
	setmapscene BATTLE_SIMULATION, SCENE_BATTLESIMULATION_RETURNED_TO_PRESENT
	warpfacing DOWN, BATTLE_SIMULATION, 2, 9
	playsound SFX_BUBBLEBEAM
	wait 8
	end

.PitchBlack
	jumpstd darkenroom
	end

PastCelebiEnergyText:
	text "CELEBI unleashed"
	line "a huge amount of"
	cont "PSYCHIC power!"
	done

PastIlexForest_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 67, 34, PAST_FOREST_GATE, 1 ; Forest Gate
	warp_event 67, 35, PAST_FOREST_GATE, 2 ; Forest Gate
	warp_event 48,  3, ROUTE_24_NORTH, 1 ; Test Point

	db 0 ; coord events

	db 1 ; bg events
	bg_event 48,  2, BGEVENT_UP, PastCelebiTest

	db 1 ; object events
	object_event -1, -1, SPRITE_CELEBI, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
