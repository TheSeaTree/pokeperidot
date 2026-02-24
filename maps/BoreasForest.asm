	const_def 2 ; object constants
	const BOREASFOREST_RIVAL
	const BOREASFOREST_MEWTWO

BoreasForest_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINSIHED

	db 0 ; callbacks

.DummyScene:
	end

BoreasForestRivalBattleLeft:
	scall BoreasForestRivalNoticePlayer
	applymovement BOREASFOREST_RIVAL, BoreasForestRivalApproachPlayerLeft
	scall BoreasForestRivalBattleCommon
	playsound SFX_BALL_POOF
	applymovement BOREASFOREST_RIVAL, BoreasForestRivalMewtwoBreakFree
	moveobject BOREASFOREST_MEWTWO, 17, 25
	appear BOREASFOREST_MEWTWO
	scall BoreasForestRivalAfterBattle
	applymovement BOREASFOREST_RIVAL, BoreasForestRivalExitLeft
	jump BoreasForestRivalEndScene

BoreasForestRivalBattleRight:
	scall BoreasForestRivalNoticePlayer
	applymovement BOREASFOREST_RIVAL, BoreasForestRivalApproachPlayerRight
	scall BoreasForestRivalBattleCommon
	playsound SFX_BALL_POOF
	applymovement BOREASFOREST_RIVAL, BoreasForestRivalMewtwoBreakFree
	moveobject BOREASFOREST_MEWTWO, 18, 25
	appear BOREASFOREST_MEWTWO
	scall BoreasForestRivalAfterBattle
	applymovement BOREASFOREST_RIVAL, BoreasForestRivalExitRight

BoreasForestRivalEndScene:
	playsound SFX_EXIT_BUILDING
	disappear BOREASFOREST_RIVAL
	waitsfx
	setscene SCENE_FINISHED
	setevent EVENT_BEAT_RIVAL_IN_POSTGAME
	playmusic MUSIC_UNION_CAVE
	end

BoreasForestRivalNoticePlayer:
	setlasttalked BOREASFOREST_RIVAL
	special FadeOutMusic
	faceplayer
	showemote EMOTE_QUESTION, BOREASFOREST_RIVAL, 30
	special StopPlayerRunning
	playmusic MUSIC_RIVAL_ENCOUNTER
	end

BoreasForestRivalBattleCommon:
	opentext
	writetext PostgameRivalIntroText
	waitbutton
	closetext
	winlosstext PostgameRivalWinText, PostgameRivalLossText
	loadtrainer RIVAL1, RIVAL1_7
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	end
	
BoreasForestRivalAfterBattle:
	opentext
	writetext MewtwoEscapedItsBallText
	waitbutton
	closetext
	cry MEWTWO
	waitsfx
	playsound SFX_WARP_TO
	applymovement BOREASFOREST_MEWTWO, BoreasForestMewtwoTeleportAway
	disappear BOREASFOREST_MEWTWO
	waitsfx
	opentext
	writetext MewtwoTeleportedText
	waitbutton
	closetext

	showemote EMOTE_SHOCK, BOREASFOREST_RIVAL, 15
	applymovement BOREASFOREST_RIVAL, BoreasForestRivalLookLeftRight

	opentext
	writetext PostgameRivalAfterText
	waitbutton
	closetext
	end

BoreasForestHiddenRevivalHerb:
	hiddenitem REVIVAL_HERB, EVENT_BOREAS_FOREST_HIDDEN_REVIVAL_HERB

BoreasForestHiddenXAttack:
	hiddenitem X_ATTACK, EVENT_BOREAS_FOREST_HIDDEN_X_ATTACK

BoreasForestHiddenXSpAtk:
	hiddenitem X_SP_ATK, EVENT_BOREAS_FOREST_HIDDEN_X_SP_ATK

BoreasForestRivalApproachPlayerRight:
	step RIGHT
BoreasForestRivalApproachPlayerLeft:
	step DOWN
	step DOWN
	step_end

