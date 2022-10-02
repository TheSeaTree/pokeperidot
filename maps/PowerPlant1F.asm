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
	loadwildmon GRIMER, 28
	writecode VAR_BATTLETYPE, BATTLETYPE_TRAP
	startbattle
	end
	
PowerPlant1FMuk:
	opentext
	writetext PowerPlant1FMukText
	cry MUK
	waitbutton
	closetext
	loadwildmon MUK, 35
	writecode VAR_BATTLETYPE, BATTLETYPE_BOSS
	startbattle
	reloadmapafterbattle
	disappear POWERPLANT1F_MUK
	checkcode VAR_FACING
	ifequal UP, .FacingUp
	ifequal LEFT, .FacingLeft
	moveobject POWERPLANT1F_ADMIN, 14, 2
	appear POWERPLANT1F_ADMIN
	applymovement POWERPLANT1F_ADMIN, PowerPlantAdminMovement1
	opentext 
	writetext PowerPlant1FAfterText
	waitbutton
	closetext
	applymovement PLAYER, PowerPlantApproachAdmin
	jump .Continue
.FacingUp:
	moveobject POWERPLANT1F_ADMIN, 15, 2
	appear POWERPLANT1F_ADMIN
	applymovement POWERPLANT1F_ADMIN, PowerPlantAdminMovement2
	opentext 
	writetext PowerPlant1FAfterText
	waitbutton
	closetext
	turnobject PLAYER, LEFT
	jump .Continue
.FacingLeft:
	moveobject POWERPLANT1F_ADMIN, 16, 2
	appear POWERPLANT1F_ADMIN
	applymovement POWERPLANT1F_ADMIN, PowerPlantAdminMovement3
	opentext 
	writetext PowerPlant1FAfterText
	waitbutton
	closetext
	applymovement PLAYER, PowerPlantBehindMuk
.Continue:
	opentext 
	writetext PowerPlant1FAfterText2
	waitbutton
	closetext
	special FadeOutPalettes
	special FadeOutMusic
	waitsfx
	warpfacing RIGHT, POWER_PLANT_1F_B, 5, 20
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
	
PowerPlantMetalCoat:
	itemball METAL_COAT
	
PowerPlantHyperPotion:
	itemball HYPER_POTION
	
PowerPlantPPUp:
	itemball PP_UP
	
PowerPlantAdminMovement1:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_resume	

PowerPlantAdminMovement2:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_resume
	
PowerPlantAdminMovement3:
	step RIGHT
	step RIGHT
	step_resume
	
PowerPlantApproachAdmin:
	step DOWN
	turn_step LEFT
	step_resume
	
PowerPlantBehindMuk:
	step LEFT
	step LEFT
	step DOWN
	turn_step LEFT
	step_resume
	
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
	cont "place nicely!"
	done
	
PowerPlant1FAfterText2:
	text "Pardon my lack of"
	line "introduction. I'm"
	cont "the ADMIN of this"
	cont "POWER PLANT."
	
	para "I never thought a"
	line "child could handle"
	cont "those GRIMER."
	
	para "JOEL told me that"
	line "a kid came here"
	cont "alone to clean the"
	cont "place up."
	
	para "I'm impressed!"
	
	para "I should reward"
	line "you for this, but"
	cont "let's get the"
	cont "lights on first."
	
	para "This place gives"
	line "me the creeps when"
	cont "it's dark like"
	cont "this."
	done

PowerPlant1F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  5, 21, RUGOSA_CITY, 3
	warp_event  6, 21, RUGOSA_CITY, 11
	warp_event 25, 20, POWER_PLANT_2F, 1
	warp_event  3, 10, POWER_PLANT_2F, 2

	db 0 ; coord events

	db 3 ; bg events
	bg_event  6,  8, BGEVENT_UP, PowerPlantGeneratorDoor
	bg_event  5,  8, BGEVENT_IFNOTSET, PowerPlantGeneratorLockedDoor
	bg_event  4,  8, BGEVENT_IFNOTSET, PowerPlantGeneratorLockedDoor

	db 10 ; object events
	object_event 10,  7, SPRITE_GRIMER, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, PowerPlant1FGrimer1, POWER_PLANT_1F_GRIMER_1
	object_event 29, 17, SPRITE_GRIMER, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, PowerPlant1FGrimer2, POWER_PLANT_1F_GRIMER_2
	object_event 15, 19, SPRITE_GRIMER, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, PowerPlant1FGrimer3, POWER_PLANT_1F_GRIMER_3
	object_event 20,  1, SPRITE_GRIMER, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, PowerPlant1FMuk, -1
	object_event  0,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_ITEMBALL, 0, PowerPlantHyperPotion, EVENT_POWER_PLANT_HYPER_POTION
	object_event  0,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_ITEMBALL, 0, PowerPlantMetalCoat, EVENT_POWER_PLANT_METAL_COAT
	object_event  0, 13, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_ITEMBALL, 0, PowerPlantPPUp, EVENT_POWER_PLANT_PP_UP
	object_event 19, 10, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_ITEMBALL, 0, PowerPlantAdminKey, EVENT_POWER_PLANT_ADMIN_KEY
	object_event 30, 20, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_ITEMBALL, 0, PowerPlantOfficeKey, EVENT_POWER_PLANT_OFFICE_KEY
	object_event 31,  0, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
