	const_def 2 ; object constants

PectiniaArcade_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .Night
	
.Night:
	checktime NITE
	iffalse .NotNight
	changeblock   2,  8, $03
	changeblock   2, 10, $07
.NotNight
	return

PectiniaArcadeSubwayRewardGuy:
	faceplayer
	opentext
	writetext PectiniaArcadeRewardIntroText
	waitbutton
	checksubwaystreak 9
	ifequal HAVE_MORE, .GiveReward1
	closetext
	turnobject LAST_TALKED, LEFT
	end

.GiveReward1:
	checkevent EVENT_ARCADE_REWARD_1
	iftrue .GiveReward2
	giveitem TRICK_MIRROR
	iffalse .NoSpace
	setevent EVENT_ARCADE_REWARD_1
	writebyte 10
	itemtotext TRICK_MIRROR, MEM_BUFFER_0
	jump .ReceivedReward
.GiveReward2:
	checksubwaystreak 20
	ifequal HAVE_LESS, .NoMoreRewards
	giveitem PP_UP, 24
	iffalse .NoSpace
	setevent EVENT_ARCADE_REWARD_2
	writebyte 20
	itemtotext PP_UP, MEM_BUFFER_0
	jump .ReceivedReward
.GiveReward3:
	checksubwaystreak 30
	ifequal HAVE_LESS, .NoMoreRewards
	giveitem FOCUS_SASH, 5
	iffalse .NoSpace
	setevent EVENT_ARCADE_REWARD_3
	writebyte 30
	itemtotext FOCUS_SASH, MEM_BUFFER_0
	jump .ReceivedReward
.GiveReward4:
	checksubwaystreak 40
	ifequal HAVE_LESS, .NoMoreRewards
	giveitem HP_UP, 20
	iffalse .NoSpace
	setevent EVENT_ARCADE_REWARD_4
	writebyte 40
	itemtotext HP_UP, MEM_BUFFER_0
	jump .ReceivedReward
.GiveReward5:
	checksubwaystreak 50
	ifequal HAVE_LESS, .NoMoreRewards
	giveitem POWER_HERB, 5
	iffalse .NoSpace
	setevent EVENT_ARCADE_REWARD_5
	writebyte 50
	itemtotext POWER_HERB, MEM_BUFFER_0
	jump .ReceivedReward
.GiveReward6:
	checksubwaystreak 60
	ifequal HAVE_LESS, .NoMoreRewards
	giveitem PROTEIN, 20
	iffalse .NoSpace
	setevent EVENT_ARCADE_REWARD_6
	writebyte 60
	itemtotext PROTEIN, MEM_BUFFER_0
	jump .ReceivedReward
.GiveReward7:
	checksubwaystreak 70
	ifequal HAVE_LESS, .NoMoreRewards
	giveitem SKILL_BELT
	iffalse .NoSpace
	setevent EVENT_ARCADE_REWARD_7
	writebyte 70
	itemtotext SKILL_BELT, MEM_BUFFER_0
	jump .ReceivedReward
.GiveReward8:
	checksubwaystreak 80
	ifequal HAVE_LESS, .NoMoreRewards
	giveitem CALCIUM, 20
	iffalse .NoSpace
	setevent EVENT_ARCADE_REWARD_8
	writebyte 80
	itemtotext CALCIUM, MEM_BUFFER_0
	jump .ReceivedReward
.GiveReward9:
	checksubwaystreak 90
	ifequal HAVE_LESS, .NoMoreRewards
	giveitem HEAT_CHARM, 5
	iffalse .NoSpace
	setevent EVENT_ARCADE_REWARD_9
	writebyte 90
	itemtotext HEAT_CHARM, MEM_BUFFER_0
	jump .ReceivedReward
.GiveReward10:
	checksubwaystreak 100
	ifequal HAVE_LESS, .NoMoreRewards
	giveitem IRON, 20
	iffalse .NoSpace
	setevent EVENT_ARCADE_REWARD_10
	writebyte 100
	itemtotext IRON, MEM_BUFFER_0
	jump .ReceivedReward
.GiveReward11:
	checksubwaystreak 110
	ifequal HAVE_LESS, .NoMoreRewards
	giveitem DAMP_CHARM, 5
	iffalse .NoSpace
	setevent EVENT_ARCADE_REWARD_11
	writebyte 110
	itemtotext DAMP_CHARM, MEM_BUFFER_0
	jump .ReceivedReward
.GiveReward12:
	checksubwaystreak 120
	ifequal HAVE_LESS, .NoMoreRewards
	giveitem CARBOS, 20
	iffalse .NoSpace
	setevent EVENT_ARCADE_REWARD_12
	writebyte 120
	itemtotext CARBOS, MEM_BUFFER_0
	jump .ReceivedReward
