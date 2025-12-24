	const_def 2 ; object constants
	const PASTROUTE3_BUENA
	const PASTROUTE3_LASS
	const PASTROUTE3_YOUNGSTER1
	const PASTROUTE3_BUG_CATCHER
	const PASTROUTE3_YOUNGSTER2
	const PASTROUTE3_POKEFAN
	const PASTROUTE3_GENTLEMAN
	const PASTROUTE3_POKE_BALL1
	const PASTROUTE3_POKE_BALL2
	const PASTROUTE3_POKE_BALL3
	const PASTROUTE3_CELEBI

PastRoute3_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerBeautyLina:
	trainer BEAUTY, LINA, EVENT_BEAT_BEAUTY_LINA, BeautyLinaText, BeautyLinaWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BeautyLinaAfterText
	waitbutton
	closetext
	end

TrainerLassCathy:
	trainer LASS, CATHY, EVENT_BEAT_LASS_CATHY, LassCathyText, LassCathyWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassCathyAfterText
	waitbutton
	closetext
	end

TrainerCamperWilson:
	trainer CAMPER, WILSON, EVENT_BEAT_CAMPER_WILSON, CamperWilsonText, CamperWilsonWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperWilsonAfterText
	waitbutton
	closetext
	end

TrainerBugCatcherKevin:
	trainer BUG_CATCHER, KEVIN, EVENT_BEAT_BUG_CATCHER_KEVIN, BugCatcherKevinText, BugCatcherKevinWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BugCatcherKevinAfterText
	waitbutton
	closetext
	end

TrainerLadChester:
	trainer LAD, CHESTER, EVENT_BEAT_LAD_CHESTER, LadChesterText, LadChesterWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LadChesterAfterText
	waitbutton
	closetext
	end

TrainerHikerWarrenSr:
	trainer HIKER, WARREN_SR, EVENT_BEAT_HIKER_WARREN_SR, HikerWarrenSrText, HikerWarrenSrWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerWarrenSrAfterText
	waitbutton
	closetext
	end

TrainerGentlemanNigel:
	trainer GENTLEMAN, NIGEL, EVENT_BEAT_GENTLEMAN_NIGEL, GentlemanNigelText, GentlemanNigelWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GentlemanNigelAfterText
	waitbutton
	closetext
	end

CelebiBoss2:
	scall CelebiBoss2Intro
	loadwildmon CELEBI, 18
	writecode VAR_BATTLETYPE, BATTLETYPE_BOSS
	startbattle
	reloadmapafterbattle
	playsound SFX_WARP_TO
	applymovement PASTROUTE3_CELEBI, PastRoute3CelebiTeleportMovement
	setevent EVENT_HIDE_AND_SEEK_CELEBI_2
	clearevent EVENT_HIDE_AND_SEEK_CELEBI_3
	disappear PASTROUTE3_CELEBI
	waitsfx
	jumpstd bosscelebidisappear

CelebiBoss2Intro:
	jumpstd bosscelebiintro
	end

PastRoute3CelebiTeleportMovement:
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

PastRoute3Lemonade:
	itemball LEMONADE

PastRoute3MiracleSeed:
	itemball MIRACLE_SEED

PastRoute3Stick:
	itemball STICK

PastRoute3HiddenHeatCharm:
	hiddenitem HEAT_CHARM, EVENT_ROUTE_3_PAST_HIDDEN_HEAT_CHARM

PastRoute3HiddenPsnCureBerry:
	hiddenitem PSNCUREBERRY, EVENT_ROUTE_3_PAST_HIDDEN_PSNCUREBERRY

PastRoute3HiddenSilverBerry:
	hiddenitem SILVER_BERRY, EVENT_ROUTE_3_PAST_HIDDEN_SILVER_BERRY

PastRoute3HiddenPowerHerb:
	hiddenitem POWER_HERB, EVENT_ROUTE_3_PAST_HIDDEN_POWER_HERB

BeautyLinaText:
	text "I'm going shopping"
	line "in the city with"
	cont "all the prize"
	cont "money I've won."

	para "I'll have plenty"
	line "after I win"
	cont "against you!"
	done

BeautyLinaWinText:
	text "Hey, that's not"
	line "fair!"

	para "How do you expect"
	line "me to go shopping"
	cont "if I have to give"
	cont "you my money?"
	done

BeautyLinaAfterText:
	text "I need a boyfriend"
	line "who can win my"
	cont "battles for me!"
	done

LassCathyText:
	text "My cousins are"
	line "hogging the best"
	cont "spot in the trees."

	para "There's too much"
	line "grass here!"
	done

