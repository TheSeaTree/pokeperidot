	const_def 2 ; object constants
	const POWERPLANT2F_GRIMER1
	const POWERPLANT2F_GRIMER2
	const POWERPLANT2F_GRIMER3
	const POWERPLANT2F_GRIMER4
	const POWERPLANT2F_GRIMER5
	const POWERPLANT2F_GRIMER6
	const POWERPLANT2F_GRIMER7
	const POWERPLANT2F_ITEMBALL1
	const POWERPLANT2F_ITEMBALL2
	const POWERPLANT2F_ITEMBALL3
	const POWERPLANT2F_ITEMBALL4
	const POWERPLANT2F_ITEMBALL5
	const POWERPLANT2F_ITEMBALL6
	const POWERPLANT2F_ITEMBALL7
	const POWERPLANT2F_ITEMBALL8

PowerPlant2F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .CardKeyShutterCallback

.CardKeyShutterCallback:
	checkevent EVENT_USED_OFFICE_KEY
	iftrue .Office
	checkevent EVENT_USED_ADMIN_KEY
	iftrue .Admin
	return

.Office:
	changeblock  22, 10, $07 ; open shutter
	return

.Admin:
	changeblock   6, 10, $07 ; open shutter
	return
	
PowerPlant2FGrimer1:
	cry GRIMER
	loadwildmon GRIMER, 3
	writecode VAR_BATTLETYPE, BATTLETYPE_TRAP
	startbattle
	reloadmapafterbattle
	disappear POWERPLANT2F_GRIMER1
	setevent POWER_PLANT_2F_GRIMER_1
	end

PowerPlant2FGrimer2:
	cry GRIMER
	loadwildmon GRIMER, 3
	writecode VAR_BATTLETYPE, BATTLETYPE_TRAP
	startbattle
	reloadmapafterbattle
	disappear POWERPLANT2F_GRIMER2
	setevent POWER_PLANT_2F_GRIMER_2
	end

PowerPlant2FGrimer3:
	cry GRIMER
	loadwildmon GRIMER, 3
	writecode VAR_BATTLETYPE, BATTLETYPE_TRAP
	startbattle
	reloadmapafterbattle
	disappear POWERPLANT2F_GRIMER3
	setevent POWER_PLANT_2F_GRIMER_3
	end

PowerPlant2FGrimer4:
	cry GRIMER
	loadwildmon GRIMER, 3
	writecode VAR_BATTLETYPE, BATTLETYPE_TRAP
	startbattle
	reloadmapafterbattle
	disappear POWERPLANT2F_GRIMER4
	setevent POWER_PLANT_2F_GRIMER_4
	end

PowerPlant2FGrimer5:
	cry GRIMER
	loadwildmon GRIMER, 3
	writecode VAR_BATTLETYPE, BATTLETYPE_TRAP
	startbattle
	reloadmapafterbattle
	disappear POWERPLANT2F_GRIMER5
	setevent POWER_PLANT_2F_GRIMER_5
	end

PowerPlant2FGrimer6:
	cry GRIMER
	loadwildmon GRIMER, 3
	writecode VAR_BATTLETYPE, BATTLETYPE_TRAP
	startbattle
	reloadmapafterbattle
	disappear POWERPLANT2F_GRIMER6
	setevent POWER_PLANT_2F_GRIMER_6
	end

PowerPlant2FGrimer7:
	cry GRIMER
	loadwildmon GRIMER, 3
	writecode VAR_BATTLETYPE, BATTLETYPE_TRAP
	startbattle
	reloadmapafterbattle
	disappear POWERPLANT2F_GRIMER7
	setevent POWER_PLANT_2F_GRIMER_7
	end
	
PowerPlantOfficeDoor:
	opentext
	checkevent EVENT_USED_OFFICE_KEY
	iftrue .used
	writetext OfficeKeySlotText
	waitbutton
	checkitem OFFICE_KEY
	iffalse .nope
	writetext OpenOfficeDoorText
	waitbutton
	closetext
	setevent EVENT_USED_OFFICE_KEY
	changeblock  22, 10	, $07	
	playsound SFX_ENTER_DOOR
	reloadmappart
	waitsfx
;	takeitem OFFICE_KEY
	end

.used
	writetext PowerPlant2FUsedKeyText
	waitbutton
	closetext
	end
	
.nope
	closetext
	end
	
