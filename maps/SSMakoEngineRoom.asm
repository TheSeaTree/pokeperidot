	const_def 2 ; object constants
	const SSMAKOENGINEROOM_FANGIRL

SSMakoEngineRoom_MapScripts:
	db 3 ; scene scripts
	scene_script .DummyScene0 ; SCENE_SSMAKOENGINEROOM_DEFAULT
	scene_script .DummyScene1 ; SCENE_SSMAKOENGINEROOM_FOLLOWING
	scene_script .DummyScene2 ; SCENE_SSMAKOENGINEROOM_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .RestorePlayerSprite

.RestorePlayerSprite:
	special RestorePlayerSprite
	return
	
.DummyScene0:
	setmapscene SS_MAKO_B1F, SCENE_SSMAKOB1F_DEFAULT
.DummyScene1:
.DummyScene2:
	end

	db 0 ; callbacks

FangirlEngineRoomTeleport:
	moveobject SSMAKOENGINEROOM_FANGIRL, 8, 7
	appear SSMAKOENGINEROOM_FANGIRL
	follow PLAYER, SSMAKOENGINEROOM_FANGIRL
	setscene SCENE_SSMAKOENGINEROOM_FOLLOWING
	faceobject SSMAKOENGINEROOM_FANGIRL, PLAYER
	end

SSMakoEngineRoomFangirl:
	checkevent EVENT_GOT_VIP_TICKET
	iftrue .Ticket
	jumptextfaceplayer SSMakoEngineRoomEmilyBeforeTicketText
	
.Ticket
	jumpstd emilycompanion
	
SSMakoB1FGiveTicket:
	faceplayer
	opentext
	checkevent EVENT_BEAT_SAILOR_TAYLOR
	iftrue .AfterRematch
	checkflag ENGINE_FLYPOINT_POKEMON_LEAGUE
	iftrue .Rematch
	checkevent EVENT_GOT_VIP_TICKET
	iftrue .Ticket
	writetext SailorTaylorText
	waitbutton
	playmusic MUSIC_HIKER_ENCOUNTER
	writetext SailorTaylorChallengeText
	waitbutton
	closetext
	winlosstext SailorTaylorWinText, 0
	loadtrainer SAILOR, TAYLOR
	startbattle
	reloadmapafterbattle

	opentext
	verbosegiveitem VIP_TICKET
	setevent EVENT_GOT_VIP_TICKET
.Ticket
	writetext SailorTaylorAfterText
	waitbutton
	closetext
	end
	
.Rematch:
	writetext SailorTaylorRematchIntroText
	waitbutton
	playmusic MUSIC_HIKER_ENCOUNTER
	writetext SailorTaylorRematchChallengeText
	waitbutton
	closetext
	winlosstext SailorTaylorWinText, 0
	copybytetovar wTaylorFightCount
	ifgreater  11, .RematchTeam5
	ifgreater	8, .RematchTeam4
	ifgreater  	5, .RematchTeam3
	ifgreater  	2, .RematchTeam2
;RematchTeam1
	loadtrainer SAILOR, TAYLOR_REMATCH1
	jump .DoBattle
.RematchTeam2:
	loadtrainer SAILOR, TAYLOR_REMATCH2
	jump .DoBattle
.RematchTeam3:
	loadtrainer SAILOR, TAYLOR_REMATCH3
	jump .DoBattle
.RematchTeam4:
	loadtrainer SAILOR, TAYLOR_REMATCH4
	jump .DoBattle
.RematchTeam5:
	loadtrainer SAILOR, TAYLOR_REMATCH5
.DoBattle
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_SAILOR_TAYLOR
	copybytetovar wTaylorFightCount
	ifgreater  11, .DoneRematch
	addvar 1
	copyvartobyte wTaylorFightCount
.DoneRematch
	opentext
.AfterRematch:
	writetext SailorTaylorAfterRematchText
	waitbutton
	closetext
	end

SailorTaylorText:
	text "Huh? How did you"
	line "get in here? Did"
	cont "someone lose their"
	cont "ENGINE KEY again?"

	para "Huh? Yeah. I have"
	line "a VIP TICKET, but"
	cont "I won't give it to"
	cont "you that easily."
	done

SailorTaylorRematchIntroText:
	text "Hey, you're the" 
	line "kid I gave that"
	cont "VIP TICKET to!"
	
SailorTaylorRematchChallengeText:
	text "You want to have"
	line "another battle?"
	
	para "Not a problem!"
	done

SailorTaylorChallengeText:
	text "How about you ent-"
	line "ertain me for my"
	cont "shift? Let's have"
	cont "a battle!"
	done

SailorTaylorWinText:
	text "Careful!"
	
	para "If you hit the"
	line "ENGINE, we'll be"
	cont "in some serious"
	cont "trouble!"
	done

SailorTaylorAfterText:
	text "I get a VIP"
	line "TICKET every year."

	para "I'm always so busy"
	line "tending to the"
	cont "ENGINE ROOM down"
	cont "here, so I never"
	cont "get to use it."

	para "They usually go to"
	line "waste, but I don't"
	cont "mind giving it"
	cont "away to a good"
	cont "trainer like you."
	done

SailorTaylorAfterRematchText:
	text "You're still real"
	line "good! We might"
	cont "have to make this"
	cont "a regular thing."
	
	para "You really push me"
	line "to my limits!"
	done

SSMakoEngineRoomEmilyBeforeTicketText:
	text "That must be the"
	line "man with the VIP"
	cont "TICKET."
	
	para "Let's see if he'll"
	line "let you have it."
	done

SSMakoEngineRoom_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  8,  7, SS_MAKO_B1F, 2
	warp_event  9,  7, SS_MAKO_B1F, 2

	db 3 ; coord events
	coord_event  7,  7, SCENE_SSMAKOENGINEROOM_DEFAULT, FangirlEngineRoomTeleport
	coord_event  8,  6, SCENE_SSMAKOENGINEROOM_DEFAULT, FangirlEngineRoomTeleport
	coord_event  9,  7, SCENE_SSMAKOENGINEROOM_DEFAULT, FangirlEngineRoomTeleport

	db 0 ; bg events

	db 2 ; object events
	object_event -1, -1, SPRITE_FANGIRL, SPRITEMOVEDATA_COMPANION, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSMakoEngineRoomFangirl, -1
	object_event  6,  4, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSMakoB1FGiveTicket, -1
