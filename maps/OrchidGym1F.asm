	const_def 2 ; object constants
	const ORCHIDGYM_GYM_GUY

OrchidGym1F_MapScripts:
	db 2 ; scene scripts
	scene_script .Scene0 ; SCENE_DEFAULT
	scene_script .Scene1 ; SCENE_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .SetSteps

.Scene1:
	turnobject ORCHIDGYM_GYM_GUY, LEFT
	opentext
	writetext BlackthornGymGuyFailureText
	closetext
	turnobject ORCHIDGYM_GYM_GUY, DOWN
	setscene SCENE_DEFAULT
.Scene0:
	end
	
.SetSteps
	special SetFireGymSteps
	return

BlackthornGymGuy:
	jumptextfaceplayer BlackthornGymGuyText
	
BlackthornCantLeave:
	checkflag ENGINE_RISINGBADGE
	iftrue .Leave
	jumpstd cantleavegym
	end
	
.Leave
	opentext
	writetext BlackthornGymHaveBadge
	waitbutton
	closetext
	applymovement PLAYER, BlackthornLeaveGym
	special FadeOutPalettes
	playsound SFX_EXIT_BUILDING
	wait 4
	warpfacing DOWN, ORCHID_CITY, 26,  7
	end
	
BlackthornGymStatue:
	trainertotext ENYA, ENYA1, MEM_BUFFER_1
	checkflag ENGINE_RISINGBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	checkflag ENGINE_FLYPOINT_POKEMON_LEAGUE
	iftrue .RivalBeaten
	jumpstd gymstatue2
.RivalBeaten
	jumpstd gymstatue3

BlackthornLeaveGym:
	turn_step DOWN
	step_end

BlackthornGymGuyText:
	text "Yo! Champ in the"
	line "making!"

	para "This GYM on top of"
	line "a volcano is too"
	cont "hot to handle!"

	para "Careful down in"
	line "the basement."

	para "The trainers down"
	line "there are used to"
	cont "the extreme heat,"
	cont "bur you're not!"

	para "Plan your steps"
	line "carefully, or else"
	cont "you might pass out"
	cont "and have to start"
	cont "from back here."

	para "ENYA only wants to"
	line "battle the best of"
	cont "the best."

	para "Don't worry, you"
	line "got this!"
	done
	
BlackthornGymGuyFailureText:
	text "Woah there! You"
	line "gave me quite the"
	cont "scare!"
	
	para "You need to be"
	line "more careful in"
	cont "that extreme heat!"
	done

BlackthornGymHaveBadge:
	text "<PLAYER> used"
	line "the WYRMBADGE to"
	cont "unlock the door!"
	done

OrchidGym1F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  6,  3, ORCHID_GYM_B1F, 1

	db 0 ; coord events

	db 4 ; bg events
	bg_event  4,  5, BGEVENT_READ, BlackthornGymStatue
	bg_event  9,  5, BGEVENT_READ, BlackthornGymStatue
	bg_event  6,  8, BGEVENT_DOWN, BlackthornCantLeave
	bg_event  7,  8, BGEVENT_DOWN, BlackthornCantLeave

	db 1 ; object events
	object_event  8,  5, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 1, BlackthornGymGuy, -1
