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
	setmapscene SS_MAKO_1F_ROOMS, SCENE_SSMAKO1FROOMS_FOLLOWING
.DummyScene1:
.DummyScene2:
	end
	
.UnlockDoor:
	checkevent EVENT_USED_ENGINE_KEY
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
	setmapscene SS_MAKO_ENGINE_ROOM, SCENE_SSMAKOENGINEROOM_DEFAULT
	end
	
SSMakoB1FFangirl:
	jumpstd emilycompanion
	
TrainerSailorDarius:
	trainer SAILOR, DARIUS, EVENT_BEAT_SAILOR_DARIUS, SailorDariusText, SSMakoB1FTrainerWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SSMakoB1FTrainerAfterText
	waitbutton
	closetext
	end

TrainerSailorNathan:
	trainer SAILOR, NATHAN, EVENT_BEAT_SAILOR_NATHAN, SailorNathanText, SSMakoB1FTrainerWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SSMakoB1FTrainerAfterText
	waitbutton
	closetext
	end

TrainerSailorGene:
	trainer SAILOR, GENE, EVENT_BEAT_SAILOR_GENE, SSMakoB1FTrainerText, SSMakoB1FTrainerWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SSMakoB1FTrainerAfterText
	waitbutton
	closetext
	end

TrainerSailorRoscoe:
	trainer SAILOR, ROSCOE, EVENT_BEAT_SAILOR_ROSCOE, SSMakoB1FTrainerText, SSMakoB1FTrainerWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SSMakoB1FTrainerAfterText
	waitbutton
	closetext
	end

TrainerSailorHerman:
	trainer SAILOR, HERMAN, EVENT_BEAT_SAILOR_HERMAN, SailorHermanText, SailorHermanWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SailorHermanAfterText
	waitbutton
	closetext
	end

TrainerEngineerRocco:
	trainer ENGINEER, ROCCO, EVENT_BEAT_ENGINEER_ROCCO, EngineerRoccoText, EngineerRoccoWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext EngineerRoccoAfterText
	waitbutton
	closetext
	end

TrainerEngineerEnrique:
	trainer ENGINEER, ENRIQUE, EVENT_BEAT_ENGINEER_ENRIQUE, EngineerEnriqueText, SSMakoB1FTrainerWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SSMakoB1FTrainerAfterText
	waitbutton
	closetext
	end

TrainerEngineerRudolph:
	trainer ENGINEER, RUDOLPH, EVENT_BEAT_ENGINEER_RUDOLPH, SSMakoB1FTrainerText, SSMakoB1FTrainerWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SSMakoB1FTrainerAfterText
	waitbutton
	closetext
	end

TrainerEngineerBernard:
	trainer ENGINEER, BERNARD, EVENT_BEAT_ENGINEER_BERNARD, EngineerBernardText, EngineerBernardWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext EngineerBernardAfterText
	waitbutton
	closetext
	end

TrainerEngineerArnie:
	trainer ENGINEER, ARNIE, EVENT_BEAT_ENGINEER_ARNIE, SSMakoB1FTrainerText, SSMakoB1FTrainerWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SSMakoB1FTrainerAfterText
	waitbutton
	closetext
	end
	
SSMakoB1FEngineKey:
	itemball ENGINE_KEY
	
SSMakoB1FLockedDoor:
	conditional_event EVENT_USED_ENGINE_KEY, .Script

.Script:
	opentext
	writetext SSMakoB1FLockedDoorText
	waitbutton
	checkitem ENGINE_KEY
	iffalse .Close
	writetext SSMakoB1FAskUnlockDoorText
	yesorno
	iffalse .Close
	writetext SSMakoB1FUsedEngineKeyText
	waitbutton
	writetext SSMakoB1FUnlockedDoorText
	changeblock   4,  6, $80
	playsound SFX_ENTER_DOOR
	waitsfx
	closetext
	reloadmappart
	setevent EVENT_USED_ENGINE_KEY
	end

.Close
	closetext
	end
	
SSMakoWorker1:
	jumptextfaceplayer SSMakoWorker1Text

SSMakoWorker2:
	jumptextfaceplayer SSMakoWorker2Text
	
SSMakoB1FHiddenItem:
	; Placeholder
	end

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

SailorDariusText:
	text "Loading and unloa-"
	line "ding these ships"
	cont "is the best exer-"
	cont "cise!"
	done
	
SailorNathanText:
	text "My #MON can"
	line "move these crates"
	cont "with their PSYCHIC"
	cont "powers."
	
	para "Mind over matter!"
	done

