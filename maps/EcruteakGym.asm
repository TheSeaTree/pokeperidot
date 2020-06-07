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
	checkflag ENGINE_STORMBADGE
	iftrue .end
	setscene SCENE_ECRUTEAKGYM_INTRO
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
	checkevent EVENT_BEAT_POSEY
	iftrue .FightDone
	checkscene
	ifequal SCENE_ECRUTEAKGYM_DONE, .Battle
	jumptext WillNotBattle
	end
	
.Battle
	opentext
	writetext PoseyChallengeText
	waitbutton
	checkflag ENGINE_FLYPOINT_OLIVINE
	iftrue .Team2
	winlosstext PoseyWinText, 0
	loadtrainer POSEY, POSEY1
	startbattle
	reloadmapafterbattle
	jump .After
.Team2:
	winlosstext PoseyWinText, 0
	loadtrainer POSEY, POSEY2
	startbattle
	reloadmapafterbattle

.After:
	setmapscene ECRUTEAK_CITY, SCENE_ECRUTEAKCITY_DONE
	setevent EVENT_BEAT_CAMPER_JEFF
	setevent EVENT_BEAT_BUG_CATCHER_GREG
	setevent EVENT_BEAT_PICNICKER_TERRY
	setevent EVENT_BEAT_PICNICKER_BRITTANY
	setevent EVENT_BEAT_POKEFANM_LESTER
	opentext
	writetext PlayerReceivedRootBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_STORMBADGE
	setevent EVENT_BEAT_POSEY
.FightDone:
	opentext
	special HealParty
	checkevent EVENT_GOT_TM_SOLARBEAM
	iftrue .GotSolarbeam
	writetext PoseyRootBadgeText
	buttonsound
	verbosegiveitem TM_SOLARBEAM
	setevent EVENT_GOT_TM_SOLARBEAM
	writetext PoseySolarbeamText
	waitbutton
.GotSolarbeam:
	writetext PoseyAfterText
	waitbutton
	closetext
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
	warpfacing DOWN, ECRUTEAK_CITY, 12, 11
	end
	
EcruteakGymBossMon1:
	cry TANGELA
	waitsfx
	loadwildmon TANGELA, 30
	writecode VAR_BATTLETYPE, BATTLETYPE_BOSS
	startbattle
	reloadmapafterbattle
	setevent EVENT_ECRUTEAK_GYM_MON_1
	checkevent EVENT_ECRUTEAK_GYM_MON_2
	iftrue EcruteakGymSceneDone
	setscene SCENE_ECRUTEAKGYM_MON_2
	end
	
EcruteakGymBossMon2:
	cry VILEPLUME
	waitsfx
	loadwildmon VILEPLUME, 30
	writecode VAR_BATTLETYPE, BATTLETYPE_BOSS
	startbattle
	reloadmapafterbattle
	setevent EVENT_ECRUTEAK_GYM_MON_2
	checkevent EVENT_ECRUTEAK_GYM_MON_3
	iftrue EcruteakGymSceneDone
	setscene SCENE_ECRUTEAKGYM_MON_3
	end
	
EcruteakGymBossMon3:
	cry JUMPLUFF
	waitsfx
	loadwildmon JUMPLUFF, 30
	writecode VAR_BATTLETYPE, BATTLETYPE_BOSS
	startbattle
	reloadmapafterbattle
	setevent EVENT_ECRUTEAK_GYM_MON_3
	checkevent EVENT_ECRUTEAK_GYM_MON_4
	iftrue EcruteakGymSceneDone
	setscene SCENE_ECRUTEAKGYM_MON_4
	end
	
EcruteakGymBossMon4:
	cry VICTREEBEL
	waitsfx
	loadwildmon VICTREEBEL, 30
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
	
TrainerBugCatcherGreg:
	trainer BUG_CATCHER, GREG, EVENT_BEAT_BUG_CATCHER_GREG, BugCatcherGregText, BugCatcherGregWinText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext BugCatcherGregAfterText
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
	
EcruteakGymGuy:
	jumptextfaceplayer EcruteakGymGuyText
	
EcruteakGymStatue:
	checkflag ENGINE_STORMBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	trainertotext POSEY, POSEY1, MEM_BUFFER_1
	jumpstd gymstatue2
	
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
	text "Ah, there you are!"
	
	para "Thank you once"
	line "again for MAROWAK!"
	
	para "Now, before I will"
	line "accept your"
	cont "challenge, I must"
	cont "let you know some-"
	cont "thing."
	
	para "My GYM is an"
	line "extension to my"
	cont "shelter on ROUTE"
	cont "12."
	
	para "There are some"
	line "wild #MON here"
	cont "right now."
	
	para "They should go"
	line "back outside if"
	cont "they are defeated"
	cont "in battle."
	
	para "I'm sorry if this"
	line "is inconvenient"
	cont "for you."
	
	para "I would just hate"
	line "for there to be"
	cont "any distractions"
	cont "during our battle."
	
	para "There are 4"
	line "#MON that I"
	cont "know are here at"
	cont "the moment."
	
	para "When they are all"
	line "gone, you may"
	cont "challenge me."
	
	para "Good luck finding"
	line "them all!"
	
	para "See you soon!"
	done
	
