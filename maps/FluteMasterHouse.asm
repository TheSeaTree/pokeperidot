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
	writetext FluteMasterIntro
	waitbutton
	closetext
	turnobject FLUTE_MASTER, DOWN
	showemote EMOTE_QUESTION, FLUTE_MASTER, 15
	opentext
	writetext FluteMasterNoticesPlayer
	waitbutton
	closetext
	playsound SFX_ENTER_DOOR
	moveobject FLUTE_BURGLAR, 2, 7
	appear FLUTE_BURGLAR
	applymovement FLUTE_BURGLAR, FluteBurglarEntrance
	applymovement PLAYER, PlayerPushedMovement
	waitsfx
	opentext
	writetext FluteBurglarIntro
	waitbutton
	closetext
	turnobject FLUTE_BURGLAR, RIGHT
	showemote EMOTE_SHOCK, FLUTE_BURGLAR, 15
	opentext
	writetext FluteBurglarShockText
	waitbutton
	playmusic MUSIC_POKEMANIAC_ENCOUNTER
	writetext FluteBurglarChallengeText
	waitbutton
	closetext
	winlosstext FluteBurglarWinText, -1
	loadtrainer BURGLAR, HARRIS
	startbattle
	reloadmapafterbattle
	opentext
	writetext FluteBurglarAfterText
	waitbutton
	closetext
	playsound SFX_EXIT_BUILDING
	applymovement FLUTE_BURGLAR, FluteBurglarExit
	disappear FLUTE_BURGLAR
	waitsfx
	applymovement FLUTE_MASTER, FluteMasterApproach
	opentext
	writetext FluteMasterExplain
	waitbutton
	writetext FluteMasterAfter
	waitbutton
	closetext
	applymovement FLUTE_MASTER, FluteMasterWalkBack
	setscene SCENE_FINISHED
	setevent EVENT_FLUTE_HIDEOUT_OPEN
	end

.DummyScene:
	end

FluteMaster:
	jumptextfaceplayer FluteMasterAfter
	; Heal Bell tutor after defeating the lair.
	
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

FluteMasterIntro:
	text "Haven't you taken"
	line "enough? What more"
	cont "could you possibly"
	cont "want from me?"
	done
	
FluteMasterNoticesPlayer:
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

FluteBurglarIntro:
	text "Well, well, well…"
	
	para "Did our last visit"
	line "frighten you that"
	cont "much? You went and"
	cont "got a body guard?"
	done

FluteBurglarShockText:
	text "No way…"
	
	para "I've heard about"
	line "you!"
	
	para "You're the kid"
	line "that managed to"
	cont "beat the guys at"
	cont "HELIO TOWN!"
	done
	
FluteBurglarChallengeText:
	text "Hehehe…"
	
	para "I'm going to get"
	line "such a raise if I"
	cont "can beat you!"
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
	
	para "Especially now"
	line "that we got the"
	cont "# FLUTE and"
	cont "a gang of BIKERs"
	cont "on our side."
	done
	
FluteMasterExplain:
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
	
FluteMasterAfter:
	text "That # FLUTE"
	line "is more trouble"
	cont "than it's worth."
	
	para "If you can get it"
	line "back, you can keep"
	cont "it."
	done
	
FluteMasterTutor:
	text "Brilliant job"
	line "defeating those"
	cont "crooks!"
	
	para "In return for your"
	line "help, I want to"
	cont "teach my new song"
	cont "to one of your"
	cont "#MON."
	
	para "Sorry, but I will"
	line "require a SILVER"
	cont "LEAF in return."
	done
	
HealBellTutorTeach:
	text "Would you like to"
	line "teach your #MON"
	cont "HEAL BELL?"
	done
	
HealBellTutorWhichOne:
	text "Ah, wonderful!"
	
	para "Which #MON will"
	line "I be tutoring?"
	done
	
HealBellTutorRefused:
	text "Pity, you must not"
	line "have a #MON"
	cont "that can learn my"
	cont "special song."
	done
	
HealBellTutorExplainSilverLeaf:
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
	warp_event  2,  7, BLACKTHORN_CITY, 5
	warp_event  3,  7, BLACKTHORN_CITY, 5

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  2,  4, SPRITE_BILL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, FluteMaster, -1
	object_event  0, -4, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_UP, 0, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  3,  4, SPRITE_PAPER, SPRITEMOVEDATA_STILL, 0, 2, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ComplicatedSheetMusic, -1
