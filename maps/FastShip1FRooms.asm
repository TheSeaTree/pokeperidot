	const_def 2 ; object constants
	const FASTSHIP1FROOMS_FANGIRL

FastShip1FRooms_MapScripts:
	db 3 ; scene scripts
	scene_script .DummyScene0 ; SCENE_FASTSHIP1FROOMS_DEFAULT
	scene_script .DummyScene1 ; SCENE_FASTSHIP1FROOMS_FOLLOWING
	scene_script .DummyScene2 ; SCENE_FASTSHIP1FROOMS_FINISHED

	db 0 ; callbacks
	
.DummyScene0:
	setmapscene FAST_SHIP_1F, SCENE_FASTSHIP1F_DEFAULT
	end

.DummyScene1:
.DummyScene2:
	end

RoomsFangirlTeleport1:
	moveobject FASTSHIP1FROOMS_FANGIRL, 1, 0
	jump RoomsFangirlContinueFolow
	
RoomsFangirlTeleport2:
	moveobject FASTSHIP1FROOMS_FANGIRL, 10, 0
	jump RoomsFangirlContinueFolow
	
RoomsFangirlTeleport3:
	moveobject FASTSHIP1FROOMS_FANGIRL, 20, 0
	jump RoomsFangirlContinueFolow
	
RoomsFangirlTeleport4:
	moveobject FASTSHIP1FROOMS_FANGIRL, 0, 15
	jump RoomsFangirlContinueFolow
	
RoomsFangirlTeleport5:
	moveobject FASTSHIP1FROOMS_FANGIRL, 10, 15
	jump RoomsFangirlContinueFolow
	
RoomsFangirlTeleport6:
	moveobject FASTSHIP1FROOMS_FANGIRL, 20, 15
	jump RoomsFangirlContinueFolow

RoomsFangirlContinueFolow:
	appear FASTSHIP1FROOMS_FANGIRL
	follow PLAYER, FASTSHIP1FROOMS_FANGIRL
	setscene SCENE_FASTSHIP1FROOMS_FOLLOWING
	setmapscene FAST_SHIP_1F, SCENE_FASTSHIP1F_DEFAULT
	end

FastShipPlayerBedScript:
	opentext
	writetext FastShipPlayerBedText
	waitbutton	
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	special StubbedTrainerRankings_Healings
	playmusic MUSIC_HEAL
	special HealParty
	pause 60
	special FadeInQuickly
	special RestartMapMusic
;	checkevent EVENT_BEAT_BURGLAR_[The one who steals Emily's bag]
;	iftrue .Landed
	end
.Landed
	playsound SFX_ELEVATOR_END
	opentext
	writetext FastShipLandedText
	waitbutton
	closetext
	special FadeOutPalettes
	playsound SFX_EXIT_BUILDING
	wait 4
;	checkevent EVENT_COMING_FROM_LEAGUE
;	iftrue, .Rugosa
; Set scenes here as well, for each respective map.
	warpfacing UP, INDIGO_PLATEAU_POKECENTER_1F, 12, 7
	end
.Rugosa
; Set scenes here as well, for each respective map.
;	clearevent EVENT_COMING_FROM_LEAGUE
	warpfacing UP, RUGOSA_PORT, 14, 7
	end

FastShipPlayerBedText:
	text "It's a comfy bed!"
	line "Time for a quick"
	cont "rest!"
	done

FastShipLandedText:
	text "We have landed!"
	done

FastShip1FRooms_MapEvents:
	db 0, 0 ; filler

	db 9 ; warp events
	warp_event  1,  0, FAST_SHIP_1F, 3
	warp_event 10,  0, FAST_SHIP_1F, 4
	warp_event 20,  0, FAST_SHIP_1F, 5
	warp_event  0, 15, FAST_SHIP_1F, 6
	warp_event 10, 15, FAST_SHIP_1F, 7
	warp_event 20, 15, FAST_SHIP_1F, 8
	warp_event  1, 15, FAST_SHIP_1F, 6
	warp_event 11, 15, FAST_SHIP_1F, 7
	warp_event 21, 15, FAST_SHIP_1F, 8

	db 9 ; coord events
	coord_event  1,  1, SCENE_FASTSHIP1F_DEFAULT, RoomsFangirlTeleport1
	coord_event 10,  1, SCENE_FASTSHIP1F_DEFAULT, RoomsFangirlTeleport2
	coord_event 20,  1, SCENE_FASTSHIP1F_DEFAULT, RoomsFangirlTeleport3
	coord_event  0, 14, SCENE_FASTSHIP1F_DEFAULT, RoomsFangirlTeleport4
	coord_event 10, 14, SCENE_FASTSHIP1F_DEFAULT, RoomsFangirlTeleport5
	coord_event 20, 14, SCENE_FASTSHIP1F_DEFAULT, RoomsFangirlTeleport6
	coord_event  1, 15, SCENE_FASTSHIP1F_DEFAULT, RoomsFangirlTeleport4
	coord_event 11, 15, SCENE_FASTSHIP1F_DEFAULT, RoomsFangirlTeleport5
	coord_event 21, 15, SCENE_FASTSHIP1F_DEFAULT, RoomsFangirlTeleport6

	db 2 ; bg events
	bg_event 3, 1, BGEVENT_RIGHT, FastShipPlayerBedScript
	bg_event 3, 2, BGEVENT_RIGHT, FastShipPlayerBedScript

	db 5 ; object events
	object_event -5, -4, SPRITE_FANGIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 11,  4, SPRITE_FANGIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 3, ObjectEvent, -1
	object_event 21,  3, SPRITE_FANGIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 1, ObjectEvent, -1
	object_event 20, 12, SPRITE_FANGIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 3, ObjectEvent, -1
	object_event  1, 14, SPRITE_FANGIRL, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 1, ObjectEvent, -1
