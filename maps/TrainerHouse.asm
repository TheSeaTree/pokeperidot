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
	const TRAINERHOUSE_RECEPTIONIST

TrainerHouse_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene ; SCENE_DEFAULT
	scene_script .LoadTrainerBattle ; SCENE_FINISHED

	db 0 ; callbacks

.LoadTrainerBattle
	scall TrainerHouse_LoadTrainer

.DummyScene
	end

TrainerHouseBattleRegistration:
	opentext
	checkevent EVENT_TRAINER_HOUSE_EARNED_CONSOLATION_PRIZE
	iftrue .PickUpReward
	checkevent EVENT_TRAINER_HOUSE_EARNED_PEARL
	iftrue .PickUpReward
	checkevent EVENT_TRAINER_HOUSE_EARNED_STARDUST
	iftrue .PickUpReward
	checkevent EVENT_TRAINER_HOUSE_EARNED_BIG_PEARL
	iftrue .PickUpReward
	checkevent EVENT_TRAINER_HOUSE_EARNED_STAR_PIECE
	iftrue .PickUpReward
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
	checkmoney YOUR_MONEY, 2500
	ifequal HAVE_LESS, .NotEnoughMoney
	takemoney YOUR_MONEY, 2500
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	setevent EVENT_ENTERED_KNOCKOUT_CHALLENGE
	writetext TrainerHouseAcceptText
	waitbutton
	closetext
	loadvar wTrainerHouseStreak, 0
	follow TRAINERHOUSE_SCIENTIST2, PLAYER
	applymovement TRAINERHOUSE_SCIENTIST2, TrainerHouseScientistLeadPlayerMovement
	stopfollow
	applymovement PLAYER, TrainerHousePlayerApproachMovement
	setscene SCENE_FINISHED
	warpcheck
	end
	
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

.PickUpReward:
	writetext TrainerHousePickUpRewardText
	waitbutton
	closetext
	end

TrainerHouse_LoadTrainer:
	applymovement PLAYER, TrainerHousePlayerApproachMovement2
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
	playsound SFX_EXIT_BUILDING
	applymovement TRAINERHOUSE_TRAINER1, TrainerHouseTrainerApproachMovement

	opentext
	writetext PokefanFeliciaText
	waitbutton
	closetext

	setlasttalked TRAINERHOUSE_TRAINER1
	winlosstext PokefanFeliciaWinText, PokefanFeliciaLossText
    loadtrainer POKEFANF, FELICIA
	scall .DoBattle
	ifnotequal $0, .ChallengeDefeat
	applymovement TRAINERHOUSE_TRAINER1, TrainerHouseTrainerLeaveMovement
	jump .CheckStreak

.PokefanIrving:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftrue .Loop
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	playsound SFX_EXIT_BUILDING
	applymovement TRAINERHOUSE_TRAINER2, TrainerHouseTrainerApproachMovement

	opentext
	writetext PokefanIrvingText
	waitbutton
	closetext

	setlasttalked TRAINERHOUSE_TRAINER2
	winlosstext PokefanIrvingWinText, PokefanIrvingLossText
    loadtrainer POKEFANM, IRVING
	scall .DoBattle
	ifnotequal $0, .ChallengeDefeat
	applymovement TRAINERHOUSE_TRAINER2, TrainerHouseTrainerLeaveMovement
	jump .CheckStreak

.GentlemanRon:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	iftrue .Loop
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	playsound SFX_EXIT_BUILDING
	applymovement TRAINERHOUSE_TRAINER3, TrainerHouseTrainerApproachMovement

	opentext
	writetext GentlemanRonText
	waitbutton
	closetext

	setlasttalked TRAINERHOUSE_TRAINER3
	winlosstext GentlemanRonWinText, GentlemanRonLossText
    loadtrainer GENTLEMAN, RON
	scall .DoBattle
	ifnotequal $0, .ChallengeDefeat
	applymovement TRAINERHOUSE_TRAINER3, TrainerHouseTrainerLeaveMovement
	jump .CheckStreak

