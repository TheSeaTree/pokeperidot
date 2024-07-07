	const_def 2 ; object constants
	const PASTROUTE1_YOUNGSTER
	const PASTROUTE1_FISHER
	const PASTROUTE1_TWIN1
	const PASTROUTE1_TWIN2
	const PASTROUTE1_CELEBI

PastRoute1_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerBirdKeeperChester:
	trainer BIRD_KEEPER, CHESTER, EVENT_BEAT_BIRD_KEEPER_CHESTER, BirdKeeperChesterText, BirdKeeperChesterWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperChesterAfterText
	waitbutton
	closetext
	end	

TrainerFisherMark:
	trainer FISHER, MARK, EVENT_BEAT_FISHER_MARK, FisherMarkText, FisherMarkWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherMarkAfterText
	waitbutton
	closetext
	end	

TrainerTwinAli:
	trainer TWINS, ALIANDLIA1, EVENT_BEAT_TWINS_ALI_AND_LIA, TwinAliText, TwinsAliAndLiaWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TwinAliAfterText
	waitbutton
	closetext
	end	

TrainerTwinLia:
	trainer TWINS, ALIANDLIA2, EVENT_BEAT_TWINS_ALI_AND_LIA, TwinLiaText, TwinsAliAndLiaWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TwinLiaAfterText
	waitbutton
	closetext
	end

CelebiBoss1:
	scall CelebiBoss1Intro
	loadwildmon CELEBI, 15
	writecode VAR_BATTLETYPE, BATTLETYPE_BOSS
	startbattle
	reloadmapafterbattle
	playsound SFX_WARP_TO
	applymovement PASTROUTE1_CELEBI, PastRoute2CelebiTeleportMovement
	setevent EVENT_HIDE_AND_SEEK_CELEBI_1
	clearevent EVENT_HIDE_AND_SEEK_CELEBI_2
	disappear PASTROUTE1_CELEBI
	waitsfx
	jumpstd bosscelebibattle

CelebiBoss1Intro:
	jumpstd bosscelebiintro
	end

PastRoute1CelebiTeleportMovement:
	hide_person
	step_sleep 2
	show_person
	step_sleep 2
	hide_person
	step_sleep 2
	show_person
	step_sleep 2
	hide_person
	step_sleep 2
	show_person
	step_sleep 2
	hide_person
	step_end

PastRoute1HiddenGoldBerry:
	hiddenitem GOLD_BERRY, EVENT_ROUTE_1_PAST_HIDDEN_GOLD_BERRY

PastRoute1HiddenMysteryBerry:
	hiddenitem MYSTERYBERRY, EVENT_ROUTE_1_PAST_HIDDEN_MYSTERYBERRY

BirdKeeperChesterText:
BirdKeeperChesterWinText:
BirdKeeperChesterAfterText:

FisherMarkText:
FisherMarkWinText:
FisherMarkAfterText:

TwinAliText:
TwinLiaText:
TwinsAliAndLiaWinText:
TwinAliAfterText:
TwinLiaAfterText:
	text ""
	done

PastRoute1_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 45,  7, PAST_ROUTE_1_HOUSE, 1
	warp_event  4, 25, PAST_HIDDEN_POWER_CAVE, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event 17, 41, BGEVENT_ITEM, PastRoute1HiddenGoldBerry
	bg_event 24,  4, BGEVENT_ITEM, PastRoute1HiddenMysteryBerry

	db 5 ; object events
	object_event 17, 10, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerBirdKeeperChester, -1
	object_event 36, 14, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerFisherMark, -1
	object_event 19, 19, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinAli, -1
	object_event 19, 18, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinLia, -1
	object_event 43, 24, SPRITE_CELEBI, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CelebiBoss1, EVENT_HIDE_AND_SEEK_CELEBI_1
