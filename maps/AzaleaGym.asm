	const_def 2 ; object constants
	const AZALEAGYM_MURPHY
	const AZALEAGYM_OFFICER1
	const AZALEAGYM_OFFICER2
	const AZALEAGYM_GYM_GUY

AzaleaGym_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 0 ; callbacks
	
.DummyScene0:
	end
	
.DummyScene1:
	end
	
AzaleaGymMurphyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_MURPHY
	iftrue .FightDone
	writetext MurphyText_INeverLose
	waitbutton
	closetext
	winlosstext MurphyText_ResearchIncomplete, 0
	checkflag ENGINE_FLYPOINT_VIOLET
	iftrue .Team2
	loadtrainer MURPHY, MURPHY1
	startbattle
	reloadmapafterbattle
	jump .After
.Team2:
	loadtrainer MURPHY, MURPHY2
	startbattle
	reloadmapafterbattle
	jump .After

.After:
	setevent EVENT_BEAT_MURPHY
	special HealParty
	opentext
	writetext Text_ReceivedFistBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_FISTBADGE
	checkcode VAR_BADGES
.FightDone:
	checkevent EVENT_GOT_TM_ROCK_SMASH
	iftrue .GotFuryCutter
	setevent EVENT_BEAT_OFFICER_BILLY
	setevent EVENT_BEAT_OFFICER_JIMMY
	setevent EVENT_BEAT_OFFICER_GORDON
	writetext MurphyText_FistBadgeSpeech
	buttonsound
	verbosegiveitem TM_ROCK_SMASH
	iffalse .NoRoomForFuryCutter
	setevent EVENT_GOT_TM_ROCK_SMASH
	setmapscene VIOLET_CITY, SCENE_FINISHED
	writetext MurphyText_FuryCutterSpeech
	waitbutton
	closetext
	end
.GotFuryCutter:
	writetext MurphyText_BugMonsAreDeep
	waitbutton
.NoRoomForFuryCutter:
	closetext
	end

TrainerOfficerBilly:
	trainer OFFICER, BILLY, EVENT_BEAT_OFFICER_BILLY, OfficerBillyText, OfficerBillyWinText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext OfficerBillyAfterText
	waitbutton
	closetext
	end

TrainerOfficerJimmy:
	trainer OFFICER, JIMMY, EVENT_BEAT_OFFICER_JIMMY, OfficerJimmyText, OfficerJimmyWinText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext OfficerJimmyAfterText
	waitbutton
	closetext
	end

TrainerOfficerGordon:
	trainer OFFICER, GORDON, EVENT_BEAT_OFFICER_GORDON, OfficerGordonText, OfficerGordonWinText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext OfficerGordonAfterText
	waitbutton
	closetext
	end

AzaleaGymGuyScript:
	faceplayer
	checkevent EVENT_BEAT_MURPHY
	iftrue .AzaleaGymGuyWinScript
	opentext
	writetext AzaleaGymGuyText
	waitbutton
	closetext
	end

.AzaleaGymGuyWinScript:
	opentext
	writetext AzaleaGymGuyWinText
	waitbutton
	closetext
	end

AzaleaGymStatue:
	checkflag ENGINE_FISTBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	trainertotext MURPHY, MURPHY1, MEM_BUFFER_1
	jumpstd gymstatue2
	
AzaleaCantLeave:
	checkflag ENGINE_FISTBADGE
	iftrue .Leave
	jumpstd cantleavegym
	end
	
.Leave
	opentext
	writetext AzaleaGymHaveBadge
	waitbutton
	closetext
	applymovement PLAYER, AzaleaLeaveGym
	special FadeOutPalettes
	playsound SFX_EXIT_BUILDING
	wait 4
	warpfacing DOWN, AZALEA_TOWN, 40, 17
	end
	
AzaleaLockedDoor:
	jumptext AzaleaLockedDoorText
	
AzaleaLeaveGym:
	turn_step DOWN
	step_end
	
AzaleaGymWalkToPlayer:
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	turn_step DOWN
	step_end
	
AzaleaGymWalkFromPlayer:
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	turn_step DOWN
	step_end

AzaleaGymHaveBadge:
	text "<PLAYER> used"
	line "the FISTBADGE to"
	cont "unlock the door!"
	done
	
MurphyText_INeverLose:
	text "Welcome, trainer!"
	line "My name is MURPHY."
	
	para "Since before you"
	line "were born, I have"
	cont "been the strong"
	cont "arm of the law in"
	cont "this city!"
	
	para "My FIGHTING-type"
	line "#MON have been"
	cont "trained under the"
	cont "same discipline I"
	cont "had at the academy"
	cont "so many years ago."
	
	para "My #MON do not"
	line "only stop crime in"
	cont "this city."
	
	para "They will also put"
	line "a stop to your GYM"
	cont "CHALLENGE!"
	done

