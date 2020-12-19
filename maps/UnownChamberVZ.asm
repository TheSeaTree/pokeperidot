	const_def 2 ; object constants

UnownChamberVZ_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .OpenCave
	
.OpenCave
	setevent EVENT_UNOWN_CHAMBER_VZ_OPEN
	clearflag ENGINE_UNLOCKED_UNOWNS_A_TO_G
	clearflag ENGINE_UNLOCKED_UNOWNS_H_TO_N
	clearflag ENGINE_UNLOCKED_UNOWNS_O_TO_U
	clearflag ENGINE_UNLOCKED_UNOWNS_V_TO_Z
	return
	
UnownVZChamberWallText:
	opentext
	writetext UnownVZWritingText1
	waitbutton
	writebyte UNOWNWORDS_VOLCANO
	special DisplayUnownWords
	checkflag ENGINE_UNLOCKED_UNOWNS_V_TO_Z
	iftrue .AlreadyActive
	special EnteiChamber
	iftrue .UnlockUnown
.AlreadyActive
	writetext UnownVZWritingText2
	waitbutton
	closetext
	end

.UnlockUnown:
	closetext
	earthquake 30
	showemote EMOTE_SHOCK, PLAYER, 20
	playsound SFX_WARP_TO
	special FadeOutPalettes
	waitsfx
	special FadeInPalettes
	opentext
	writetext UnownVZStrangePresence
	waitbutton
	setflag ENGINE_UNLOCKED_UNOWNS_V_TO_Z
	setscene SCENE_DEFAULT
	closetext
	end

UnownVZWritingText1:
	text "There's something"
	line "on this wall."
	done

UnownVZWritingText2:
	text "What are these"
	line "symbols?"
	done
	
UnownVZStrangePresence:
	text "A strange presence"
	line "fills the air…"
	done

UnownChamberVZ_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  5, 13, SEA_ROUTE_6, 1
	warp_event  6, 13, SEA_ROUTE_6, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event  5,  1, BGEVENT_READ, UnownVZChamberWallText
	bg_event  6,  1, BGEVENT_READ, UnownVZChamberWallText
	
	db 0 ; object events
