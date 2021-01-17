	const_def 2 ; object constants
	const PALEROCKSTRENGTHROOM_BALL
	
PalerockMountainStrengthRoom_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PalerockMountainStrengthRoomBall:
	opentext
	writetext ItLooksStuck
	yesorno
	iffalse .No
	writetext HM04Text
	playsound SFX_GET_TM
	waitsfx
	waitbutton
	disappear PALEROCKSTRENGTHROOM_BALL
	giveitem TM_STRENGTH
	writetext HM04PutAwayText
	waitbutton
	closetext
	earthquake 30
	playsound SFX_STRENGTH
	turnobject PLAYER, DOWN
	showemote EMOTE_SHOCK, PLAYER, 15
	setevent EVENT_GOT_TM_STRENGTH
	clearevent EVENT_BOULDER_IN_PALEROCK_B
	clearevent EVENT_PALEROCK_MOUNTAIN_B1F_STARDUST
	clearevent EVENT_PALEROCK_MOUNTAIN_B1F_REVIVE
	opentext
	writetext CrashingDownText
	waitbutton
	closetext
	
.No
	closetext
	end
	
PalerockStrengthRoomSign:
	checkcode VAR_FACING
	ifequal UP, .SignText
	end
	
.SignText
	jumptext PalerockStrengthRoomSignText
	end

ItLooksStuck:
	text "The capsule seems"
	line "to be suck…"

	para "Attempt to"
	line "dislodge it?"
	done
	
HM04Text:
	text "<PLAYER> got"
	line "TM24!"
	line "TM24!"
	done
	
HM04PutAwayText:
	text "<PLAYER> put the"
	line "TM24 in"
	cont "the TM POCKET."
	done

CrashingDownText:
	text "A loud crash"
	line "echoes outside!"
	done
	
PalerockStrengthRoomSignText:
	text "WARNING!"
	
	para "Disturbing this"
	line "podium may cause"
	cont "instability within"
	cont "the cavern."
	
	para "Please do not"
	line "touch anything."
	done
	
PalerockMountainStrengthRoom_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  3, 5, PALEROCK_MOUNTAIN_B1, 2

	db 0 ; coord events

	db 1 ; bg events
	bg_event  4,  2, BGEVENT_READ, PalerockStrengthRoomSign

	db 1 ; object events
	object_event   5,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, PalerockMountainStrengthRoomBall, EVENT_GOT_TM_STRENGTH
