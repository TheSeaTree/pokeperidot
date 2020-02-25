	const_def 2 ; object constants
	const MAHOGANYGYM_LEADER
	const MAHOGANYGYM_SCIENTIST1
	const MAHOGANYGYM_SCIENTIST2
	const MAHOGANYGYM_SCIENTIST3
	const MAHOGANYGYM_SCIENTIST4

MahoganyGym_MapScripts:
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_OBJECTS, .CheckTrainers
	callback MAPCALLBACK_TILES, .Cables

.CheckTrainers:
	checkevent EVENT_BEAT_SCIENTIST_ANDRE
	iffalse .skip1
	moveobject MAHOGANYGYM_SCIENTIST1, 14, 20
.skip1
	checkevent EVENT_BEAT_SCIENTIST_KURT
	iffalse .skip2
	moveobject MAHOGANYGYM_SCIENTIST2, 20, 16
.skip2
	checkevent EVENT_BEAT_SCIENTIST_DAVID
	iffalse .skip3
	moveobject MAHOGANYGYM_SCIENTIST3,  2, 20
.skip3
	checkevent EVENT_BEAT_SCIENTIST_SETH
	iffalse .skip4
	moveobject MAHOGANYGYM_SCIENTIST4, 15,  8
.skip4
	return
	
.Cables
	checkevent EVENT_MAHOGANY_GYM_SWITCH_1
	iffalse .skipcables1
	changeblock  4, 14, $67
	changeblock  6, 14, $5e
	changeblock  8, 14, $4d
	changeblock  2, 18, $69
	changeblock  4, 20, $60
	changeblock  4, 22, $62
	changeblock  6, 22, $65
	changeblock  8, 22, $61
	changeblock 10, 22, $64
	changeblock 10, 20, $60
	changeblock 10, 18, $50	
	changeblock 10, 16, $60
	changeblock 14, 18, $67
	changeblock 16, 20, $4e
	changeblock 18, 20, $5e
	changeblock 20, 20, $4d
	changeblock 22, 20, $6c
	changeblock 22, 16, $4c
	changeblock 22, 14, $6d
	changeblock 22, 10, $60
	changeblock 22,  8, $6b
.skipcables1
	checkevent EVENT_MAHOGANY_GYM_SWITCH_3
	iffalse .skipcables2
	changeblock  4, 14, $67
	changeblock  6, 14, $5e
	changeblock  8, 14, $4d
	changeblock 10, 14, $4d
	changeblock 14, 18, $67
	changeblock 16, 20, $4e
	changeblock 18, 20, $5e
	changeblock 20, 20, $4d
	changeblock 22, 20, $6d
	changeblock 12,  6, $6b
	changeblock 12,  8, $50
	changeblock 12, 10, $64
	changeblock 12, 14, $62
	changeblock 14, 14, $61
.skipcables2
	return
	
ElectricGymLeader:
	faceplayer
	checkevent EVENT_BEAT_JOEL
	iftrue .FightDone
	opentext
	writetext ElectricLeaderChallengeText
	waitbutton
	winlosstext ElectricLeaderWinText, 0
	loadtrainer JOEL, JOEL1
	startbattle
	reloadmapafterbattle
	setmapscene ECRUTEAK_CITY, SCENE_ECRUTEAKCITY_DONE
	setevent EVENT_BEAT_SCIENTIST_ANDRE
	setevent EVENT_BEAT_SCIENTIST_KURT
	setevent EVENT_BEAT_SCIENTIST_DAVID
	setevent EVENT_BEAT_SCIENTIST_SETH
	clearevent EVENT_MAHOGANY_GYM_SWITCH_4
	opentext
	writetext PlayerReceivedCogBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_MINERALBADGE
	setevent EVENT_BEAT_JOEL
.FightDone:
	opentext
	special HealParty
	checkevent EVENT_GOT_TM_THUNDERBOLT
	iftrue .GotThunderbolt
	writetext CogBadgeText
	buttonsound
	verbosegiveitem TM_THUNDERBOLT
	iffalse .NoRoomForThunderbolt
	setevent EVENT_GOT_TM_THUNDERBOLT

.GotThunderbolt:
	writetext ThunderboltTMText
	waitbutton
.NoRoomForThunderbolt:
	closetext
	end

