	const_def 2 ; object constants
	const THE_BONEYARD_1F_BOULDER1
	const THE_BONEYARD_1F_BOULDER2
	const THE_BONEYARD_1F_BOULDER3
	const THE_BONEYARD_1F_MAROWAK
	const THE_BONEYARD_1F_TEACHER

TheBoneyard1F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .MarowakCallback

.MarowakCallback:
	checkevent EVENT_THE_BONEYARD_MAROWAK
	iftrue .Disappear
	copybytetovar wFarfetchdPosition
	ifequal  1, .PositionOne
	ifequal  2, .PositionTwo
	ifequal  3, .PositionThree
	ifequal  4, .PositionFour
	ifequal  5, .PositionFive
	ifequal  6, .PositionSix

.Disappear:
	return

.PositionOne:
	moveobject THE_BONEYARD_1F_MAROWAK,  8,  8
	return
	
.PositionTwo:
	moveobject THE_BONEYARD_1F_MAROWAK,  8,  5
	return
	
.PositionThree:
	moveobject THE_BONEYARD_1F_MAROWAK,  5, 12
	appear THE_BONEYARD_1F_MAROWAK
	return	
	
.PositionFour:
	moveobject THE_BONEYARD_1F_MAROWAK,  2,  7
	appear THE_BONEYARD_1F_MAROWAK
	return
	
.PositionFive:
	moveobject THE_BONEYARD_1F_MAROWAK, 13,  9
	return
	
.PositionSix:
	moveobject THE_BONEYARD_1F_MAROWAK,  8,  4
	return

TheBoneyard1FMarowakScript:
	copybytetovar wFarfetchdPosition
	ifequal  1, .Position1
	ifequal  2, .Position2
	ifequal  3, .Position3
	ifequal  4, .Position4
	ifequal  5, .Position5
	ifequal  6, .Position6

.Position1:
	faceplayer
	opentext
	writetext TheBoneyard1FMarowakText
	cry MAROWAK
	waitbutton
	closetext
	checkevent EVENT_THE_BONEYARD_1F_BOULDER_1
	iftrue .Position1_Continue
	checkevent EVENT_THE_BONEYARD_1F_BOULDER_2
	iftrue .Position1_Continue
	checkevent EVENT_THE_BONEYARD_1F_BOULDER_3
	iftrue .Position1_Down2
.Position1_Continue:
	scall .CheckFacing
	ifequal DOWN, .Position1_Down
	applymovement THE_BONEYARD_1F_MAROWAK, MarowakPos1
	moveobject THE_BONEYARD_1F_MAROWAK, 8, 5
	loadvar wFarfetchdPosition, 2
	end

.Position1_Down:
	checkevent EVENT_THE_BONEYARD_1F_BOULDER_3
	iffalse .Position1_Down2
	applymovement THE_BONEYARD_1F_MAROWAK, MarowakPos1Down
	moveobject THE_BONEYARD_1F_MAROWAK, 5, 12
	loadvar wFarfetchdPosition, 3
	end
	
.Position1_Down2:
	scall .CheckFacing
	ifequal LEFT, .Position1_DownLeft
	applymovement THE_BONEYARD_1F_MAROWAK, MarowakPos1Down2
	moveobject THE_BONEYARD_1F_MAROWAK, 13, 9
	loadvar wFarfetchdPosition, 5
	end
	
.Position1_DownLeft:
	applymovement THE_BONEYARD_1F_MAROWAK, MarowakPos1Down3
	moveobject THE_BONEYARD_1F_MAROWAK, 13, 9
	loadvar wFarfetchdPosition, 5
	end
	
.Position2:
	faceplayer
	opentext
	writetext TheBoneyard1FMarowakText
	cry MAROWAK
	waitbutton
	closetext
	checkevent EVENT_THE_BONEYARD_1F_BOULDER_1
	iffalse .Position2_DeadEnd
	checkevent EVENT_THE_BONEYARD_1F_BOULDER_2
	iffalse .Position2_DeadEnd
