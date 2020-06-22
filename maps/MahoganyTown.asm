	const_def 2 ; object constants
	const MAHOGANYTOWN_MERCHANT1
	const MAHOGANYTOWN_CLERK
	const MAHOGANYTOWN_MERCHANT2
	const MAHOGANYTOWN_MERCHANT3
	const MAHOGANYTOWN_LASS
	const MAHOGANYTOWN_ADMIN1

MahoganyTown_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_MAHOGANY
	return
	
PowerPlantDoor:
	checkevent EVENT_POWER_PLANT_1F_MUK
	playsound SFX_ENTER_DOOR
	special FadeOutPalettes
	special FadeOutMusic
	waitsfx
	iftrue .Lights
	warpfacing UP, POWER_PLANT_1F, 5, 21
	end
	
.Lights
	warpfacing UP, POWER_PLANT_1F_B, 5, 21
	end
	
MahoganyGymLeader:
	faceplayer
	opentext
	checkevent EVENT_GOT_HM_SURF
	iftrue .GotSurf
	checkevent EVENT_EXPLAINED_POWER_PLANT
	iftrue .ExplainedPlant
	writetext MahoganyGymLeaderIntroText
	waitbutton
	setevent EVENT_EXPLAINED_POWER_PLANT
	checkcode VAR_BADGES
	ifless 6, .NotEnoughBadges
	writetext MahoganyGymLeaderAskText
	yesorno
	iffalse .No

.ExplainedPlant
	checkcode VAR_BADGES
	ifless 6, .NotEnoughBadges
	writetext MahoganyGymLeaderAgree
	waitbutton
	closetext
	setevent EVENT_UNLOCKED_SURF
	end
	
.GotSurf
	writetext MahoganyPowerPlantGotSurf
	waitbutton
	closetext
	end
	
.No
	writetext MahoganyGymLeaderComeBack
	yesorno
	iftrue .ExplainedPlant
	iffalse .No
	
.NotEnoughBadges
	writetext MahoganyPowerPlantNotEnoughBadges
	waitbutton
	closetext
	end
	
MahoganyGymEvent:
	checkflag ENGINE_COGBADGE
	iftrue .havebadge
	clearevent EVENT_BEAT_SCIENTIST_ANDRE
	clearevent EVENT_BEAT_SCIENTIST_KURT
	clearevent EVENT_BEAT_SCIENTIST_DAVID
	clearevent EVENT_BEAT_SCIENTIST_SETH
	clearevent EVENT_MAHOGANY_GYM_SWITCH_1
	clearevent EVENT_MAHOGANY_GYM_SWITCH_2
	clearevent EVENT_MAHOGANY_GYM_SWITCH_3
	clearevent EVENT_MAHOGANY_GYM_SWITCH_4
	scall MahoganyGymEntrance
	iffalse .no
.warp
	warpfacing UP, MAHOGANY_GYM, 12, 31
.no
	end	

.havebadge
	scall MahoganyEnterGym
	jump .warp
	
MahoganyGymEntrance:
	jumpstd gymdoor
	end
	
MahoganyEnterGym:
	jumpstd entergym
	end

MahoganyTownLass:
	jumptextfaceplayer MahoganyTownLassText
	
MahoganyTownFruitTree:
	fruittree FRUITTREE_MAHOGANY_TOWN

MahoganyGymMovement:
	step UP
	step_resume

MahoganyGymLeaderIntroText:
	text "JOEL: Sorry, kid."
	
	para "If you're here for" 
	line "a GYM challenge,"
	cont "you're going to be"
	cont "disappointed."
	
	para "Something is wrong"
	line "with the POWER"
	cont "PLANT. It's not"
	cont "producing enough"
	cont "electricity to run"
	cont "the GYM."
	
	para "Without power, I"
	line "can't accept any"
	cont "challenges."

	para "I sent a crew to"
	line "check out what's"
	cont "going on up there,"
	cont "but they were not"
	cont "able to deal with"
	cont "the wild GRIMER"
	cont "nesting there."
	
	para "Those #MON must"
	line "be mucking up the"
	cont "turbines."
	done
	
MahoganyGymLeaderAskText:
	text "It's a lot to ask,"
	line "but would you take"
	cont "care of them?"
	done
	
MahoganyGymLeaderComeBack:
	text "What do you mean"
	line "you won't do it?"
	
	para "I know it's a lot"
	line "to ask, but I need"
	cont "to stay here and"
	cont "keep an eye on the"
	cont "GYM."
	
	para "Help a guy out,"
	line "here? Please?"
	done
	
MahoganyGymLeaderAgree:
	text "You will need a"
	line "way to get across"
	cont "the lake behind"
	cont "the GYM, and you"
	cont "don't look like"
	cont "much of a swimmer."
	
	para "I have a buddy"
	line "down on the shore."
	
	para "He's not too kind"
	line "to outsiders, but"
	cont "he owes me a favor"
	cont "so I'll give him"
	cont "a call."
	
	para "He can get you"
	line "something to cross"
	cont "the water."
	done

MahoganyPowerPlantGotSurf:
	text "Now that you have"
	line "the HM for SURF,"
	cont "you can cross the"
	cont "water and clean up"
	cont "the POWER PLANT."
	done
	
MahoganyPowerPlantNotEnoughBadges:
	text "I don't know any"
	line "trainers strong"
	cont "enough for this"
	cont "task!"
	
	para "There was one"
	line "trainer I asked,"
	cont "but he refused."
	
	para "He said it wasn't"
	line "his problem."
	
	para "Oh, what will I"
	line "do?"
	done
	
MahoganyTownLassText:
	text "With the merchants"
	line "all trying to sell"
	cont "items to the"
	cont "tourists staying"
	cont "at the hotel, this"
	cont "city's #MART"
	cont "owner sold his"
	cont "shop to join them."
	
	para "He couldn't beat"
	line "the competition"
	cont "otherwise."
	done
	
MahoganyTownStockChangesText:
	text "My stock changes"
	line "daily!"
	done
	
MahoganyTown_MapEvents:
	db 0, 0 ; filler

	db 9 ; warp events
	warp_event 23, 33, MAHOGANY_GATE, 1
	warp_event 24, 33, MAHOGANY_GATE, 2
	warp_event  2,  3, MAHOGANY_TOWN, 3
	warp_event 27, 29, MAHOGANY_POKECENTER_1F, 1
	warp_event 10, 21, MAHOGANY_DEPT_STORE_1F, 1
	warp_event 31, 19, EMYS_HOUSE, 1
	warp_event 35,  9, MOVE_DELETERS_HOUSE, 1
	warp_event 19, 29, SUBSTITUTE_HOUSE, 1
	warp_event 21, 21, MAHOGANY_APARTMENT_1F, 1

	db 1 ; coord events
	coord_event  2,  3, -1, PowerPlantDoor

	db 1 ; bg events
	bg_event 24, 13, BGEVENT_UP, MahoganyGymEvent

	db 3 ; object events
	object_event 26, 24, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 3, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyTownLass, -1
	object_event 24, 14, SPRITE_JOEL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, MahoganyGymLeader, EVENT_POWER_PLANT_1F_MUK
	object_event 22,  2, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyTownFruitTree, -1
