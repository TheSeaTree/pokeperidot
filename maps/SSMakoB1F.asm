	const_def 2 ; object constants
	const SSMAKOBASEMENT_FANGIRL

SSMakoB1F_MapScripts:
	db 3 ; scene scripts
	scene_script .DummyScene0 ; SCENE_SSMAKOB1F_DEFAULT
	scene_script .DummyScene1 ; SCENE_SSMAKOB1F_FOLLOWING
	scene_script .DummyScene2 ; SCENE_SSMAKOB1F_FINISHED

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, .RestorePlayerSprite
	callback MAPCALLBACK_TILES, .UnlockDoor

.RestorePlayerSprite:
	special RestorePlayerSprite
	return
	
.DummyScene0:
	setmapscene SS_MAKO_1F_ROOMS, SCENE_SSMAKO1FROOMS_FOLLOWING
	setmapscene SS_MAKO_ENGINE_ROOM, SCENE_SSMAKOENGINEROOM_DEFAULT
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
	faceobject SSMAKOBASEMENT_FANGIRL, PLAYER
	end

FangirlBasementTeleport2:
	moveobject SSMAKOBASEMENT_FANGIRL, 4, 6
	appear SSMAKOBASEMENT_FANGIRL
	follow PLAYER, SSMAKOBASEMENT_FANGIRL
	setscene SCENE_SSMAKOB1F_FOLLOWING
	end

SSMakoB1FFangirl:
	jumpstd emilycompanion
	
TrainerSailorDarius:
	trainer SAILOR, DARIUS, EVENT_BEAT_SAILOR_DARIUS, SailorDariusText, SailorDariusWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SailorDariusAfterText
	waitbutton
	closetext
	end

TrainerSailorNathan:
	trainer SAILOR, NATHAN, EVENT_BEAT_SAILOR_NATHAN, SailorNathanText, SailorNathanWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SailorNathanAfterText
	waitbutton
	closetext
	end

TrainerSailorGene:
	trainer SAILOR, GENE, EVENT_BEAT_SAILOR_GENE, SailorGeneText, SailorGeneWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SailorGeneAfterText
	waitbutton
	closetext
	end

TrainerSailorRoscoe:
	trainer SAILOR, ROSCOE, EVENT_BEAT_SAILOR_ROSCOE, SailorRoscoeText, SailorRoscoeWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SailorRoscoeAfterText
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
	trainer ENGINEER, ENRIQUE, EVENT_BEAT_ENGINEER_ENRIQUE, EngineerEnriqueText, EngineerEnriqueWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext EngineerEnriqueAfterText
	waitbutton
	closetext
	end

TrainerEngineerRudolph:
	trainer ENGINEER, RUDOLPH, EVENT_BEAT_ENGINEER_RUDOLPH, EngineerRudolphText, EngineerRudolphWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext EngineerRudolphAfterText
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
	trainer ENGINEER, ARNIE, EVENT_BEAT_ENGINEER_ARNIE, EngineerArnieText, EngineerArnieWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext EngineerArnieAfterText
	waitbutton
	closetext
	end
	
SSMakoB1FEngineKey:
	itemball ENGINE_KEY

SSMakoB1FMaxPotion:
	itemball MAX_POTION

SSMakoB1FHiddenFocusSash:
	hiddenitem FOCUS_SASH, EVENT_SS_MAKO_HIDDEN_FOCUS_SASH

SSMakoB1FHiddenFullRestore:
	hiddenitem FULL_RESTORE, EVENT_SS_MAKO_HIDDEN_FULL_RESTORE

SSMakoB1FHiddenElixer:
	hiddenitem ELIXER, EVENT_SS_MAKO_HIDDEN_ELIXER

SSMakoB1FHiddenUltraBall:
	hiddenitem ULTRA_BALL, EVENT_SS_MAKO_HIDDEN_ULTRA_BALL

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

SailorDariusWinText:
	text "It seems #MON"
	line "battles are much"
	cont "better exercise."
	done

SailorDariusAfterText:
	text "You wanna hear a"
	line "secret?"
	
	para "Some of these"
	line "crates ain't packed"
	cont "right. Sometimes"
	cont "items will fall"
	cont "right out of 'em."
	done

SailorNathanText:
	text "My #MON can"
	line "move these crates"
	cont "with their PSYCHIC"
	cont "powers."
	
	para "Mind over matter!"
	done
	
SailorNathanWinText:
	text "Overreliance on"
	line "the mind has left"
	cont "my arms weak…"
	done
	
SailorNathanAfterText:
	text "From today on, I"
	line "will no longer use"
	cont "my #MON to get"
	cont "out of doing work!"
	
	para "My mind will be"
	line "just as strong as"
	cont "my body!"
	done
	