MahoganyGymPod1:
	checkevent EVENT_BEAT_SCIENTIST_ANDRE
	iftrue .NoBattle
	moveobject MAHOGANYGYM_SCIENTIST1, 13, 19
	appear MAHOGANYGYM_SCIENTIST1
	applymovement MAHOGANYGYM_SCIENTIST1, TrainerApproach
	applymovement PLAYER, TrainerStepBack
	playmusic MUSIC_HIKER_ENCOUNTER
	opentext
	writetext ScientistAndreText
	waitbutton
	closetext
	winlosstext ScientistAndreWinText, 0
	loadtrainer SCIENTIST, ANDRE
	startbattle
	reloadmapafterbattle
	applymovement MAHOGANYGYM_SCIENTIST1, TrainerStepRight
	moveobject MAHOGANYGYM_SCIENTIST1, 14, 20
	setevent EVENT_BEAT_SCIENTIST_ANDRE
	end
.NoBattle
	opentext
	writetext AskUsePod
	yesorno
	iffalse .No
	closetext
	applymovement PLAYER, StepIntoPod
	playsound SFX_ENTER_DOOR
	wait 8
	playsound SFX_AEROBLAST
	waitsfx
	playsound SFX_THUNDER
	checkflag ENGINE_MINERALBADGE
	iftrue .Badge
	applymovement PLAYER, Pod1Movement
	waitsfx
.Exit
	playsound SFX_WARP_FROM
	waitsfx
	wait 2
	playsound SFX_EXIT_BUILDING
	applymovement PLAYER, StepOutPod
	end
	
.Badge
	applymovement PLAYER, Pod1Movement2
	jump .Exit
	
.No
	closetext
	end

MahoganyGymPod2:
	opentext
	writetext AskUsePod
	yesorno
	iffalse .No
	closetext
	applymovement PLAYER, StepIntoPod
	playsound SFX_ENTER_DOOR
	wait 8
	playsound SFX_AEROBLAST
	waitsfx
	playsound SFX_THUNDER
	checkevent EVENT_MAHOGANY_GYM_SWITCH_1
	iftrue .Switch1
	checkevent EVENT_MAHOGANY_GYM_SWITCH_3
	iftrue .Switch3
	applymovement PLAYER, Pod2Movement
.Exit
	waitsfx
	playsound SFX_WARP_FROM
	waitsfx
	wait 2
	playsound SFX_EXIT_BUILDING
	applymovement PLAYER, StepOutPod
	end
	
.Switch1
	applymovement PLAYER, Pod2Movement2
	jump .Exit
	
.Switch3
	applymovement PLAYER, Pod6Movement
	jump .Exit
	
.No
	closetext
	end

MahoganyGymPod3:
	checkevent EVENT_BEAT_SCIENTIST_KURT
	iftrue .NoBattle
	moveobject MAHOGANYGYM_SCIENTIST2, 19, 15
	appear MAHOGANYGYM_SCIENTIST2
	applymovement MAHOGANYGYM_SCIENTIST2, TrainerApproach
	applymovement PLAYER, TrainerStepBack
	playmusic MUSIC_HIKER_ENCOUNTER
	opentext
	writetext ScientistKurtText
	waitbutton
	closetext
	winlosstext ScientistKurtWinText, 0
	loadtrainer SCIENTIST, KURT
	startbattle
	reloadmapafterbattle
	applymovement MAHOGANYGYM_SCIENTIST2, TrainerStepRight
	moveobject MAHOGANYGYM_SCIENTIST2, 20, 16
	setevent EVENT_BEAT_SCIENTIST_KURT
	end
.NoBattle
	opentext
	writetext AskUsePod
	yesorno
	iffalse .No
	closetext
	applymovement PLAYER, StepIntoPod
	playsound SFX_ENTER_DOOR
	wait 8
	playsound SFX_AEROBLAST
	waitsfx
	playsound SFX_THUNDER
	checkevent EVENT_MAHOGANY_GYM_SWITCH_1
	iftrue .Switch1
	checkevent EVENT_MAHOGANY_GYM_SWITCH_3
	iftrue .Switch3
	applymovement PLAYER, Pod3Movement
.Exit
	waitsfx
	playsound SFX_WARP_FROM
	waitsfx
	wait 2
	playsound SFX_EXIT_BUILDING
	applymovement PLAYER, StepOutPod
	end
	
.Switch1
	applymovement PLAYER, Pod3Movement2
	jump .Exit

