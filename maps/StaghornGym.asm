	const_def 2 ; object constants
	const STAGHORNGYM_LEADER1
	const STAGHORNGYM_LEADER2
	const STAGHORNGYM_GYM_GUY
	const STAGHORNGYM_LASS1
	const STAGHORNGYM_LASS2
	const STAGHORNGYM_LASS3
	const STAGHORNGYM_LASS4
	const STAGHORNGYM_LASS5

StaghornGym_MapScripts:
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
	checkflag ENGINE_ROOTBADGE
	iftrue .end
	setscene SCENE_STAGHORNGYM_INTRO
.end
	end
	
StaghornGymIntroRight:
	applymovement STAGHORNGYM_LEADER2, StaghornGymLeaderApproach
	turnobject PLAYER, LEFT
	jump StaghornGymIntroLeft

StaghornGymIntroLeft:
	checkevent EVENT_ECRUTEAK_GYM_INTRO
	iftrue .Shuffle
	opentext
	writetext StaghorngymIntroText
	waitbutton
	closetext
	applymovement STAGHORNGYM_LEADER2, StaghornGymLeaderWalkAway
	disappear STAGHORNGYM_LEADER2
	setevent EVENT_ECRUTEAK_GYM_INTRO
.Shuffle
	random 4
	ifequal 0, .Spawn1
	ifequal 1, .Spawn2
	ifequal 2, .Spawn3
	ifequal 3, .Spawn4
	return
	
.Spawn1
	setscene SCENE_STAGHORNGYM_MON_1
	end

.Spawn2
	setscene SCENE_STAGHORNGYM_MON_2
	end

.Spawn3
	setscene SCENE_STAGHORNGYM_MON_3
	end
	
.Spawn4
	setscene SCENE_STAGHORNGYM_MON_4
	end
	
StaghornGymLeader:
	faceplayer
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .Rematch
	checkevent EVENT_BEAT_POSEY
	iftrue .FightDone
	checkscene
	ifequal SCENE_STAGHORNGYM_DONE, .Battle
	jumptext WillNotBattle
	end
	
.Battle
	opentext
	writetext PoseyChallengeText
	waitbutton
	checkflag ENGINE_FLYPOINT_RUGOSA
	iftrue .Team2
	checkflag ENGINE_FLYPOINT_ACROPORA
	iftrue .Team3
	checkflag ENGINE_FLYPOINT_ORCHID
	iftrue .Team4
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
	jump .After
.Team3:
	winlosstext PoseyWinText, 0
	loadtrainer POSEY, POSEY3
	startbattle
	reloadmapafterbattle
	jump .After
.Team4:
	winlosstext PoseyWinText, 0
	loadtrainer POSEY, POSEY4
	startbattle
	reloadmapafterbattle

.After:
	setmapscene STAGHORN_TOWN, SCENE_STAGHORNTOWN_DONE
	setevent EVENT_BEAT_CAMPER_JEFF
	setevent EVENT_BEAT_BUG_CATCHER_GREG
	setevent EVENT_BEAT_PICNICKER_TERRY
	setevent EVENT_BEAT_PICNICKER_BRITTANY
	setevent EVENT_BEAT_POKEFANM_LESTER
	opentext
	writetext PlayerReceivedRootBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_ROOTBADGE
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

.Rematch:
	checkflag ENGINE_REMATCH_POSEY
	iftrue .DoneRematch
	
	opentext
	writetext PoseyRematchText
	waitbutton
	closetext
	
	winlosstext PoseyRematchWinText, 0

	copybytetovar wPoseyFightCount
	ifgreater 3, .FinalRematch
	ifequal 3, .RematchTeam4
	ifequal 2, .RematchTeam3
	ifequal 1, .RematchTeam2

.RematchTeam1:
	loadtrainer POSEY, POSEY_REMATCH1
	jump .DoRematch
.RematchTeam2:
	loadtrainer POSEY, POSEY_REMATCH2
	jump .DoRematch
.RematchTeam3:
	loadtrainer POSEY, POSEY_REMATCH3
	jump .DoRematch