MurphyText_ResearchIncomplete:
	text "I must be getting"
	line "too old for this…"
	
	para "Heh! I'm only"
	line "kidding!"
	
	para "Congratulations to"
	line "you, trainer!"
	
	para "You have earned my"
	line "badge, fair and"
	cont "square." 
	done

Text_ReceivedFistBadge:
	text "<PLAYER> received"
	line "FISTBADGE."
	done

MurphyText_FistBadgeSpeech:
	text "Of course, you do"
	line "not only win a"
	cont "BADGE from defeat-"
	cont "ing a GYM LEADER."
	
	para "You have also won"
	line "my special TM."
	done

MurphyText_FuryCutterSpeech:
	text "TM08 contains"
	line "ROCK SMASH."

	para "It has a good"
	line "chance of lowering"
	cont "your target's"
	cont "DEFENSE."
	
	para "It hits hard, and"
	line "will hit even"
	cont "harder on subsequ-"
	cont "quent strikes!"
	
	para "You can also use"
	line "ROCK SMASH to"
	cont "destroy any rocks"
	cont "in your path!"
	done

MurphyText_BugMonsAreDeep:
	text "My #MON have"
	line "sworn to uphold"
	cont "justice."
	
	para "They put these"
	line "criminals behind"
	cont "bars, and keep"
	cont "these streets"
	cont "clean."
	done

OfficerBillyText:
	text "Freeze!"
	
	para "Put your #BALLs"
	line "where I can see"
	cont "them!"
	done
	
OfficerBillyWinText:
	text "Stop resisting!"
	done
	
OfficerBillyAfterText:
	text "It's my job to try"
	line "and stop any chal-"
	cont "lengers from"
	cont "reaching the"
	cont "LEADER."
	done
	
OfficerJimmyText:
	text "Hey, a trainer!"
	
	para "Let's battle to"
	line "pass the time."
	done
	
OfficerJimmyWinText:
	text "You've given me a"
	line "run for my money,"
	cont "kid."
	done
	
OfficerJimmyAfterText:
	text "MURPHY's #MON"
	line "are too good at"
	cont "their jobs."
	
	para "It's pretty calm"
	line "in this city as a"
	cont "result."
	done
	
OfficerGordonText:
	text "Thought you were"
	line "being clever by"
	cont "sneaking around?"
	done
	
OfficerGordonWinText:
	text "No way!"
	
	para "Outsmarted by a"
	line "child!"
	done
	
OfficerGordonAfterText:
	text "Move along,"
	line "there's nothing to"
	cont "see here."
	done
	
AzaleaGymGuyText:
	text "Yo, challenger!"

	para "MURPHY's been at"
	line "this for a long"
	cont "time."

	para "His FIGHTING-type"
	line "#MON will pumm-"
	cont "el you into submi-"
	cont "ssion if you"
	cont "aren't prepared."

	para "It's going to be"
	line "tough without my"
	cont "advice."

	para "PSYCHIC-types will"
	line "give you a great"
	cont "advantage."

	para "FLYING-type moves"
	line "are super-effec-"
	cont "tive too."
	done

AzaleaGymGuyWinText:
	text "Well done! That"
	line "was a great clash"
	cont "between talented"
	cont "trainers!"
	
	para "It's not often"
	line "someone your age"
	cont "gives MURPHY such"
	cont "a challenge."
	done
	
AzaleaLockedDoorText:
	text "It's locked."
	
	para "Probably for a"
	line "good reason."
	done

AzaleaGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  8, 17, AZALEA_TOWN, 5
	warp_event  9, 17, AZALEA_TOWN, 5

	db 0 ; coord events

	db 8 ; bg events
	bg_event  7, 15, BGEVENT_READ, AzaleaGymStatue
	bg_event 10, 15, BGEVENT_READ, AzaleaGymStatue
	bg_event  8, 18, BGEVENT_DOWN, AzaleaCantLeave
	bg_event  9, 18, BGEVENT_DOWN, AzaleaCantLeave
	bg_event 15,  3, BGEVENT_UP,   AzaleaLockedDoor
	bg_event  2,  3, BGEVENT_UP,   AzaleaLockedDoor
	bg_event  6,  3, BGEVENT_UP,   AzaleaLockedDoor
	bg_event 11,  3, BGEVENT_UP,   AzaleaLockedDoor

	db 9 ; object events
	object_event  9,  3, SPRITE_MURPHY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, AzaleaGymMurphyScript, -1
	object_event 10, 10, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerOfficerBilly, -1
	object_event  6,  7, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerOfficerJimmy, -1
	object_event 13,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerOfficerGordon, -1
	object_event 11, 15, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, AzaleaGymGuyScript, -1
	object_event 11,  1, SPRITE_BIKER, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 16,  2, SPRITE_BIKER, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  0,  2, SPRITE_PHARMACIST, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  5,  1, SPRITE_PHARMACIST, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
