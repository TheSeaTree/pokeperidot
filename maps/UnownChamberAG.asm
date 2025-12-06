	const_def 2 ; object constants

UnownChamberAG_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .OpenCave
	
.OpenCave
	setevent EVENT_UNOWN_CHAMBER_AG_OPEN
	clearflag ENGINE_UNLOCKED_UNOWNS_A_TO_G
	clearflag ENGINE_UNLOCKED_UNOWNS_H_TO_N
	clearflag ENGINE_UNLOCKED_UNOWNS_O_TO_U
	clearflag ENGINE_UNLOCKED_UNOWNS_V_TO_Z
	return
	
UnownAGChamberWallText:
	opentext
	writetext UnownAGWritingText1
	waitbutton
	writebyte UNOWNWORDS_FRIENDS
	special DisplayUnownWords
	checkflag ENGINE_UNLOCKED_UNOWNS_A_TO_G
	iftrue .AlreadyActive
	special GetFirstPokemonHappiness
	ifgreater 200 - 1, .UnlockUnown
.AlreadyActive
	writetext UnownAGWritingText2
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
	writetext UnownHNStrangePresence
	waitbutton
	setflag ENGINE_UNLOCKED_UNOWNS_A_TO_G
	closetext
	end

UnownAGWritingText1:
	text "There's something"
	line "on this wall."
	done

UnownAGWritingText2:
	text "What are these"
	line "symbols?"
	done

UnownChamberAG_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  5, 13, ROUTE_5, 2
	warp_event  6, 13, ROUTE_5, 2

	db 0 ; coord events

	db 2 ; bg events
	bg_event  5,  1, BGEVENT_READ, UnownAGChamberWallText
	bg_event  6,  1, BGEVENT_READ, UnownAGChamberWallText
	
	db 0 ; object events