.TeacherCecelia:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_4
	iftrue .Loop
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_4
	playsound SFX_EXIT_BUILDING
	applymovement TRAINERHOUSE_TRAINER4, TrainerHouseTrainerApproachMovement

	opentext
	writetext TeacherCeceliaText
	waitbutton
	closetext

	setlasttalked TRAINERHOUSE_TRAINER4
	winlosstext TeacherCeceliaWinText, TeacherCeceliaLossText
    loadtrainer TEACHER, CECELIA
	scall .DoBattle
	ifnotequal $0, .ChallengeDefeat
	applymovement TRAINERHOUSE_TRAINER4, TrainerHouseTrainerLeaveMovement
	jump .CheckStreak

.SuperNerdNorbert:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_5
	iftrue .Loop
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_5
	playsound SFX_EXIT_BUILDING
	applymovement TRAINERHOUSE_TRAINER5, TrainerHouseTrainerApproachMovement

	opentext
	writetext SuperNerdNorbertText
	waitbutton
	closetext

	setlasttalked TRAINERHOUSE_TRAINER5
	winlosstext SuperNerdNorbertWinText, SuperNerdNorbertLossText
    loadtrainer SUPER_NERD, NORBERT
	scall .DoBattle
	ifnotequal $0, .ChallengeDefeat
	applymovement TRAINERHOUSE_TRAINER5, TrainerHouseTrainerLeaveMovement
	jump .CheckStreak

.BeautyGrace:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_6
	iftrue .Loop
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_6
	playsound SFX_EXIT_BUILDING
	applymovement TRAINERHOUSE_TRAINER6, TrainerHouseTrainerApproachMovement

	opentext
	writetext BeautyGraceText
	waitbutton
	closetext

	setlasttalked TRAINERHOUSE_TRAINER6
	winlosstext BeautyGraceWinText, BeautyGraceLossText
    loadtrainer BEAUTY, GRACE
	scall .DoBattle
	ifnotequal $0, .ChallengeDefeat
	applymovement TRAINERHOUSE_TRAINER6, TrainerHouseTrainerLeaveMovement
	jump .CheckStreak

.CooltrainerEdgar:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_7
	iftrue .Loop
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_7
	playsound SFX_EXIT_BUILDING
	applymovement TRAINERHOUSE_TRAINER7, TrainerHouseTrainerApproachMovement

	opentext
	writetext CooltrainerEdgarText
	waitbutton
	closetext

	setlasttalked TRAINERHOUSE_TRAINER7
	winlosstext CooltrainerEdgarWinText, CooltrainerEdgarLossText
    loadtrainer COOLTRAINERM, EDGAR
	scall .DoBattle
	ifnotequal $0, .ChallengeDefeat
	applymovement TRAINERHOUSE_TRAINER7, TrainerHouseTrainerLeaveMovement
	jump .CheckStreak

.CooltrainerAbby:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_8
	iftrue .Loop
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_8
	playsound SFX_EXIT_BUILDING
	applymovement TRAINERHOUSE_TRAINER8, TrainerHouseTrainerApproachMovement

	opentext
	writetext CooltrainerAbbyText
	waitbutton
	closetext

	setlasttalked TRAINERHOUSE_TRAINER8
	winlosstext CooltrainerAbbyWinText, CooltrainerAbbyLossText
    loadtrainer COOLTRAINERF, ABBY
	scall .DoBattle
	ifnotequal $0, .ChallengeDefeat
	applymovement TRAINERHOUSE_TRAINER8, TrainerHouseTrainerLeaveMovement

.CheckStreak
	playsound SFX_EXIT_BUILDING
	wait 8
	copybytetovar wTrainerHouseStreak
	addvar 1
	copyvartobyte wTrainerHouseStreak
	ifequal 4, .ChallengeVictory
	jump .Loop

.DoBattle
	writecode VAR_BATTLETYPE, BATTLETYPE_NOCASH
	startbattle
	reloadmap
	end

.ChallengeDefeat
	wait 8
.ChallengeVictory
	playsound SFX_ELEVATOR_END
	waitsfx
	opentext
	writetext TrainerHouseChallengeOverText
	waitbutton
	closetext
	special HealParty
	applymovement PLAYER, TrainerHousePlayerLeaveMovement
	setscene SCENE_DEFAULT
	warpcheck
	end

