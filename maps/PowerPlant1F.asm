	const_def 2 ; object constants
	const POWERPLANT1F_GRIMER1
	const POWERPLANT1F_GRIMER2
	const POWERPLANT1F_GRIMER3
	const POWERPLANT1F_MUK
	const POWERPLANT1F_ITEMBALL1
	const POWERPLANT1F_ITEMBALL2
	const POWERPLANT1F_ITEMBALL3
	const POWERPLANT1F_ITEMBALL4
	const POWERPLANT1F_ITEMBALL5
	const POWERPLANT1F_ADMIN

PowerPlant1F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .CardKeyShutterCallback

.CardKeyShutterCallback:
	checkevent EVENT_USED_GEN_KEY
	iftrue .Change
	return

.Change:
	changeblock  4,  8, $07 ; open shutter
	return
	
PowerPlant1FGrimer1:
	scall PowerPlant1FGrimerBattle
	reloadmapafterbattle
	disappear POWERPLANT1F_GRIMER1
	setevent POWER_PLANT_1F_GRIMER_1
	end

PowerPlant1FGrimer2:
	scall PowerPlant1FGrimerBattle
	reloadmapafterbattle
	disappear POWERPLANT1F_GRIMER2
	setevent POWER_PLANT_1F_GRIMER_2
	end

PowerPlant1FGrimer3:
	scall PowerPlant1FGrimerBattle
	reloadmapafterbattle
	disappear POWERPLANT1F_GRIMER3
	setevent POWER_PLANT_1F_GRIMER_3
	end
	
PowerPlant1FGrimerBattle:
	opentext
	writetext PowerPlant1FGrimerText
	cry GRIMER
	waitbutton
	closetext
	setlasttalked -1
	loadwildmon GRIMER, 3
	writecode VAR_BATTLETYPE, BATTLETYPE_TRAP
	startbattle
	end
	
PowerPlant1FMuk:
	opentext
	writetext PowerPlant1FMukText
	cry MUK
	waitbutton
	closetext
	loadwildmon MUK, 3
	writecode VAR_BATTLETYPE, BATTLETYPE_TRAP
	startbattle
	reloadmapafterbattle
	disappear POWERPLANT1F_MUK
	setevent POWER_PLANT_1F_MUK
	end
	
PowerPlantGeneratorDoor:
	opentext
	checkevent EVENT_USED_GEN_KEY
	iftrue .used
	writetext GeneratorKeySlotText
	waitbutton
	checkitem GEN_KEY
	iffalse .nope
	writetext OpenGenDoorText
	waitbutton
	closetext
	setevent EVENT_USED_GEN_KEY
	changeblock  4,  8, $07
	playsound SFX_ENTER_DOOR
	reloadmappart
	waitsfx
;	takeitem GEN_KEY
	end

.used
	writetext UsedGenKeyText
	waitbutton
	closetext
	end
	
.nope
	closetext
	end
	
PowerPlantGeneratorLockedDoor:
	conditional_event EVENT_USED_GEN_KEY, .Script

.Script:
	opentext
	writetext NeedsGenKeyText
	waitbutton
	closetext
	end
	
PowerPlantOfficeKey:
	itemball OFFICE_KEY
	
PowerPlantAdminKey:
	itemball ADMIN_KEY
	
GeneratorKeySlotText:
	text "It looks like a"
	line "GEN. KEY would go"
	cont "here."
	done
	
NeedsGenKeyText:
	text "This door needs a"
	line "GEN. KEY to open."
	done
	
OpenGenDoorText:
	text "<PLAYER> used"
	line "the GEN. KEY!"
	done
	
UsedGenKeyText:
	text "The door is"
	line "already open."
	done
	
PowerPlant1FGrimerText:
	text "GRIMER: Blblbl!"
	done
	
PowerPlant1FMukText:
	text "MUK: Scree!"
	done
	
PowerPlant1FAfterText:
	text "Wow! You were able"
	line "to clean up this"
	cont "place nicely."
	
	para "After the crew I"
	line "hired failed, I"
	cont "never thought a"
	cont "child could handle"
	cont "those GRIMER."
	
	para "I should reward"
	line "you for this, but"
	cont "let's go outside"
	cont "first. This place"
	cont "gives me the"
	cont "creeps when it's"
	cont "dark like this."
	done

PowerPlant1F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  5, 21, MAHOGANY_TOWN, 3
	warp_event  6, 21, MAHOGANY_TOWN, 3
	warp_event 25, 20, POWER_PLANT_2F, 1
	warp_event  3, 10, POWER_PLANT_2F, 2

	db 0 ; coord events

	db 3 ; bg events
	bg_event  6,  8, BGEVENT_UP, PowerPlantGeneratorDoor
	bg_event  5,  8, BGEVENT_IFNOTSET, PowerPlantGeneratorLockedDoor
	bg_event  4,  8, BGEVENT_IFNOTSET, PowerPlantGeneratorLockedDoor

	db 10 ; object events
	object_event 10,  7, SPRITE_GRIMER, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PowerPlant1FGrimer1, POWER_PLANT_1F_GRIMER_1
	object_event 29, 17, SPRITE_GRIMER, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PowerPlant1FGrimer2, POWER_PLANT_1F_GRIMER_2
	object_event 15, 19, SPRITE_GRIMER, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PowerPlant1FGrimer3, POWER_PLANT_1F_GRIMER_3
	object_event 20,  1, SPRITE_GRIMER, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PowerPlant1FMuk, POWER_PLANT_1F_MUK
	object_event  0, 13, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_ITEMBALL, 0, ObjectEvent, -1 ; Some Item
	object_event  0,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_ITEMBALL, 0, ObjectEvent, -1 ; Some Item
	object_event  0,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_ITEMBALL, 0, ObjectEvent, -1 ; Some Item
	object_event 19, 10, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_ITEMBALL, 0, PowerPlantAdminKey, EVENT_POWER_PLANT_ADMIN_KEY
	object_event 30, 20, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_ITEMBALL, 0, PowerPlantOfficeKey, EVENT_POWER_PLANT_OFFICE_KEY
	object_event 31,  0, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
