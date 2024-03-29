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
	jumptextfaceplayer TrainerOfficerMatthewAfterText

Route28OfficerBattleRight:
	scall OfficerMatthewStopPlayer
	applymovement PLAYER, Route28GatePlayerMovement
	jump Route28OfficerBattleCommon

Route28OfficerBattleLeft:
	scall OfficerMatthewStopPlayer
	turnobject PLAYER, LEFT
Route28OfficerBattleCommon:
	opentext
	writetext TrainerOfficerMatthewText
	waitbutton
	closetext
	winlosstext TrainerOfficerMatthewWinText, 0
	loadtrainer OFFICER, MATTHEW
	startbattle
	reloadmapafterbattle
	opentext
	writetext TrainerOfficerMatthewAfterText
	waitbutton
	closetext
	setscene SCENE_FINISHED
	end

OfficerMatthewStopPlayer:
	playmusic MUSIC_OFFICER_ENCOUNTER
	showemote EMOTE_SHOCK, ROUTE28GATE_OFFICER, 30
	opentext
	writetext TrainerOfficerMatthewStopPlayerText
	waitbutton
	closetext
	end

Route28GatePlayerMovement:
	step LEFT
	step_end

Route28GateOfficerText:
	text "You beat me in"
	line "battle."
	done

TrainerOfficerMatthewStopPlayerText:
	text "Freeze!"
	done

TrainerOfficerMatthewText:
	text "No way I'm going to"
	line "let a second tres-"
	cont "passer through!"
	done

TrainerOfficerMatthewWinText:
	text "Man! You kids are"
	line "getting strong!"

	para "My #MON just"
	line "can't keep up."
	done

TrainerOfficerMatthewAfterText:
	text "After you and the"
	line "other kid who came"
	cont "by today, I really"
	cont "need to train my"
	cont "#MON harder."

	para "What use is an"
	line "OFFICER who can't"
	cont "defend his gate?"
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
