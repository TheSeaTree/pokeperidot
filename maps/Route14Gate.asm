	const_def 2 ; object constants

Route14Gate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
Route14GateOfficer1Script:
	faceplayer
	opentext
	checkevent EVENT_GOT_RARE_CANDY_FROM_ROUTE_14_GUARD
	iftrue .AfterReward
	checkevent EVENT_ROUTE_14_GATE_STARING_CONTEST
	iftrue .Guard1Won
	checkcode VAR_FACING
	ifequal UP, .Guard1Lost
	writetext Route14GateOfficer1Text
	waitbutton
	closetext
	end
	
.Guard1Lost
	writetext Route14GateOfficer1LostText
	waitbutton
	closetext
	end

.Guard1Won:
	writetext Route14GateOfficer1WonText
	waitbutton
	giveitem RARE_CANDY, 3
	iffalse .NoRoom
	writetext Route14GatePlayerGotItem
	waitbutton
	writetext Route14GatePlayerPutAway
	waitbutton
	closetext
	setevent EVENT_GOT_RARE_CANDY_FROM_ROUTE_14_GUARD
	end
	
.AfterReward
	writetext Route14GateOfficer1AfterText
	waitbutton
	closetext
	end

.NoRoom
	writetext Route14GateNoRoomText
	waitbutton
	closetext
	end

Route14GateOfficer2Script:
	faceplayer
	opentext
	checkevent EVENT_BEAT_OFFICER_HARRY
	iftrue .FightDone
	checkevent EVENT_GOT_RARE_CANDY_FROM_ROUTE_14_GUARD
	iftrue .AfterReward
	checkevent EVENT_ROUTE_14_GATE_STARING_CONTEST
	iftrue .Guard2Lost
	checkcode VAR_FACING
	ifequal UP, .Guard2Lost
	writetext Route14GateOfficer2Text
	waitbutton
	closetext
	end
	
.Guard2Lost
	writetext Route14GateOfficer2LostText
	waitbutton
	closetext
	setevent EVENT_ROUTE_14_GATE_STARING_CONTEST
	end
	
.AfterReward
	writetext Route14GateOfficer2AfterText
	waitbutton
	winlosstext Route14GateOfficer2WinText, 0
	loadtrainer OFFICER, HARRY
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_OFFICER_HARRY
	endifjustbattled
	
.FightDone
	writetext Route14GateOfficer2AfterBattleText
	waitbutton
	closetext
	end
	
Route14GateOfficer1Text:
	text "We're having a"
	line "staring contest."
	
	para "I usually lose,"
	line "but I think I have"
	cont "a chance now!"
	done
	
Route14GateOfficer1LostText:
	text "Darn it!"
	
	para "I was so close to"
	line "winning, too!"
	done
	
Route14GateOfficer1WonText:
	text "Aha! I won!"
	
	para "I could have never"
	line "done it without"
	cont "you, kid!"
	
	para "I was going to use"
	line "these on my own"
	cont "#MON, but you"
	cont "can have them as"
	cont "thanks."
	done

Route14GateOfficer1AfterText:
	text "The guy I was hav-"
	line "ing a staring con-"
	cont "test with doesn't"
	cont "take a loss well."
	
	para "I'd avoid him if I"
	line "were you."
	done
	
Route14GateNoRoomText:
	text "<PLAYER> received"
	line "3 RARE CANDY…"
	
	para "But there's no room"
	line "for more items."
	done
	
Route14GatePlayerGotItem:
	text "<PLAYER> received"
	line "3 RARE CANDY!@"
	sound_item
	db "@"
	done

Route14GatePlayerPutAway:
	text "<PLAYER> put the"
	line "RARE CANDY in the"
	cont "ITEM POCKET."
	done

Route14GateOfficer2Text:
	text "Do you mind?"
	
	para "I'm having a star-"
	line "ing contest with"
	cont "the other guard."
	done

Route14GateOfficer2LostText:
	text "What gives? I was"
	line "about to win!"
	done
	
Route14GateOfficer2AfterText:
	text "That wasn't cool"
	line "how you distracted"
	cont "me like that!"
	
	para "I'd oughta arrest"
	line "you for that."
	
	para "…Lucky for you I"
	line "don't have that"
	cont "kind of power."
	
	para "But what I do have"
	line "are #MON!"
	done
	
Route14GateOfficer2WinText:
	text "You just got"
	line "lucky, punk!"
	done

Route14GateOfficer2AfterBattleText:
	text "Hey, quit"
	line "loitering!"
	
	para "I already lost my"
	line "staring contest,"
	cont "and now a battle…"
	done

Route14Gate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  7, ROUTE_14, 4
	warp_event  5,  7, ROUTE_14, 4
	warp_event  4,  0, ROUTE_18, 1
	warp_event  5,  0, ROUTE_18, 2

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  0,  4, SPRITE_OFFICER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route14GateOfficer1Script, -1
	object_event  9,  4, SPRITE_OFFICER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route14GateOfficer2Script, -1