.GiveReward13:
	checksubwaystreak 130
	ifequal HAVE_LESS, .NoMoreRewards
	giveitem X_ACCURACY, 5
	iffalse .NoSpace
	setevent EVENT_ARCADE_REWARD_13
	writebyte 130
	itemtotext X_ACCURACY, MEM_BUFFER_0
	jump .ReceivedReward
.GiveReward14:
	checksubwaystreak 140
	ifequal HAVE_LESS, .NoMoreRewards
	giveitem RARE_CANDY, 10
	iffalse .NoSpace
	setevent EVENT_ARCADE_REWARD_14
	writebyte 140
	itemtotext RARE_CANDY, MEM_BUFFER_0
	jump .ReceivedReward
.GiveReward15:
	checksubwaystreak 150
	ifequal HAVE_LESS, .NoMoreRewards
	giveitem LEFTOVERS
	iffalse .NoSpace
	setevent EVENT_ARCADE_REWARD_15
	writebyte 150
	itemtotext LEFTOVERS, MEM_BUFFER_0
.GiveReward16:
	checksubwaystreak 999
	ifequal HAVE_MORE, .MaxScoreReward

.ReceivedReward:
	writetext PectiniaArcadeRewardReceiveText
	playsound SFX_ITEM
	waitbutton
	itemnotify

	checkevent EVENT_ARCADE_REWARD_2
	iffalse .GiveReward2
	checkevent EVENT_ARCADE_REWARD_3
	iffalse .GiveReward3
	checkevent EVENT_ARCADE_REWARD_4
	iffalse .GiveReward4
	checkevent EVENT_ARCADE_REWARD_5
	iffalse .GiveReward5
	checkevent EVENT_ARCADE_REWARD_6
	iffalse .GiveReward6
	checkevent EVENT_ARCADE_REWARD_7
	iffalse .GiveReward7
	checkevent EVENT_ARCADE_REWARD_8
	iffalse .GiveReward8
	checkevent EVENT_ARCADE_REWARD_9
	iffalse .GiveReward9
	checkevent EVENT_ARCADE_REWARD_10
	iffalse .GiveReward10
	checkevent EVENT_ARCADE_REWARD_11
	iffalse .GiveReward11
	checkevent EVENT_ARCADE_REWARD_12
	iffalse .GiveReward12
	checkevent EVENT_ARCADE_REWARD_13
	iffalse .GiveReward13
	checkevent EVENT_ARCADE_REWARD_14
	iffalse .GiveReward14
	checkevent EVENT_ARCADE_REWARD_15
	iffalse .GiveReward15
	checkevent EVENT_ARCADE_REWARD_16
	iffalse .GiveReward16

.NoMoreRewards:
	writetext PectiniaArcadeRewardAfterText
	waitbutton
	closetext
	end

.NoSpace:
	writetext PectiniaArcadeRewardNoRoomText
	waitbutton
	closetext
	end

.MaxScoreReward:
	giveitem MASTER_BALL, 99
	iffalse .NoSpace
	writetext PectiniaArcadeMaxStreakText
	waitbutton
	writetext PectiniaArcadeReceiveMasterBallText
	playsound SFX_DEX_FANFARE_200_229
	pause 60
	writetext PectiniaArcadePutAwayMasterBallText
	waitbutton
	closetext
	setevent EVENT_ARCADE_REWARD_16
	end

PectiniaArcadeClerk:
	jumptext PectiniaArcadeClerkText

PectiniaArcadeYoungster1:
	opentext
	writetext PectiniaArcadeYoungster1Text
	waitbutton
	closetext
	faceobject LAST_TALKED, PLAYER
	opentext
	writetext PectiniaArcadeYoungster1LostText
	jump PectiniaArcadeTurnUp

PectiniaArcadeBlackbelt:
	faceplayer
	opentext
	writetext PectiniaArcadeBlackbeltText
	jump PectiniaArcadeTurnUp

PectiniaArcadeBugCatcher:
	faceplayer
	opentext
	writetext PectiniaArcadeBugCatcherText
	jump PectiniaArcadeTurnUp

PectiniaArcadeSuperNerd:
	faceplayer
	opentext
	writetext PectiniaArcadeSuperNerdText
	jump PectiniaArcadeTurnUp

PectiniaArcadeFisher:
	faceplayer
	opentext
	writetext PectiniaArcadeFisherText
	jump PectiniaArcadeTurnUp

PectiniaArcadeScientist:
	faceplayer
	opentext
	writetext PectiniaArcadeScientistText
	jump PectiniaArcadeTurnUp

PectiniaArcadeRocker1:
	faceplayer
	opentext
	writetext PectiniaArcadeRocker1Text
	jump PectiniaArcadeTurnUp

