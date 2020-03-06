	const_def 2 ; object constants
	const AZALEAGYM_BUGSY
	const AZALEAGYM_BLACKBELT1
	const AZALEAGYM_BLACKBELT2
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
	
AzaleaGymBugsyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_BUGSY
	iftrue .FightDone
	writetext BugsyText_INeverLose
	waitbutton
	closetext
	winlosstext BugsyText_ResearchIncomplete, 0
	checkflag ENGINE_FLYPOINT_VIOLET
	iftrue .Team2
	loadtrainer BUGSY, BUGSY1
	startbattle
	reloadmapafterbattle
	jump .After
.Team2:
	loadtrainer BUGSY, BUGSY2
	startbattle
	reloadmapafterbattle
	jump .After

.After:
	setevent EVENT_BEAT_BUGSY
	special HealParty
	opentext
	writetext Text_ReceivedHiveBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_ZEPHYRBADGE
	checkcode VAR_BADGES
.FightDone:
	checkevent EVENT_GOT_TM_ROCK_SMASH
	iftrue .GotFuryCutter
	setevent EVENT_BEAT_BLACKBELT_BILLY
	setevent EVENT_BEAT_BLACKBELT_JIMMY
	writetext BugsyText_HiveBadgeSpeech
	buttonsound
	verbosegiveitem TM_ROCK_SMASH
	iffalse .NoRoomForFuryCutter
	setevent EVENT_GOT_TM_ROCK_SMASH
	setmapscene VIOLET_CITY, SCENE_FINISHED
	writetext BugsyText_FuryCutterSpeech
	waitbutton
	closetext
	end
.GotFuryCutter:
	writetext BugsyText_BugMonsAreDeep
	waitbutton
.NoRoomForFuryCutter:
	closetext
	end

TrainerBlackBeltBilly:
	trainer BLACKBELT_T, BILLY, EVENT_BEAT_BLACKBELT_BILLY, BlackBeltBillyText, BlackBeltBillyWinText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext BlackBeltBillyAfterText
	waitbutton
	closetext
	end

TrainerBlackBeltJimmy:
	trainer BLACKBELT_T, JIMMY, EVENT_BEAT_BLACKBELT_JIMMY, BlackBeltJimmyText, BlackBeltJimmyWinText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext BlackBeltJimmyAfterText
	waitbutton
	closetext
	end

AzaleaGymGuyScript:
	faceplayer
	checkevent EVENT_BEAT_BUGSY
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
	checkflag ENGINE_HIVEBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	trainertotext BUGSY, BUGSY1, MEM_BUFFER_1
	jumpstd gymstatue2
	
AzaleaCantLeave:
	checkflag ENGINE_ZEPHYRBADGE
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

AzaleaGymGreeting:
	text "Greetings,"
	line "challenger!"
	done

AzaleaGymHaveBadge:
	text "<PLAYER> used"
	line "the FISTBADGE to"
	cont "unlock the door!"
	done
	
AzaleaExplainGyms:	
	text "You should know"
	line "before you enter"
	cont "that you cannot"
	cont "exit a gym"
	cont "unless you win"
	cont "a BADGE or white"
	cont "out."
	
	para "Would you like a"
	line "chance to stock up"
	cont "on items before"
	cont "taking on this"
	cont "challenge?"
	done
	
AzaleaGymGoodLuck:
	text "Good luck on your"
	line "challenge,"
	cont "trainer!"
	done
	
BugsyText_INeverLose:
	text "I'm BUGSY!"
	line "I never lose when"

	para "it comes to bug"
	line "#MON."

	para "My research is"
	line "going to make me"

	para "the authority on"
	line "bug #MON!"

	para "Let me demonstrate"
	line "what I've learned"
	cont "from my studies."
	done

BugsyText_ResearchIncomplete:
	text "Whoa, amazing!"
	line "You're an expert"
	cont "on #MON!"

	para "My research isn't"
	line "complete yet."

	para "OK, you win. Take"
	line "this BADGE."
	done

Text_ReceivedHiveBadge:
	text "<PLAYER> received"
	line "HIVEBADGE."
	done

BugsyText_HiveBadgeSpeech:
	text "Do you know the"
	line "benefits of HIVE-"
	cont "BADGE?"

	para "If you have it,"
	line "#MON up to L30"

	para "will obey you,"
	line "even traded ones."

	para "#MON that know"
	line "CUT will be able"

	para "to use it outside"
	line "of battle too."

	para "Here, I also want"
	line "you to have this."
	done

BugsyText_FuryCutterSpeech:
	text "TM08 contains"
	line "ROCK SMASH."

	para "It has a good"
	line "chance of lowering"
	cont "your target's"
	cont "DEFENSE."
	
	para "It hits hard, and"
	line "can let you hit"
	cont "even harder!"
	
	para "You can also use"
	line "ROCK SMASH to"
	cont "destroy any rocks"
	cont "in your path!"
	done

BugsyText_BugMonsAreDeep:
	text "Bug #MON are"
	line "deep. There are"

	para "many mysteries to"
	line "be explored."

	para "Study your favor-"
	line "ites thoroughly."
	done

BlackBeltBillyText:
	text "I started training"
	line "in this gym"
	cont "because of my"
	cont "older brother."
	done
	
BlackBeltBillyWinText:
	text "Oh no!"
	done
	
BlackBeltBillyAfterText:
	text "I hope my girl"
	line "won't hear "
	cont "about this…"
	done
	
BlackBeltJimmyText:
	text "My little brother"
	line "and I have been"
	cont "training here for"
	cont "years!"
	done
	
BlackBeltJimmyWinText:
	text "That was tougher"
	line "than I thought it"
	cont "would be."
	done
	
BlackBeltJimmyAfterText:
	text "You're pretty good"
	line "at this, kid."
	done
	
AzaleaGymGuyText:
	text "Yo, challenger!"

	para "BUGSY's young, but"
	line "his knowledge of"

	para "bug #MON is for"
	line "real."

	para "It's going to be"
	line "tough without my"
	cont "advice."

	para "Let's see… Bug"
	line "#MON don't like"
	cont "fire."

	para "Flying-type moves"
	line "are super-effec-"
	cont "tive too."
	done

AzaleaGymGuyWinText:
	text "Well done! That"
	line "was a great clash"

	para "of talented young"
	line "trainers."

	para "With people like"
	line "you, the future of"
	cont "#MON is bright!"
	done

AzaleaGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  8, 19, AZALEA_TOWN, 5
	warp_event  9, 19, AZALEA_TOWN, 5

	db 0 ; coord events

	db 4 ; bg events
	bg_event  7, 15, BGEVENT_READ, AzaleaGymStatue
	bg_event 10, 15, BGEVENT_READ, AzaleaGymStatue
	bg_event  8, 20, BGEVENT_DOWN, AzaleaCantLeave
	bg_event  9, 20, BGEVENT_DOWN, AzaleaCantLeave

	db 4 ; object events
	object_event  9,  3, SPRITE_BUGSY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, AzaleaGymBugsyScript, -1
	object_event  7, 11, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerBlackBeltBilly, -1
	object_event 10,  7, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBlackBeltJimmy, -1
	object_event 11, 17, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, AzaleaGymGuyScript, -1