.Switch3
	applymovement PLAYER, Pod3Movement3
	jump .Exit
	
.No
	closetext
	end

MahoganyGymPod4:
	checkevent EVENT_MAHOGANY_GYM_SWITCH_1
	iftrue PodDoorSealed
	opentext
	writetext AskUsePod
	yesorno
	iffalse .No
	closetext
	applymovement PLAYER, StepIntoPod
	playsound SFX_ENTER_DOOR
	wait 8
	playsound SFX_AEROBLAST
	waitsfx
	playsound SFX_THUNDER
	applymovement PLAYER, Pod4Movement
	waitsfx
	playsound SFX_WARP_FROM
	waitsfx
	wait 2
	playsound SFX_EXIT_BUILDING
	applymovement PLAYER, StepOutPod
	end

.No
	closetext
	end

MahoganyGymPod5:
	checkevent EVENT_MAHOGANY_GYM_SWITCH_1
	iffalse PodDoorSealed
	checkevent EVENT_BEAT_SCIENTIST_DAVID
	iftrue .NoBattle
	moveobject MAHOGANYGYM_SCIENTIST3, 1, 19
	appear MAHOGANYGYM_SCIENTIST3
	applymovement MAHOGANYGYM_SCIENTIST3, TrainerApproach
	applymovement PLAYER, TrainerStepBack
	playmusic MUSIC_HIKER_ENCOUNTER
	opentext
	writetext ScientistDavidText
	waitbutton
	closetext
	winlosstext ScientistDavidWinText, 0
	loadtrainer SCIENTIST, DAVID
	startbattle
	reloadmapafterbattle
	applymovement MAHOGANYGYM_SCIENTIST3, TrainerStepRight
	moveobject MAHOGANYGYM_SCIENTIST3,  2, 20
	setevent EVENT_BEAT_SCIENTIST_DAVID
	end
.NoBattle
	opentext
	writetext AskUsePod
	yesorno
	iffalse .No
	closetext
	applymovement PLAYER, StepIntoPod
	playsound SFX_ENTER_DOOR
	wait 8
	playsound SFX_AEROBLAST
	waitsfx
	playsound SFX_THUNDER
	applymovement PLAYER, Pod5Movement
	waitsfx
	playsound SFX_WARP_FROM
	waitsfx
	wait 2
	playsound SFX_EXIT_BUILDING
	applymovement PLAYER, StepOutPod
	end
	
.No
	closetext
	end
	
MahoganyGymPod6:
	opentext
	writetext AskUsePod
	yesorno
	iffalse .No
	closetext
	applymovement PLAYER, StepIntoPod
	playsound SFX_ENTER_DOOR
	wait 8
	playsound SFX_AEROBLAST
	waitsfx
	playsound SFX_THUNDER
	checkevent EVENT_MAHOGANY_GYM_SWITCH_2
	iftrue .Switch2
	applymovement PLAYER, Pod6Movement
.Exit
	waitsfx
	playsound SFX_WARP_FROM
	waitsfx
	wait 2
	playsound SFX_EXIT_BUILDING
	applymovement PLAYER, StepOutPod
	end

.Switch2
	applymovement PLAYER, Pod6Movement2
	jump .Exit
	
.No
	closetext
	end

MahoganyGymPod7:
	checkevent EVENT_MAHOGANY_GYM_SWITCH_3
	iftrue PodDoorSealed
	opentext
	writetext AskUsePod
	yesorno
	iffalse .No
	closetext
	applymovement PLAYER, StepIntoPod
	playsound SFX_ENTER_DOOR
	wait 8
	playsound SFX_AEROBLAST
	waitsfx
	playsound SFX_THUNDER
	applymovement PLAYER, Pod7Movement
	waitsfx
	playsound SFX_WARP_FROM
	waitsfx
	wait 2
	playsound SFX_EXIT_BUILDING
	applymovement PLAYER, StepOutPod
	end

.No
	closetext
	end

