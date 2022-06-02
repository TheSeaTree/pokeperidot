	const_def 2 ; object constants
	const ROUTE28GATE_OFFICER

Route28Gate_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINSIHED

	db 0 ; callbacks

.DummyScene
	end

Route28GateOfficerScript:
	jumptextfaceplayer Route28GateOfficerText

Route28OfficerBattleRight:
	playmusic MUSIC_OFFICER_ENCOUNTER
	showemote EMOTE_SHOCK, ROUTE28GATE_OFFICER, 30
	applymovement PLAYER, Route28GatePlayerMovement
	jump Route28OfficerBattleCommon

Route28OfficerBattleLeft:
	playmusic MUSIC_OFFICER_ENCOUNTER
	showemote EMOTE_SHOCK, ROUTE28GATE_OFFICER, 30
	turnobject PLAYER, LEFT
Route28OfficerBattleCommon:
	reloadmapafterbattle
	setscene SCENE_FINISHED
	end

Route28GatePlayerMovement:
	step LEFT
	step_end

Route28GateOfficerText:
	text "You beat me in"
	line "battle."
	done

Route28Gate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  2,  0, NORTH_FOREST, 1
	warp_event  3,  0, NORTH_FOREST, 2
	warp_event  2,  7, ROUTE_28, 1
	warp_event  3,  7, ROUTE_28, 1

	db 2 ; coord events
	coord_event  2,  3, SCENE_DEFAULT, Route28OfficerBattleLeft
	coord_event  3,  3, SCENE_DEFAULT, Route28OfficerBattleRight

	db 0 ; bg events

	db 1 ; object events
	object_event  0,  3, SPRITE_OFFICER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route28GateOfficerScript, -1
