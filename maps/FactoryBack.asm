	const_def 2 ; object constants

FactoryBack_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
FactoryBreakableWallScript:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .AlreadyBroken
	scall FactorySmashWall
	iffalse .No
	changeblock 6, 0, $62
	reloadmappart
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
.No
	end

.AlreadyBroken:
	jumpstd smashwallbroken
	
FactorySmashWall:
	jumpstd smashwall

FactoryBack_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3, 15, FACTORY_1F, 5
	warp_event  4, 15, FACTORY_1F, 5
	warp_event  7,  0, EAST_FOREST, 4

	db 0 ; coord events

	db 1 ; bg events
	bg_event  7,  0, BGEVENT_UP, FactoryBreakableWallScript

	db 0 ; object events
	