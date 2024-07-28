	const_def 2 ; object constants
	const ROUTE24GATE_OFFICER

Route24Gate_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINSIHED

	db 0 ; callbacks

.DummyScene
	end

Route24GateOfficerScript:
	jumptextfaceplayer TrainerOfficerMatthewAfterText

Route24OfficerBattleRight:
	scall OfficerMatthewStopPlayer
	applymovement PLAYER, Route24GatePlayerMovement
	jump Route24OfficerBattleCommon

Route24OfficerBattleLeft:
	scall OfficerMatthewStopPlayer
	turnobject PLAYER, LEFT
Route24OfficerBattleCommon:
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
	showemote EMOTE_SHOCK, ROUTE24GATE_OFFICER, 30
	opentext
	writetext TrainerOfficerMatthewStopPlayerText
	waitbutton
	closetext
	end

Route24GatePlayerMovement:
	step LEFT
	step_end

Route24GateOfficerText:
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

Route24Gate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  2,  0, BOREAS_FOREST, 1
	warp_event  3,  0, BOREAS_FOREST, 2
	warp_event  2,  7, ROUTE_24, 1
	warp_event  3,  7, ROUTE_24, 1

	db 2 ; coord events
	coord_event  2,  3, SCENE_DEFAULT, Route24OfficerBattleLeft
	coord_event  3,  3, SCENE_DEFAULT, Route24OfficerBattleRight

	db 0 ; bg events

	db 1 ; object events
	object_event  0,  3, SPRITE_OFFICER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route24GateOfficerScript, -1
