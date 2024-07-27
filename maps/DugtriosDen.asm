	const_def 2 ; object constants
	const DUGTRIOSDEN_DIGLETT1
	const DUGTRIOSDEN_DIGLETT2
	const DUGTRIOSDEN_DIGLETT3
	const DUGTRIOSDEN_ITEMBALL

DugtriosDen_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	db 0 ; callbacks

.DummyScene:
	end

DugtriosDenDiglettLeft:
	checkcode VAR_MOVEMENT
	ifnotequal PLAYER_RUN, .NotRunning
	writecode VAR_MOVEMENT, PLAYER_NORMAL
	special ReplaceKrisSprite
.NotRunning
	scall DugtriosDenDiglettAppear

	moveobject DUGTRIOSDEN_DIGLETT1, 3, 5
	appear DUGTRIOSDEN_DIGLETT1
	setlasttalked DUGTRIOSDEN_DIGLETT1
	scall DugtriosDenDiglettBattle

	scall DugtriosDenDiglettAppear

	moveobject DUGTRIOSDEN_DIGLETT2, 5, 5
	appear DUGTRIOSDEN_DIGLETT2
	setlasttalked DUGTRIOSDEN_DIGLETT2
	scall DugtriosDenDiglettBattle

	scall DugtriosDenDiglettAppear

	moveobject DUGTRIOSDEN_DIGLETT3, 4, 4
	jump DugtriosDenDugtrioBoss

DugtriosDenDiglettRight:
	checkcode VAR_MOVEMENT
	ifnotequal PLAYER_RUN, .NotRunning
	writecode VAR_MOVEMENT, PLAYER_NORMAL
	special ReplaceKrisSprite
.NotRunning
	scall DugtriosDenDiglettAppear
	
	moveobject DUGTRIOSDEN_DIGLETT1, 4, 5
	appear DUGTRIOSDEN_DIGLETT1
	setlasttalked DUGTRIOSDEN_DIGLETT1
	scall DugtriosDenDiglettBattle

	scall DugtriosDenDiglettAppear

	moveobject DUGTRIOSDEN_DIGLETT2, 6, 5
	appear DUGTRIOSDEN_DIGLETT2
	setlasttalked DUGTRIOSDEN_DIGLETT2
	scall DugtriosDenDiglettBattle

	scall DugtriosDenDiglettAppear

	moveobject DUGTRIOSDEN_DIGLETT3, 5, 4

DugtriosDenDugtrioBoss:
	appear DUGTRIOSDEN_DIGLETT3
	setlasttalked DUGTRIOSDEN_DIGLETT3
	turnobject PLAYER, UP
	opentext
	writetext DugtriosDenDugtrioText
	cry DUGTRIO
	waitbutton
	closetext
	loadwildmon DUGTRIO, 60
	writecode VAR_BATTLETYPE, BATTLETYPE_BOSS
	startbattle
	reloadmapafterbattle

	opentext
	writetext DugtriosDenDugtrioWinText
	writebyte DUGTRIO
	special PlaySlowCry
	waitbutton
	closetext

	playsound SFX_RAZOR_WIND
	disappear DUGTRIOSDEN_DIGLETT1
	waitsfx
	playsound SFX_RAZOR_WIND
	disappear DUGTRIOSDEN_DIGLETT2
	waitsfx
	showemote EMOTE_SAD, DUGTRIOSDEN_DIGLETT3, 15
	playsound SFX_RAZOR_WIND
	disappear DUGTRIOSDEN_DIGLETT3
	waitsfx
	setscene SCENE_FINISHED
	end

DugtriosDenDiglettAppear:
	earthquake 10
	showemote EMOTE_QUESTION, PLAYER, 15
	playsound SFX_PLACE_PUZZLE_PIECE_DOWN
	end

DugtriosDenDiglettBattle:
	faceobject PLAYER, LAST_TALKED
	opentext
	writetext DugtriosDenDiglettText
	cry DIGLETT
	waitbutton
	closetext
	loadwildmon DIGLETT, 40
	writecode VAR_BATTLETYPE, BATTLETYPE_BOSS
	startbattle
	reloadmapafterbattle
	end

DugtriosDenXSpeed:
	itemball EMERALD_RING

DugtriosDenDiglettText:
	text "DIGLETT-DIG!"
	done

DugtriosDenDugtrioText:
	text "TRIO! TRIO! TRIO!"
	done

DugtriosDenDugtrioWinText:
	text "Trio… Trio… Trio…"
	done

DugtriosDen_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 5, 11, ROUTE_18_HIDDEN_CAVE_1F, 3

	db 2 ; coord events
	coord_event 4,  5, SCENE_DEFAULT, DugtriosDenDiglettLeft
	coord_event 5,  5, SCENE_DEFAULT, DugtriosDenDiglettRight

	db 0 ; bg events

	db 4 ; object events
	object_event  -3, -3, SPRITE_DIGLETT, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  -3, -3, SPRITE_DIGLETT, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  -3, -3, SPRITE_DIGLETT, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  5,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DugtriosDenXSpeed, EVENT_ROUTE_18_CAVE_X_SPEED