.RematchTeam4:
	loadtrainer POSEY, POSEY_REMATCH4
	jump .DoRematch
.FinalRematch:
	loadtrainer POSEY, POSEY_REMATCH5
.DoRematch
	startbattle
	reloadmapafterbattle

	setflag ENGINE_REMATCH_POSEY
	copybytetovar wPoseyFightCount
	addvar 1
	copyvartobyte wPoseyFightCount

.DoneRematch
	jumptext PoseyAfterRematchText

StaghornCantLeave:
	checkflag ENGINE_ROOTBADGE
	iftrue .Leave
	jumpstd cantleavegym
	end
	
.Leave
	opentext
	writetext StaghornGymHaveBadge
	waitbutton
	closetext
	applymovement PLAYER, StaghornLeaveGym
	special FadeOutPalettes
	playsound SFX_EXIT_BUILDING
	wait 4
	warpfacing DOWN, STAGHORN_TOWN, 12, 11
	end
	
StaghornGymBossMon1:
	cry TANGELA
	waitsfx
	loadwildmon TANGELA, 30
	writecode VAR_BATTLETYPE, BATTLETYPE_BOSS
	startbattle
	reloadmapafterbattle
	setevent EVENT_ECRUTEAK_GYM_MON_1
	checkevent EVENT_ECRUTEAK_GYM_MON_2
	iftrue StaghornGymSceneDone
	setscene SCENE_STAGHORNGYM_MON_2
	end
	
StaghornGymBossMon2:
	cry VILEPLUME
	waitsfx
	loadwildmon VILEPLUME, 30
	writecode VAR_BATTLETYPE, BATTLETYPE_BOSS
	startbattle
	reloadmapafterbattle
	setevent EVENT_ECRUTEAK_GYM_MON_2
	checkevent EVENT_ECRUTEAK_GYM_MON_3
	iftrue StaghornGymSceneDone
	setscene SCENE_STAGHORNGYM_MON_3
	end
	
StaghornGymBossMon3:
	cry JUMPLUFF
	waitsfx
	loadwildmon JUMPLUFF, 30
	writecode VAR_BATTLETYPE, BATTLETYPE_BOSS
	startbattle
	reloadmapafterbattle
	setevent EVENT_ECRUTEAK_GYM_MON_3
	checkevent EVENT_ECRUTEAK_GYM_MON_4
	iftrue StaghornGymSceneDone
	setscene SCENE_STAGHORNGYM_MON_4
	end
	
StaghornGymBossMon4:
	cry VICTREEBEL
	waitsfx
	loadwildmon VICTREEBEL, 30
	writecode VAR_BATTLETYPE, BATTLETYPE_BOSS
	startbattle
	reloadmapafterbattle
	setevent EVENT_ECRUTEAK_GYM_MON_4
	checkevent EVENT_ECRUTEAK_GYM_MON_1
	iftrue StaghornGymSceneDone
	setscene SCENE_STAGHORNGYM_MON_1
	end
	
StaghornGymSceneDone:
	setscene SCENE_STAGHORNGYM_DONE
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
	
StaghornGymGuy:
	jumptextfaceplayer StaghornGymGuyText
	
StaghornGymStatue:
	checkflag ENGINE_ROOTBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	trainertotext POSEY, POSEY1, MEM_BUFFER_1
	jumpstd gymstatue2
	
StaghornGymLeaderApproach:
	step DOWN
	turn_head RIGHT
	step_resume
	
StaghornGymLeaderWalkAway:
	step UP
	step UP
	step UP
	step LEFT
	step UP
	step UP
	step_end
	
StaghornLeaveGym:
	turn_step DOWN
	step_end
	
StaghorngymIntroText:
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
	line "special technique"
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

PoseyRematchText:
	text "This is where the"
	line "rematch text goes."
	done

PoseyRematchWinText:
	text "This is where the"
	line "victory text goes."
	done

PoseyAfterRematchText:
	text "Good job!"

	para "We'll do this"
	line "again tomorrow."
	done