PectiniaArcadeCooltrainer1:
	faceplayer
	opentext
	writetext PectiniaArcadeCooltrainer1Text
	jump PectiniaArcadeTurnUp

PectiniaArcadeRocker2:
	faceplayer
	opentext
	writetext PectiniaArcadeRocker2Text
	jump PectiniaArcadeTurnUp

PectiniaArcadeCardSuperNerd:
	jumptext PectiniaArcadeCardSuperNerdText

PectiniaArcadeCardYoungster:
	jumptext PectiniaArcadeCardYoungsterText

PectiniaArcadeCooltrainer2:
	faceplayer
	opentext
	writetext PectiniaArcadeCooltrainer2Text
	jump PectiniaArcadeTurnUp

PectiniaArcadeLass:
	faceplayer
	opentext
	writetext PectiniaArcadeLassText

PectiniaArcadeTurnUp:
	waitbutton
	closetext
	turnobject LAST_TALKED, UP
	end

PectiniaArcadeImportGame:
	jumptext PectiniaArcadeImportGameText

PectiniaArcadeTrackballGame:
	jumptext PectiniaArcadeTrackballGameText

PectiniaArcadeFightingGame:
	jumptext PectiniaArcadeFightingGameText

PectiniaArcadeSpaceshipGame:
	jumptext PectiniaArcadeSpaceshipGameText

PectiniaArcadeRacingGame:
	jumptext PectiniaArcadeRacingGameText

PectiniaArcadePoster:
	jumptext PectiniaArcadePosterText

PectiniaArcadeClerkText:
	text "Welcome to the"
	line "ARCADE."

	para "We've got all the"
	line "hottest new"
	cont "machines here."

	para "We also host card"
	line "game tournaments"
	cont "every night."
	done

PectiniaArcadeYoungster1Text:
	text "Come on… Just a"
	line "little more!"

	para "………………"

	para "No!"
	done

PectiniaArcadeYoungster1LostText:
	text "Why did you have"
	line "to distract me?"

	para "I almost won!"

	para "Now I have to"
	line "start over from"
	cont "the beginning!"
	done

PectiniaArcadeBlackbeltText:
	text "I've been slacking"
	line "with my training"
	cont "to play more of"
	cont "this game."

	para "It's no fun to get"
	line "hit for real, but"
	cont "it doesn't hurt at"
	cont "all in the game!"
	done

PectiniaArcadeBugCatcherText:
	text "This game is"
	line "really hard!"

	para "I've spent almost"
	line "my whole allowance"
	cont "on it!"
	done

PectiniaArcadeSuperNerdText:
	text "I don't want to"
	line "make my friend"
	cont "feel bad, but he's"
	cont "not good at video"
	cont "games. Even when"
	cont "we work together,"
	cont "I struggle to"
	cont "help him win."
	done

PectiniaArcadeFisherText:
	text "I like the games"
	line "where I can work"
	cont "together with a"
	cont "friend more than"
	cont "the ones where I"
	cont "have to compete"
	cont "against him."
	done

PectiniaArcadeScientistText:
	text "I like to play the"
	line "new games here to"
	cont "better learn how"
	cont "computers work."

	para "…Yeah, that's a"
	line "good reason!"
	done

PectiniaArcadeRocker1Text:
	text "I love this game,"
	line "but nobody wants"
	cont "to play versus"
	cont "mode with me."

	para "I win too much and"
	line "they don't have any"
	cont "fun playing!"
	done

PectiniaArcadeCooltrainer1Text:
	text "I've never played a"
	line "game like this."

	para "The controls are"
	line "really weird, but"
	cont "it's tons of fun!"

	para "It even has a"
	line "versus mode, but"
	cont "I'm no good at it!"
	done

PectiniaArcadeRocker2Text:
	text "These racing games"
	line "have me hooked!"

	para "The fast gameplay"
	line "is so thrilling!"

	para "I wish other games"
	line "could be as fast"
	cont "as this one!"
	done

PectiniaArcadeCardSuperNerdText:
	text "Can you hurry up?"

	para "You're taking for-"
	line "ever on your turn!"
	done

PectiniaArcadeCardYoungsterText:
	text "Hm…"

	para "There's so many"
	line "possible actions."

	para "I have to make the"
	line "right choice…"
	done

PectiniaArcadeCooltrainer2Text:
	text "The orange"
	line "machines are"
	cont "linked up for"
	cont "multiplayer games."

	para "It's so much fun to"
	line "play against an"
	cont "actual person!"
	done

PectiniaArcadeLassText:
	text "This place is"
	line "awesome!"

	para "There are so many"
	line "arcade machines"
	cont "imported from"
	cont "other regions!"

	para "This game I'm"
	line "playing isn't going"
	cont "to be out here for"
	cont "at least a year!"
	done

