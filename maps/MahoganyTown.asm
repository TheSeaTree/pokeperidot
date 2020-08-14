	const_def 2 ; object constants
	const MAHOGANYTOWN_LASS
	const MAHOGANYTOWN_JOEL
	const MAHOGANYTOWN_OFFICER1
	const MAHOGANYTOWN_OFFICER2
	const MAHOGANYTOWN_RHYDON1
	const MAHOGANYTOWN_RHYDON2
	const MAHOGANYTOWN_GRIMER1
	const MAHOGANYTOWN_GRIMER2
	const MAHOGANYTOWN_FRUIT_TREE

MahoganyTown_MapScripts:
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint
	callback MAPCALLBACK_TILES, .PowerPlant

.FlyPoint:
	setflag ENGINE_FLYPOINT_MAHOGANY
	return
	
.PowerPlant:
	checkevent EVENT_POWER_PLANT_1F_MUK
	iffalse .skip
	changeblock 2, 2, $ae
.skip
	return
	
PowerPlantDoor:
	playsound SFX_ENTER_DOOR
	special FadeOutPalettes
	special FadeOutMusic
	waitsfx
	warpfacing UP, POWER_PLANT_1F, 5, 21
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
	setevent EVENT_BACKUP_REQUESTED
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

MahoganyTownOfficerScript:
	faceplayer
	opentext
	checkevent EVENT_BACKUP_REQUESTED
	iffalse .Backup
	writetext MahoganyTownOfficerBeforeText
	waitbutton
	closetext
	turnobject LAST_TALKED, LEFT
	end
	
.Backup
	writetext MahoganyTownOfficerBackupText
	waitbutton
	closetext
	playsound SFX_BALL_POOF
	waitsfx
	disappear MAHOGANYTOWN_RHYDON1
	checkcode VAR_FACING
	ifequal UP, .FacingUp
	applymovement MAHOGANYTOWN_OFFICER1, MahoganyOfficerFacingLeftMovement
	turnobject MAHOGANYTOWN_OFFICER1, UP
	end

.FacingUp
	applymovement MAHOGANYTOWN_OFFICER1, MahoganyOfficerFacingUpMovement
	end

MahoganyTownGrimerBattle:
	opentext
	writetext MahoganyTownGrimerText
	cry GRIMER
	waitbutton
	closetext
	setlasttalked -1
	loadwildmon GRIMER, 28
	writecode VAR_BATTLETYPE, BATTLETYPE_TRAP
	startbattle
	reloadmapafterbattle
	end

MahoganyTownLass:
	jumptextfaceplayer MahoganyTownLassText
	
MahoganyMoveManagersHouse:
	jumptext MoveManagersHouseText
	
MahoganyPowerPlantSign:
	jumptext MahoganyPowerPlantSignText
	
MahoganyTownMetalPowder:
	itemball METAL_POWDER
	
MahoganyTownFruitTree:
	fruittree FRUITTREE_MAHOGANY_TOWN

MahoganyGymMovement:
	step UP
	step_resume
	
MahoganyOfficerFacingLeftMovement:
	step DOWN
	turn_step UP
	step_resume
	
MahoganyOfficerFacingUpMovement
	step RIGHT
	turn_step LEFT
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
	
MahoganyTownOfficerBeforeText:
	text "Everything's under"
	line "control here."
	
	para "Move along."
	done
	
MahoganyTownOfficerBackupText:
	text "Are you the backup"
	line "JOEL was sending?"
	
	para "We can't hold back"
	line "the GRIMER, there's"
	cont "too many!"
	
	para "Give us a hand"
	line "here, will ya?"
	done
	
MahoganyTownGrimerText:
	text "GRIMER: Blblbl!"
	done
	
MahoganyTownOfficerOpeningText:
	text "You've made an"
	line "opening!"
	
	para "Quickly, make your"
	line "way to the POWER"
	cont "PLANT. We'll watch"
	cont "your back here."
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
	
MoveManagersHouseText:
	text "MOVE MANAGERs'"
	line "house."
	done
	
MahoganyPowerPlantSignText:
	text "POWER PLANT"
	done
	
MahoganyTown_MapEvents:
	db 0, 0 ; filler

	db 10 ; warp events
	warp_event 23, 33, MAHOGANY_GATE, 1
	warp_event 24, 33, MAHOGANY_GATE, 2
	warp_event  2,  3, POWER_PLANT_1F_B, 1
	warp_event 27, 29, MAHOGANY_POKECENTER_1F, 1
	warp_event 10, 21, MAHOGANY_DEPT_STORE_1F, 1
	warp_event 31, 19, EMYS_HOUSE, 1
	warp_event 35,  9, MOVE_DELETERS_HOUSE, 1
	warp_event 11, 29, SUBSTITUTE_HOUSE, 1
	warp_event 21, 21, MAHOGANY_APARTMENT_1F, 1
	warp_event 19, 29, MAHOGANY_CAFE, 1

	db 1 ; coord events
	coord_event  2,  3, -1, PowerPlantDoor

	db 3 ; bg events
	bg_event 24, 13, BGEVENT_UP, MahoganyGymEvent
	bg_event 33,  9, BGEVENT_UP, MahoganyMoveManagersHouse
	bg_event  4,  5, BGEVENT_UP, MahoganyPowerPlantSign

	db 10 ; object events
	object_event 24, 24, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 3, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyTownLass, -1
	object_event 24, 14, SPRITE_JOEL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, MahoganyGymLeader, EVENT_POWER_PLANT_1F_MUK
	object_event 25,  8, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MahoganyTownOfficerScript, -1
	object_event 24,  9, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MahoganyTownOfficerScript, -1
	object_event 24,  8, SPRITE_MONSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 23,  9, SPRITE_MONSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 23,  8, SPRITE_GRIMER, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, MahoganyTownGrimerBattle, -1
	object_event 22,  9, SPRITE_GRIMER, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, MahoganyTownGrimerBattle, -1
	object_event 17, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_ITEMBALL, 0, MahoganyTownMetalPowder, EVENT_MAHOGANY_TOWN_METAL_POWDER
	object_event 22,  2, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyTownFruitTree, -1
