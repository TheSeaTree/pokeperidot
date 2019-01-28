	const_def 2 ; object constants
	const ILEXFOREST_POKE_BALL1
	const ILEXFOREST_POKE_BALL2
	const ILEXFOREST_POKE_BALL3
	const ILEXFOREST_POKE_BALL4

IlexForest_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
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
	
IlexForest_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 67, 34, NEW_BARK_FOREST_GATE, 1
	warp_event 67, 35, NEW_BARK_FOREST_GATE, 2
	warp_event 49, 43, ROUTE_9_FOREST_GATE, 3
	warp_event 50, 43, ROUTE_9_FOREST_GATE, 4
	warp_event 22,  5, ECRUTEAK_FOREST_GATE, 1

	db 0 ; coord events

	db 3 ; bg events
	bg_event 38, 23, BGEVENT_ITEM, IlexForestHiddenSuperPotion
	bg_event 11,  7, BGEVENT_ITEM, IlexForestHiddenEther
	bg_event  1, 17, BGEVENT_ITEM, IlexForestHiddenFullHeal

	db 6 ; object events
	object_event 14, 39, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, IlexForestHardStone, EVENT_ILEX_FOREST_HARD_STONE
	object_event 54,  7, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, IlexForestSunStone, EVENT_ILEX_FOREST_SUN_STONE
	object_event 16, 18, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, IlexForestEther, EVENT_ILEX_FOREST_ETHER
	object_event 41, 28, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, IlexForestSuperPotion, EVENT_ILEX_FOREST_SUPER_POTION
	object_event 18, 38, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerHikerWarren, -1
	object_event 34, 14, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerLassAmanda, -1
