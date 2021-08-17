	const_def 2 ; object constants
	const SSMAKOENGINEROOM_FANGIRL

SSMakoEngineRoom_MapScripts:
	db 3 ; scene scripts
	scene_script .DummyScene0 ; SCENE_SSMAKOENGINEROOM_DEFAULT
	scene_script .DummyScene1 ; SCENE_SSMAKOENGINEROOM_FOLLOWING
	scene_script .DummyScene2 ; SCENE_SSMAKOENGINEROOM_FINISHED

	db 0 ; callbacks
	
.DummyScene0:
.DummyScene1:
.DummyScene2:
	end
	
	db 0 ; callbacks

FangirlEngineRoomTeleport:
	moveobject SSMAKOENGINEROOM_FANGIRL, 8, 7
	appear SSMAKOENGINEROOM_FANGIRL
	follow PLAYER, SSMAKOENGINEROOM_FANGIRL
	setscene SCENE_SSMAKOENGINEROOM_FOLLOWING
	setmapscene SS_MAKO_B1F, SCENE_SSMAKOB1F_DEFAULT
	end
	
SSMakoEngineRoomFangirl:
; This one might not need to be an std script. Just check if the player has the item or not.
	; "Do you think that's the guy who has a spare ticket over there on the other side of the room? Let's talk to him!"
	; "We got the ticket! Let's go back upstairs to get past that RECEPTIONIST!"
	jumpstd emilycompanion
	
SSMakoB1FGiveTicket:
	faceplayer
	opentext
	checkevent EVENT_GOT_VIP_TICKET
	iftrue .Ticket
	writetext SailorTaylorText
	waitbutton

	winlosstext SailorTaylorWinText, 0
	loadtrainer SAILOR, TAYLOR
	startbattle
	reloadmapafterbattle

	verbosegiveitem VIP_TICKET
	setevent EVENT_GOT_VIP_TICKET
.Ticket
	writetext SailorTaylorAfterText
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

	para "How about you ent-"
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
	object_event -1, -1, SPRITE_FANGIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSMakoEngineRoomFangirl, -1
	object_event  6,  4, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSMakoB1FGiveTicket, -1
