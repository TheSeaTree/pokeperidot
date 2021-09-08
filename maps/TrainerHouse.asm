	const_def 2 ; object constants
	const TRAINERHOUSE_SCIENTIST1
	const TRAINERHOUSE_SCIENTIST2
	const TRAINERHOUSE_SCIENTIST3
	const TRAINERHOUSE_TRAINER1
	const TRAINERHOUSE_TRAINER2
	const TRAINERHOUSE_TRAINER3
	const TRAINERHOUSE_TRAINER4
	const TRAINERHOUSE_TRAINER5
	const TRAINERHOUSE_TRAINER6
	const TRAINERHOUSE_TRAINER7
	const TRAINERHOUSE_TRAINER8

TrainerHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerHouseBattleRegistration:
	faceobject TRAINERHOUSE_SCIENTIST3, PLAYER
	faceobject PLAYER, TRAINERHOUSE_SCIENTIST3
	opentext
	checkevent EVENT_TRAINER_HOUSE_EARNED_CONSOLATION_PRIZE
	iftrue .SinglePearl
	checkevent EVENT_TRAINER_HOUSE_EARNED_PEARL
	iftrue .TwoPearls
	checkevent EVENT_TRAINER_HOUSE_EARNED_STARDUST
	iftrue .TwoStardust
	checkevent EVENT_TRAINER_HOUSE_EARNED_BIG_PEARL
	iftrue .BigPearl
	checkevent EVENT_TRAINER_HOUSE_EARNED_NUGGET
	iftrue .GiveNugget	
	checkevent EVENT_ENTERED_KNOCKOUT_CHALLENGE
	iftrue .Explained
	writetext TrainerHouseExplainText
	waitbutton
	jump .Payment
.Explained
	writetext TrainerHouseRegistrationText
	waitbutton
.Payment
	writetext TrainerHouseEntreFeeText
	special PlaceMoneyTopRight
	yesorno
	iffalse .DeclineEntry
	checkmoney YOUR_MONEY, 4000
	ifequal HAVE_LESS, .NotEnoughMoney
	takemoney YOUR_MONEY, 4000
	special PlaceMoneyTopRight
	setevent EVENT_ENTERED_KNOCKOUT_CHALLENGE
	writetext TrainerHouseAcceptText
	waitbutton
	closetext
	loadvar wTrainerHouseStreak, 0
	checkcode VAR_YCOORD
	ifequal 7, .Left
	applymovement PLAYER, TrainerHousePlayerApproachBelowMovement
.Left
	applymovement PLAYER, TrainerHousePlayerApproachMovement
	jump .Loop
	
.NotEnoughMoney
	writetext TrainerHouseNotEnoughMoneyText
	waitbutton
	closetext
	end

.DeclineEntry
	writetext TrainerHouseDeclineText
	waitbutton
	closetext
	checkcode VAR_YCOORD
	ifnotequal 7, .SkipStepDown
	applymovement PLAYER, TrainerHousePlayerStepAway
.SkipStepDown
	end

.Loop
	random 8
	ifequal 1, .PokefanIrving
	ifequal 2, .GentlemanRon
	ifequal 3, .TeacherCecelia
	ifequal 4, .SuperNerdNorbert
	ifequal 5, .BeautyGrace
	ifequal 6, .CooltrainerEdgar
	ifequal 7, .CooltrainerAbby

	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .Loop
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	moveobject TRAINERHOUSE_TRAINER1, 15, 0
	appear TRAINERHOUSE_TRAINER1
	applymovement TRAINERHOUSE_TRAINER1, TrainerHouseTrainerApproachMovement
	
	winlosstext TrainerHousePlaceholderWinText, TrainerHousePlaceholderLossText
    loadtrainer POKEFANF, FELICIA

	writecode VAR_BATTLETYPE, BATTLETYPE_NOCASH
	startbattle
	reloadmap
	setlasttalked TRAINERHOUSE_TRAINER1
	applymovement TRAINERHOUSE_TRAINER1, TrainerHouseTrainerLeaveMovement
	moveobject TRAINERHOUSE_TRAINER1, 15, -2
	ifnotequal $0, .GetReward
	jump .CheckStreak

