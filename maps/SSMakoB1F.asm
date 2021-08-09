	const_def 2 ; object constants
	const SSMAKOBASEMENT_FANGIRL

SSMakoB1F_MapScripts:
	db 3 ; scene scripts
	scene_script .DummyScene0 ; SCENE_SSMAKOB1F_DEFAULT
	scene_script .DummyScene1 ; SCENE_SSMAKOB1F_FOLLOWING
	scene_script .DummyScene2 ; SCENE_SSMAKOB1F_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .UnlockDoor
	
.DummyScene0:
.DummyScene1:
.DummyScene2:
	end
	
.UnlockDoor:
	checkevent EVENT_USED_CABIN_KEY
	iftrue .Change
	return

.Change:
	changeblock   4,  6, $80
	return

FangirlBasementTeleport1:
	moveobject SSMAKOBASEMENT_FANGIRL, 39, 11
	appear SSMAKOBASEMENT_FANGIRL
	follow PLAYER, SSMAKOBASEMENT_FANGIRL
	setscene SCENE_SSMAKOB1F_FOLLOWING
	setmapscene SS_MAKO_1F, SCENE_SSMAKO1F_DEFAULT
	end

FangirlBasementTeleport2:
	moveobject SSMAKOBASEMENT_FANGIRL, 4, 6
	appear SSMAKOBASEMENT_FANGIRL
	follow PLAYER, SSMAKOBASEMENT_FANGIRL
	setscene SCENE_SSMAKOB1F_FOLLOWING
	setmapscene SS_MAKO_B1F_CABIN, SCENE_SSMAKOB1FCABIN_DEFAULT
	end
	
SSMakoB1FFangirl:
	jumpstd emilycompanion
	
SSMakoB1FCabinKey:
	itemball CABIN_KEY
	
SSMakoB1FLockedDoor:
	conditional_event EVENT_USED_CABIN_KEY, .Script

.Script:
	opentext
	writetext SSMakoB1FLockedDoorText
	waitbutton
	checkitem CABIN_KEY
	iffalse .Close
	writetext SSMakoB1FAskUnlockDoorText
	yesorno
	iffalse .Close
	writetext SSMakoB1FUsedCabinKeyText
	waitbutton
	writetext SSMakoB1FUnlockedDoorText
	changeblock   4,  6, $80
	playsound SFX_ENTER_DOOR
	closetext
	reloadmappart
	waitsfx
	setevent EVENT_USED_CABIN_KEY
	end

.Close
	closetext
	end
	
SSMakoWorker1:
	jumptextfaceplayer SSMakoWorker1Text

SSMakoWorker2:
	jumptextfaceplayer SSMakoWorker2Text

SSMakoWorker1Text:
	text "Can't you see that" 
	line "we've got stuff to"
	cont "move here?"
	
	para "If you don't want"
	line "to pick up a crate" 
	cont "yourself, just go"
	cont "back upstairs!"
	done

SSMakoWorker2Text:
	text "Quit distractin'"
	line "me! I got a job"
	cont "to do here!"
	
	para "If you wanna"
	line "battle, come back"
	cont "on my break!"
	done
	
SSMakoB1FLockedDoorText:
	text "This door is shut"
	line "tight!"
	done

SSMakoB1FAskUnlockDoorText:
	text "Use the CABIN KEY"
	line "to unlock this"
	cont "door?"
	done
	
SSMakoB1FUsedCabinKeyText:
	text "<PLAYER> used the"
	line "CABIN KEY…"
	done
	
SSMakoB1FUnlockedDoorText:
	text "The door was"
	line "unlocked!"
	done

SSMakoB1F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 39, 11, SS_MAKO_1F, 2
	warp_event  4,  6, SS_MAKO_B1F_CABIN, 1

	db 3 ; coord events
	coord_event 38, 11, SCENE_SSMAKOB1F_DEFAULT, FangirlBasementTeleport1
	coord_event 39, 10, SCENE_SSMAKOB1F_DEFAULT, FangirlBasementTeleport1
	coord_event  4,  7, SCENE_SSMAKOB1F_DEFAULT, FangirlBasementTeleport2

	db 1 ; bg events
	bg_event  4,  6, BGEVENT_IFNOTSET, SSMakoB1FLockedDoor

	db 14 ; object events
	object_event  0,  0, SPRITE_FANGIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSMakoB1FFangirl, -1
	object_event 36,  2, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 22, 12, SPRITE_SAILOR, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 1, ObjectEvent, -1
	object_event 42,  5, SPRITE_SAILOR, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 1, ObjectEvent, -1
	object_event  4, 13, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 28, 13, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 4, ObjectEvent, -1
	object_event  9,  2, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 2, ObjectEvent, -1
	object_event 41, 12, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 1, ObjectEvent, -1
	object_event 12, 12, SPRITE_SAILOR, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 1, ObjectEvent, -1
	object_event 23,  9, SPRITE_SAILOR, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 1, ObjectEvent, -1
	object_event 13,  6, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 3, ObjectEvent, -1
	object_event 37,  6, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSMakoWorker1, EVENT_GOLD_TICKET_LOCATION_INFO
	object_event 34,  9, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSMakoWorker2, EVENT_GOLD_TICKET_LOCATION_INFO
	object_event 44, 10, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SSMakoB1FCabinKey, EVENT_GOT_CABIN_KEY
