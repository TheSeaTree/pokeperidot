	const_def 2 ; object constants
	const DIGLETTSCAVE_POKEFAN_M
	const DIGLETTSCAVE_ROCK

DiglettsCave_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .SmashWall
	
.SmashWall:
	checkevent EVENT_DRAIN_PUNCH_CHAMBER_OPEN
	iffalse .skip
	changeblock 18, 2, $13
.skip
	return
	
TrainerBlackbeltAxel:
	trainer BLACKBELT_T, AXEL, EVENT_BEAT_BLACKBELT_AXEL, Route3CaveTrainerText, Route3CaveWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext Route3CaveWinText
	waitbutton
	closetext
	end	
	
TrainerHikerAdam:
	trainer HIKER, ADAM, EVENT_BEAT_HIKER_ADAM, Route3CaveTrainerText, Route3CaveWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext Route3CaveWinText
	waitbutton
	closetext
	end	

TrainerBeautyBlaze:
	trainer BEAUTY, BLAZE, EVENT_BEAT_BEAUTY_BLAZE, Route3CaveTrainerText, Route3CaveWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext Route3CaveWinText
	waitbutton
	closetext
	end	
	
DrainPunchChamberBreakableWallScript:
	checkevent EVENT_DRAIN_PUNCH_CHAMBER_OPEN
	iftrue .AlreadyBroken
	scall DrainPunchChamberSmashWall
	iffalse .No
	changeblock 18, 2, $13
	reloadmappart
	setevent EVENT_DRAIN_PUNCH_CHAMBER_OPEN
.No
	end

.AlreadyBroken:
	jumpstd smashwallbroken
	
DrainPunchChamberSmashWall:
	jumpstd smashwall

DiglettsCaveBoulder:
	jumpstd strengthboulder	
	
DiglettsCaveHiddenEverstone:
	hiddenitem EVERSTONE, EVENT_DIGLETTS_CAVE_HIDDEN_EVERSTONE
	
Route3BlackBelt:
	itemball BLACKBELT

Route3CaveTrainerText:
	text "I am a"
	line "#MON trainer!"
	done
	
Route3CaveWinText:
	text "I lost."
	done
	
DiglettsCave_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 21,  11, ROUTE_3, 3
	warp_event  3,  13, ROUTE_3, 4
	warp_event 19,   3, DRAIN_PUNCH_CHAMBER, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event 20,  7, BGEVENT_ITEM, DiglettsCaveHiddenEverstone
	bg_event 19,  3, BGEVENT_UP, DrainPunchChamberBreakableWallScript

	db 5 ; object events
	object_event 13,  6, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerBlackbeltAxel, -1
	object_event  8, 11, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerHikerAdam, -1
	object_event 14, 14, SPRITE_BUENA, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerBeautyBlaze, -1
	object_event 11, 13, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route3BlackBelt, EVENT_ROUTE_3_BLACKBELT
	object_event  6, 10, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DiglettsCaveBoulder, -1