.Position2_Continue:
	scall .CheckFacing
	ifequal RIGHT, .Position2_Right
	applymovement THE_BONEYARD_1F_MAROWAK, MarowakPos2
	moveobject THE_BONEYARD_1F_MAROWAK, 8, 8
	loadvar wFarfetchdPosition, 1
	end

.Position2_Right:
	scall .CheckFacing
	ifequal UP, .Position2_Left
	applymovement THE_BONEYARD_1F_MAROWAK, MarowakPos2Right
	moveobject THE_BONEYARD_1F_MAROWAK, 8, 8
	loadvar wFarfetchdPosition, 1
	end

.Position2_Left:
	applymovement THE_BONEYARD_1F_MAROWAK, MarowakPos2Left
	moveobject THE_BONEYARD_1F_MAROWAK, 13, 9
	loadvar wFarfetchdPosition, 5
	end	

.Position2_DeadEnd:
	checkevent EVENT_THE_BONEYARD_1F_BOULDER_1
	iftrue .Position2_Right
	checkevent EVENT_THE_BONEYARD_1F_BOULDER_2
	iftrue .Position2_Continue
	applymovement THE_BONEYARD_1F_MAROWAK, MarowakDeadEnd
	moveobject THE_BONEYARD_1F_MAROWAK, 8, 4
	loadvar wFarfetchdPosition, 6
	end

.Position3:
	faceplayer
	opentext
	writetext TheBoneyard1FMarowakText
	cry MAROWAK
	waitbutton
	closetext
	applymovement THE_BONEYARD_1F_MAROWAK, MarowakPos3
	moveobject THE_BONEYARD_1F_MAROWAK, 2, 7
	loadvar wFarfetchdPosition, 4
	end

.Position4:
	faceplayer
	opentext
	writetext TheBoneyard1FMarowakText
	cry MAROWAK
	waitbutton
	closetext
	checkevent EVENT_THE_BONEYARD_1F_BOULDER_2
	iffalse .Position4_Up
	playsound SFX_JUMP_OVER_LEDGE
	applymovement THE_BONEYARD_1F_MAROWAK, MarowakPos4Jump
	waitsfx
	applymovement THE_BONEYARD_1F_MAROWAK, MarowakPos4
	moveobject THE_BONEYARD_1F_MAROWAK, 8, 8
	loadvar wFarfetchdPosition, 1
	end
	
.Position4_Up:
	playsound SFX_JUMP_OVER_LEDGE
	applymovement THE_BONEYARD_1F_MAROWAK, MarowakPos4UpJump
	waitsfx
	applymovement THE_BONEYARD_1F_MAROWAK, MarowakPos4Up
	moveobject THE_BONEYARD_1F_MAROWAK, 8, 8
	loadvar wFarfetchdPosition, 1
	end
	
.Position5:
	faceplayer
	opentext
	writetext TheBoneyard1FMarowakText
	cry MAROWAK
	waitbutton
	closetext
	scall .CheckFacing
	ifequal DOWN, .Position5_Down	
	applymovement THE_BONEYARD_1F_MAROWAK, MarowakPos5
	moveobject THE_BONEYARD_1F_MAROWAK, 8, 8
	loadvar wFarfetchdPosition, 1
	end
	
.Position5_Down:
	applymovement THE_BONEYARD_1F_MAROWAK, MarowakPos5Down
	moveobject THE_BONEYARD_1F_MAROWAK, 8, 8
	loadvar wFarfetchdPosition, 1
	end
	
