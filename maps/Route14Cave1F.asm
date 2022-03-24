	const_def 2 ; object constants
	const ROUTE_14_CAVE_1F_BOULDER1
	const ROUTE_14_CAVE_1F_BOULDER2
	const ROUTE_14_CAVE_1F_BOULDER3
	const ROUTE_14_CAVE_1F_MAROWAK
	const ROUTE_14_CAVE_1F_TEACHER

Route14Cave1F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .MarowakCallback

.MarowakCallback:
	checkevent EVENT_ROUTE_14_CAVE_MAROWAK
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
	moveobject ROUTE_14_CAVE_1F_MAROWAK,  8,  8
	return
	
.PositionTwo:
	moveobject ROUTE_14_CAVE_1F_MAROWAK,  8,  5
	return
	
.PositionThree:
	moveobject ROUTE_14_CAVE_1F_MAROWAK,  5, 12
	appear ROUTE_14_CAVE_1F_MAROWAK
	return	
	
.PositionFour:
	moveobject ROUTE_14_CAVE_1F_MAROWAK,  2,  7
	appear ROUTE_14_CAVE_1F_MAROWAK
	return
	
.PositionFive:
	moveobject ROUTE_14_CAVE_1F_MAROWAK, 13,  9
	return
	
.PositionSix:
	moveobject ROUTE_14_CAVE_1F_MAROWAK,  8,  4
	return

Route14Cave1FMarowakScript:
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
	writetext Route14Cave1FMarowakText
	cry MAROWAK
	waitbutton
	closetext
	checkevent EVENT_ROUTE_14_CAVE_1F_BOULDER_1
	iftrue .Position1_Continue
	checkevent EVENT_ROUTE_14_CAVE_1F_BOULDER_2
	iftrue .Position1_Continue
	checkevent EVENT_ROUTE_14_CAVE_1F_BOULDER_3
	iftrue .Position1_Down2
.Position1_Continue:
	scall .CheckFacing
	ifequal DOWN, .Position1_Down
	applymovement ROUTE_14_CAVE_1F_MAROWAK, MarowakPos1
	moveobject ROUTE_14_CAVE_1F_MAROWAK, 8, 5
	loadvar wFarfetchdPosition, 2
	end
	
.Position1_Down:
	checkevent EVENT_ROUTE_14_CAVE_1F_BOULDER_3
	iffalse .Position1_Down2
	applymovement ROUTE_14_CAVE_1F_MAROWAK, MarowakPos1Down
	moveobject ROUTE_14_CAVE_1F_MAROWAK, 5, 12
	loadvar wFarfetchdPosition, 3
	end
	
.Position1_Down2:
	scall .CheckFacing
	ifequal LEFT, .Position1_DownLeft
	applymovement ROUTE_14_CAVE_1F_MAROWAK, MarowakPos1Down2
	moveobject ROUTE_14_CAVE_1F_MAROWAK, 13, 9
	loadvar wFarfetchdPosition, 5
	end
	
.Position1_DownLeft:
	applymovement ROUTE_14_CAVE_1F_MAROWAK, MarowakPos1Down3
	moveobject ROUTE_14_CAVE_1F_MAROWAK, 13, 9
	loadvar wFarfetchdPosition, 5
	end
	
.Position2:
	faceplayer
	opentext
	writetext Route14Cave1FMarowakText
	cry MAROWAK
	waitbutton
	closetext
	checkevent EVENT_ROUTE_14_CAVE_1F_BOULDER_1
	iffalse .Position2_DeadEnd
	checkevent EVENT_ROUTE_14_CAVE_1F_BOULDER_2
	iffalse .Position2_DeadEnd
.Position2_Continue:
	scall .CheckFacing
	ifequal RIGHT, .Position2_Right
	applymovement ROUTE_14_CAVE_1F_MAROWAK, MarowakPos2
	moveobject ROUTE_14_CAVE_1F_MAROWAK, 8, 8
	loadvar wFarfetchdPosition, 1
	end

.Position2_Right:
	scall .CheckFacing
	ifequal UP, .Position2_Left
	applymovement ROUTE_14_CAVE_1F_MAROWAK, MarowakPos2Right
	moveobject ROUTE_14_CAVE_1F_MAROWAK, 8, 8
	loadvar wFarfetchdPosition, 1
	end

