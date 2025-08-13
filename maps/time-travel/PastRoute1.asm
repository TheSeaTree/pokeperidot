	const_def 2 ; object constants
	const PASTROUTE1_YOUNGSTER
	const PASTROUTE1_FISHER
	const PASTROUTE1_TWIN1
	const PASTROUTE1_TWIN2
	const PASTROUTE1_ITEMBALL1
	const PASTROUTE1_ITEMBALL2
	const PASTROUTE1_CELEBI

PastRoute1_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerBirdKeeperDarren:
	trainer BIRD_KEEPER, DARREN, EVENT_BEAT_BIRD_KEEPER_DARREN, BirdKeeperDarrenText, BirdKeeperDarrenWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperDarrenAfterText
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
	applymovement PASTROUTE1_CELEBI, PastRoute1CelebiTeleportMovement
	setevent EVENT_HIDE_AND_SEEK_CELEBI_1
	clearevent EVENT_HIDE_AND_SEEK_CELEBI_2
	disappear PASTROUTE1_CELEBI
	waitsfx
	jumpstd bosscelebidisappear

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

PastRoute1MoonStone:
	itemball MOON_STONE

PastRoute1FocusBand:
	itemball FOCUS_BAND

PastRoute1HiddenGoldBerry:
	hiddenitem GOLD_BERRY, EVENT_ROUTE_1_PAST_HIDDEN_GOLD_BERRY

PastRoute1HiddenMysteryBerry:
	hiddenitem MYSTERYBERRY, EVENT_ROUTE_1_PAST_HIDDEN_MYSTERYBERRY

PastRoute1HiddenCoarseCharm:
	hiddenitem COARSE_CHARM, EVENT_ROUTE_1_PAST_HIDDEN_COARSE_CHARM

BirdKeeperDarrenText:
	text "I hatched all of"
	line "my bird #MON"
	cont "from EGGs!"
	done

BirdKeeperDarrenWinText:
	text "Don't worry, I've"
	line "got more EGGs"
	cont "ready to hatch!"
	done

BirdKeeperDarrenAfterText:
	text "My prized NATU"
	line "came out of its"
	cont "EGG knowing some"
	cont "new moves!"
	done

FisherMarkText:
	text "I need a break"
	line "from fishing."

	para "Let's battle!"
	done

FisherMarkWinText:
	text "That's the end of"
	line "my break…"
	done

FisherMarkAfterText:
	text "I didn't think my"
	line "OLD ROD would be"
	cont "able to find any-"
	cont "thing good until I"
	cont "tried a different"
	cont "kind of bait."
	done

TwinAliText:
	text "ALI: We might look"
	line "the same, but our"
	cont "#MON are total-"
	cont "ly different!"
	done

TwinLiaText:
	text "LIA: We caught and"
	line "evolved our"
	cont "#MON together!"
	done

TwinsAliAndLiaWinText:
	text "ALI: We need more"
	line "variety next time!"

	para "LIA: We can go"
	line "find more #MON"
	cont "to catch!"
	done

TwinAliAfterText:
	text "ALI: LIA wanted to"
	line "evolve our EEVEE"
	cont "as soon as we"
	cont "found the STONEs"
	cont "for them."
	done

TwinLiaAfterText:
	text "LIA: We found the"
	line "STONEs to evolve"
	cont "our #MON in"
	cont "PAVONA VILLAGE."
	done

PastRoute1_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 45,  7, PAST_ROUTE_1_HOUSE, 1
	warp_event  4, 25, PAST_HIDDEN_POWER_CAVE, 1

	db 0 ; coord events

	db 3 ; bg events
	bg_event  5, 13, BGEVENT_ITEM, PastRoute1HiddenGoldBerry
	bg_event 24,  4, BGEVENT_ITEM, PastRoute1HiddenMysteryBerry
	bg_event  9, 29, BGEVENT_ITEM, PastRoute1HiddenCoarseCharm

	db 7 ; object events
	object_event 17, 10, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerBirdKeeperDarren, -1
	object_event 36, 14, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerFisherMark, -1
	object_event 19, 19, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinAli, -1
	object_event 19, 18, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinLia, -1
	object_event 31,  9, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PastRoute1MoonStone, EVENT_ROUTE_1_PAST_MOON_STONE
	object_event  7,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PastRoute1FocusBand, EVENT_ROUTE_1_PAST_FOCUS_BAND
	object_event 43, 24, SPRITE_CELEBI, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CelebiBoss1, EVENT_HIDE_AND_SEEK_CELEBI_1
