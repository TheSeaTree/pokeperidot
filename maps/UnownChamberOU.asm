	const_def 2 ; object constants

UnownChamberOU_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .OpenCave
	
.DummyScene:
	end

.OpenCave
	setevent EVENT_UNOWN_CHAMBER_OU_OPEN
	setscene SCENE_DEFAULT
	clearflag ENGINE_UNLOCKED_UNOWNS_A_TO_G
	clearflag ENGINE_UNLOCKED_UNOWNS_H_TO_N
	clearflag ENGINE_UNLOCKED_UNOWNS_O_TO_U
	clearflag ENGINE_UNLOCKED_UNOWNS_V_TO_Z
	return
	
UnownnOUChamberWallText:
	opentext
	writetext UnownOUWritingText1
	waitbutton
	writebyte UNOWNWORDS_CLOCK
	special DisplayUnownWords
	writetext UnownOUWritingText2
	waitbutton
	closetext
	checkflag ENGINE_UNLOCKED_UNOWNS_O_TO_U
	iftrue .end
	setscene SCENE_FINISHED
.end
	end
	
UnownChamberOULapCheck:
	setscene SCENE_DEFAULT
	end
	
UnownChamberOUFinishLine:
	checkcode VAR_FACING
	ifequal RIGHT, .Finished
	setscene SCENE_DEFAULT
	end

.Finished
	earthquake 30
	showemote EMOTE_SHOCK, PLAYER, 20
	playsound SFX_WARP_TO
	special FadeOutPalettes
	waitsfx
	special FadeInPalettes
	opentext
	writetext UnownOUStrangePresence
	waitbutton
	setflag ENGINE_UNLOCKED_UNOWNS_O_TO_U
	setscene SCENE_DEFAULT
	closetext
	end

UnownOUWritingText1:
	text "There's something"
	line "on this wall."
	done

UnownOUWritingText2:
	text "What are these"
	line "symbols?"
	done
	
UnownOUStrangePresence:
	text "A strange presence"
	line "fills the air…"
	done

UnownChamberOU_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  5, 13, ROUTE_12, 1
	warp_event  6, 13, ROUTE_12, 1

	db 21 ; coord events
	coord_event  4,  5, SCENE_FINISHED, UnownChamberOULapCheck
	coord_event  4,  6, SCENE_FINISHED, UnownChamberOULapCheck
	coord_event  3,  7, SCENE_FINISHED, UnownChamberOULapCheck
	coord_event  2,  7, SCENE_FINISHED, UnownChamberOULapCheck
	coord_event  2,  8, SCENE_FINISHED, UnownChamberOULapCheck
	coord_event  2,  9, SCENE_FINISHED, UnownChamberOULapCheck
	coord_event  4, 10, SCENE_FINISHED, UnownChamberOULapCheck
	coord_event  4, 11, SCENE_FINISHED, UnownChamberOULapCheck
	coord_event  5, 11, SCENE_FINISHED, UnownChamberOULapCheck
	coord_event  6, 11, SCENE_FINISHED, UnownChamberOULapCheck
	coord_event  7, 11, SCENE_FINISHED, UnownChamberOULapCheck
	coord_event  7, 10, SCENE_FINISHED, UnownChamberOULapCheck
	coord_event  9,  9, SCENE_FINISHED, UnownChamberOULapCheck
	coord_event  9,  8, SCENE_FINISHED, UnownChamberOULapCheck
	coord_event  9,  7, SCENE_FINISHED, UnownChamberOULapCheck
	coord_event  8,  7, SCENE_FINISHED, UnownChamberOULapCheck
	coord_event  7,  6, SCENE_FINISHED, UnownChamberOULapCheck
	coord_event  7,  5, SCENE_FINISHED, UnownChamberOULapCheck
	coord_event  6,  3, SCENE_FINISHED, UnownChamberOULapCheck
	coord_event  5,  3, SCENE_FINISHED, UnownChamberOULapCheck
	coord_event  4,  2, SCENE_FINISHED, UnownChamberOUFinishLine

	db 2 ; bg events
	bg_event  5,  1, BGEVENT_READ, UnownnOUChamberWallText
	bg_event  6,  1, BGEVENT_READ, UnownnOUChamberWallText
	
	db 0 ; object events