.PokefanIrving:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftrue .Loop
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	moveobject TRAINERHOUSE_TRAINER2, 15, 0
	appear TRAINERHOUSE_TRAINER2
	applymovement TRAINERHOUSE_TRAINER2, TrainerHouseTrainerApproachMovement

	winlosstext TrainerHousePlaceholderWinText, TrainerHousePlaceholderLossText
    loadtrainer POKEFANM, IRVING
	
	writecode VAR_BATTLETYPE, BATTLETYPE_NOCASH
	startbattle
	reloadmap
	setlasttalked TRAINERHOUSE_TRAINER2
	applymovement TRAINERHOUSE_TRAINER2, TrainerHouseTrainerLeaveMovement
	moveobject TRAINERHOUSE_TRAINER2, 15, -2
	ifnotequal $0, .GetReward
	jump .CheckStreak

.GentlemanRon:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	iftrue .Loop
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	moveobject TRAINERHOUSE_TRAINER3, 15, 0
	appear TRAINERHOUSE_TRAINER3
	applymovement TRAINERHOUSE_TRAINER3, TrainerHouseTrainerApproachMovement

	winlosstext TrainerHousePlaceholderWinText, TrainerHousePlaceholderLossText
    loadtrainer GENTLEMAN, RON
	
	writecode VAR_BATTLETYPE, BATTLETYPE_NOCASH
	startbattle
	reloadmap
	setlasttalked TRAINERHOUSE_TRAINER3
	applymovement TRAINERHOUSE_TRAINER3, TrainerHouseTrainerLeaveMovement
	moveobject TRAINERHOUSE_TRAINER3, 15, -2
	ifnotequal $0, .GetReward
	jump .CheckStreak

.TeacherCecelia:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_4
	iftrue .Loop
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_4
	moveobject TRAINERHOUSE_TRAINER4, 15, 0
	appear TRAINERHOUSE_TRAINER4
	applymovement TRAINERHOUSE_TRAINER4, TrainerHouseTrainerApproachMovement

	winlosstext TrainerHousePlaceholderWinText, TrainerHousePlaceholderLossText
    loadtrainer TEACHER, CECELIA

	writecode VAR_BATTLETYPE, BATTLETYPE_NOCASH
	startbattle
	reloadmap
	setlasttalked TRAINERHOUSE_TRAINER4
	applymovement TRAINERHOUSE_TRAINER4, TrainerHouseTrainerLeaveMovement
	moveobject TRAINERHOUSE_TRAINER4, 15, -2
	ifnotequal $0, .GetReward
	jump .CheckStreak

.SuperNerdNorbert:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_5
	iftrue .Loop
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_5
	moveobject TRAINERHOUSE_TRAINER5, 15, 0
	appear TRAINERHOUSE_TRAINER5
	applymovement TRAINERHOUSE_TRAINER5, TrainerHouseTrainerApproachMovement

	winlosstext TrainerHousePlaceholderWinText, TrainerHousePlaceholderLossText
    loadtrainer SUPER_NERD, NORBERT

	writecode VAR_BATTLETYPE, BATTLETYPE_NOCASH
	startbattle
	reloadmap
	setlasttalked TRAINERHOUSE_TRAINER5
	applymovement TRAINERHOUSE_TRAINER5, TrainerHouseTrainerLeaveMovement
	moveobject TRAINERHOUSE_TRAINER5, 15, -2
	ifnotequal $0, .GetReward
	jump .CheckStreak

