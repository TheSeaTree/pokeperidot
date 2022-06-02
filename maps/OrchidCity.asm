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
	checkevent EVENT_ORCHID_CITY_HIDDEN_CAVE_OPEN
	iffalse .skip
	changeblock 18, 22, $3D
.skip
	return

OrchidGymEvent:
	checkflag ENGINE_RISINGBADGE
	iftrue .havebadge
	clearevent EVENT_BEAT_FIREBREATHER_KENNY
	clearevent EVENT_BEAT_FIREBREATHER_AIDEN
	clearevent EVENT_BEAT_JUGGLER_URI
	clearevent EVENT_BEAT_JUGGLER_KAI
	clearevent EVENT_BEAT_BIKER_DANTE
	clearevent EVENT_BEAT_COOLTRAINERF_KARI
	clearevent EVENT_BEAT_COOLTRAINERM_TORY
	scall OrchidGymEntrance
	iffalse .no
.warp
	warpfacing UP, ORCHID_GYM_1F, 8, 9
.no
	end

.havebadge
	scall OrchidEnterGym
	jump .warp
	
OrchidGymEntrance:
	jumpstd gymdoor
	end

OrchidEnterGym:
	jumpstd entergym
	end

OrchidCityTeacher:
	faceplayer
	opentext
	checkevent EVENT_MET_ORCHID_TEACHER_OUTSIDE
	iftrue .LearnedName
	checkevent EVENT_MET_ORCHID_TEACHER_IN_HOUSE
	iffalse .HaventMet
	writetext OrchidCityTeacherAlreadyMetText
	waitbutton
	setevent EVENT_MET_ORCHID_TEACHER_OUTSIDE
	closetext
	end

.LearnedName
	writetext OrchidCityTeacherSecondTimeText
	waitbutton
	closetext
	end
	
.HaventMet
	writetext OrchidCityTeacherText
	waitbutton
	closetext
	end
	
OrchidCityPokefan:
	jumptextfaceplayer OrchidCityPokefanText
	
OrchidCityCooltrainer:
	jumptextfaceplayer OrchidCityCooltrainerText
	
OrchidCitySign:
	jumptext OrchidCitySignText
	
OrchidCityBouldersSign:
	jumptext OrchidCityBouldersSignText
	
OrchidCityTeacherText:
	text "The lava glows so"
	line "bright after dark."
	
	para "I'd love to have"
	line "someone stay here"
	cont "and watch it with."
	done
	
OrchidCityTeacherAlreadyMetText:
	text "Oh! Hi there!"
	
	para "I'm sorry, I didn't"
	line "get your name last"
	cont "time."
	
	para "………"
	
	para "<PLAYER>? Did I"
	line "hear that right?"

	para "Well I'm glad that"
	line "you could make it"
	cont "tonight, <PLAYER>."
	
	para "You've made me"
	line "so welcome here."
	
	para "Meet me at my"
	line "place later, I"
	cont "think I have some-"
	cont "thing that will"
	cont "help you out."
	done
	
OrchidCityTeacherSecondTimeText:
	text "Hey, <PLAYER>!"

	para "I'm so glad you"
	line "found the time to"
	cont "meet me tonight!"
	
	para "You really keep a"
	line "girl from feeling"
	cont "so lonely in a"
	cont "new city."
	done

OrchidCityPokefanText:
	text "I moved each one"
	line "of these boulders"
	cont "to block off the"
	cont "lava pools."

	para "It's tiring work,"
	line "but it's to keep"	
	cont "my city safe!"
	done

OrchidCityCooltrainerText:
	text "The GYM here is"
	line "really tough!"
	
	para "I can't go more"
	line "than a few steps"
	cont "without passing"
	cont "out from the heat!"
	
	para "That's why I'm pre-"
	line "paring myself near"
	cont "this lava!"
	done

OrchidCitySignText:
	text "ORCHID CITY"
	
	para "Where the ever-"
	line "lasting flame of"
	cont "victory burns."
	done

OrchidCityBouldersSignText:
	text "NOTICE!"
	
	para "For your safety,"
	line "and the safety of"
	cont "others, do not"
	cont "attempt to move"
	cont "any boulders surr-"
	cont "ounding the lava"
	cont "pits."
	done

OrchidCity_MapEvents:
	db 0, 0 ; filler

	db 7 ; warp events
	warp_event 23, 25, ORCHID_POKECENTER_1F, 1
	warp_event  5, 15, DRAGONBREATH_HOUSE, 1
	warp_event 13,  5, ORCHID_MART, 1
	warp_event 26,  7, ORCHID_GYM_1F, 1
	warp_event 13, 27, ORCHID_TEACHERS_HOUSE, 1
	warp_event 19, 23, ORCHID_BLACKBELTS_HOUSE, 1
	warp_event  7, 11, ORCHID_GRANNYS_HOUSE, 1
	
	db 0 ; coord events

	db 3 ; bg events
	bg_event 26,  7, BGEVENT_UP, OrchidGymEvent
	bg_event 17, 29, BGEVENT_UP, OrchidCitySign
	bg_event 11, 15, BGEVENT_UP, OrchidCityBouldersSign

	db 3 ; object events
	object_event 29, 18, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 2, -1, NITE, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OrchidCityTeacher, -1
	object_event 10, 24, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 2, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, OrchidCityPokefan, -1
	object_event 17,  8, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 3, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, OrchidCityCooltrainer, -1