TrainerHouse_StreakOver:
	applymovement PLAYER, TrainerHousePlayerReturnToDesk
	applymovement TRAINERHOUSE_SCIENTIST2, TrainerHouseScientistLeadPlayerMovement
	applymovement PLAYER, TrainerHousePlayerOneStepDown
	follow PLAYER, TRAINERHOUSE_SCIENTIST2
	applymovement PLAYER, TrainerHousePlayerReturnToDesk
	stopfollow
	turnobject PLAYER, UP

TrainerHouse_GetReward:
	opentext
	copybytetovar wTrainerHouseStreak
	ifequal 0, .SinglePearl
	ifequal 1, .TwoPearls
	ifequal 2, .TwoStardust
	ifequal 3, .BigPearl
	checkevent EVENT_GOT_TM_HYPER_BEAM
	iftrue .GiveStarPiece
	writetext TrainerHouseTMHyperBeamPrize
	waitbutton
	verbosegiveitem TM_HYPER_BEAM
	setevent EVENT_GOT_TM_HYPER_BEAM
	writetext TrainerHouseAlsoWinNuggetText
	waitbutton
	giveitem STAR_PIECE, 3
	iffalse .NoRoomForStarPiece
	itemtotext STAR_PIECE, MEM_BUFFER_1
	writetext TrainerHouseGiveThreeItemsText
	playsound SFX_ITEM
	waitsfx
	jump .ReceivedItem

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
	waitsfx
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
	waitsfx
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

.GiveStarPiece:
	writetext TrainerHouseFourStreakPrizeText
	waitbutton
	giveitem STAR_PIECE, 3
	iffalse .NoRoomForStarPiece
	itemtotext STAR_PIECE, MEM_BUFFER_1
	writetext TrainerHouseGiveThreeItemsText
	playsound SFX_ITEM
	waitsfx
	jump .ReceivedItem

.NoRoomForStarPiece:
	setevent EVENT_TRAINER_HOUSE_EARNED_STAR_PIECE
	jump .NoRoomForPrize

.ReceivedItem:
	clearevent EVENT_TRAINER_HOUSE_EARNED_CONSOLATION_PRIZE
	clearevent EVENT_TRAINER_HOUSE_EARNED_PEARL
	clearevent EVENT_TRAINER_HOUSE_EARNED_STARDUST
	clearevent EVENT_TRAINER_HOUSE_EARNED_BIG_PEARL
	clearevent EVENT_TRAINER_HOUSE_EARNED_STAR_PIECE
	clearevent EVENT_TRAINER_HOUSE_RECEPTIONIST_ITEM
	writetext TrainerHouseComeAgainText
	waitbutton
	closetext
	end

.NoRoomForPrize:
	writetext TrainerHouseNoRoomForPrizeText
	waitbutton
	checkevent EVENT_TRAINER_HOUSE_RECEPTIONIST_ITEM
	iftrue .ReceptionistHasReward
	setevent EVENT_TRAINER_HOUSE_RECEPTIONIST_ITEM
	writetext TrainerHouseScientistNoRoomText
	waitbutton
	closetext
	end

.ReceptionistHasReward
	writetext TrainerHouseReceptionistNoRoomText
	waitbutton
	closetext
	end

TrainerHouseReceptionist:
	faceplayer
	checkevent EVENT_TRAINER_HOUSE_RECEPTIONIST_ITEM
	iftrue TrainerHouse_GetReward
	jumptext TrainerHouseReceptionistText

TrainerHouseComputerScientist:
	jumptextfaceplayer TrainerHouseComputerScientistText

TrainerHouseDataCollector:
	jumptextfaceplayer TrainerHouseDataCollectorText

TrainerHousePlayerApproachBelowMovement:
	step LEFT
	step UP
	step_resume

TrainerHouseScientistLeadPlayerMovement:
	step UP
	step RIGHT
	turn_head LEFT
	step_end

TrainerHousePlayerApproachMovement:
	step UP
	step UP
	step UP
	step UP
	step_end

TrainerHousePlayerApproachMovement2:
	step UP
	step UP
	step UP
	turn_head RIGHT
	step_resume
	
TrainerHousePlayerStepAway:
	step DOWN
	step_resume
	