.BeautyGrace:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_6
	iftrue .Loop
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_6
	moveobject TRAINERHOUSE_TRAINER6, 15, 0
	appear TRAINERHOUSE_TRAINER6
	applymovement TRAINERHOUSE_TRAINER6, TrainerHouseTrainerApproachMovement

	winlosstext TrainerHousePlaceholderWinText, TrainerHousePlaceholderLossText
    loadtrainer BEAUTY, GRACE

	writecode VAR_BATTLETYPE, BATTLETYPE_NOCASH
	startbattle
	reloadmap
	setlasttalked TRAINERHOUSE_TRAINER6
	applymovement TRAINERHOUSE_TRAINER6, TrainerHouseTrainerLeaveMovement
	moveobject TRAINERHOUSE_TRAINER6, 15, -2
	ifnotequal $0, .GetReward
	jump .CheckStreak

.CooltrainerEdgar:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_7
	iftrue .Loop
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_7
	moveobject TRAINERHOUSE_TRAINER7, 15, 0
	appear TRAINERHOUSE_TRAINER7
	applymovement TRAINERHOUSE_TRAINER7, TrainerHouseTrainerApproachMovement

	winlosstext TrainerHousePlaceholderWinText, TrainerHousePlaceholderLossText
    loadtrainer COOLTRAINERM, EDGAR

	writecode VAR_BATTLETYPE, BATTLETYPE_NOCASH
	startbattle
	reloadmap
	setlasttalked TRAINERHOUSE_TRAINER7
	applymovement TRAINERHOUSE_TRAINER7, TrainerHouseTrainerLeaveMovement
	moveobject TRAINERHOUSE_TRAINER7, 15, -2
	ifnotequal $0, .GetReward
	jump .CheckStreak

.CooltrainerAbby:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_8
	iftrue .Loop
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_8
	moveobject TRAINERHOUSE_TRAINER8, 15, 0
	appear TRAINERHOUSE_TRAINER8
	applymovement TRAINERHOUSE_TRAINER8, TrainerHouseTrainerApproachMovement

	winlosstext TrainerHousePlaceholderWinText, TrainerHousePlaceholderLossText
    loadtrainer COOLTRAINERF, ABBY

	writecode VAR_BATTLETYPE, BATTLETYPE_NOCASH
	startbattle
	reloadmap
	setlasttalked TRAINERHOUSE_TRAINER8
	applymovement TRAINERHOUSE_TRAINER8, TrainerHouseTrainerLeaveMovement
	moveobject TRAINERHOUSE_TRAINER8, 15, -2
	ifnotequal $0, .GetReward
	jump .CheckStreak

.CheckStreak
	copybytetovar wTrainerHouseStreak
	addvar 1
	copyvartobyte wTrainerHouseStreak
	ifequal 4, .GetReward
	jump .Loop

.GetReward
	special HealParty
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_4
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_5
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_6
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_7
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_8

	applymovement PLAYER, TrainerHousePlayerLeaveMovement

	opentext
	copybytetovar wTrainerHouseStreak
	ifequal 0, .SinglePearl
	ifequal 1, .TwoPearls
	ifequal 2, .TwoStardust
	ifequal 3, .BigPearl
	checkevent EVENT_GOT_TM_HYPER_BEAM
	iftrue .GiveNugget
	writetext TrainerHouseTMHyperBeamPrize
	waitbutton
	verbosegiveitem TM_HYPER_BEAM
	setevent EVENT_GOT_TM_HYPER_BEAM
	writetext TrainerHouseAlsoWinNuggetText
	waitbutton
	verbosegiveitem NUGGET
	iftrue .ReceivedItem
	setevent EVENT_TRAINER_HOUSE_EARNED_NUGGET
	jump .NoRoomForPrize

.SinglePearl:
	writetext TrainerHouseZeroStreakPrizeText
	waitbutton
	verbosegiveitem PEARL
	iftrue .ReceivedItem
	setevent EVENT_TRAINER_HOUSE_EARNED_CONSOLATION_PRIZE
	jump .NoRoomForPrize

.TwoPearls:
	writetext TrainerHouseOneStreakPrizeText
	waitbutton
	giveitem PEARL, 2
	itemtotext PEARL, MEM_BUFFER_1
	iffalse .NoRoomForPearls
	itemtotext PEARL, MEM_BUFFER_1
	writetext TrainerHouseGiveTwoItemsText
	playsound SFX_ITEM
	waitbutton
	jump .ReceivedItem
	
