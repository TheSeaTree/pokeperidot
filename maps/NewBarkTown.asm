	const_def 2 ; object constants
	const NEWBARKTOWN_TEACHER
	const NEWBARKTOWN_FISHER1
	const NEWBARKTOWN_FISHER2
	const NEWBARKTOWN_BUG_CATCHER

NewBarkTown_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.DummyScene0:
	end

.DummyScene1:
	end

.FlyPoint:
	setflag ENGINE_FLYPOINT_NEW_BARK
	clearevent EVENT_FIRST_TIME_BANKING_WITH_MOM
	return

NewBarkTownTeacherScript:
	faceplayer
	opentext
	checkevent EVENT_TALKED_TO_MOM_AFTER_MYSTERY_EGG_QUEST
	iftrue .CallMom
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
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

.CallMom:
	writetext Text_CallMomOnGear
	waitbutton
	closetext
	end
	
NewBarkTownYoungsterScript:
	jumptextfaceplayer Text_BrothersAreJerks
	
NewBarkTownLeftNerdScript:
	jumptextfaceplayer Text_GetLostKid

NewBarkTownRightNerdScript:
	jumptextfaceplayer Text_GetLostKid2

NewBarkTownSign:
	jumptext NewBarkTownSignText

NewBarkTownPlayersHouseSign:
	jumptext NewBarkTownPlayersHouseSignText

NewBarkTownElmsLabSign:
	jumptext NewBarkTownElmsLabSignText

NewBarkTownElmsHouseSign:
	jumptext NewBarkTownElmsHouseSignText

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
	text "Wow, your #GEAR"
	line "is impressive!"

	para "Did your mom get"
	line "it for you?"
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

NewBarkTownSignText:
	text "NEW BARK TOWN"

	para "The Town Where the"
	line "Winds of a New"
	cont "Beginning Blow"
	done

NewBarkTownPlayersHouseSignText:
	text "<PLAYER>'s House"
	done

NewBarkTownElmsLabSignText:
	text "ELM #MON LAB"
	done

NewBarkTownElmsHouseSignText:
	text "ELM'S HOUSE"
	done

NewBarkTown_MapEvents:
	db 0, 0 ; filler

	db 6 ; warp events
	warp_event 17, 11, PLAYERS_HOUSE_1F, 1
	warp_event 11,  7, PLAYERS_NEIGHBORS_HOUSE, 1
	warp_event 14, 17, ELMS_HOUSE, 1
	warp_event  5, 11, VIRIDIAN_POKECENTER_1F, 1
	warp_event 17, 21, ROUTE_1_NEW_BARK_GATE, 1
	warp_event 18, 21, ROUTE_1_NEW_BARK_GATE, 2

	db 0 ; coord events

	db 2 ; bg events
	bg_event 10, 12, BGEVENT_READ, NewBarkTownSign
	bg_event 15, 11, BGEVENT_UP, NewBarkTownPlayersHouseSign

	db 4 ; object events
	object_event  9,  9, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NewBarkTownTeacherScript, -1
	object_event  7, 21, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, NewBarkTownRightNerdScript, EVENT_MOVED_NERDS
	object_event  6, 21, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, NewBarkTownLeftNerdScript, EVENT_MOVED_NERDS
	object_event  4, 15, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, NewBarkTownYoungsterScript, -1