TrainerHousePlayerLeaveMovement:
	step DOWN
TrainerHousePlayerReturnToDesk:
	step DOWN
TrainerHousePlayerOneStepDown:
	step DOWN
	step_resume

TrainerHouseTrainerApproachMovement:
	show_person
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	turn_head LEFT
	step_end

TrainerHouseTrainerLeaveMovement:
	step UP
	step UP
	step UP
	step UP
	hide_person
	step_resume

TrainerHouseComputerScientistText:
	text "We gather lots of"
	line "information from"
	cont "the battles that"
	cont "take place here."

	para "Of course, we"
	line "offer rewards in"
	cont "exchange for our"
	cont "data collection."
	done

TrainerHouseReceptionistText:
	text "Welcome to the"
	line "TRAINER HOUSE!"
	
	para "In this facility,"
	line "we allow trainers"
	cont "to battle their"
	cont "#MON in prep-"
	cont "aration for the"
	cont "#MON LEAGUE."

	para "If you would like"
	line "to issue a knock-"
	cont "out challenge,"
	cont "please refer to"
	cont "the other desk."
	done

TrainerHouseDataCollectorText:
	text "I need to change"
	line "out the tapes on"
	cont "these machines"
	cont "so often with the"
	cont "amount of data"
	cont "that we collect."

	para "I wish there was a"
	line "better technology"
	cont "for us to use."
	done

TrainerHouseExplainText:
	text "Welcome to the"
	line "TRAINER HOUSE."

	para "This is where you"
	line "can register for"
	cont "the knockout"
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
	line "¥2500, okay?"
	done	

TrainerHouseNotEnoughMoneyText:
	text "I'm terribly sorry,"
	line "but you don't have"
	cont "enough money to"
	cont "enter right now."
	
	para "Please come back"
	line "later."
	done

TrainerHousePickUpRewardText:
	text "I'm sorry. I cannot"
	line "allow you to issue"
	cont "another challenge"
	cont "at this time."

	para "You have not coll-"
	line "ected the reward"
	cont "from your previous"
	cont "challenge here."

	para "Please check in"
	line "with the receptio-"
	cont "nist to receive"
	cont "your prize."
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

TrainerHouseChallengeOverText:
	text "Attention, CHALL-"
	line "ENGER <PLAYER>."
	
	para "Your knockout"
	line "challenge is over."

	para "Please return to"
	line "the desk and coll-"
	cont "ect your prize."
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
	
	para "You have won the"
	line "GRAND PRIZE,"
	cont "TM20 - HYPER BEAM!"
	done

TrainerHouseAlsoWinNuggetText:
	text "You have also won"
	line "3 STAR PIECEs."
	done

TrainerHouseFourStreakPrizeText:
	text "Congratulations!"
	
	para "For defeating all"
	line "four trainers in a"
	cont "row, you have"
	cont "earned a trio of"
	cont "STAR PIECEs!"
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
	
TrainerHouseGiveThreeItemsText:
	text "<PLAYER> received"
	line "three @"
	text_ram wStringBuffer4
	text "s."
	done

TrainerHouseNoRoomForPrizeText:
	text "You seem to have"
	line "no room for your"
	cont "prize."
	done

TrainerHouseScientistNoRoomText:
	text "I will let the"
	line "receptionist hold"
	cont "onto your prize"
	cont "while you make"
	cont "room for it."
	done

TrainerHouseReceptionistNoRoomText:
	text "I'll hold onto it"
	line "while you make"
	cont "some room in your"
	cont "PACK."
	done

PokefanFeliciaText:
	text "My babies are very"
	line "tough. I've raised"
	cont "them strictly."
	done

PokefanFeliciaWinText:
	text "I have been too"
	line "lenient with my"
	cont "#MON."
	done

PokefanFeliciaLossText:
	text "See, babies?"

	para "That's what happens"
	line "when we work hard!"

	para "I'm so proud!"
	done

PokefanIrvingText:
	text "I sell all of my"
	line "prizes to buy lots"
	cont "of BERRIES!"
	done

PokefanIrvingWinText:
	text "That's just great."

	para "Now I'll have to"
	line "go pick my own"
	cont "BERRIES…"
	done