MahoganyGymPod8:
	checkevent EVENT_MAHOGANY_GYM_SWITCH_3
	iffalse PodDoorSealed
	checkevent EVENT_BEAT_SCIENTIST_SETH
	iftrue .NoBattle
	moveobject MAHOGANYGYM_SCIENTIST4, 14, 7
	appear MAHOGANYGYM_SCIENTIST4
	applymovement MAHOGANYGYM_SCIENTIST4, TrainerApproach
	applymovement PLAYER, TrainerStepBack
	playmusic MUSIC_HIKER_ENCOUNTER
	opentext
	writetext ScientistSethText
	waitbutton
	closetext
	winlosstext ScientistSethWinText, 0
	loadtrainer SCIENTIST, SETH
	startbattle
	reloadmapafterbattle
	applymovement MAHOGANYGYM_SCIENTIST4, TrainerStepRight
	moveobject MAHOGANYGYM_SCIENTIST4, 15,  8
	setevent EVENT_BEAT_SCIENTIST_SETH
	end
.NoBattle
	opentext
	writetext AskUsePod
	yesorno
	iffalse .No
	closetext
	applymovement PLAYER, StepIntoPod
	playsound SFX_ENTER_DOOR
	wait 8
	playsound SFX_AEROBLAST
	waitsfx
	playsound SFX_THUNDER
	applymovement PLAYER, Pod8Movement
	waitsfx
	playsound SFX_WARP_FROM
	waitsfx
	wait 2
	playsound SFX_EXIT_BUILDING
	applymovement PLAYER, StepOutPod
	end
	
.No
	closetext
	end

MahoganyGymPod9:
	opentext
	writetext AskUsePod
	yesorno
	iffalse .No
	closetext
	applymovement PLAYER, StepIntoPod
	playsound SFX_ENTER_DOOR
	wait 8
	checkevent EVENT_MAHOGANY_GYM_SWITCH_4
	iftrue .Switch4
	playsound SFX_AEROBLAST
	waitsfx
	playsound SFX_THUNDER
	applymovement PLAYER, Pod2Movement2
	waitsfx
	playsound SFX_WARP_FROM
	waitsfx
	wait 2
	playsound SFX_EXIT_BUILDING
	applymovement PLAYER, StepOutPod
	end
	
.Switch4
	playsound SFX_METRONOME
	waitsfx
	playsound SFX_EGG_BOMB
	applymovement PLAYER, Pod9Movement2
	waitsfx
	earthquake 8
	playsound SFX_BURN
	waitsfx
	changeblock 10, 14, $4f
	changeblock 12, 14, $4e
	changeblock 10, 10, $4d
	changeblock  8, 10, $5e
	changeblock  6, 10, $4d
	changeblock  4, 10, $4e
	changeblock  4,  8, $4c
	changeblock  2,  6, $67
	opentext
	writetext PodOverloadText
	waitbutton
	closetext
	playsound SFX_EXIT_BUILDING
	applymovement PLAYER, StepOutPod
	end
	
.No
	closetext
	end

MahoganyGymPod10:
	checkflag ENGINE_MINERALBADGE
	iffalse PodDoorSealed
	opentext
	writetext AskUsePod
	yesorno
	iffalse .No
	closetext
	applymovement PLAYER, StepIntoPod
	playsound SFX_ENTER_DOOR
	wait 8
	playsound SFX_AEROBLAST
	waitsfx
	playsound SFX_THUNDER
	applymovement PLAYER, Pod10Movement
	waitsfx
	playsound SFX_WARP_FROM
	waitsfx
	wait 2
	playsound SFX_EXIT_BUILDING
	applymovement PLAYER, StepOutPod
	end
	
.No
	closetext
	end
	
PodDoorSealed:
	jumptext MahoganyGymPodDoorSealed
	
MahoganyGymPodSwitch1:
	opentext
	checkevent EVENT_MAHOGANY_GYM_SWITCH_1
	iftrue .Used
	writetext MahoganyGymPodAsk
	yesorno
	iffalse .No
	writetext MahoganyGymPodWhoWouldnt
	playsound SFX_ZAP_CANNON
	waitsfx
	changeblock  4, 14, $67
	changeblock  6, 14, $5e
	changeblock  8, 14, $4d
	changeblock  2, 18, $69
	changeblock  4, 20, $60
	changeblock  4, 22, $62
	changeblock  6, 22, $65
	changeblock  8, 22, $61
	changeblock 10, 22, $64
	changeblock 10, 20, $60
	changeblock 10, 18, $50	
	changeblock 10, 16, $60
	changeblock 14, 18, $67
	changeblock 16, 20, $4e
	changeblock 18, 20, $5e
	changeblock 20, 20, $4d
	changeblock 22, 20, $6c
	changeblock 22, 16, $4c
	changeblock 22, 14, $6d
	changeblock 22, 10, $60
	changeblock 22,  8, $6b
	reloadmappart
	setevent EVENT_MAHOGANY_GYM_SWITCH_1
	clearevent EVENT_MAHOGANY_GYM_SWITCH_2
	clearevent EVENT_MAHOGANY_GYM_SWITCH_3
	clearevent EVENT_MAHOGANY_GYM_SWITCH_4
