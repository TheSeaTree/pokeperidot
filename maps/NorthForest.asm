	const_def 2 ; object constants
	const NORTHFOREST_RIVAL
	const NORTHFOREST_MEWTWO

NorthForest_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINSIHED

	db 0 ; callbacks

.DummyScene:
	end

NorthForestRivalBattleLeft:
	scall NorthForestRivalNoticePlayer
	applymovement NORTHFOREST_RIVAL, NorthForestRivalApproachPlayerLeft
	scall NorthForestRivalBattleCommon
	playsound SFX_BALL_POOF
	applymovement NORTHFOREST_RIVAL, NorthForestRivalMewtwoBreakFree
	moveobject NORTHFOREST_MEWTWO, 17, 23
	appear NORTHFOREST_MEWTWO
	scall NorthForestRivalAfterBattle
	applymovement NORTHFOREST_RIVAL, NorthForestRivalExitLeft
	jump NorthForestRivalEndScene

NorthForestRivalBattleRight:
	scall NorthForestRivalNoticePlayer
	applymovement NORTHFOREST_RIVAL, NorthForestRivalApproachPlayerRight
	scall NorthForestRivalBattleCommon
	playsound SFX_BALL_POOF
	applymovement NORTHFOREST_RIVAL, NorthForestRivalMewtwoBreakFree
	moveobject NORTHFOREST_MEWTWO, 18, 23
	appear NORTHFOREST_MEWTWO
	scall NorthForestRivalAfterBattle
	applymovement NORTHFOREST_RIVAL, NorthForestRivalExitRight

NorthForestRivalEndScene:
	playsound SFX_EXIT_BUILDING
	disappear NORTHFOREST_RIVAL
	waitsfx
	setscene SCENE_FINISHED
	setevent EVENT_BEAT_RIVAL_IN_POSTGAME
	playmusic MUSIC_UNION_CAVE
	end

NorthForestRivalNoticePlayer:
	setlasttalked NORTHFOREST_RIVAL
	special FadeOutMusic
	faceplayer
	showemote EMOTE_QUESTION, NORTHFOREST_RIVAL, 15
	playmusic MUSIC_RIVAL_ENCOUNTER
	end

NorthForestRivalBattleCommon:
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
	
NorthForestRivalAfterBattle:
	opentext
	writetext MewtwoEscapedItsBallText
	waitbutton
	closetext
	cry MEWTWO
	waitsfx
	playsound SFX_WARP_TO
	applymovement NORTHFOREST_MEWTWO, NorthForestMewtwoTeleportAway
	disappear NORTHFOREST_MEWTWO
	waitsfx
	opentext
	writetext MewtwoTeleportedText
	waitbutton
	closetext

	showemote EMOTE_SHOCK, NORTHFOREST_RIVAL, 15
	applymovement NORTHFOREST_RIVAL, NorthForestRivalLookLeftRight

	opentext
	writetext PostgameRivalAfterText
	waitbutton
	closetext
	end

NorthForestHiddenRevivalHerb:
	hiddenitem REVIVAL_HERB, EVENT_NORTH_FOREST_HIDDEN_REVIVAL_HERB

NorthForestHiddenXAttack:
	hiddenitem REVIVAL_HERB, EVENT_NORTH_FOREST_HIDDEN_X_ATTACK

NorthForestHiddenXSpAtk:
	hiddenitem X_SP_ATK, EVENT_NORTH_FOREST_HIDDEN_X_SP_ATK

NorthForestRivalApproachPlayerRight:
	step RIGHT
NorthForestRivalApproachPlayerLeft:
	step DOWN
	step DOWN
	step_end

NorthForestRivalMewtwoBreakFree:
	fix_facing
	run_step UP
	remove_fixed_facing
	step_end

NorthForestMewtwoTeleportAway:
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

NorthForestRivalLookLeftRight:
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

NorthForestRivalExitLeft:
	step RIGHT
	step DOWN
	step DOWN
	turn_step DOWN
	step_resume

NorthForestRivalExitRight:
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

NorthForest_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 17, 25, ROUTE_28_GATE, 1
	warp_event 18, 25, ROUTE_28_GATE, 2
	warp_event 24,  4, MEWTWO_LAB_1F, 1
	warp_event 25,  4, MEWTWO_LAB_1F, 2

	db 2 ; coord events
	coord_event 17, 24, SCENE_DEFAULT, NorthForestRivalBattleLeft
	coord_event 18, 24, SCENE_DEFAULT, NorthForestRivalBattleRight

	db 3 ; bg events
	bg_event 32, 21, BGEVENT_ITEM, NorthForestHiddenRevivalHerb
	bg_event 31,  7, BGEVENT_ITEM, NorthForestHiddenXAttack
	bg_event 11,  3, BGEVENT_ITEM, NorthForestHiddenXSpAtk

	db 2 ; object events
	object_event 17, 21, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_BEAT_RIVAL_IN_POSTGAME
	object_event  0,  0, SPRITE_MEWTWO, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_BEAT_RIVAL_IN_POSTGAME
