	const_def 2 ; object constants

UnownChamberHN_MapScripts:
	db 2 ; scene scripts
	scene_script .CheckFished ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .OpenCave
	
.CheckFished:
	checkevent EVENT_FISHED_UNOWN_CHAMBER_HN
	iftrue .StrangePresence
.DummyScene:
	end
	
.StrangePresence
	priorityjump .SpawnUnownScript
	end
	
.OpenCave:
	setscene SCENE_DEFAULT
	setevent EVENT_UNOWN_CHAMBER_HN_OPEN
	clearevent EVENT_FISHED_UNOWN_CHAMBER_HN
	clearflag ENGINE_UNLOCKED_UNOWNS_A_TO_G
	clearflag ENGINE_UNLOCKED_UNOWNS_H_TO_N
	clearflag ENGINE_UNLOCKED_UNOWNS_O_TO_U
	clearflag ENGINE_UNLOCKED_UNOWNS_V_TO_Z
	return
	
.SpawnUnownScript:
	earthquake 30
	showemote EMOTE_SHOCK, PLAYER, 20
	playsound SFX_WARP_TO
	special FadeOutPalettes
	waitsfx
	cry UNOWN
	special FadeInPalettes
	opentext
	writetext UnownHNStrangePresence
	waitbutton
	setflag ENGINE_UNLOCKED_UNOWNS_H_TO_N
	setscene SCENE_FINISHED
	closetext
	end

UnownHNChamberWallText:
	opentext
	writetext UnownHNWritingText1
	writebyte UNOWNWORDS_FISH
	special DisplayUnownWords
	writetext UnownHNWritingText2
	waitbutton
	writebyte UNOWNWORDS_STATUE
	special DisplayUnownWords
	writetext UnownHNWritingText3
	waitbutton
	closetext
	end

UnownHNWritingText1:
	text "There's something"
	line "on this wall."
	done

UnownHNWritingText2:
	text "There's more of"
	line "them…"
	done
	
UnownHNWritingText3:
	text "What are these"
	line "symbols?"
	done
	
	
UnownHNStrangePresence:
	text "A strange presence"
	line "fills the air…"
	done

UnownChamberHN_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  5, 13, ILEX_FOREST, 5
	warp_event  6, 13, ILEX_FOREST, 5

	db 0 ; coord events

	db 2 ; bg events
	bg_event  5,  1, BGEVENT_READ, UnownHNChamberWallText
	bg_event  6,  1, BGEVENT_READ, UnownHNChamberWallText
	
	db 0 ; object events