.No
	closetext
	end
	
.Used
	writetext MahoganyGymSwitchActive
	waitbutton
	jump .No

MahoganyGymPodSwitch2:
	opentext
	checkevent EVENT_MAHOGANY_GYM_SWITCH_2
	iftrue .Used
	writetext MahoganyGymPodAsk
	yesorno
	iffalse .No
	writetext MahoganyGymPodWhoWouldnt
	playsound SFX_ZAP_CANNON
	waitsfx
	changeblock  2, 18, $67
	changeblock  4, 20, $4c
	changeblock  4, 22, $4e
	changeblock  6, 22, $5e
	changeblock  8, 22, $4d
	changeblock 10, 22, $52
	changeblock 10, 20, $4c
	changeblock 10, 18, $4e
	changeblock 10, 16, $4c
	changeblock 10, 14, $4f
	changeblock 12, 14, $4e
	changeblock 14, 14, $4d
	changeblock 16, 14, $5e
	changeblock 18, 14, $66
	changeblock 22, 14, $6c
	changeblock 22, 10, $4c
	changeblock 18,  8, $69
	changeblock 20,  8, $65
	changeblock 22,  8, $6b
	reloadmappart
	setevent EVENT_MAHOGANY_GYM_SWITCH_2
	clearevent EVENT_MAHOGANY_GYM_SWITCH_1
	clearevent EVENT_MAHOGANY_GYM_SWITCH_3
	clearevent EVENT_MAHOGANY_GYM_SWITCH_4	
.No
	closetext
	end

.Used
	writetext MahoganyGymSwitchActive
	waitbutton
	jump .No

MahoganyGymPodSwitch3:
	opentext
	checkevent EVENT_MAHOGANY_GYM_SWITCH_3
	iftrue .Used
	writetext MahoganyGymPodAsk
	yesorno
	iffalse .No
	writetext MahoganyGymPodWhoWouldnt
	playsound SFX_ZAP_CANNON
	waitsfx
	changeblock 18,  8, $67
	changeblock 20,  8, $5e
	changeblock 22,  8, $6a
	changeblock 12,  6, $6b
	changeblock 12,  8, $50
	changeblock 12, 10, $64
	changeblock 12, 14, $62
	changeblock 14, 14, $61
	changeblock 16, 14, $65
	changeblock 18, 14, $68
	changeblock 22, 14, $6f
	changeblock 22, 16, $60
	changeblock 22, 20, $6d
	reloadmappart
	setevent EVENT_MAHOGANY_GYM_SWITCH_3
	clearevent EVENT_MAHOGANY_GYM_SWITCH_1
	clearevent EVENT_MAHOGANY_GYM_SWITCH_2
	clearevent EVENT_MAHOGANY_GYM_SWITCH_4	
.No
	closetext
	end	

.Used
	writetext MahoganyGymSwitchActive
	waitbutton
	jump .No

MahoganyGymPodSwitch4:
	opentext
	checkevent EVENT_MAHOGANY_GYM_SWITCH_4
	iftrue .Used
	writetext MahoganyGymPodAsk
	yesorno
	iffalse .No
	writetext MahoganyGymPodWhoWouldnt
	playsound SFX_ZAP_CANNON
	waitsfx
	changeblock 12,  6, $6a
	changeblock 12,  8, $4e
	changeblock 12, 10, $52
	changeblock 12, 14, $50
	changeblock 14, 14, $4d
	changeblock 16, 14, $5e
	changeblock 18, 14, $66
	changeblock 22, 14, $6c
	changeblock 22, 16, $4c
	changeblock 22, 20, $6f
	changeblock 20, 20, $61
	changeblock 18, 20, $65
	changeblock 16, 20, $62
	changeblock 14, 18, $69
	changeblock 12, 18, $68
	changeblock 10, 18, $62
	changeblock 10, 16, $60
	changeblock 10, 14, $63
	changeblock 12, 14, $50
	changeblock 10, 10, $61
	changeblock  8, 10, $65
	changeblock  6, 10, $61
	changeblock  4, 10, $62
	changeblock  4,  8, $60
	changeblock  2,  6, $69
	reloadmappart
	setevent EVENT_MAHOGANY_GYM_SWITCH_4
	clearevent EVENT_MAHOGANY_GYM_SWITCH_1
	clearevent EVENT_MAHOGANY_GYM_SWITCH_2
	clearevent EVENT_MAHOGANY_GYM_SWITCH_3
