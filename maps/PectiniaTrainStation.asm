	const_def 2 ; object constants
	const PECTINIATRAINSTATION_OFFICER
	const PECTINIATRAINSTATION_GENTLEMAN

PectiniaTrainStation_MapScripts:
	db 1 ; scene scripts
	scene_script .DummyScene ; SCENE_DEFAULT

	db 0 ; callbacks

.DummyScene:
	end

PectiniaSubwayLass:
	jumptextfaceplayer PectiniaSubwayLassText
	
PectiniaSubwayBugCatcher:
	jumptext PectiniaSubwayBugCatcherText

PectiniaSubwayCooltrainer:
	jumptext PectiniaSubwayCooltrainerText

PectiniaSubwayTeacher:
	jumptext PectiniaSubwayTeacherText

BattleSubwayBlock:
	jumptextfaceplayer BattleSubwayBlockText

AwakeningGuy:
	jumptextfaceplayer AwakeningGuyText

BattleSubwayEntranceSign:
	jumptext BattleSubwayEntranceSignText

PectiniaBedStoreSign:
	jumptext PectiniaBedStoreSignText

PectiniaDollStoreSign:
	jumptext PectiniaDollStoreSignText

AwakeningGuyText:
	text "How well do you"
	line "sleep at night?"

	para "DOWZEE's SLUMBER"
	line "SHACK guarantees"
	cont "you will sleep so"
	cont "soundly, you will"
	cont "need an AWAKENING"
	cont "in the morning."

	para "Act now and we"
	line "will include an"
	cont "AWAKENING with"
	cont "your purchase of"
	cont "any new BED!"
	done

PectiniaSubwayLassText:
	text "Sometimes I like"
	line "to take a break"
	cont "from shopping and"
	cont "watch all of the"
	cont "people who pass"
	cont "through here."
	done

PectiniaSubwayBugCatcherText:
	text "Wow! Look at how"
	line "big that LAPRAS"
	cont "DOLL is!"
	done

PectiniaSubwayCooltrainerText:
	text "The shops upstairs"
	line "sell all kinds of"
	cont "furnishing for"
	cont "your room."

	para "I'm just here for"
	line "the BATTLE SUBWAY."
	done

PectiniaSubwayTeacherText:
	text "Every time I visit"
	line "here, I toss a few"
	cont "coins into one of"
	cont "the fountains for"
	cont "good luck."

	para "But don't mind me,"
	line "I'm just a super-"
	cont "stitious woman."
	done

BattleSubwayBlockText:
	text "The BATTLE SUBWAY"
	line "is not open to the"
	cont "public just yet."

	para "The shops on the"
	line "next floor are all"
	cont "open for business."

	para "Feel free to visit"
	line "any of those!"
	done

BattleSubwayEntranceSignText:
	text "Downstairs to"
	line "BATTLE SUBWAY."
	done

PectiniaBedStoreSignText:
	text "DROWZEE's SLUMBER"
	line "SHACK."
	done

PectiniaDollStoreSignText:
	text "DOLL STORE"
	done

PectiniaTrainStation_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event  8, 17, PECTINIA_CITY, 2
	warp_event  9, 17, PECTINIA_CITY, 2
	warp_event  9,  8, BATTLE_SUBWAY_PLATFORM, 1
	warp_event 14,  0, PECTINIA_BED_STORE, 1
	warp_event  3,  0, PECTINIA_DOLL_STORE, 1

	db 0 ; coord events
;	coord_event 18,  8, SCENE_DEFAULT, Script_ArriveFromSaffron

	db 3 ; bg events
	bg_event  8,  8, BGEVENT_READ, BattleSubwayEntranceSign
	bg_event 13,  0, BGEVENT_READ, PectiniaBedStoreSign
	bg_event  4,  0, BGEVENT_READ, PectiniaDollStoreSign

	db 6 ; object events
	object_event  8,  5, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PectiniaSubwayLass, -1
	object_event  5,  1, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PectiniaSubwayBugCatcher, -1
	object_event 10, 13, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PectiniaSubwayCooltrainer, -1
	object_event  4, 16, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_UP_DOWN, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PectiniaSubwayTeacher, -1
	object_event 15,  2, SPRITE_CLERK, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AwakeningGuy, -1
	object_event  9,  1, SPRITE_OFFICER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  9,  9, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BattleSubwayBlock, -1 ; Remove after getting access to BP.