PectiniaArcadeRewardIntroText:
	text "You're a trainer,"
	line "right?"

	para "Have you checked"
	line "out the BATTLE"
	cont "SUBWAY yet?"

	para "I like to keep up"
	line "with the high"
	cont "scores people set."

	para "I always love to"
	line "meet those who can"
	cont "get a really good"
	cont "streak going!"
	done

PectiniaArcadeRewardReceiveText:
	text "You got a streak"
	line "of @"
	deciram wScriptVar, 1, 3
	text "? Fantastic!"

	para "You've earned this"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

PectiniaArcadeMaxStreakText:
	text "Woah! You got a"
	line "streak of 999 on"
	cont "the BATTLE SUBWAY?"

	para "You must really"
	line "be some kind of"
	cont "amazing trainer!"

	para "I think you've"
	line "earned these"
	cont "MASTER BALLs!"
	done

PectiniaArcadeReceiveMasterBallText:
	text "<PLAYER> received"
	line "99 MASTER BALLs!"
	done

PectiniaArcadePutAwayMasterBallText:
	text "<PLAYER> put the"
	line "MASTER BALLs in"
	cont "the BALL POCKET."
	prompt

PectiniaArcadeRewardNoRoomText:
	text "I have more to"
	line "give you, but your"
	cont "PACK can't fit any"
	cont "more ITEMs."

	para "Clear out some"
	line "space, I'll hold"
	cont "onto it for you."
	done	

PectiniaArcadeRewardAfterText:
	text "Next time you get"
	line "a good streak,"
	cont "come see me."

	para "I'll have something"
	line "good to give you."
	done

PectiniaArcadeImportGameText:
	text "The text in this"
	line "game is in a dif-"
	cont "ferent language."
	done

PectiniaArcadeTrackballGameText:
	text "There's a man with"
	line "an axe running"
	cont "around a castle."

	para "It seems to be"
	line "controlled by a"
	cont "large ball and"
	cont "some buttons."
	done

PectiniaArcadeFightingGameText:
	text "The graphics on"
	line "this fighting game"
	cont "are amazing!"

	para "Everything is"
	line "rendered in 3D!"
	done

PectiniaArcadeSpaceshipGameText:
	text "A space ship needs"
	line "to move through a"
	cont "whole screen of"
	cont "enemy projectiles."

	para "Wow! This does"
	line "look difficult!"
	done

PectiniaArcadeRacingGameText:
	text "This racing game"
	line "with hovering cars"
	cont "looks really fast!"
	done

PectiniaArcadePosterText:
	text "It's a poster"
	line "advertising the"
	cont "new games coming"
	cont "out soon."
	done

PectiniaArcade_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 17, PECTINIA_MALL, 9
	warp_event  5, 17, PECTINIA_MALL, 9

	db 0 ; coord events

	db 9 ; bg events
	bg_event 13, 13, BGEVENT_UP, PectiniaArcadeImportGame
	bg_event 14, 13, BGEVENT_UP, PectiniaArcadeImportGame
	bg_event  5,  3, BGEVENT_UP, PectiniaArcadeTrackballGame
	bg_event 12,  9, BGEVENT_UP, PectiniaArcadeFightingGame
	bg_event  0, 15, BGEVENT_UP, PectiniaArcadeSpaceshipGame
	bg_event  2, 15, BGEVENT_UP, PectiniaArcadeSpaceshipGame
	bg_event  9, 15, BGEVENT_UP, PectiniaArcadeRacingGame
	bg_event 10, 15, BGEVENT_UP, PectiniaArcadeRacingGame
	bg_event  8,  2, BGEVENT_UP, PectiniaArcadePoster

	db 15 ; object events
	object_event 12,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PectiniaArcadeClerk, -1
	object_event  1, 16, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PectiniaArcadeYoungster1, -1
	object_event 14, 10, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PectiniaArcadeBlackbelt, -1
	object_event 11, 16, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PectiniaArcadeBugCatcher, -1
	object_event  8, 16, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, PectiniaArcadeSuperNerd, -1
	object_event  7, 16, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PectiniaArcadeFisher, -1
	object_event  7,  4, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PectiniaArcadeScientist, -1
	object_event  6,  4, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PectiniaArcadeRocker1, -1
	object_event  4,  4, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, PectiniaArcadeCooltrainer1, -1
	object_event  3,  4, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PectiniaArcadeRocker2, -1
	object_event  4,  9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, NITE, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, PectiniaArcadeCardYoungster, -1
	object_event  1,  9, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, NITE, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PectiniaArcadeCardSuperNerd, -1
	object_event 13, 10, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PectiniaArcadeCooltrainer2, -1
	object_event 15, 14, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PectiniaArcadeLass, -1
	object_event  0,  3, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PectiniaArcadeSubwayRewardGuy, -1