PokefanIrvingLossText:
	text "Ooh, I'll be able"
	line "to afford some"
	cont "good ones after"
	cont "this win!"
	done

GentlemanRonText:
	text "Can we make this"
	line "quick? I have a"
	cont "packed schedule."
	done

GentlemanRonWinText:
	text "I didn't want the"
	line "fight to end that"
	cont "quick."
	done

GentlemanRonLossText:
	text "You should have"
	line "thrown in the"
	cont "towel sooner."

	para "Now I'm going to be"
	line "late for my appoi-"
	cont "ntment."
	done

TeacherCeceliaText:
	text "Today's lesson:"

	para "How to lose with"
	line "dignity."
	done

TeacherCeceliaWinText:
	text "Good thing I'm not"
	line "a LASS anymore."

	para "I would be graded"
	line "so harshly!"
	done

TeacherCeceliaLossText:
	text "Have your MOM sign"
	line "this form and"
	cont "return it to me."
	done

BeautyGraceText:
	text "I'm training to be"
	line "a #MON NURSE."

	para "Let me damage your"
	line "#MON so I can"
	cont "make them healthy"
	cont "afterward!"
	done

BeautyGraceWinText:
	text "I need a doctor!"
	done

BeautyGraceLossText:
	text "I hope I didn't"
	line "hurt your #MON"
	cont "too badly!"
	done

SuperNerdNorbertText:
	text "I am collecting my"
	line "own data."

	para "I hope your"
	line "#MON will teach"
	cont "me something."
	done

SuperNerdNorbertWinText:
	text "Hm… Unfortunate."

	para "I will reflect on"
	line "my notes upstairs."
	done

SuperNerdNorbertLossText:
	text "Yes, I see…"

	para "According to my"
	line "calculations, your"
	cont "#MON were not up"
	cont "to the task of"
	cont "defeating mine."
	done

CooltrainerEdgarText:
	text "I met my #MON"
	line "in another region."

	para "Our bond cannot be"
	line "broken!"
	done

CooltrainerEdgarWinText:
	text "I'm sorry to have"
	line "failed you, team."

	para "You deserve a good"
	line "rest after that."
	done

CooltrainerEdgarLossText:
	text "Good job, team!"

	para "This trainer had"
	line "no chance against"
	cont "our bond!"
	done

CooltrainerAbbyText:
	text "Do you want to"
	line "meet my friends?"

	para "They're all very"
	line "strong."
	done

CooltrainerAbbyWinText:
	text "Can I get to know"
	line "your friends too?"

	para "They're so strong!"
	done

CooltrainerAbbyLossText:
	text "The secret to a"
	line "good friendship"
	cont "with #MON is to"
	cont "reward them nicely"
	cont "when they win."

	para "I'm taking them to"
	line "the CAFé!"
	done

TrainerHouse_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 17,  9, POKEMON_LEAGUE, 6
	warp_event 18,  9, POKEMON_LEAGUE, 6
	warp_event 18,  0, TRAINER_HOUSE, 4
	warp_event  2,  9, TRAINER_HOUSE, 3

	db 1 ; coord events
	coord_event 18,  1, SCENE_DEFAULT, TrainerHouse_StreakOver

	db 0 ; bg events

	db 12 ; object events
	object_event 23,  2, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TrainerHouseComputerScientist, -1
	object_event 18,  5, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TrainerHouseBattleRegistration, -1
	object_event 12,  2, SPRITE_SCIENTIST, SPRITEMOVEDATA_WANDER, 3, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TrainerHouseDataCollector, -1
	object_event  3,  1, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1 ; Pokefan Felicia
	object_event  3,  1, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1 ; Pokefan Irving
	object_event  3,  1, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1 ; Gentleman Ron
	object_event  3,  1, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1 ; Teacher Cecelia
	object_event  3,  1, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1 ; Super Nerd Norbert
	object_event  3,  1, SPRITE_BUENA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1 ; Beauty Grace
	object_event  3,  1, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1 ; Cooltrainer Edgar
	object_event  3,  1, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1 ; Cooltrainer Abby
	object_event 13,  8, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TrainerHouseReceptionist, -1
