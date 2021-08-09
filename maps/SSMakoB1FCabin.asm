	const_def 2 ; object constants
	const SSMAKOBASEMENTCABIN_FANGIRL

SSMakoB1FCabin_MapScripts:
	db 3 ; scene scripts
	scene_script .DummyScene0 ; SCENE_SSMAKOB1FCABIN_DEFAULT
	scene_script .DummyScene1 ; SCENE_SSMAKOB1FCABIN_FOLLOWING
	scene_script .DummyScene2 ; SCENE_SSMAKOB1FCABIN_FINISHED

	db 0 ; callbacks
	
.DummyScene0:
.DummyScene1:
.DummyScene2:
	end
	
	db 0 ; callbacks

FangirlBasementCabinTeleport:
	moveobject SSMAKOBASEMENTCABIN_FANGIRL, 6, 7
	appear SSMAKOBASEMENTCABIN_FANGIRL
	follow PLAYER, SSMAKOBASEMENTCABIN_FANGIRL
	setscene SCENE_SSMAKOB1FCABIN_FOLLOWING
	setmapscene SS_MAKO_B1F, SCENE_SSMAKOB1F_DEFAULT
	end
	
SSMakoB1FCabinFangirl:
; This one might not need to be an std script. Just check if the player has the item or not.
	; "Do you think that's the guy who has a spare ticket over there on the other side of the room? Let's talk to him!"
	; "We got the ticket! Let's go back upstairs to get past that RECEPTIONIST!"
	jumpstd emilycompanion
	
SSMakoB1FGiveTicket:
	faceplayer
	opentext
	verbosegiveitem S_S_TICKET
	setevent EVENT_GOT_GOLDEN_TICKET
	closetext
	end

SSMakoB1FCabin_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 6, 7, SS_MAKO_B1F, 2
	warp_event 7, 7, SS_MAKO_B1F, 2

	db 3 ; coord events
	coord_event  5,  7, SCENE_SSMAKOB1FCABIN_DEFAULT, FangirlBasementCabinTeleport
	coord_event  6,  6, SCENE_SSMAKOB1FCABIN_DEFAULT, FangirlBasementCabinTeleport
	coord_event  7,  7, SCENE_SSMAKOB1FCABIN_DEFAULT, FangirlBasementCabinTeleport

	db 0 ; bg events

	db 2 ; object events
	object_event -3, -1, SPRITE_FANGIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSMakoB1FCabinFangirl, -1
	object_event  1,  4, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSMakoB1FGiveTicket, -1