.Position6:
	applymovement THE_BONEYARD_1F_MAROWAK, MarowakCornered
	opentext
	writetext MarowakCorneredText
	waitbutton
	writetext TheBoneyard1FMarowakText
	cry MAROWAK
	waitsfx
	closetext
	loadwildmon MAROWAK, 35
	writecode VAR_BATTLETYPE, BATTLETYPE_BOSS
	startbattle
	reloadmapafterbattle
	opentext
	writetext Route13TeacherApproachText
	waitbutton
	closetext
	moveobject THE_BONEYARD_1F_TEACHER, 12, 10
	appear THE_BONEYARD_1F_TEACHER
	applymovement THE_BONEYARD_1F_TEACHER, TheBoneyard1FTeacherApproach
	applymovement PLAYER, TheBoneyard1FPlayerStepAside
	applymovement THE_BONEYARD_1F_TEACHER, TheBoneyard1FTeacherApproach2
	opentext
	writetext TheBoneyard1FTeacherWorried
	waitbutton
	closetext
	showemote EMOTE_SHOCK, THE_BONEYARD_1F_TEACHER, 15
	opentext
	writetext TheBoneyard1FTeacherBattle
	waitbutton
	closetext
	turnobject THE_BONEYARD_1F_TEACHER, LEFT
	opentext
	writetext TheBoneyard1FTeacherThankPlayer
	waitbutton
	closetext
	turnobject THE_BONEYARD_1F_TEACHER, UP
	opentext
	writetext TheBoneyard1FTeacherLetsGoText
	waitbutton
	closetext
	follow THE_BONEYARD_1F_TEACHER, THE_BONEYARD_1F_MAROWAK
	applymovement THE_BONEYARD_1F_TEACHER, TheBoneyard1FTeacherLeave
	disappear THE_BONEYARD_1F_MAROWAK
	disappear THE_BONEYARD_1F_TEACHER
	clearevent EVENT_HIDE_SHELTER_MAROWAK
	setevent EVENT_THE_BONEYARD_MAROWAK
	end
	
.CheckFacing:
	checkcode VAR_FACING
	end	

TheBoneyard1FBoulder:
	jumptext TheBoneyard1FWontBudge
	
TheBoneyardReset:
	setevent EVENT_THE_BONEYARD_1F_BOULDER_1
	setevent EVENT_THE_BONEYARD_1F_BOULDER_2
	setevent EVENT_THE_BONEYARD_1F_BOULDER_3
	clearevent EVENT_THE_BONEYARD_2F_BOULDER_1
	clearevent EVENT_THE_BONEYARD_2F_BOULDER_2
	clearevent EVENT_THE_BONEYARD_2F_BOULDER_3
	clearevent EVENT_HEARD_ROUTE_11_LEADER
	loadvar wFarfetchdPosition, 1
	end
	
MarowakPos1:
	run_step UP
	run_step UP
	run_step UP
	step_resume
	
MarowakPos1Down:
	run_step DOWN
	run_step DOWN
	run_step RIGHT
	run_step DOWN
	run_step RIGHT
	run_step DOWN
	run_step DOWN
	run_step LEFT
	run_step LEFT
	run_step LEFT
	run_step LEFT
	run_step LEFT
	run_step UP
	step_resume
	
MarowakPos1Down2:
	run_step RIGHT
	run_step RIGHT
	run_step RIGHT
	run_step RIGHT
	run_step RIGHT
	run_step DOWN
	step_resume	

MarowakPos1Down3:
	run_step DOWN
	run_step RIGHT
	run_step RIGHT
	run_step UP
	run_step RIGHT
	run_step RIGHT
	run_step RIGHT
	run_step DOWN
	step_resume
	
MarowakPos2:
	run_step LEFT
	run_step LEFT
	run_step LEFT
	run_step DOWN
	run_step DOWN
	run_step RIGHT
	run_step DOWN
	run_step RIGHT
	run_step RIGHT
	step_resume
	
MarowakPos2Right:
	run_step DOWN
	run_step DOWN
	run_step DOWN
	step_resume
	
MarowakPos2Left:
	run_step RIGHT
	run_step RIGHT
	run_step DOWN
	run_step RIGHT
	run_step RIGHT
	run_step RIGHT
	run_step DOWN
	run_step DOWN
	run_step DOWN
	step_resume
	
MarowakPos3:
	run_step UP
	run_step LEFT
	run_step LEFT
	run_step LEFT
	run_step UP
	run_step UP
	run_step UP
	run_step UP
	step_resume
	
MarowakPos4Jump:
	jump_step RIGHT
	step_resume

MarowakPos4:
	run_step RIGHT
	run_step RIGHT
	run_step DOWN
	run_step RIGHT
	run_step RIGHT	
	step_resume
	