PowerPlantAdminDoor:
	opentext
	checkevent EVENT_USED_ADMIN_KEY
	iftrue .used
	writetext AdminKeySlotText
	waitbutton
	checkitem ADMIN_KEY
	iffalse .nope
	writetext OpenAdminDoorText
	waitbutton
	closetext
	setevent EVENT_USED_ADMIN_KEY
	changeblock   6, 10, $07
	playsound SFX_ENTER_DOOR
	reloadmappart
	waitsfx
;	takeitem ADMIN_KEY
	end

.used
	writetext PowerPlant2FUsedKeyText
	waitbutton
	closetext
	end
	
.nope
	closetext
	end
	
PowerPlantOfficeLockedDoor:
	conditional_event EVENT_USED_OFFICE_KEY, .Script

.Script:
	opentext
	writetext NeedsOfficeKeyText
	waitbutton
	closetext
	end
	
PowerPlantAdminLockedDoor:
	conditional_event EVENT_USED_ADMIN_KEY, .Script

.Script:
	opentext
	writetext NeedsAdminKeyText
	waitbutton
	closetext
	end
	
PowerPlantGeneratorKey:
	itemball GEN_KEY

OfficeKeySlotText:
	text "It looks like an"
	line "OFFICE KEY would"
	cont "go here."
	done
	
AdminKeySlotText:
	text "It looks like an"
	line "ADMIN KEY would go"
	cont "here."
	done
	
NeedsOfficeKeyText:
	text "This door needs an"
	line "OFFICE KEY to"
	cont "open."
	done	

NeedsAdminKeyText:
	text "This door needs an"
	line "ADMIN KEY to open."
	done
	
OpenOfficeDoorText:
	text "<PLAYER> used"
	line "the OFFICE KEY!"
	done

OpenAdminDoorText:
	text "<PLAYER> used"
	line "the ADMIN KEY!"
	done
	
PowerPlant2FUsedKeyText:
	text "The door is"
	line "already open."
	done

PowerPlant2F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 25, 14, POWER_PLANT_1F, 3
	warp_event  3,  4, POWER_PLANT_1F, 4

	db 0 ; coord events

	db 6 ; bg events
	bg_event 20,  9, BGEVENT_UP, PowerPlantOfficeDoor
	bg_event 22, 10, BGEVENT_IFNOTSET, PowerPlantOfficeLockedDoor
	bg_event 22, 11, BGEVENT_IFNOTSET, PowerPlantOfficeLockedDoor
	bg_event  8,  9, BGEVENT_UP, PowerPlantAdminDoor
	bg_event  7, 10, BGEVENT_IFNOTSET, PowerPlantAdminLockedDoor
	bg_event  7, 11, BGEVENT_IFNOTSET, PowerPlantAdminLockedDoor

	db 15 ; object events
	object_event 13,  5, SPRITE_GRIMER, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PowerPlant2FGrimer1, POWER_PLANT_2F_GRIMER_1
	object_event 31,  4, SPRITE_GRIMER, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PowerPlant2FGrimer2, POWER_PLANT_2F_GRIMER_2
	object_event  5, 13, SPRITE_GRIMER, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PowerPlant2FGrimer3, POWER_PLANT_2F_GRIMER_3
	object_event 21, 13, SPRITE_GRIMER, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PowerPlant2FGrimer4, POWER_PLANT_2F_GRIMER_4
	object_event  6,  6, SPRITE_GRIMER, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PowerPlant2FGrimer5, POWER_PLANT_2F_GRIMER_5
	object_event 11,  1, SPRITE_GRIMER, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PowerPlant2FGrimer6, POWER_PLANT_2F_GRIMER_6
	object_event  3, 10, SPRITE_GRIMER, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PowerPlant2FGrimer7, POWER_PLANT_2F_GRIMER_7
	object_event 15, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_ITEMBALL, 0, ObjectEvent, -1 ; Some Item
	object_event 15, 10, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_ITEMBALL, 0, ObjectEvent, -1 ; Some Item
	object_event  9,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_ITEMBALL, 0, ObjectEvent, -1 ; Some Item
	object_event  1, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_ITEMBALL, 0, ObjectEvent, -1 ; Some Item
	object_event 30, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_ITEMBALL, 0, ObjectEvent, -1 ; Some Item
	object_event 18,  8, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_ITEMBALL, 0, ObjectEvent, -1 ; Some Item
	object_event 26,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_ITEMBALL, 0, ObjectEvent, -1 ; Some Item
	object_event  6, 14, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_ITEMBALL, 0, PowerPlantGeneratorKey, EVENT_POWER_PLANT_GEN_KEY
