	const_def 2 ; object constants
	const ILEXFOREST_POKE_BALL1
	const ILEXFOREST_POKE_BALL2
	const ILEXFOREST_POKE_BALL3
	const ILEXFOREST_POKE_BALL4

IlexForest_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .SmashWall
	
.SmashWall:
	checkevent EVENT_UNOWN_CHAMBER_HN_OPEN
	iffalse .skip
	changeblock 14, 34, $73
.skip
	return
	
TrainerHikerRay:
	trainer HIKER, RAY, EVENT_BEAT_HIKER_RAY, HikerRayText, HikerRayWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerRayAfterText
	waitbutton
	closetext
	end
	
TrainerLassAmanda:
	trainer LASS, AMANDA, EVENT_BEAT_LASS_AMANDA, LassAmandaText, LassAmandaWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassAmandaAfterText
	waitbutton
	closetext
	end		

TrainerBirdKeeperEllis:
	trainer BIRD_KEEPER, ELLIS, EVENT_BEAT_BIRD_KEEPER_ELLIS, BirdKeeperEllisText, BirdKeeperEllisWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperEllisAfterText
	waitbutton
	closetext
	end	

TrainerPokefanFElane:
	trainer POKEFANF, ELANE, EVENT_BEAT_POKEFANF_ELANE, PokefanFElaneText, PokefanFElaneWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanFElaneAfterText
	waitbutton
	closetext
	end
	
TrainerTwinFaye:
	trainer TWINS, FAYEANDMAE1, EVENT_BEAT_TWINS_FAYE_AND_MAE, TwinFayeText, TwinsFayeAndMaeWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TwinFayeAfterText
	waitbutton
	closetext
	end	
	
TrainerTwinMae:
	trainer TWINS, FAYEANDMAE2, EVENT_BEAT_TWINS_FAYE_AND_MAE, TwinMaeText, TwinsFayeAndMaeWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TwinMaeAfterText
	waitbutton
	closetext
	end	

IlexForestHardStone:
	itemball HARD_STONE

IlexForestSunStone:
	itemball SUN_STONE

IlexForestSuperPotion:
	itemball SUPER_POTION

IlexForestEther:
	itemball ETHER

IlexForestHiddenEther:
	hiddenitem ETHER, EVENT_ILEX_FOREST_HIDDEN_ETHER

IlexForestHiddenSuperPotion:
	hiddenitem SUPER_POTION, EVENT_ILEX_FOREST_HIDDEN_SUPER_POTION

IlexForestHiddenFullHeal:
	hiddenitem FULL_HEAL, EVENT_ILEX_FOREST_HIDDEN_FULL_HEAL
	
HikerRayText:
	text "Ho ho!"
	
	para "There is no better"
	line "place for me to"
	cont "train my rock-"
	cont "solid squad!"
	done
	
HikerRayWinText:
	text "My #MON got"
	line "rocked."
	done
	
HikerRayAfterText:
	text "I need to stop"
	line "ignoring the"
	cont "other types."
	done
	
LassAmandaText:
	text "You're not out of"
	line "the woods yet. You"
	cont "still need to get"
	cont "through me!"
	done
	
LassAmandaWinText:
	text "My team was too"
	line "hot for even me"
	cont "to handle."
	done

LassAmandaAfterText:
	text "My #MON fought"
	line "hard. They've"
	cont "earned this rest."
	done
	
BirdKeeperEllisText:
	text "Hehe! None of the"
	line "GRASS or BUG-type"
	cont "#MON are a"
	cont "match for my"
	cont "birds!"
	done
	
BirdKeeperEllisWinText:
	text "My wings have been"
	line "clipped!"
	done

BirdKeeperEllisAfterText:
	text "One setback won't"
	line "discourage me from"
	cont "training my birds."
	done
	
PokefanFElaneText:
	text "My #MON are too"
	line "cute to evolve!"
	done
	
PokefanFElaneWinText:
	text "I would rather"
	line "lose a battle than"
	cont "lose my precious"
	cont "babies!"
	done

PokefanFElaneAfterText:
	text "I am still proud"
	line "of how well my"
	cont "darlings did"
	cont "against such a"
	cont "strong trainer"
	cont "like yourself."
	done
	
TwinFayeText:
	text "FAYE: My sister"
	line "and I always"
	cont "battle together!"
	done

TwinsFayeAndMaeWinText:
	text "FAYE: You play too"
	line "rough!"
	
	para "MAE: Yeah, you big"
	line "bully!"
	done

TwinFayeAfterText:
	text "FAYE: I think my"
	line "#MON was stronger"
	cont "than MAE's."
	done

TwinMaeText:
	text "MAE: Two against"
	line "one isn't fair, so"
	cont "we can take turns!"
	done

TwinMaeAfterText:
	text "MAE: My #MON"
	line "was just sleepy!"
	done

IlexForest_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 49, 43, ROUTE_9_FOREST_GATE, 3
	warp_event 50, 43, ROUTE_9_FOREST_GATE, 4
	warp_event 22,  5, ECRUTEAK_FOREST_GATE, 1
	warp_event  3,  7, SWORDS_DANCE_HOUSE, 1
	warp_event 14, 35, UNOWN_CHAMBER_HN, 1

	db 0 ; coord events

	db 3 ; bg events
	bg_event 38, 23, BGEVENT_ITEM, IlexForestHiddenSuperPotion
	bg_event 37,  5, BGEVENT_ITEM, IlexForestHiddenEther
	bg_event 16, 17, BGEVENT_ITEM, IlexForestHiddenFullHeal

	db 10 ; object events
	object_event 14, 39, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, IlexForestHardStone, EVENT_ILEX_FOREST_HARD_STONE
	object_event 54,  7, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, IlexForestSunStone, EVENT_ILEX_FOREST_SUN_STONE
	object_event 16, 29, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, IlexForestEther, EVENT_ILEX_FOREST_ETHER
	object_event 57, 25, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, IlexForestSuperPotion, EVENT_ILEX_FOREST_SUPER_POTION
	object_event 18, 38, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerHikerRay, -1
	object_event 34, 14, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerLassAmanda, -1
	object_event 52, 29, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerBirdKeeperEllis, -1
	object_event 40, 23, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerPokefanFElane, -1
	object_event 36, 26, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinFaye, -1
	object_event 37, 26, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinMae, -1
