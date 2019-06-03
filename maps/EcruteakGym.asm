	const_def 2 ; object constants
	const ECRUTEAKGYM_LEADER1
	const ECRUTEAKGYM_LEADER2
	const ECRUTEAKGYM_GYM_GUY
	const ECRUTEAKGYM_LASS1
	const ECRUTEAKGYM_LASS2
	const ECRUTEAKGYM_LASS3
	const ECRUTEAKGYM_LASS4
	const ECRUTEAKGYM_LASS5

EcruteakGym_MapScripts:
	db 6 ; scene scripts
	scene_script .DummyScene 	; SCENE_INTRO
	scene_script .DummyScene    ; SCENE_MON_1
	scene_script .DummyScene    ; SCENE_MON_2
	scene_script .DummyScene 	; SCENE_MON_3
	scene_script .DummyScene	; SCENE_MON_4
	scene_script .DummyScene 	; SCENE_DONE

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .PrepareGym
	
.DummyScene:
	end

.PrepareGym:
	checkevent EVENT_BEAT_PRYCE
	iftrue .end
	clearevent EVENT_ECRUTEAK_GYM_MON_1
	clearevent EVENT_ECRUTEAK_GYM_MON_2
	clearevent EVENT_ECRUTEAK_GYM_MON_3
	clearevent EVENT_ECRUTEAK_GYM_MON_4
	clearflag EVENT_BEAT_CAMPER_JEFF
	clearflag EVENT_BEAT_CAMPER_GREG
	clearflag EVENT_BEAT_PICNICKER_TERRY
	clearflag EVENT_BEAT_PICNICKER_BRITTANY
	clearflag EVENT_BEAT_POKEFANM_LESTER
.end
	end
	
EcruteakGymIntroRight:
	applymovement ECRUTEAKGYM_LEADER2, EcruteakGymLeaderApproach
	turnobject PLAYER, LEFT
	jump EcruteakGymIntroLeft

EcruteakGymIntroLeft:
	checkevent EVENT_ECRUTEAK_GYM_INTRO
	iftrue .Shuffle
	opentext
	writetext EcruteakgymIntroText
	waitbutton
	closetext
	applymovement ECRUTEAKGYM_LEADER2, EcruteakGymLeaderWalkAway
	disappear ECRUTEAKGYM_LEADER2
	setevent EVENT_ECRUTEAK_GYM_INTRO
.Shuffle
	random 4
	ifequal 0, .Spawn1
	ifequal 1, .Spawn2
	ifequal 2, .Spawn3
	ifequal 3, .Spawn4
	return
	
.Spawn1
	setscene SCENE_ECRUTEAKGYM_MON_1
	end

.Spawn2
	setscene SCENE_ECRUTEAKGYM_MON_2
	end

.Spawn3
	setscene SCENE_ECRUTEAKGYM_MON_3
	end
	
.Spawn4
	setscene SCENE_ECRUTEAKGYM_MON_4
	end
	
EcruteakGymLeader:
	faceplayer
	checkscene
	ifequal SCENE_ECRUTEAKGYM_DONE, .Battle
	jumptext WillNotBattle
	end
	
.Battle
	setmapscene ECRUTEAK_CITY, SCENE_ECRUTEAKCITY_DONE
	setflag ENGINE_STORMBADGE
	setevent EVENT_BEAT_PRYCE
	jumptext ThisIsOurBattle
	end
	
EcruteakCantLeave:
	checkflag ENGINE_STORMBADGE
	iftrue .Leave
	jumpstd cantleavegym
	end
	
.Leave
	opentext
	writetext EcruteakGymHaveBadge
	waitbutton
	closetext
	applymovement PLAYER, EcruteakLeaveGym
	special FadeOutPalettes
	playsound SFX_EXIT_BUILDING
	wait 4
	warpfacing DOWN, ECRUTEAK_CITY, 8, 11
	end
	
EcruteakGymBossMon1:
	cry TANGELA
	waitsfx
	loadwildmon TANGELA, 5
	writecode VAR_BATTLETYPE, BATTLETYPE_BOSS
	startbattle
	reloadmapafterbattle
	setevent EVENT_ECRUTEAK_GYM_MON_1
	checkevent EVENT_ECRUTEAK_GYM_MON_2
	iftrue EcruteakGymSceneDone
	setscene SCENE_ECRUTEAKGYM_MON_2
	end
	
EcruteakGymBossMon2:
	cry GLOOM
	waitsfx
	loadwildmon GLOOM, 5
	writecode VAR_BATTLETYPE, BATTLETYPE_BOSS
	startbattle
	reloadmapafterbattle
	setevent EVENT_ECRUTEAK_GYM_MON_2
	checkevent EVENT_ECRUTEAK_GYM_MON_3
	iftrue EcruteakGymSceneDone
	setscene SCENE_ECRUTEAKGYM_MON_3
	end
	
EcruteakGymBossMon3:
	cry SKIPLOOM
	waitsfx
	loadwildmon SKIPLOOM, 5
	writecode VAR_BATTLETYPE, BATTLETYPE_BOSS
	startbattle
	reloadmapafterbattle
	setevent EVENT_ECRUTEAK_GYM_MON_3
	checkevent EVENT_ECRUTEAK_GYM_MON_4
	iftrue EcruteakGymSceneDone
	setscene SCENE_ECRUTEAKGYM_MON_4
	end
	
EcruteakGymBossMon4:
	cry WEEPINBELL
	waitsfx
	loadwildmon WEEPINBELL, 5
	writecode VAR_BATTLETYPE, BATTLETYPE_BOSS
	startbattle
	reloadmapafterbattle
	setevent EVENT_ECRUTEAK_GYM_MON_4
	checkevent EVENT_ECRUTEAK_GYM_MON_1
	iftrue EcruteakGymSceneDone
	setscene SCENE_ECRUTEAKGYM_MON_1
	end
	