.NoRoomForPearls:
	setevent EVENT_TRAINER_HOUSE_EARNED_PEARL
	jump .NoRoomForPrize

.TwoStardust:
	writetext TrainerHouseTwoStreakPrizeText
	waitbutton
	giveitem STARDUST, 2
	iffalse .NoRoomForStardust
	itemtotext STARDUST, MEM_BUFFER_1
	writetext TrainerHouseGiveTwoItemsText
	playsound SFX_ITEM
	waitbutton
	jump .ReceivedItem

.NoRoomForStardust:
	setevent EVENT_TRAINER_HOUSE_EARNED_STARDUST
	jump .NoRoomForPrize

.BigPearl:
	writetext TrainerHouseThreeStreakPrizeText
	waitbutton
	verbosegiveitem BIG_PEARL
	iftrue .ReceivedItem
	setevent EVENT_TRAINER_HOUSE_EARNED_BIG_PEARL
	jump .NoRoomForPrize

.GiveNugget:
	writetext TrainerHouseFourStreakPrizeText
	waitbutton
	verbosegiveitem NUGGET
	iftrue .ReceivedItem
	setevent EVENT_TRAINER_HOUSE_EARNED_NUGGET
	jump .NoRoomForPrize
.ReceivedItem:
	clearevent EVENT_TRAINER_HOUSE_EARNED_CONSOLATION_PRIZE
	clearevent EVENT_TRAINER_HOUSE_EARNED_PEARL
	clearevent EVENT_TRAINER_HOUSE_EARNED_STARDUST
	clearevent EVENT_TRAINER_HOUSE_EARNED_BIG_PEARL
	clearevent EVENT_TRAINER_HOUSE_EARNED_NUGGET
	writetext TrainerHouseComeAgainText
	waitbutton
	closetext
	checkcode VAR_YCOORD
	ifnotequal 7, .SkipStepDownAfterPrize
	applymovement PLAYER, TrainerHousePlayerStepAway
.SkipStepDownAfterPrize:
	turnobject TRAINERHOUSE_SCIENTIST3, DOWN
	end

.NoRoomForPrize:
	writetext TrainerHouseNoRoomForPrizeText
	waitbutton
	closetext
	checkcode VAR_YCOORD
	ifnotequal 7, .SkipStepDownAfterPackFull
	applymovement PLAYER, TrainerHousePlayerStepAway
.SkipStepDownAfterPackFull:
	turnobject TRAINERHOUSE_SCIENTIST3, DOWN
	end

TrainerHouseScientistExplain:
	jumptextfaceplayer TrainerHouseScientistExplainText

TrainerHousePlayerApproachBelowMovement:
	step LEFT
	step UP
	step_resume

TrainerHousePlayerApproachMovement:
	step UP
	step UP
	step UP
	step RIGHT
	step_resume
	
TrainerHousePlayerStepAway:
	step DOWN
	step_resume
	
TrainerHousePlayerLeaveMovement:
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	turn_head RIGHT
	step_resume

TrainerHouseTrainerApproachMovement:
	show_person
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step_end
	
TrainerHouseTrainerLeaveMovement:
	step RIGHT
	step RIGHT
	step UP
	step UP
	step UP
	step UP
	hide_person
	step_resume

TrainerHouseScientistExplainText:
	text "Hello!"
	
	para "Welcome to the"
	line "TRAINER HOUSE!"
	
	para "In this facility,"
	line "we allow trainers"
	cont "to battle their"
	cont "#MON in prep-"
	cont "aration for the"
	cont "#MON LEAGUE."
	
	para "If you would like"
	line "to take part in"
	cont "the challenge,"
	cont "visit the front"
	cont "desk for more in-"
	cont "formation."
	done
	
