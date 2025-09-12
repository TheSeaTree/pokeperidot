	const_def 2 ; object constants

Route13Gate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
Route13GateOfficer1Script:
	faceplayer
	opentext
	checkevent EVENT_GOT_RARE_CANDY_FROM_ROUTE_13_GUARD
	iftrue .AfterReward
	checkevent EVENT_ROUTE_13_GATE_STARING_CONTEST
	iftrue .Guard1Won
	checkcode VAR_FACING
	ifequal UP, .Guard1Lost
	writetext Route13GateOfficer1Text
	waitbutton
	closetext
	end
	
.Guard1Lost
	writetext Route13GateOfficer1LostText
	waitbutton
	closetext
	end

.Guard1Won:
	writetext Route13GateOfficer1WonText
	waitbutton
	giveitem RARE_CANDY, 3
	iffalse .NoRoom
	writetext Route13GatePlayerGotItem
	waitbutton
	writetext Route13GatePlayerPutAway
	waitbutton
	closetext
	setevent EVENT_GOT_RARE_CANDY_FROM_ROUTE_13_GUARD
	end
	
.AfterReward
	writetext Route13GateOfficer1AfterText
	waitbutton
	closetext
	end

.NoRoom
	writetext Route13GateNoRoomText
	waitbutton
	closetext
	end

Route13GateOfficer2Script:
	faceplayer
	opentext
	checkevent EVENT_BEAT_OFFICER_HARRY
	iftrue .FightDone
	checkevent EVENT_GOT_RARE_CANDY_FROM_ROUTE_13_GUARD
	iftrue .AfterReward
	checkevent EVENT_ROUTE_13_GATE_STARING_CONTEST
	iftrue .Guard2Lost
	checkcode VAR_FACING
	ifequal UP, .Guard2Lost
	writetext Route13GateOfficer2Text
	waitbutton
	closetext
	end
	
.Guard2Lost
	writetext Route13GateOfficer2LostText
	waitbutton
	closetext
	setevent EVENT_ROUTE_13_GATE_STARING_CONTEST
	end
	
.AfterReward
	writetext Route13GateOfficer2AfterText
	waitbutton
	playmusic MUSIC_HIKER_ENCOUNTER
	writetext Route13GateOfficer2ChellengeText
	waitbutton
	winlosstext Route13GateOfficer2WinText, 0
	loadtrainer OFFICER, HARRY
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_OFFICER_HARRY
	endifjustbattled
	
.FightDone
	writetext Route13GateOfficer2AfterBattleText
	waitbutton
	closetext
	end
	
Route13GateOfficer1Text:
	text "We're having a"
	line "staring contest."
	
	para "I usually lose,"
	line "but I think I have"
	cont "a chance now!"
	done
	
Route13GateOfficer1LostText:
	text "Darn it!"
	
	para "I was so close to"
	line "winning, too!"
	done
	
Route13GateOfficer1WonText:
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

Route13GateOfficer1AfterText:
	text "The guy I was hav-"
	line "ing a staring con-"
	cont "test with doesn't"
	cont "take a loss well."
	
	para "I'd avoid him if I"
	line "were you."
	done
	
Route13GateNoRoomText:
	text "<PLAYER> received"
	line "3 RARE CANDY…"
	
	para "But there's no room"
	line "for more items."
	done
	
Route13GatePlayerGotItem:
	text "<PLAYER> received"
	line "3 RARE CANDY!@"
	sound_item
	db "@"
	done

Route13GatePlayerPutAway:
	text "<PLAYER> put the"
	line "RARE CANDY in the"
	cont "ITEM POCKET."
	done

Route13GateOfficer2Text:
	text "Do you mind?"
	
	para "I'm having a star-"
	line "ing contest with"
	cont "the other guard."
	done

Route13GateOfficer2LostText:
	text "What gives? I was"
	line "about to win!"
	done
	
Route13GateOfficer2AfterText:
	text "That wasn't cool"
	line "how you distracted"
	cont "me like that!"
	
	para "I'd ought to arrest"
	line "you for that."
	
	para "…Lucky for you I"
	line "don't have that"
	cont "kind of power."
	done

Route13GateOfficer2ChellengeText:
	text "But what I do have"
	line "are #MON that"
	cont "can teach you a"
	cont "lesson!"
	done
	
Route13GateOfficer2WinText:
	text "You just got"
	line "lucky, punk!"
	done

Route13GateOfficer2AfterBattleText:
	text "Hey, quit"
	line "loitering!"
	
	para "I already lost my"
	line "staring contest,"
	cont "and now a battle…"
	done

Route13Gate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  7, ROUTE_13, 4
	warp_event  5,  7, ROUTE_13, 4
	warp_event  4,  0, ROUTE_14, 1
	warp_event  5,  0, ROUTE_14, 2

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  0,  4, SPRITE_OFFICER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route13GateOfficer1Script, -1
	object_event  9,  4, SPRITE_OFFICER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route13GateOfficer2Script, -1
