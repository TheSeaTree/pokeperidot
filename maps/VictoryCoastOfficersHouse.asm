	const_def 2 ; object constants

VictoryCoastOfficersHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

VictoryCoastOfficerFMorn:
	jumptextfaceplayer VictoryCoastOfficerFMornText

VictoryCoastOfficerFDay:
	jumptextfaceplayer VictoryCoastOfficerFDayText

VictoryCoastSnubbullMorning:
	opentext 
	writetext VictoryCoastSnubbleCryText
	cry SNUBBULL
	waitbutton
	writetext VictoryCoastSnubbullMorningText
	waitbutton
	closetext
	end

VictoryCoastSnubbullDay:
	faceplayer
	opentext
	writetext VictoryCoastSnubbleCryText
	cry SNUBBULL
	waitbutton
	writetext VictoryCoastSnubbullDayText
	waitbutton
	closetext
	end

VictoryCoastSnubbullNight:
	opentext 
	writetext VictoryCoastSnubbleCryText
	writebyte SNUBBULL
	special PlaySlowCry
	waitbutton
	writetext VictoryCoastSnubbullNightText
	waitbutton
	closetext
	end

VictoryCoastOfficersHouseFridge:
	jumptext VictoryCoastOfficersHouseFridgeText

VictoryCoastOfficersHouseSink:
	jumptext VictoryCoastOfficersHouseSinkText

VictoryCoastOfficersHouseOven:
	jumptext VictoryCoastOfficersHouseOvenText

VictoryCoastOfficerFMornText:
	text "I could hear the"
	line "battles on ROUTE"
	cont "22 last night."

	para "It sounded so ex-"
	line "citing! Did you"
	cont "take part in any?"

	para "I wish I could,"
	line "but my dearest"
	cont "SNUBBULL isn't fit"
	cont "to battle with"
	cont "those trainers."
	done

VictoryCoastOfficerFDayText:
	text "Hello there."

	para "I'm preparing for"
	line "my shift tonight."

	para "I'll need plenty of"
	line "coffee to keep my-"
	cont "self awake."
	done

VictoryCoastSnubbleCryText:
	text "SNUBBULL: Bu-ull!"
	done

VictoryCoastSnubbullMorningText:
	text "SNUBBULL is lean-"
	line "ing up against its"
	cont "owner as it gets"
	cont "petted."

	para "It doesn't seem to"
	line "care about any-"
	cont "thing else going"
	cont "on around it."
	done

VictoryCoastSnubbullDayText:
	text "SNUBBULL is pacing"
	line "about. It doesn't"
	cont "seem to want its"
	cont "owner to leave."
	done

VictoryCoastSnubbullNightText:
	text "SNUBBULL is curled"
	line "up on the couch,"
	cont "sound asleep."
	done

VictoryCoastOfficersHouseFridgeText:
	text "It's a"
	line "refrigerator."

	para "The door is"
	line "stocked with"
	cont "bottles of SWEET"
	cont "TEA and LEMONADE."
	done

VictoryCoastOfficersHouseSinkText:
	text "There are lots of"
	line "coffee mugs in the"
	cont "sink that need to"
	cont "be cleaned."
	done

VictoryCoastOfficersHouseOvenText:
	text "The only thing on"
	line "the stove is an"
	cont "empty kettle."
	done

VictoryCoastOfficersHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, VICTORY_COAST, 5
	warp_event  5,  7, VICTORY_COAST, 5

	db 0 ; coord events

	db 3 ; bg events
	bg_event  7,  1, BGEVENT_READ, VictoryCoastOfficersHouseFridge
	bg_event  8,  1, BGEVENT_READ, VictoryCoastOfficersHouseSink
	bg_event  9,  1, BGEVENT_READ, VictoryCoastOfficersHouseOven

	db 5 ; object events
	object_event  2,  1, SPRITE_OFFICER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, MORN, 0, OBJECTTYPE_SCRIPT, 0, VictoryCoastOfficerFMorn, -1
	object_event  9,  2, SPRITE_OFFICER_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, DAY, 0, OBJECTTYPE_SCRIPT, 0, VictoryCoastOfficerFDay, -1
	object_event  3,  1, SPRITE_MONSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, MORN, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, VictoryCoastSnubbullMorning, -1
	object_event  3,  5, SPRITE_MONSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, DAY, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, VictoryCoastSnubbullDay, -1
	object_event  2,  1, SPRITE_MONSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, NITE, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, VictoryCoastSnubbullNight, -1