.No
	closetext
	end
	
.Used
	writetext MahoganyGymSwitchActive
	waitbutton
	jump .No
	
ScientistAndre:
	jumptextfaceplayer ScientistAndreAfterText

ScientistKurt:
	jumptextfaceplayer ScientistKurtAfterText

ScientistDavid:
	jumptextfaceplayer ScientistDavidAfterText

ScientistSeth:
	jumptextfaceplayer ScientistSethAfterText
	
MahoganyGymExit:
	checkflag ENGINE_MINERALBADGE
	iftrue .Leave
	jumpstd cantleavegym
	end

.Leave
	opentext
	writetext MahoganyGymHaveBadge
	waitbutton
	closetext
	applymovement PLAYER, MahoganyLeaveGym
	special FadeOutPalettes
	playsound SFX_EXIT_BUILDING
	wait 4
	warpfacing DOWN, MAHOGANY_TOWN, 24, 13
	end
	
MahoganyLeaveGym:
	turn_step DOWN
	step_end
	
MahoganyGymHaveBadge:
	text "<PLAYER> used"
	line "the COGBADGE to"
	cont "unlock the door!"
	done

StepIntoPod:
	step UP
	hide_person
	step_end
	
StepOutPod:
	show_person
	step DOWN
	step_end
	
TrainerApproach:
	step DOWN
	step_resume
	
TrainerStepBack:
	fix_facing
	step DOWN
	remove_fixed_facing
	step_resume
	
TrainerStepRight:
	step RIGHT
	turn_head DOWN
	step_resume
	
Pod1Movement:
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step DOWN
	big_step DOWN
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step RIGHT
	big_step RIGHT
	step_end
	
Pod1Movement2:
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step RIGHT
	big_step RIGHT
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step LEFT
	big_step LEFT
	big_step LEFT
	step_end
	
Pod2Movement:
	big_step LEFT
	big_step LEFT
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step UP
	big_step UP
	big_step LEFT
	big_step LEFT
	big_step LEFT
	step_end
	
Pod2Movement2:
	big_step LEFT
	big_step LEFT
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step RIGHT
	big_step RIGHT
	step_end
	
Pod6Movement:
	big_step LEFT
	big_step LEFT
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step RIGHT
	big_step RIGHT
	step_end
	
Pod6Movement2:
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	step_end
	
Pod7Movement:
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	step_end
	
Pod8Movement:
	big_step LEFT
	big_step LEFT
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	step_end
	
Pod3Movement:
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	step_end

Pod3Movement2:
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step LEFT
	big_step LEFT
	big_step LEFT
	step_end
	
Pod3Movement3:
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step RIGHT
	big_step RIGHT
	step_end

Pod4Movement:
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	step_end
	
Pod5Movement:
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	step_end

Pod9Movement2:
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step UP
	big_step UP
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step RIGHT
	big_step RIGHT
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step LEFT
	big_step LEFT
	big_step LEFT
	step_end
	
Pod10Movement:
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step LEFT
	big_step LEFT
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	step_end
	
MahoganyGymPodAsk:
	text "It's a switch."
	
	para "Flip it?"
	done
	
MahoganyGymPodWhoWouldnt:
	text "Who wouldn't?"
	done
	
MahoganyGymSwitchActive:
	text "The switch has"
	line "already been"
	cont "flipped."
	done
	
AskUsePod:
	text "Open the pod door"
	line "and enter?"
	done
	
MahoganyGymPodDoorSealed:
	text "The pod door is"
	line "sealed tight."
	done

PodOverloadText:
	text "The pod's power"
	line "overloaded."
	done
	
ElectricLeaderChallengeText:
	text "Ah, a challenger!"
	
	para "How do you like my"
	line "telepods? Quite"
	cont "genius, yeah?"
	
	para "I designed them"
	line "myself. Such"
	cont "ingenuity has made"
	cont "me the perfect fit"
	cont "for this GYM's"
	cont "leader!"
	
	para "I have already"
	line "shown my mastery"
	cont "of machine. Now"
	cont "you will see my"
	cont "mastery of #MON"
	cont "battles!"
	done
	