MarowakPos4UpJump:
	jump_step RIGHT
	step_resume

MarowakPos4Up:
	run_step RIGHT
	run_step UP
	run_step UP
	run_step RIGHT
	run_step RIGHT
	run_step RIGHT	
	run_step DOWN
	run_step DOWN
	run_step DOWN
	step_resume
	
MarowakPos5:
	run_step UP
	run_step LEFT
	run_step LEFT
	run_step LEFT
	run_step LEFT
	run_step LEFT
	step_resume

MarowakPos5Down:
	run_step LEFT
	run_step UP
	run_step LEFT
	run_step LEFT
	run_step LEFT
	run_step LEFT
	step_resume
	
MarowakDeadEnd:
	fix_facing
	slow_step UP
	remove_fixed_facing
	step_resume
	
MarowakCornered:
	turn_head LEFT
	step_sleep 8
	step_sleep 8
	turn_head RIGHT
	step_sleep 8
	step_sleep 8
	turn_head LEFT
	step_sleep 8
	turn_head RIGHT
	step_sleep 8
	step_sleep 8
	turn_head DOWN
	step_resume
	
TheBoneyard1FTeacherApproach:
	step UP
	step UP
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step UP
	step UP
	step_resume
	
TheBoneyard1FPlayerStepAside:
	step LEFT
	turn_head RIGHT
	step_end
	
TheBoneyard1FTeacherLeave:
	step DOWN
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step DOWN
	step RIGHT
	step UP
	step_resume

TheBoneyard1FTeacherApproach2:
	step UP
	step_resume
	
TheBoneyard1FMarowakText:
	text "MAROWAK: Kyarugoo!"
	done
	
TheBoneyard1FWontBudge:
	text "It won't budge!"
	done
	
MarowakCorneredText:
	text "MAROWAK is"
	line "cornered!"
	done
	
Route13TeacherApproachText:
	text "???: That's where"
	line "you ran off to!"
	done
	
TheBoneyard1FTeacherWorried:
	text "You have worried"
	line "us so much!"
	done
	
TheBoneyard1FTeacherBattle:
	text "It looks like you"
	line "were just in a"
	cont "battle."
	
	para "Was it with this"
	line "trainer?"
	done
	
TheBoneyard1FTeacherThankPlayer:
	text "Thank you so much"
	line "for not hurting"
	cont "MAROWAK!"
	
	para "He doesn't have"
	line "much experience"
	cont "battling, so who"
	cont "knows what could"
	cont "have happened if"
	cont "someone else found" 
	cont "him!"
	done
	
TheBoneyard1FTeacherLetsGoText:
	text "Please come back"
	line "to the shelter and"
	cont "show KANGASKHAN"
	cont "you are alright!"
	
	para "She has been"
	line "worried sick over"
	cont "you!"
	done
	
TheBoneyard1FTeacherComeAlong:
	text "You may come along"
	line "too!"
	done

TheBoneyard1F_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 11,  3, THE_BONEYARD_2F, 1
	warp_event 10,  6, THE_BONEYARD_1F, 2
	warp_event 10, 12, THE_BONEYARD_1F, 2
	warp_event  6,  8, THE_BONEYARD_1F, 2
	warp_event  9, 19, ROUTE_13, 1

	db 0 ; coord events

	db 0 ; bg events
;	bg_event  9, 19, BGEVENT_READ, TheBoneyardReset

	db 5 ; object events
	object_event 10,  5, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TheBoneyard1FBoulder, EVENT_THE_BONEYARD_1F_BOULDER_1
	object_event  6,  7, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TheBoneyard1FBoulder, EVENT_THE_BONEYARD_1F_BOULDER_2
	object_event 10, 11, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TheBoneyard1FBoulder, EVENT_THE_BONEYARD_1F_BOULDER_3
	object_event  8,  8, SPRITE_MONSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, TheBoneyard1FMarowakScript, EVENT_THE_BONEYARD_MAROWAK
	object_event  0,  0, SPRITE_POSEY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_THE_BONEYARD_MAROWAK
	