SailorHermanText:
	text "These crates are"
	line "so intimately"
	cont "packed."
	
	para "I left no room for"
	line "wandering kids to"
	cont "run!"
	done
	
SailorHermanWinText:
	text "That's what I get"
	line "for trying to"
	cont "think outside the"
	cont "box…"
	done

SailorHermanAfterText:
	text "I know my #MON"
	line "are all fainted,"
	cont "but I can't leave."
	
	para "The crates were"
	line "packed too tight"
	cont "for me to get out!"
	done

EngineerRoccoText:
	text "I don't like how"
	line "close-quarters"
	cont "this part of the"
	cont "ship is."
	
	para "But I think this"
	line "part is just wide"
	cont "enough for a"
	cont "#MON battle!"
	done
	
EngineerRoccoWinText:
	text "You really put the"
	line "squeeze on me!"
	done

EngineerRoccoAfterText:
	text "This part of the"
	line "ship is just so"
	cont "cramped."
	
	para "It really messes"
	line "with my claustro-"
	cont "phobia."
	done

EngineerEnriqueText:
	text "Ain't nobody is"
	line "supposed to be in"
	cont "the ENGINE ROOM."
	
	para "Not like you'll"
	line "get in without a"
	cont "key!"
	done

EngineerBernardText:
	text "Check out these"
	line "rare #MON I"
	cont "scored in trades!"
	done
	
EngineerBernardWinText:
	text "They're just used"
	line "to their old"
	cont "trainers, I bet!"
	done
	
EngineerBernardAfterText:
	text "I've been all over"
	line "the world."
	
	para "That means I get"
	line "to trade #MON"
	cont "with people from"
	cont "far away."
	done

SSMakoB1FTrainerText:
	text "I am a"
	line "#MON trainer!"
	done

SSMakoB1FTrainerWinText:
	text "I lost."
	done

SSMakoB1FTrainerAfterText:
	text "I lost."
	done

SSMakoB1FLockedDoorText:
	text "This door is shut"
	line "tight!"
	done

SSMakoB1FAskUnlockDoorText:
	text "Use the ENGINE KEY"
	line "to unlock this"
	cont "door?"
	done
	
SSMakoB1FUsedEngineKeyText:
	text "<PLAYER> used the"
	line "ENGINE KEY…"
	done
	
SSMakoB1FUnlockedDoorText:
	text "The door was"
	line "unlocked!"
	done

SSMakoB1F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 39, 11, SS_MAKO_1F, 2
	warp_event  4,  6, SS_MAKO_ENGINE_ROOM, 1

	db 3 ; coord events
	coord_event 38, 11, SCENE_SSMAKOB1F_DEFAULT, FangirlBasementTeleport1
	coord_event 39, 10, SCENE_SSMAKOB1F_DEFAULT, FangirlBasementTeleport1
	coord_event  4,  7, SCENE_SSMAKOB1F_DEFAULT, FangirlBasementTeleport2

	db 5 ; bg events
	bg_event  4,  6, BGEVENT_IFNOTSET, SSMakoB1FLockedDoor
	bg_event 14,  9, BGEVENT_ITEM, SSMakoB1FHiddenItem
	bg_event 37,  2, BGEVENT_ITEM, SSMakoB1FHiddenItem
	bg_event  6, 11, BGEVENT_ITEM, SSMakoB1FHiddenItem
	bg_event  3, 14, BGEVENT_ITEM, SSMakoB1FHiddenItem

	db 15 ; object events
	object_event  0,  0, SPRITE_FANGIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSMakoB1FFangirl, -1
	object_event 36,  2, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 0, TrainerSailorNathan, -1
	object_event 22, 12, SPRITE_SAILOR, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerSailorDarius, -1
	object_event 42,  5, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerEngineerBernard, -1
	object_event  4, 13, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 0, TrainerSailorRoscoe, -1
	object_event 28, 13, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerEngineerRocco, -1
	object_event 11,  2, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerEngineerRudolph, -1
	object_event 40, 12, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerSailorHerman, -1
	object_event 12, 12, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerEngineerEnrique, -1
	object_event 23,  9, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerEngineerArnie, -1
	object_event 13,  6, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerSailorGene, -1
	object_event 37,  6, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSMakoWorker1, EVENT_VIP_TICKET_LOCATION_INFO
	object_event 34,  9, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSMakoWorker2, EVENT_VIP_TICKET_LOCATION_INFO
	object_event  8,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SSMakoB1FEngineKey, EVENT_GOT_ENGINE_KEY
	object_event 44, 10, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, ObjectEvent, -1