.Position2_Left:
	applymovement ROUTE_14_CAVE_1F_MAROWAK, MarowakPos2Left
	moveobject ROUTE_14_CAVE_1F_MAROWAK, 13, 9
	loadvar wFarfetchdPosition, 5
	end	

.Position2_DeadEnd:
	checkevent EVENT_ROUTE_14_CAVE_1F_BOULDER_1
	iftrue .Position2_Right
	checkevent EVENT_ROUTE_14_CAVE_1F_BOULDER_2
	iftrue .Position2_Continue
	applymovement ROUTE_14_CAVE_1F_MAROWAK, MarowakDeadEnd
	moveobject ROUTE_14_CAVE_1F_MAROWAK, 8, 4
	loadvar wFarfetchdPosition, 6
	end

.Position3:
	faceplayer
	opentext
	writetext Route14Cave1FMarowakText
	cry MAROWAK
	waitbutton
	closetext
	applymovement ROUTE_14_CAVE_1F_MAROWAK, MarowakPos3
	moveobject ROUTE_14_CAVE_1F_MAROWAK, 2, 7
	loadvar wFarfetchdPosition, 4
	end

.Position4:
	faceplayer
	opentext
	writetext Route14Cave1FMarowakText
	cry MAROWAK
	waitbutton
	closetext
	checkevent EVENT_ROUTE_14_CAVE_1F_BOULDER_2
	iffalse .Position4_Up
	applymovement ROUTE_14_CAVE_1F_MAROWAK, MarowakPos4
	moveobject ROUTE_14_CAVE_1F_MAROWAK, 8, 8
	loadvar wFarfetchdPosition, 1
	end
	
.Position4_Up:
	applymovement ROUTE_14_CAVE_1F_MAROWAK, MarowakPos4Up
	moveobject ROUTE_14_CAVE_1F_MAROWAK, 8, 8
	loadvar wFarfetchdPosition, 1
	end
	
.Position5:
	faceplayer
	opentext
	writetext Route14Cave1FMarowakText
	cry MAROWAK
	waitbutton
	closetext
	scall .CheckFacing
	ifequal DOWN, .Position5_Down	
	applymovement ROUTE_14_CAVE_1F_MAROWAK, MarowakPos5
	moveobject ROUTE_14_CAVE_1F_MAROWAK, 8, 8
	loadvar wFarfetchdPosition, 1
	end
	
.Position5_Down:
	applymovement ROUTE_14_CAVE_1F_MAROWAK, MarowakPos5Down
	moveobject ROUTE_14_CAVE_1F_MAROWAK, 8, 8
	loadvar wFarfetchdPosition, 1
	end
	
.Position6:
	applymovement ROUTE_14_CAVE_1F_MAROWAK, MarowakCornered
	opentext
	writetext MarowakCorneredText
	waitbutton
	writetext Route14Cave1FMarowakText
	cry MAROWAK
	waitbutton
	closetext
	loadwildmon MAROWAK, 35
	writecode VAR_BATTLETYPE, BATTLETYPE_BOSS
	startbattle
	reloadmapafterbattle
	opentext
	writetext Route14TeacherApproachText
	waitbutton
	closetext
	moveobject ROUTE_14_CAVE_1F_TEACHER, 12, 10
	appear ROUTE_14_CAVE_1F_TEACHER
	applymovement ROUTE_14_CAVE_1F_TEACHER, Route14Cave1FTeacherApproach
	applymovement PLAYER, Route14Cave1FPlayerStepAside
	applymovement ROUTE_14_CAVE_1F_TEACHER, Route14Cave1FTeacherApproach2
	opentext
	writetext Route14Cave1FTeacherWorried
	waitbutton
	closetext
	showemote EMOTE_SHOCK, ROUTE_14_CAVE_1F_TEACHER, 15
	opentext
	writetext Route14Cave1FTeacherBattle
	waitbutton
	closetext
	turnobject ROUTE_14_CAVE_1F_TEACHER, LEFT
	opentext
	writetext Route14Cave1FTeacherThankPlayer
	waitbutton
	closetext
	turnobject ROUTE_14_CAVE_1F_TEACHER, UP
	opentext
	writetext Route14Cave1FTeacherLetsGoText
	waitbutton
	closetext
	follow ROUTE_14_CAVE_1F_TEACHER, ROUTE_14_CAVE_1F_MAROWAK
	applymovement ROUTE_14_CAVE_1F_TEACHER, Route14Cave1FTeacherLeave
	disappear ROUTE_14_CAVE_1F_MAROWAK
	disappear ROUTE_14_CAVE_1F_TEACHER
	clearevent EVENT_HIDE_SHELTER_MAROWAK
	setevent EVENT_ROUTE_14_CAVE_MAROWAK
	end
	