TrainerHouseExplainText:
	text "Welcome to the"
	line "TRAINER HOUSE."
	
	para "This desk is where"
	line "you can register"
	cont "for the knockout"
	cont "challenge."
	
	para "You will battle"
	line "four opponents in"
	cont "a row. Defeating"
	cont "any trainers will"
	cont "earn you a prize."
	
	para "Defeating all four"
	line "trainers in a row"
	cont "will get you our"
	cont "GRAND PRIZE."
	done

TrainerHouseRegistrationText:
	text "Welcome back to"
	line "the TRAINER HOUSE."
	
	para "Are you interested"
	line "in taking on the"
	cont "knockout challenge"
	cont "once more?"
	done

TrainerHouseEntreFeeText:	
	text "The entry fee is"
	line "¥4000, okay?"
	done	

TrainerHouseNotEnoughMoneyText:
	text "I'm terribly sorry,"
	line "but you don't have"
	cont "enough money to"
	cont "enter right now."
	
	para "Please come back"
	line "later."
	done
	
TrainerHouseAcceptText:
	text "Right this way."
	
	para "You will meet your"
	line "opponent shortly."
	done
	
TrainerHouseDeclineText:
	text "The TRAINER HOUSE"
	line "is always open,"
	cont "should you recon-"
	cont "sider."
	done

TrainerHouseZeroStreakPrizeText:
	text "For participating,"
	line "you will receive a"
	cont "PEARL."
	done
	
TrainerHouseOneStreakPrizeText:
	text "Defeating one"
	line "trainer has earned"
	cont "you two PEARLs."
	done

TrainerHouseTwoStreakPrizeText:
	text "A streak of two"
	line "wins earns you a"
	cont "pair of STARDUST."
	done

TrainerHouseThreeStreakPrizeText:
	text "Ah, so close…"
	
	para "Winning three"
	line "battles in a row"
	cont "earns a BIG PEARL."
	done
	
TrainerHouseTMHyperBeamPrize:
	text "Congratulations on"
	line "defeating all four"
	cont "trainers we had"
	cont "set up for you!"
	
	para "You have won our"
	line "GRAND PRIZE! TM20,"
	cont "HYPER BEAM!"
	done
	
TrainerHouseAlsoWinNuggetText:
	text "You have also won"
	line "a NUGGET."
	done

TrainerHouseFourStreakPrizeText:
	text "Congratulations!"
	
	para "For defeating all"
	line "four trainers in a"
	cont "row, you have"
	cont "earned a NUGGET!"
	done

TrainerHouseComeAgainText:
	text "We hope you visit"
	line "the TRAINER HOUSE"
	cont "in the future for"
	cont "more challenges."
	done
	
TrainerHouseGiveTwoItemsText:
	text "<PLAYER> received"
	line "two @"
	text_ram wStringBuffer4
	text "s."
	done

TrainerHouseNoRoomForPrizeText:
	text "You seem to have"
	line "no room for your"
	cont "prize."
	
	para "I'll hold onto it"
	line "while you make"
	cont "some room in your"
	cont "PACK."
	done

TrainerHousePlaceholderWinText:
	text "Yeahhh"
	done
	
TrainerHousePlaceholderLossText:
	text "Nahhh"
	done

TrainerHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2, 15, POKEMON_LEAGUE, 6
	warp_event  3, 15, POKEMON_LEAGUE, 6

	db 1 ; coord events
	coord_event 11,  7, -1, TrainerHouseBattleRegistration

	db 0 ; bg events

	db 11 ; object events
	object_event  2, 11, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TrainerHouseScientistExplain, -1
	object_event  8, 14, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1 ; Desk NPC
	object_event 12,  7, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TrainerHouseBattleRegistration, -1
	object_event 15, -2, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1 ; Pokefan Felicia
	object_event 15, -2, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1 ; Pokefan Irving
	object_event 15, -2, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1 ; Gentleman Ron
	object_event 15, -2, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1 ; Teacher Cecelia
	object_event 15, -2, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1 ; Super Nerd Norbert
	object_event 15, -2, SPRITE_BUENA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1 ; Beauty Grace
	object_event 15, -2, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1 ; Cooltrainer Edgar
	object_event 15, -2, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1 ; Cooltrainer Abby
