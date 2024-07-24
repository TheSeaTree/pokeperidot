	const_def 2 ; object constants

PastRoute11Schoolhouse2_MapScripts:
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_TILES, .Chair
	callback MAPCALLBACK_NEWMAP, .Lights

.Chair
	checkcode VAR_HOUR
	ifless 16, .done
	ifgreater 17, .done
	changeblock	8, 0, $3c
	changeblock	8, 2, $3d
.done
	return

.Lights
	checkcode VAR_HOUR
	ifless 17, .nothing
	scall .lights
.nothing
	return

.lights
	jumpstd darkenroomnoflash
	end

PastRoute11Schoolhouse2_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  5,  9, PAST_ROUTE_11, 1
	warp_event  6,  9, PAST_ROUTE_11, 1

	db 0 ; coord events

	db 10 ; bg events
	bg_event  6,  6, BGEVENT_UP, PastRoute11SchoolhouseEmptyDesk
	bg_event  2,  4, BGEVENT_UP, PastRoute11SchoolhouseTidyDesk
	bg_event  4,  4, BGEVENT_UP, PastRoute11SchoolhouseTidyDesk
	bg_event  6,  4, BGEVENT_UP, PastRoute11SchoolhouseTidyDesk
	bg_event  8,  4, BGEVENT_UP, PastRoute11SchoolhouseTidyDesk
	bg_event  2,  6, BGEVENT_UP, PastRoute11SchoolhouseTidyDesk
	bg_event  4,  6, BGEVENT_UP, PastRoute11SchoolhouseTidyDesk
	bg_event  8,  6, BGEVENT_UP, PastRoute11SchoolhouseTidyDesk
	bg_event  6,  0, BGEVENT_UP, PastRoute11SchoolhouseChalkboard
	bg_event  5,  0, BGEVENT_UP, PastRoute11SchoolhouseChalkboard

	db 9 ; object events
	object_event  5,  3, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, 7, 15, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PastRoute11SchoolhouseTeacher, -1
	object_event  9,  1, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, 16, 17, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PastRoute11SchoolhouseTeacherAfterHours, -1
	object_event  4,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 1, 0, 7, 15, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, TrainerSchoolboyPatrick, -1
	object_event  2,  7, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 1, 0, 7, 15, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, TrainerLassJean, -1
	object_event  8,  5, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_UP, 1, 0, 7, 15, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, TrainerBugCatcherTony, -1
	object_event  4,  5, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_UP, 1, 0, 7, 15, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PastRoute11SchoolhouseTwin, -1
	object_event  2,  5, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_UP, 1, 0, 7, 15, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, TrainerCooltrainerMMitch, -1
	object_event  8,  7, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 1, 0, 7, 15, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, TrainerPicnickerGia, -1
	object_event  6,  5, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_UP, 1, 0, 7, 15, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, TrainerCooltrainerFHannah, -1