ElectricLeaderWinText:
	text "It saddens me to"
	line "be outsmarted, but"
	cont "at the same time I"
	cont "am glad for it to"
	cont "happen."
	
	para "Competition is"
	line "necessary in the"
	cont "progression of"
	cont "technology. This"
	cont "will push me to"
	cont "further perfect"
	cont "science of #MON"
	cont "battles."
	
	para "You have won my"
	line "BADGE, trainer."
	
	para "Take it, and"
	line "continue your"
	cont "journey."
	done

PlayerReceivedCogBadgeText	
	text "<PLAYER> received"
	line "COGBADGE."
	done

CogBadgeText:
	text "Defeating me in"
	line "battle has earned"
	cont "you my signature"
	cont "TM as well."
	done
	
ThunderboltTMText:
	text "That TM is"
	line "THUNDERBOLT."
	
	para "As you saw in our"
	line "battle, its raw"
	cont "power is nothing"
	cont "to scoff at."
	
	para "Leaving your foe"
	line "paralyzed opens up"
	cont "many opportunities"
	cont "in battle."
	done
	
ScientistAndreText:
	text "No!"
	
	para "You must never let"
	line "more than one"
	cont "person or object"
	cont "inside the pod!"
	done
	
ScientistAndreWinText:
	text "I lost."
	done

ScientistAndreAfterText:
	text "We have not yet"
	line "run any tests to"
	cont "see what happens"
	cont "multiple objects"
	cont "enter a pod at the"
	cont "same time."
	done
	
ScientistKurtText:
	text "I am a"
	line "#MON trainer."
	done
	
ScientistKurtWinText:
	text "I lost."
	done
	
ScientistKurtAfterText:
	text "I lost."
	done
	
ScientistDavidText:
	text "I am a"
	line "#MON trainer."
	done

ScientistDavidWinText:
	text "I lost."
	done

ScientistDavidAfterText:
	text "I lost."
	done
	
ScientistSethText:
	text "Groan…"
	
	para "I'm not feeling so"
	line "good right now."
	done
	
ScientistSethWinText:
	text "My illness should"
	line "not be anything to"
	cont "worry about."
	done
	
ScientistSethAfterText:
	text "Do you have any-"
	line "thing sweet that"
	cont "I could eat?"
	
	para "I crave sugar for"
	line "some reason."
	done

MahoganyGym_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 12, 31, MAHOGANY_TOWN, 6

	db 0 ; coord events

	db 16 ; bg events
	bg_event 13, 19, BGEVENT_UP, MahoganyGymPod1
	bg_event 24, 15, BGEVENT_UP, MahoganyGymPod2
	bg_event 19, 15, BGEVENT_UP, MahoganyGymPod3
	bg_event  3, 15, BGEVENT_UP, MahoganyGymPod4
	bg_event  1, 19, BGEVENT_UP, MahoganyGymPod5
	bg_event 24,  9, BGEVENT_UP, MahoganyGymPod6
	bg_event 17,  9, BGEVENT_UP, MahoganyGymPod7
	bg_event 14,  7, BGEVENT_UP, MahoganyGymPod8
	bg_event 24, 21, BGEVENT_UP, MahoganyGymPod9
	bg_event  1,  7, BGEVENT_UP, MahoganyGymPod10
	bg_event  0, 13, BGEVENT_UP, MahoganyGymPodSwitch1
	bg_event 22,  5, BGEVENT_UP, MahoganyGymPodSwitch2
	bg_event 10,  5, BGEVENT_UP, MahoganyGymPodSwitch3
	bg_event 20, 19, BGEVENT_UP, MahoganyGymPodSwitch4
	bg_event 12, 32, BGEVENT_READ, MahoganyGymExit
	bg_event 13, 32, BGEVENT_READ, MahoganyGymExit

	db 5 ; object events
	object_event  5,  1, SPRITE_SURGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ElectricGymLeader, -1 ; Leader
	object_event  0, 31, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ScientistAndre, -1
	object_event  0, 31, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ScientistKurt, -1
	object_event  0, 31, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ScientistDavid, -1
	object_event  0, 31, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ScientistSeth, -1
