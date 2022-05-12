	const_def 2 ; object constants
	const FLUTE_MASTER
	const FLUTE_BURGLAR

FluteMasterHouse_MapScripts:
	db 2 ; scene scripts
	scene_script .FluteMaster
	scene_script .DummyScene

	db 0 ; callbacks
	
.FluteMaster:
	opentext
	writetext FluteMasterIntroText
	waitbutton
	closetext
	turnobject FLUTE_MASTER, DOWN
	showemote EMOTE_QUESTION, FLUTE_MASTER, 15
	opentext
	writetext FluteMasterNoticesPlayerText
	waitbutton
	closetext
	playsound SFX_ENTER_DOOR
	moveobject FLUTE_BURGLAR, 2, 7
	appear FLUTE_BURGLAR
	applymovement FLUTE_BURGLAR, FluteBurglarEntrance
	applymovement PLAYER, PlayerPushedMovement
	waitsfx
	playmusic MUSIC_ROCKET_ENCOUNTER
	opentext
	writetext FluteBurglarIntroText
	waitbutton
	closetext
	turnobject FLUTE_BURGLAR, RIGHT
	showemote EMOTE_SHOCK, FLUTE_BURGLAR, 15
	opentext
	writetext FluteBurglarShockText
	waitbutton
	writetext FluteBurglarChallengeText
	waitbutton
	closetext
	winlosstext FluteBurglarWinText, 0
	loadtrainer BURGLAR, HARRIS
	startbattle
	reloadmapafterbattle
	playmusic MUSIC_ROCKET_ENCOUNTER
	opentext
	writetext FluteBurglarAfterText
	waitbutton
	closetext
	playsound SFX_EXIT_BUILDING
	applymovement FLUTE_BURGLAR, FluteBurglarExit
	disappear FLUTE_BURGLAR
	waitsfx
	special RestartMapMusic
	applymovement FLUTE_MASTER, FluteMasterApproach
	opentext
	writetext FluteMasterExplainText
	waitbutton
	writetext FluteMasterAfterText
	waitbutton
	closetext
	applymovement FLUTE_MASTER, FluteMasterWalkBack
	setscene SCENE_FINISHED
	setevent EVENT_FLUTE_HIDEOUT_OPEN
	end

.DummyScene:
	end

FluteMaster:
	faceplayer
	opentext
	checkevent EVENT_FOUGHT_SNORLAX
	iffalse .TutorNotActive
	checkitem POKE_FLUTE
	iftrue .TakeFlute

	writetext FluteMasterTutorText
	waitbutton
	checkitem GOLD_LEAF
	iffalse .NoLeaf
	writetext HealBellTutorTeachText
	yesorno
	iftrue .HealBell
	jump .Refused
	
.HealBell
	writetext HealBellTutorWhichOneText
	buttonsound
	writebyte HEAL_BELL
	special MoveTutor
	ifequal $0, .TeachMove
	jump .Refused
	
.TeachMove
	takeitem GOLD_LEAF
	writetext HealBellTutorThankYouText
	waitbutton
	closetext
	end
	
.Refused
	writetext HealBellTutorRefusedText
	waitbutton
	closetext
	end
	
.NoLeaf
	writetext HealBellTutorExplainGoldLeafText
	waitbutton
	turnobject LAST_TALKED, RIGHT
	closetext
	end
	
.TutorNotActive
	writetext FluteMasterAfterText
	waitbutton
	closetext
	end
	
.TakeFlute
	writetext FluteMasterWantsFluteText
	yesorno
	iffalse .KeepFlute
	writetext PlayerReturnsFluteText
	takeitem POKE_FLUTE
	waitbutton
	writetext AfterReturningFluteText
	waitbutton
	closetext
	end
	
.KeepFlute
	writetext PlayerKeepFluteText
	waitbutton
	closetext
	end
	
ComplicatedSheetMusic:
	jumptext ComplicatedSheetMusicText
	
FluteBurglarEntrance:
	turn_step UP
	step_resume
	
FluteBurglarExit:
	turn_step DOWN
	step_resume
	
FluteMasterApproach:
	step DOWN
	step DOWN
	step DOWN
	turn_head RIGHT
	step_resume
	
FluteMasterWalkBack:
	step UP
	step UP
	step UP
	turn_head RIGHT
	step_resume
	
PlayerPushedMovement:
	turn_head LEFT
	fix_facing
	step RIGHT
	remove_fixed_facing
	step_resume

FluteMasterIntroText:
	text "Haven't you taken"
	line "enough? What more"
	cont "could you possibly"
	cont "want from me?"
	done
	
