	const_def 2 ; object constants

OrchidCity_MapScripts:
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint
	callback MAPCALLBACK_TILES, .SmashWall
	
.FlyPoint:
	setflag ENGINE_FLYPOINT_ORCHID
	return
	
.SmashWall:
	checkevent EVENT_ENTEI_CAVE_OPEN
	iffalse .skip
	changeblock 18, 22, $4D
.skip
	return

OrchidGymEvent:
	scall OrchidGymEntrance
	iffalse .no
	warpfacing UP, BLACKTHORN_GYM_1F, 7, 21
.no
	end
	
OrchidGymEntrance:
	jumpstd gymdoor
	end

OrchidCityTeacher:
	jumptextfaceplayer OrchidCityTeacherText
	
OrchidCityTeacherText:
	text "The lava glows so"
	line "bright after dark."
	
	para "I'd love to have"
	line "someone stay here"
	cont "and watch it with."
	done

OrchidCity_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 23, 25, ORCHID_POKECENTER_1F, 1
	warp_event  5, 15, DRAGONBREATH_HOUSE, 1
	warp_event 13,  5, ORCHID_MART, 1
	warp_event 26,  7, BLACKTHORN_GYM_1F, 1
	warp_event 19, 23, ENTEI_CAVE_1F, 1
	
	db 0 ; coord events

	db 1 ; bg events
	bg_event 26,  7, BGEVENT_UP, OrchidGymEvent

	db 1 ; object events
	object_event 29, 18, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OrchidCityTeacher, -1