.CheckFacing:
	checkcode VAR_FACING
	end	

Route14Cave1FBoulder:
	jumptext Route14Cave1FWontBudge
	
Route14CaveReset:
	setevent EVENT_ROUTE_14_CAVE_1F_BOULDER_1
	setevent EVENT_ROUTE_14_CAVE_1F_BOULDER_2
	setevent EVENT_ROUTE_14_CAVE_1F_BOULDER_3
	clearevent EVENT_ROUTE_14_CAVE_2F_BOULDER_1
	clearevent EVENT_ROUTE_14_CAVE_2F_BOULDER_2
	clearevent EVENT_ROUTE_14_CAVE_2F_BOULDER_3
	clearevent EVENT_HEARD_ROUTE_12_LEADER
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
	
MarowakPos4:
	jump_step RIGHT
	run_step RIGHT
	run_step RIGHT
	run_step DOWN
	run_step RIGHT
	run_step RIGHT	
	step_resume	
	
MarowakPos4Up:
	jump_step RIGHT
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
	
Route14Cave1FTeacherApproach:
	step UP
	step UP
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step UP
	step UP
	step_resume
	
Route14Cave1FPlayerStepAside:
	step LEFT
	turn_head RIGHT
	step_end
	
Route14Cave1FTeacherLeave:
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

Route14Cave1FTeacherApproach2:
	step UP
	step_resume
	
Route14Cave1FMarowakText:
	text "MAROWAK: Kyarugoo!"
	done
	
Route14Cave1FWontBudge:
	text "It won't budge!"
	done
	
MarowakCorneredText:
	text "MAROWAK is"
	line "cornered!"
	done
	
Route14TeacherApproachText:
	text "That's where you"
	line "ran off to!"
	done
	
Route14Cave1FTeacherWorried:
	text "You have worried"
	line "us so much!"
	done
	
Route14Cave1FTeacherBattle:
	text "It looks like you"
	line "were just in a"
	cont "battle."
	
	para "Was it with this"
	line "trainer?"
	done
	
Route14Cave1FTeacherThankPlayer:
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
	
Route14Cave1FTeacherLetsGoText:
	text "Please come back"
	line "to the shelter and"
	cont "show KANGASKHAN"
	cont "you are alright!"
	
	para "She has been"
	line "worried sick over"
	cont "you!"
	done
	
Route14Cave1FTeacherComeAlong:
	text "You may come along"
	line "too!"
	done

Route14Cave1F_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 11,  3, ROUTE_14_CAVE_2F, 1
	warp_event 10,  6, ROUTE_14_CAVE_1F, 2
	warp_event 10, 12, ROUTE_14_CAVE_1F, 2
	warp_event  6,  8, ROUTE_14_CAVE_1F, 2
	warp_event  9, 19, ROUTE_14, 1

	db 0 ; coord events

	db 0 ; bg events
;	bg_event  9, 19, BGEVENT_READ, Route14CaveReset

	db 5 ; object events
	object_event 10,  5, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route14Cave1FBoulder, EVENT_ROUTE_14_CAVE_1F_BOULDER_1
	object_event  6,  7, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route14Cave1FBoulder, EVENT_ROUTE_14_CAVE_1F_BOULDER_2
	object_event 10, 11, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route14Cave1FBoulder, EVENT_ROUTE_14_CAVE_1F_BOULDER_3
	object_event  8,  8, SPRITE_MONSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Route14Cave1FMarowakScript, EVENT_ROUTE_14_CAVE_MAROWAK
	object_event  0,  0, SPRITE_POSEY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROUTE_14_CAVE_MAROWAK
	
