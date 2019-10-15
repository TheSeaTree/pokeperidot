	const_def 2 ; object constants
	const BLACKTHORNGYM_CANNONBALL
	const BLACKTHORNGYM_EXPLOSION
	const BLACKTHORNGYM_CHRIS
	const BLACKTHORNGYM_KRIS

BlackthornGym1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

BlackthornGymCannon:
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .ShowGirl
	moveobject BLACKTHORNGYM_CHRIS, 7, 19
	appear BLACKTHORNGYM_CHRIS
	jump .HidePlayer
.ShowGirl
	moveobject BLACKTHORNGYM_KRIS, 7, 19
	appear BLACKTHORNGYM_KRIS
.HidePlayer
	applymovement PLAYER, BlackthornGymCannonMovement
	opentext
	writetext ChooseATargetText
	loadmenu .MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .Left
	ifequal 2, .Right
	end

.Left:
	closetext
	applymovement PLAYER, BlackthornGymCannonAimLeft
	moveobject BLACKTHORNGYM_CANNONBALL,  5, 16
	appear BLACKTHORNGYM_CANNONBALL
	playsound SFX_STRENGTH
	waitsfx
	applymovement BLACKTHORNGYM_CANNONBALL, BlackthornGymLaunchCannonball
	disappear BLACKTHORNGYM_CANNONBALL
	moveobject BLACKTHORNGYM_EXPLOSION,  5, 11
	appear BLACKTHORNGYM_EXPLOSION
	playsound SFX_EGG_BOMB
	waitsfx
	disappear BLACKTHORNGYM_EXPLOSION
	changeblock 4, 10, $24 ; wall
	applymovement PLAYER, BlackthornGymCannonMoveBackLeft
	jump .Finish
	
.Right:
	closetext
	applymovement PLAYER, BlackthornGymCannonAimRight
	moveobject BLACKTHORNGYM_CANNONBALL, 10, 14
	appear BLACKTHORNGYM_CANNONBALL
	playsound SFX_STRENGTH
	waitsfx
	applymovement BLACKTHORNGYM_CANNONBALL, BlackthornGymLaunchCannonball
	disappear BLACKTHORNGYM_CANNONBALL
	moveobject BLACKTHORNGYM_EXPLOSION,  10, 9
	appear BLACKTHORNGYM_EXPLOSION
	playsound SFX_EGG_BOMB
	waitsfx
	disappear BLACKTHORNGYM_CANNONBALL
	changeblock 10, 8, $24 ; wall
	applymovement PLAYER, BlackthornGymCannonMoveBackRight
	
.Finish:
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .HideGirl
	disappear BLACKTHORNGYM_CHRIS
.HideGirl
	disappear BLACKTHORNGYM_KRIS
	end

.MenuHeader:
	db MENU_SPRITE_ANIMS | MENU_BACKUP_TILES ; flags
	menu_coords  12, 7, SCREEN_WIDTH - 1, SCREEN_HEIGHT - 6
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_DISABLE_B | STATICMENU_CURSOR ; flags
	db 2 ; # items
	db "LEFT@"
	db "RIGHT@"
	
BlackthornGymCannonMovement:
	hide_person
	run_step UP
	run_step UP
	run_step UP
	run_step UP
	run_step UP
	run_step UP
	run_step UP
	run_step UP
	run_step UP
	step_resume
	
BlackthornGymCannonMoveBackLeft:
	run_step DOWN
	run_step DOWN
	run_step DOWN
	run_step DOWN
	run_step DOWN
	run_step DOWN
	run_step DOWN
	run_step DOWN
	run_step RIGHT
	run_step RIGHT
	turn_head UP
	show_person
	step_resume
	
BlackthornGymCannonMoveBackRight:
	run_step DOWN
	run_step DOWN
	run_step DOWN
	run_step DOWN
	run_step DOWN
	run_step DOWN
	run_step DOWN
	run_step DOWN
	run_step DOWN
	run_step DOWN
	run_step LEFT
	run_step LEFT
	run_step LEFT
	turn_head UP
	show_person
	step_resume
	
BlackthornGymCannonAimLeft:
	step LEFT
	step LEFT
	step DOWN
	step_resume

BlackthornGymCannonAimRight:
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step_resume

BlackthornGymLaunchCannonball:
	slide_step UP
	slide_step UP
	slide_step UP
	slide_step UP
	slide_step UP
	hide_person
	step_end
	
ChooseATargetText:
	text "Which target will"
	line "you aim at?"
	done

BlackthornGym1F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 7, 21, ROUTE_20, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event  7, 18, BGEVENT_UP, BlackthornGymCannon

	db 4 ; object events
	object_event  0,  0, SPRITE_CANNONBALL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  0,  0, SPRITE_EXPLOSION, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  0,  0, SPRITE_CHRIS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  0,  0, SPRITE_KRIS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