LassCathyWinText:
	text "Eek!"

	para "There was an EKANS"
	line "in the grass that"
	cont "distracted me!"
	done

LassCathyAfterText:
	text "I just want to go"
	line "camping with my"
	cont "cousins, but those"
	cont "dumb boys won't let"
	cont "any girls hang out"
	cont "with them."
	done

CamperWilsonText:
	text "This is the best"
	line "spot to camp out."

	para "I set up the tent,"
	line "while my brother"
	cont "finds some new"
	cont "#MON to catch."
	done

CamperWilsonWinText:
	text "No way! I lost!"

	para "I was supposed to"
	line "protect our camp!"
	done

CamperWilsonAfterText:
	text "At least my"
	line "#MON can keep"
	cont "CATHY from"
	cont "bothering us."
	done

BugCatcherKevinText:
	text "Hey! You can't be"
	line "here!"

	para "My brother and I"
	line "found this spot,"
	cont "so that means it's"
	cont "all ours!"
	done

BugCatcherKevinWinText:
	text "Okay, you won. Now"
	line "will you quit"
	cont "bugging us?"
	done

BugCatcherKevinAfterText:
	text "Our grandpa doesn't"
	line "like us staying"
	cont "out past dark, but"
	cont "that's when all the"
	cont "best BUG-types are"
	cont "active!"
	done

LadChesterText:
	text "Do you think a"
	line "regular person"
	cont "could have"
	cont "PSYCHIC abilities?"
	done

LadChesterWinText:
	text "I had a feeling"
	line "that you would"
	cont "beat me, but I"
	cont "wanted to change"
	cont "the outcome."
	done

LadChesterAfterText:
	text "FAVIA TOWN"
	line "attracts a lot of"
	cont "#MON with"
	cont "PSYCHIC powers."

	para "I need to find"
	line "more to train."
	done

HikerWarrenSrText:
	text "I'm trying to clear"
	line "a path through"
	cont "this rock."

	para "A battle will get"
	line "my #MON fired"
	cont "up so they can"
	cont "work even harder!"
	done

HikerWarrenSrWinText:
	text "Ah! I need a rest."

	para "I didn't expect"
	line "someone to push"
	cont "me so hard."
	done

HikerWarrenSrAfterText:
	text "When I'm done,"
	line "people will be"
	cont "able to reach"
	cont "PALEROCK MOUNTAIN"
	cont "from this side of"
	cont "the region."

	para "I think it will"
	line "really help bring"
	cont "people together."
	done

GentlemanNigelText:
	text "I'm keeping an eye"
	line "on my grandkids"
	cont "while they play."

	para "But I'm sure I"
	line "could spare a"
	cont "moment to battle."
	done

GentlemanNigelWinText:
	text "Wow! Some of you"
	line "kids have gotten"
	cont "really good at"
	cont "raising #MON!"
	done

GentlemanNigelAfterText:
	text "Wild #MON can"
	line "be dangerous."

	para "I've trained some"
	line "#MON of my own"
	cont "to keep my grand-"
	cont "children safe."
	done

PastRoute3_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 29, 43, PAST_PECTINIA_GATE, 1 ; Pectinia Gate
	warp_event 30, 43, PAST_PECTINIA_GATE, 2 ; Pectinia Gate

	db 0 ; coord events

	db 4 ; bg events
	bg_event 16, 19, BGEVENT_ITEM, PastRoute3HiddenHeatCharm
	bg_event 25, 33, BGEVENT_ITEM, PastRoute3HiddenPsnCureBerry
	bg_event 17, 41, BGEVENT_ITEM, PastRoute3HiddenSilverBerry
	bg_event 26, 18, BGEVENT_ITEM, PastRoute3HiddenPowerHerb

	db 11 ; object events
	object_event 12,  8, SPRITE_BUENA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerBeautyLina, -1
	object_event 27, 28, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerLassCathy, -1
	object_event 10, 33, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerCamperWilson, -1
	object_event 15, 31, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerBugCatcherKevin, -1
	object_event 13, 22, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerLadChester, -1
	object_event 33, 11, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 0, TrainerHikerWarrenSr, -1
	object_event 27, 38, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerGentlemanNigel, -1
	object_event  1, 18, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PastRoute3Lemonade, EVENT_ROUTE_3_PAST_LEMONADE
	object_event  6,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PastRoute3MiracleSeed, EVENT_ROUTE_3_PAST_MIRACLE_SEED
	object_event 31, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PastRoute3Stick, EVENT_ROUTE_3_PAST_STICK
	object_event  5, 42, SPRITE_CELEBI, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CelebiBoss2, EVENT_HIDE_AND_SEEK_CELEBI_2