YouDidIt:
	text "POSEY: You got rid"
	line "of all the #MON"
	cont "in here!"
	
	para "Come find me and"
	line "we can have that"
	cont "battle you wanted!"
	done
	
WillNotBattle:	
	text "I can't battle you"
	line "yet. There are"
	cont "still wild #MON"
	cont "in the gym!"
	done
	
PoseyChallengeText:
	text "I usually oppose"
	line "violence, but my"
	cont "#MON are happy"
	cont "to have a good"
	cont "battle!"
	
	para "I trust you will"
	line "show them a great"
	cont "one!"
	done
	
PoseyWinText:
	text "That was a wonder-"
	line "ful battle!"

	para "A balance between"
	line "skill and respect"
	cont "is important to a"
	cont "trainer. You have"
	cont "displayed both!"

	para "You have earned"
	line "my ROOTBADGE!"
	done
	
PoseyRootBadgeText:
	text "Please take my"
	cont "special technique"
	cont "as well!"
	done

PoseySolarbeamText:
	text "TM56 contains"
	line "SOLARBEAM."
	
	para "It takes a while"
	line "to build strength,"
	cont "but you don't want"
	cont "to be on the"
	cont "receiving end of"
	cont "it when it's ready"
	cont "to go!"
	
	para "If it's sunny, it"
	line "won't even need to"
	cont "be charged!"
	done
	
PoseyAfterText:
	text "You have battled"
	line "so well, but I can"
	cont "feel the love and"
	cont "care you have for"
	cont "your #MON."
	
	para "I know that will"
	line "continue to grow"
	cont "stronger. I'll be"
	cont "rooting for you,"
	cont "<PLAYER>!"
	done

PlayerReceivedRootBadgeText:
	text "<PLAYER> received"
	line "ROOTBADGE."
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
	
BugCatcherGregText:
	text "What's creepy,"
	line "crawly, and scares"
	cont "my sister?"
	
	para "My #MON!"
	done

BugCatcherGregWinText:
	text "I lost."
	done

BugCatcherGregAfterText:
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
	
EcruteakGymGuyText:
	text "Yo! Champ in the"
	line "making!"
	
	para "POSEY is back from"
	line "her emergency, so"
	cont "she is accepting"
	cont "challenges once"
	cont "again!"
	
	para "Her specialty is"
	line "in #MON at one"
	cont "with nature."
	
	para "FIRE and FLYING-"
	line "type #MON are"
	cont "greatly effective"
	cont "in here!"
	
	para "You can't go wrong"
	line "with some ROCK or"
	cont "ICE moves, either!"
	
	para "Good luck out"
	line "there!"
	done

EcruteakGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 10, 21, ECRUTEAK_CITY, 5
	warp_event 11, 21, ECRUTEAK_CITY, 5

	db 6 ; coord events
	coord_event 13, 15, SCENE_ECRUTEAKGYM_MON_1, EcruteakGymBossMon1
	coord_event 15, 10, SCENE_ECRUTEAKGYM_MON_2, EcruteakGymBossMon2
	coord_event  9,  9, SCENE_ECRUTEAKGYM_MON_3, EcruteakGymBossMon3
	coord_event  6, 12, SCENE_ECRUTEAKGYM_MON_4, EcruteakGymBossMon4
	coord_event 10, 18, SCENE_ECRUTEAKGYM_INTRO, EcruteakGymIntroLeft
	coord_event 11, 18, SCENE_ECRUTEAKGYM_INTRO, EcruteakGymIntroRight

	db 4 ; bg events
	bg_event  9, 18, BGEVENT_READ, EcruteakGymStatue
	bg_event 12, 18, BGEVENT_READ, EcruteakGymStatue
	bg_event 10, 22, BGEVENT_DOWN, EcruteakCantLeave
	bg_event 11, 22, BGEVENT_DOWN, EcruteakCantLeave

	db 8 ; object events
	object_event 11,  3, SPRITE_POSEY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, EcruteakGymLeader, -1
	object_event 10, 17, SPRITE_POSEY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ECRUTEAK_GYM_INTRO
	object_event 13, 19, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, EcruteakGymGuy, -1
	object_event 13, 12, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerCamperJeff, -1
	object_event  6, 14, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerPicnickerTerry, -1
	object_event  5,  9, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerPokefanMLester, -1
	object_event 18,  8, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerBugCatcherGreg, -1
	object_event 11, 10, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerPicnickerBrittany, -1
