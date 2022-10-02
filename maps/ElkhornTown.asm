	const_def 2 ; object constants
	const ELKHORNTOWN_TEACHER
	const ELKHORNTOWN_FISHER1
	const ELKHORNTOWN_FISHER2
	const ELKHORNTOWN_BUG_CATCHER
	const ELKHORNTOWN_MOM

ElkhornTown_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint
	callback MAPCALLBACK_OBJECTS, .HideMom

.DummyScene0:
	end

.DummyScene1:
	setevent EVENT_GOT_A_POKEMON_FROM_MAPLE
	setscene SCENE_DEFAULT
	end

.FlyPoint:
	setflag ENGINE_FLYPOINT_ELKHORN
	clearevent EVENT_FIRST_TIME_BANKING_WITH_MOM
	return

.HideMom:
	checkevent EVENT_GOT_A_POKEMON_FROM_MAPLE
	iffalse .NoAppear
	return

.NoAppear:
	moveobject ELKHORNTOWN_MOM, -4, -4
	return

ElkhornTownTeacherScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_A_POKEMON_FROM_MAPLE
	iftrue .MonIsAdorable
	writetext Text_GearIsImpressive
	waitbutton
	closetext
	end

.MonIsAdorable:
	writetext Text_YourMonIsAdorable
	waitbutton
	closetext
	end

MomScript_Outside:
	faceplayer
	jump MomScript.Outside

ElkhornTownYoungsterScript:
	jumptextfaceplayer Text_BrothersAreJerks
	
ElkhornTownLeftNerdScript:
	jumptextfaceplayer Text_GetLostKid

ElkhornTownRightNerdScript:
	jumptextfaceplayer Text_GetLostKid2

ElkhornTownSign:
	jumptext ElkhornTownSignText

ElkhornTownPlayersHouseSign:
	jumptext ElkhornTownPlayersHouseSignText

ElkhornTownMomsGarden:
	jumptext ElkhornTownMomsGardenText

Movement_SilverPushesYouAway_NBT:
	turn_head UP
	step DOWN
	step_end

Movement_SilverShovesYouOut_NBT:
	turn_head UP
	fix_facing
	jump_step DOWN
	remove_fixed_facing
	step_end

Movement_SilverReturnsToTheShadows_NBT:
	step RIGHT
	step_end

Text_GearIsImpressive:
	text "Are you going to"
	line "get a #MON?"

	para "I'm not brave"
	line "enough to catch"
	cont "wild #MON."
	done

Text_YourMonIsAdorable:
	text "Oh! Your #MON"
	line "is adorable!"
	cont "I wish I had one!"
	done

Text_CallMomOnGear:
	text "Call your mom on"
	line "your #GEAR to"

	para "let her know how"
	line "you're doing."
	done
	
Text_BrothersAreJerks:
	text "My brothers are"
	line "real jerks!"
	
	para "They never let"
	line "anyone but their"
	cont "friends onto"
	cont "ROUTE 1."
	done
	
Text_GetLostKid:
	text "Get lost, kid."
	
	para "You'll never be"
	line "cool enough to"
	cont "train with us."
	done
	
Text_GetLostKid2:
	text "Don't fool your-"
	line "self. We'll never"
	cont "let a dork like"
	cont "you hang with us."
	done

ElkhornTownSignText:
	text "ELKHORN TOWN"

	para "The first tip of"
	line "your branching"
	cont "path."
	done

ElkhornTownPlayersHouseSignText:
	text "<PLAYER>'s House"
	done

ElkhornTownMomsGardenText:
	text "It's the garden"
	line "that MOM tends to"
	cont "in the morning."

	para "The flowers look"
	line "so lively!"
	done

ElkhornTown_MapEvents:
	db 0, 0 ; filler

	db 6 ; warp events
	warp_event 17, 11, PLAYERS_HOUSE_1F, 1
	warp_event 11,  7, PLAYERS_NEIGHBORS_HOUSE, 1
	warp_event 14, 17, ELMS_HOUSE, 1
	warp_event  5, 11, VIRIDIAN_POKECENTER_1F, 1
	warp_event 17, 21, ROUTE_1_ELKHORN_GATE, 1
	warp_event 18, 21, ROUTE_1_ELKHORN_GATE, 2

	db 0 ; coord events

	db 5 ; bg events
	bg_event 10, 12, BGEVENT_READ, ElkhornTownSign
	bg_event 15, 11, BGEVENT_UP, ElkhornTownPlayersHouseSign
	bg_event 20, 11, BGEVENT_READ, ElkhornTownMomsGarden
	bg_event 21, 11, BGEVENT_READ, ElkhornTownMomsGarden
	bg_event 22, 11, BGEVENT_READ, ElkhornTownMomsGarden

	db 5 ; object events
	object_event  9,  9, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ElkhornTownTeacherScript, -1
	object_event  7, 21, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ElkhornTownRightNerdScript, EVENT_MOVED_NERDS
	object_event  6, 21, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ElkhornTownLeftNerdScript, EVENT_MOVED_NERDS
	object_event  4, 15, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ElkhornTownYoungsterScript, -1
	object_event 21, 12, SPRITE_VARIABLE_MOM, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, MORN, 0, OBJECTTYPE_SCRIPT, 0, MomScript_Outside, -1