StaghornGymHaveBadge:
	text "<PLAYER> used"
	line "the ROOTBADGE to"
	cont "unlock the door!"
	done
	
CamperJeffText:
	text "POSEY has brought"
	line "the fun of camping"
	cont "indoors!"
	done	
	
CamperJeffWinText:
	text "She even copies"
	line "the parts that"
	cont "aren't fun."
	
	para "Like losing to"
	line "strangers!"
	done

CamperJeffAfterText:
	text "I like to come to"
	line "this GYM when it"
	cont "is raining out."
	
	para "POSEY has really"
	line "captured the true"
	cont "essense of the"
	cont "outdoors."
	done
	
BugCatcherGregText:
	text "What's creepy,"
	line "crawly, and scares"
	cont "my sister?"
	
	para "My #MON!"
	done

BugCatcherGregWinText:
	text "Quick! Hide in the"
	line "grass where he"
	cont "can't get you!"
	done

BugCatcherGregAfterText:
	text "My #MON are"
	line "more scared of you"
	cont "than you are them!"
	done	

PicnickerTerryText:
	text "Eek!"
	
	para "I felt something"
	line "brush up against"
	cont "my leg!"
	done

PicnickerTerryWinText:
	text "Redo! I was"
	line "distracted by the"
	cont "grass!"
	done

PicnickerTerryAfterText:
	text "The #MON hiding"
	line "in the grass tend"
	cont "to avoid trainers."
	
	para "I bet you could"
	line "find them all with"
	cont "no trainer seeing"
	cont "you."
	done

PicnickerBrittanyText:
	text "Let me rope you"
	line "into a battle!"
	done

PicnickerBrittanyWinText:
	text "Aw! You tripped up"
	line "all of my #MON!"
	done

PicnickerBrittanyAfterText:
	text "I couldn't help"
	line "the puns. I just"
	cont "love vines! Hehe!"
	done

PokefanMLesterText:
	text "As a kid, I was a"
	line "BUG CATCHER!"
	done
	
PokefanMLesterWinText:
	text "Careful! My part-"
	line "ners are very del-"
	cont "icate!"
	done
	
PokefanMLesterAfterText:
	text "Some day I will"
	line "show the world"
	cont "how strong a BUG-"
	cont "type can be!"
	done
	
StaghornGymGuyText:
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

StaghornGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 10, 21, STAGHORN_TOWN, 5
	warp_event 11, 21, STAGHORN_TOWN, 5

	db 6 ; coord events
	coord_event 13, 15, SCENE_STAGHORNGYM_MON_1, StaghornGymBossMon1
	coord_event 15, 10, SCENE_STAGHORNGYM_MON_2, StaghornGymBossMon2
	coord_event  9,  9, SCENE_STAGHORNGYM_MON_3, StaghornGymBossMon3
	coord_event  6, 12, SCENE_STAGHORNGYM_MON_4, StaghornGymBossMon4
	coord_event 10, 18, SCENE_STAGHORNGYM_INTRO, StaghornGymIntroLeft
	coord_event 11, 18, SCENE_STAGHORNGYM_INTRO, StaghornGymIntroRight

	db 4 ; bg events
	bg_event  9, 18, BGEVENT_READ, StaghornGymStatue
	bg_event 12, 18, BGEVENT_READ, StaghornGymStatue
	bg_event 10, 22, BGEVENT_DOWN, StaghornCantLeave
	bg_event 11, 22, BGEVENT_DOWN, StaghornCantLeave

	db 8 ; object events
	object_event 11,  3, SPRITE_POSEY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, StaghornGymLeader, -1
	object_event 10, 17, SPRITE_POSEY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ECRUTEAK_GYM_INTRO
	object_event 13, 19, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, StaghornGymGuy, -1
	object_event 13, 12, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerCamperJeff, -1
	object_event  6, 14, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerPicnickerTerry, -1
	object_event  5,  9, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerPokefanMLester, -1
	object_event 18,  8, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerBugCatcherGreg, -1
	object_event 11, 10, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerPicnickerBrittany, -1