EcruteakGymSceneDone:
	setscene SCENE_ECRUTEAKGYM_DONE
	jumptext YouDidIt
	end
	
TrainerCamperJeff:
	trainer CAMPER, JEFF, EVENT_BEAT_CAMPER_JEFF, CamperJeffText, CamperJeffWinText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext CamperJeffAfterText
	waitbutton
	closetext
	end
	
TrainerCamperGreg:
	trainer CAMPER, GREG, EVENT_BEAT_CAMPER_GREG, CamperGregText, CamperGregWinText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext CamperGregAfterText
	waitbutton
	closetext
	end
	
TrainerPicnickerTerry:
	trainer PICNICKER, TERRY, EVENT_BEAT_PICNICKER_TERRY, PicnickerTerryText, PicnickerTerryWinText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext PicnickerTerryAfterText
	waitbutton
	closetext
	end
	
TrainerPicnickerBrittany:
	trainer PICNICKER, BRITTANY, EVENT_BEAT_PICNICKER_BRITTANY, PicnickerBrittanyText, PicnickerBrittanyWinText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext PicnickerBrittanyAfterText
	waitbutton
	closetext
	end

TrainerPokefanMLester:
	trainer POKEFANM, LESTER, EVENT_BEAT_POKEFANM_LESTER, PokefanMLesterText, PokefanMLesterWinText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext PokefanMLesterAfterText
	waitbutton
	closetext
	end
	
EcruteakGymLeaderApproach:
	step DOWN
	turn_head RIGHT
	step_resume
	
EcruteakGymLeaderWalkAway:
	step UP
	step UP
	step UP
	step LEFT
	step UP
	step UP
	step_end
	
EcruteakLeaveGym:
	turn_step DOWN
	step_end
	
EcruteakgymIntroText:
	text "Ah, you have come"
	line "to challenge my"
	cont "GYM?"
	
	para "Very well."
	
	para "…But there is"
	line "one issue."
	
	para "My GYM is home to"
	line "wild #MON look-"
	cont "ing for shelter."
	
	para "I would hate for"
	line "there to be any"
	cont "distractions"
	cont "during our battle."
	
	para "There are 4 that I"
	line "know are here"
	cont "right now. Battle"
	cont "them and they"
	cont "should go back"
	cont "outside."
	
	para "When they are all"
	line "gone, you may"
	cont "challenge me."
	
	para "… … …"
	
	para "Oh! I almost"
	line "forgot!"
	
	para "None of these"
	line "#MON want"
	cont "trainers. They"
	cont "will block any"
	cont "BALL you throw at"
	cont "them."
	
	para "I hope to see you"
	line "again soon."
	done
	
YouDidIt:
	text "It has been done."
	done
	
WillNotBattle:	
	text "I will not battle"
	line "you yet."
	done
	
ThisIsOurBattle:
	text "Our battle will go"
	line "here."
	done
	
EcruteakGymHaveBadge:
	text "<PLAYER> used"
	line "the ROOTBADGE to"
	cont "unlock the door!"
	done
	
CamperJeffText:
	text "I am a"
	line "#MON trainer."
	done	
	
CamperJeffWinText:
	text "I lost."
	done

CamperJeffAfterText:
	text "I lost."
	done
	
CamperGregText:
	text "I am a"
	line "#MON trainer."
	done

CamperGregWinText:
	text "I lost."
	done

CamperGregAfterText:
	text "I lost."
	done	

PicnickerTerryText:
	text "I am a"
	line "#MON trainer."
	done

PicnickerTerryWinText:
	text "I lost."
	done

PicnickerTerryAfterText:
	text "I lost."
	done

PicnickerBrittanyText:
	text "I am a"
	line "#MON trainer."
	done

PicnickerBrittanyWinText:
	text "I lost."
	done

PicnickerBrittanyAfterText:
	text "I lost."
	done

PokefanMLesterText:
	text "I am a"
	line "#MON trainer."
	done
	
PokefanMLesterWinText:
	text "I lost."
	done
	
PokefanMLesterAfterText:
	text "I lost."
	done

EcruteakGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 10, 21, ECRUTEAK_CITY, 5
	warp_event 11, 21, ECRUTEAK_CITY, 5

	db 6 ; coord events
	coord_event 13, 15, SCENE_ECRUTEAKGYM_MON_1, EcruteakGymBossMon1
	coord_event 18, 10, SCENE_ECRUTEAKGYM_MON_2, EcruteakGymBossMon2
	coord_event  9,  9, SCENE_ECRUTEAKGYM_MON_3, EcruteakGymBossMon3
	coord_event  6, 12, SCENE_ECRUTEAKGYM_MON_4, EcruteakGymBossMon4
	coord_event 10, 18, SCENE_ECRUTEAKGYM_INTRO, EcruteakGymIntroLeft
	coord_event 11, 18, SCENE_ECRUTEAKGYM_INTRO, EcruteakGymIntroRight

	db 2 ; bg events
	bg_event 10, 22, BGEVENT_DOWN, EcruteakCantLeave
	bg_event 11, 22, BGEVENT_DOWN, EcruteakCantLeave

	db 8 ; object events
	object_event 11,  3, SPRITE_ERIKA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, EcruteakGymLeader, -1
	object_event 10, 17, SPRITE_ERIKA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ECRUTEAK_GYM_INTRO
	object_event 12, 19, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 13, 12, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerCamperJeff, -1
	object_event  6, 14, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerPicnickerTerry, -1
	object_event  5,  9, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerPokefanMLester, -1
	object_event 18,  8, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerCamperGreg, -1
	object_event 11, 10, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerPicnickerBrittany, -1