FluteMasterNoticesPlayerText:
	text "…Oh, you're not"
	line "one of them."
	
	para "Can't you read the"
	line "sign? I don't want"
	cont "any distractions"
	cont "while I work!"
	
	para "That is the whole"
	line "reason I moved"
	cont "away from-"
	done

FluteBurglarIntroText:
	text "Well, well, well…"
	
	para "Did our last visit"
	line "frighten you that"
	cont "much? You went and"
	cont "got a body guard?"
	done

FluteBurglarShockText:
	text "Wait a second…"
	
	para "No way…"
	
	para "I recognize you!"
	
	para "You're the kid"
	line "that managed to"
	cont "beat the guys at"
	cont "HELIO TOWN!"
	done
	
FluteBurglarChallengeText:
	text "Hehehe…"
	
	para "I'm going to get"
	line "such a raise when"
	cont "I beat you!"
	done
	
FluteBurglarWinText:
	text "Woah! The guys"
	line "weren't kidding!"
	done
	
FluteBurglarAfterText:
	text "You may have beat"
	line "me alone, but you"
	cont "will never be able"
	cont "to take on our"
	cont "whole base."
	
	para "Hehehe…"
	
	para "Especially now"
	line "that we got the"
	cont "# FLUTE and"
	cont "a gang of BIKERs"
	cont "on our side."
	done
	
FluteMasterExplainText:
	text "You know these"
	line "hoodlums?"
	
	para "They broke into my"
	line "house recently and"
	cont "stole my #"
	cont "FLUTE!"
	
	para "I have no"
	line "#MON, so I was"
	cont "helpless to them."
	
	para "Normally I don't"
	line "like to trust any-"
	cont "one, but you"
	cont "handled yourself"
	cont "well enough in"
	cont "that battle."
	
	para "Could I ask you to"
	line "go and get back my"
	cont "# FLUTE from"
	cont "those thieves?"
	done
	
FluteMasterAfterText:
	text "That # FLUTE"
	line "has caused so much"
	cont "trouble."

	para "I'm not sure if I"
	line "still want it."
	done
	
FluteMasterWantsFluteText:
	text "After some serious"
	line "thought, I have"
	cont "decided that I"
	cont "would like the"
	cont "# FLUTE back."
	
	para "I realize my mis-"
	line "take now. No man"
	cont "should have the"
	cont "kind of power it"
	cont "can grant."
	
	para "Would you mind re-"
	line "turning the FLUTE?"
	
	para "I plan to destroy"
	line "it."
	done

PlayerReturnsFluteText:
	text "<PLAYER> reutned"
	line "the # FLUTE."
	done
	
PlayerKeepFluteText:
	text "I can't exactly"
	line "stop you from kee-"
	cont "ping the FLUTE,"
	cont "but if you recons-"
	cont "ider, find me."
	done
	
AfterReturningFluteText:
	text "I know it takes a"
	line "lot to give up an"
	cont "item as powerful"
	cont "as the # FLUTE."
	
	para "Stop by again some"
	line "time."
	
	para "I have an idea of"
	line "how to make this"
	cont "up to you."
	done

FluteMasterTutorText:
	text "Brilliant job"
	line "defeating those"
	cont "crooks!"

	para "In return for your"
	line "help, I want to"
	cont "teach my new song"
	cont "to one of your"
	cont "#MON."

	para "Sorry, but I will"
	line "require a GOLD"
	cont "LEAF in return."
	done

HealBellTutorTeachText:
	text "Would you like to"
	line "teach your #MON"
	cont "HEAL BELL?"
	done
	
HealBellTutorWhichOneText:
	text "Ah, wonderful!"
	
	para "Which #MON will"
	line "I be tutoring?"
	done
	
HealBellTutorThankYouText:
	text "Thank you."
	
	para "Your #MON will"
	line "see the magic that"
	cont "music can create."
	done
	
HealBellTutorRefusedText:
	text "Pity, you must not"
	line "have a #MON"
	cont "that can learn my"
	cont "special song."
	done
	
HealBellTutorExplainGoldLeafText:
	text "I'm sorry, but"
	line "I need something"
	cont "in return for my"
	cont "service."
	done
	
ComplicatedSheetMusicText:
	text "It's sheet music."
	
	para "It looks very"
	line "complicated."
	done
	
FluteMasterHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, ACROPORA_CITY, 5
	warp_event  3,  7, ACROPORA_CITY, 5

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  2,  4, SPRITE_BILL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, FluteMaster, -1
	object_event  0, -4, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_UP, 0, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  3,  4, SPRITE_PAPER, SPRITEMOVEDATA_STILL, 0, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ComplicatedSheetMusic, -1