BoreasForestRivalMewtwoBreakFree:
	fix_facing
	run_step UP
	remove_fixed_facing
	step_end

BoreasForestMewtwoTeleportAway:
	hide_person
	step_sleep 1
	show_person
	step_sleep 1
	hide_person
	step_sleep 1
	show_person
	step_sleep 1
	hide_person
	step_sleep 1
	show_person
	step_sleep 1
	hide_person
	step_sleep 1
	show_person
	step_sleep 1
	hide_person
	step_end

BoreasForestRivalLookLeftRight:
	turn_head LEFT
	step_sleep 16
	turn_head RIGHT
	step_sleep 16
	turn_head LEFT
	step_sleep 16
	turn_head RIGHT
	step_sleep 16
	step DOWN
	step_end

BoreasForestRivalExitLeft:
	step RIGHT
	step DOWN
	step DOWN
	turn_step DOWN
	step_resume

BoreasForestRivalExitRight:
	step LEFT
	step DOWN
	step DOWN
	turn_step DOWN
	step_resume

PostgameRivalIntroText:
	text "How nice to see"
	line "you, “CHAMPION.”"

	para "You must have" 
	line "heard the rumors"
	cont "about the super"
	cont "powerful #MON."

	para "It's a shame, you"
	line "just missed it."

	para "…Well, that's not"
	line "exactly true."

	para "You only missed"
	line "your chance to"
	cont "catch it."

	para "There's no way you"
	line "can stand a chance"
	cont "at beating me now."

	para "Not when I have"
	line "the most powerful"
	cont "#MON the world"
	cont "has ever seen!"
	done

PostgameRivalWinText:
	text "Impossible!"

	para "How could I have"
	line "lost with MEWTWO"
	cont "by my side?"
	done

PostgameRivalLossText:
	text "Heh! How does it"
	line "feel to be on the"
	cont "receiving end of"
	cont "such a powerful"
	cont "#MON?"
	done

MewtwoEscapedItsBallText:
	text "MEWTWO escaped"
	line "from its BALL!"
	done

MewtwoTeleportedText:
	text "MEWTWO teleported"
	line "away!"
	done

PostgameRivalAfterText:
	text "…What?"

	para "After all this"
	line "time and effort-"

	para "After capturing"
	line "the most powerful"
	cont "#MON ever made."

	para "It wasn't enough…"

	para "Could it have been"
	line "that I was a weak"
	cont "trainer all along?"

	para "Could MEWTWO have"
	line "sensed this?"

	para "…………………………………"

	para "Instead of making"
	line "use of what I had,"
	cont "I sought nothing"
	cont "but power."

	para "Is… Is that what"
	line "has made the bond"
	cont "you have with your"
	cont "#MON so strong?"

	para "I'm… I'm sorry."

	para "For how I acted"
	line "since we met."

	para "I'll learn how to"
	line "grow stronger with"
	cont "what I have, just"
	cont "like you."

	para "I hope you can"
	line "forgive me."

	para "See you around,"
	line "<PLAYER>."
	done

BoreasForest_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 17, 27, ROUTE_24_GATE, 1
	warp_event 18, 27, ROUTE_24_GATE, 2
	warp_event 24,  6, MEWTWO_LAB_1F, 1
	warp_event 25,  6, MEWTWO_LAB_1F, 2

	db 2 ; coord events
	coord_event 17, 26, SCENE_DEFAULT, BoreasForestRivalBattleLeft
	coord_event 18, 26, SCENE_DEFAULT, BoreasForestRivalBattleRight

	db 3 ; bg events
	bg_event 32, 23, BGEVENT_ITEM, BoreasForestHiddenRevivalHerb
	bg_event 31,  9, BGEVENT_ITEM, BoreasForestHiddenXAttack
	bg_event 11,  5, BGEVENT_ITEM, BoreasForestHiddenXSpAtk

	db 2 ; object events
	object_event 17, 23, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_BEAT_RIVAL_IN_POSTGAME
	object_event  0,  0, SPRITE_MEWTWO, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_BEAT_RIVAL_IN_POSTGAME
