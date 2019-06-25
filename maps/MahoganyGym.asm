	const_def 2 ; object constants

MahoganyGym_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

MahoganyGymPod1:
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

MahoganyGymPod2:
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

MahoganyGymPod3:
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

MahoganyGymPod4:
	checkevent EVENT_MAHOGANY_GYM_SWITCH_1
	iftrue PodDoorSealed
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

MahoganyGymPod5:
	checkevent EVENT_MAHOGANY_GYM_SWITCH_1
	iffalse PodDoorSealed
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
	
MahoganyGymPod6:
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

MahoganyGymPod7:
	checkevent EVENT_MAHOGANY_GYM_SWITCH_3
	iftrue PodDoorSealed
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

MahoganyGymPod8:
	checkevent EVENT_MAHOGANY_GYM_SWITCH_3
	iffalse PodDoorSealed
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

MahoganyGymPod9:
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
	opentext
	changeblock 10, 14, $4f
	changeblock 12, 14, $4e
	changeblock 10, 10, $4d
	changeblock  8, 10, $5e
	changeblock  6, 10, $4d
	changeblock  4, 10, $4e
	changeblock  4,  8, $4c
	changeblock  2,  6, $67
	reloadmappart
	writetext PodOverloadText
	waitbutton
	closetext
	playsound SFX_EXIT_BUILDING
	applymovement PLAYER, StepOutPod
	end

MahoganyGymPod10:
	checkflag ENGINE_MINERALBADGE
	iffalse PodDoorSealed
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
	
PodDoorSealed:
	jumptext MahoganyGymPodDoorSealed
	
MahoganyGymPodSwitch1:
	opentext
	writetext MahoganyGymPodAsk
	yesorno
	iffalse .No
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
	closetext
	end
	
.No
	closetext
	end

MahoganyGymPodSwitch2:
	opentext
	writetext MahoganyGymPodAsk
	yesorno
	iffalse .No
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
	closetext
	end
	
.No
	closetext
	end

MahoganyGymPodSwitch3:
	opentext
	writetext MahoganyGymPodAsk
	yesorno
	iffalse .No
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
	closetext
	end
	
.No
	closetext
	end

MahoganyGymPodSwitch4:
	opentext
	writetext MahoganyGymPodAsk
	yesorno
	iffalse .No
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
	closetext
	end
	
.No
	closetext
	end
	
StepIntoPod:
	step UP
	hide_person
	step_end
	
StepOutPod:
	show_person
	step DOWN
	step_end
	
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
	
MahoganyGymPodDoorSealed:
	text "The pod door is"
	line "sealed tight."
	done

PodOverloadText:
	text "The pod's power"
	line "overloaded."
	done

MahoganyGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 12, 31, MAHOGANY_TOWN, 6
	warp_event 13, 31, MAHOGANY_TOWN, 6

	db 0 ; coord events

	db 14 ; bg events
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

	db 4 ; object events
	object_event  5,  1, SPRITE_SURGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1 ; Leader
	object_event 11, 23, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 11,  6, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 22, 23, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