SailorGeneText:
	text "Working on this"
	line "ship has put me in"
	cont "my peak physical"
	cont "condition."

	para "It's done the same"
	line "for my #MON!"
	done

SailorGeneWinText:
	text "Weaklings!"
	
	para "They must have"
	line "skipped out on"
	cont "their jobs just"
	cont "like NATHAN!"
	done
	
SailorGeneAfterText:
	text "As soon as my"
	line "#MON are fight-"
	cont "ing fit once more,"
	cont "I will work them"
	cont "so hard!"
	
	para "I ain't raising a"
	line "buncha' wimps!"
	done
	
SailorRoscoeText:
	text "Yo, ho!"
	
	para "You won't blow this"
	line "man down!"
	done

SailorRoscoeWinText:
	text "Woah! Watch it!"
	
	para "I nearly lost my"
	line "balance!"
	done

SailorRoscoeAfterText:
	text "I got a confession"
	line "to make…"
	
	para "I ain't got my sea"
	line "legs yet…"
	
	para "OCTILLERY & ANCOR"
	line "were helping keep"
	cont "me firmly on my"
	cont "feet as we sail."
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
	line "get in without"
	cont "the right KEY!"
	done

EngineerEnriqueWinText:
	text "Your #MON are a"
	line "lot more fun to"
	cont "battle than the"
	cont "others down here."
	done

EngineerEnriqueAfterText:
	text "I designed the"
	line "lock for the"
	cont "ENGINE ROOM."
	
	para "It's nearly impene-"
	line "trable without the"
	cont "matching KEY."
	done

EngineerRudolphText:
	text "Hey! You can't go"
	line "past this point!"
	
	para "I dropped the"
	line "ENGINE KEY."

	para "The boss is gonna"
	line "be real steamed if"
	cont "he finds out, so I"
	cont "gotta get it back!"
	done

EngineerRudolphWinText:
	text "Why did you have"
	line "to be so rough?"
	
	para "Look, you've made"
	line "such a mess!"
	done
	
EngineerRudolphAfterText:
	text "My shift is ending"
	line "soon."

	para "If I can't"
	cont "find that KEY,"
	cont "I'm toast!"
	done

EngineerBernardText:
	text "Check out these"
	line "rare #MON I"
	cont "scored in a trade!"
	done
	
EngineerBernardWinText:
	text "It's just used to"
	line "its old trainer,"
	cont "I bet!"
	done
	
EngineerBernardAfterText:
	text "I've been all over"
	line "the world."
	
	para "That means I get"
	line "to trade #MON"
	cont "with people from"
	cont "far away."
	done
	
EngineerArnieText:
	text "Where are you"
	line "going?"
	
	para "Don't you have"
	line "enough time to"
	cont "entertain me while"
	cont "I'm on break?"
	done

EngineerArnieWinText:
	text "I shouldn't have"
	line "wasted your time…"
	done

EngineerArnieAfterText:
	text "In reality, I just"
	line "needed to get away"
	cont "from the ENGINE"
	cont "ROOM for a while."
	
	para "That loud noise"
	line "drives me crazy!"
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
	bg_event 14,  9, BGEVENT_ITEM, SSMakoB1FHiddenFocusSash
	bg_event 37,  2, BGEVENT_ITEM, SSMakoB1FHiddenFullRestore
	bg_event  6, 11, BGEVENT_ITEM, SSMakoB1FHiddenElixer
	bg_event  3, 14, BGEVENT_ITEM, SSMakoB1FHiddenUltraBall

	db 15 ; object events
	object_event  0,  0, SPRITE_FANGIRL, SPRITEMOVEDATA_COMPANION, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSMakoB1FFangirl, -1
	object_event 36,  2, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerSailorNathan, -1
	object_event 22, 12, SPRITE_SAILOR, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerSailorDarius, -1
	object_event 42,  5, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerEngineerBernard, -1
	object_event  4, 13, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerSailorRoscoe, -1
	object_event 28, 13, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerEngineerRocco, -1
	object_event 11,  2, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerEngineerRudolph, -1
	object_event 40, 12, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerSailorHerman, -1
	object_event 12, 12, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerEngineerEnrique, -1
	object_event 23,  9, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerEngineerArnie, -1
	object_event 13,  6, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerSailorGene, -1
	object_event 37,  6, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSMakoWorker1, EVENT_VIP_TICKET_LOCATION_INFO
	object_event 34,  9, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSMakoWorker2, EVENT_VIP_TICKET_LOCATION_INFO
	object_event  8,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SSMakoB1FEngineKey, EVENT_GOT_ENGINE_KEY
	object_event 44, 10, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SSMakoB1FMaxPotion, EVENT_SS_MAKO_B1F_MAX_POTION
