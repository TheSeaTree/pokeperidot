	const_def 2 ; object constants
	const POWERPLANT1FB_ADMIN
	const POWERPLANT1FB_POKEBALL1
	const POWERPLANT1FB_POKEBALL2
	const POWERPLANT1FB_POKEBALL3
	const POWERPLANT1FB_SCIENTIST1
	const POWERPLANT1FB_SCIENTIST2
	const POWERPLANT1FB_SCIENTIST3
	const POWERPLANT1FB_SCIENTIST4
	const POWERPLANT1FB_SCIENTIST5
	const POWERPLANT1FB_SCIENTIST6

PowerPlant1FB_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .CardKeyShutterCallback

.DummyScene0:
	priorityjump PowerPlantPassEvent
	end

.DummyScene1:
	end

.CardKeyShutterCallback:
	changeblock  4,  8, $07 ; open shutter
	return

PowerPlantPassEvent:
	pause 8
	opentext
	writetext MahoganyTownPowerPlantCompleted
	buttonsound
	verbosegiveitem PASS
	writetext MahoganyTownPowerPlantAfterPass
	buttonsound
	setscene SCENE_FINISHED
	setevent EVENT_POWER_PLANT_1F_MUK
	setevent EVENT_RETURNED_MACHINE_PART
	closetext
	applymovement POWERPLANT1FB_ADMIN, PowerPlantAdminWalkAway
	disappear POWERPLANT1FB_ADMIN
	end

PowerPlantAdmin:
	jumptextfaceplayer MahoganyTownPowerPlantAfterPass

PowerPlantBMetalCoat:
	itemball METAL_COAT
	
PowerPlantBHyperPotion:
	itemball HYPER_POTION
	
PowerPlantBPPUp:
	itemball PP_UP
	
PowerPlantAdminWalkAway:
	step UP
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

MahoganyTownPowerPlantCompleted:
	text "This is much"
	line "better!"
	
	para "Here is the reward"
	line "I promised inside."
	
	para "It's a PASS to"
	line "ride the SUBWAY to"
	cont "PECTINIA CITY."
	done
	
MahoganyTownPowerPlantAfterPass:
	text "I have so much"
	line "work to catch up"
	cont "on now, that I"
	cont "doubt I will find"
	cont "the time for a"
	cont "vacation any time"
	cont "soon."
	
	para "You helped the"
	line "city so much"
	cont "that you deserve"
	cont "to use the TRAIN"
	cont "as often as you"
	cont "would like."
	
	para "Now if you don't"
	line "mind, I have lots"
	cont "of work ahead of"
	cont "me."
	
	para "You're welcome to"
	line "visit me in my"
	cont "office now that"
	cont "we have everything"
	cont "up and running"
	cont "once more."
	done

PowerPlant1FB_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  5, 21, MAHOGANY_TOWN, 3
	warp_event  6, 21, MAHOGANY_TOWN, 3
	warp_event 25, 20, POWER_PLANT_2F_B, 1
	warp_event  3, 10, POWER_PLANT_2F_B, 2

	db 0 ; coord events

	db 0 ; bg events

	db 10 ; object events
	object_event  6, 20, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RETURNED_MACHINE_PART
	object_event  0,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_ITEMBALL, 0, PowerPlantBHyperPotion, EVENT_POWER_PLANT_HYPER_POTION
	object_event  0,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_ITEMBALL, 0, PowerPlantBMetalCoat, EVENT_POWER_PLANT_METAL_COAT
	object_event  0, 13, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_ITEMBALL, 0, PowerPlantBPPUp, EVENT_POWER_PLANT_PP_UP
	object_event  7, 18, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 16,  9, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 24, 11, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 28, 13, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 16, 21, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 14, 11, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
