	const_def 2 ; object constants
	const PECTINIAMALL_OFFICER
	const PECTINIAMALL_GENTLEMAN

PectiniaMall_MapScripts:
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
	jumptextfaceplayer PectiniaSubwayCooltrainerText

PectiniaSubwayTeacher:
	jumptextfaceplayer PectiniaSubwayTeacherText

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

PectiniaCarpetStoreSign:
	jumptext PectiniaCarpetStoreSignText

PectiniaComicStoreSign:
	jumptext PectiniaComicStoreSignText

PectiniaBattleItemStoreSign:
	jumptext PectiniaBattleItemStoreSignText

PectiniaArcadeSign:
	jumptext PectiniaArcadeSignText

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
	text "DROWZEE's"
	line "SLUMBER SHACK"
	done

PectiniaDollStoreSignText:
	text "MR. MIME's"
	line "DOLL HOUSE"
	done

PectiniaCarpetStoreSignText: ; Come up with something better
	text "CARPET STORE"
	done

PectiniaComicStoreSignText:
	text "SMEARGLE's COMICS"
	line "& COLLECTABLES"
	done

PectiniaBattleItemStoreSignText:
	text "SKARMORY's SKY-"
	line "HIGH SELECTION"
	done

PectiniaArcadeSignText:
	text "PORYGON's VIRTUAL"
	line "PLAYGROUND."
	done

PectiniaMall_MapEvents:
	db 0, 0 ; filler

	db 9 ; warp events
	warp_event 16, 17, PECTINIA_CITY, 2
	warp_event 17, 17, PECTINIA_CITY, 2
	warp_event 17,  8, BATTLE_SUBWAY_PLATFORM, 1
	warp_event 22,  0, PECTINIA_BED_STORE, 1
	warp_event 11,  0, PECTINIA_DOLL_STORE, 1
	warp_event 27, 12, PECTINIA_CARPET_STORE, 1
	warp_event  6, 12, PECTINIA_COMIC_STORE, 1
	warp_event  2,  6, PECTINIA_BATTLE_ITEM_STORE, 1
	warp_event 31,  6, PECTINIA_ARCADE, 1

	db 0 ; coord events
;	coord_event 18,  8, SCENE_DEFAULT, Script_ArriveFromSaffron

	db 7 ; bg events
	bg_event 16,  8, BGEVENT_READ, BattleSubwayEntranceSign
	bg_event 21,  0, BGEVENT_READ, PectiniaBedStoreSign
	bg_event 12,  0, BGEVENT_READ, PectiniaDollStoreSign
	bg_event 28, 12, BGEVENT_READ, PectiniaCarpetStoreSign
	bg_event  5, 12, BGEVENT_READ, PectiniaComicStoreSign
	bg_event  1,  6, BGEVENT_READ, PectiniaBattleItemStoreSign
	bg_event 32,  6, BGEVENT_READ, PectiniaArcadeSign

	db 8 ; object events
	object_event 16,  5, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PectiniaSubwayLass, -1
	object_event 13,  1, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PectiniaSubwayBugCatcher, -1
	object_event 18, 13, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PectiniaSubwayCooltrainer, -1
	object_event 12, 16, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_UP_DOWN, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PectiniaSubwayTeacher, -1
	object_event 23,  2, SPRITE_CLERK, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AwakeningGuy, -1
	object_event 17,  1, SPRITE_OFFICER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  0, 13, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 17,  9, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BattleSubwayBlock, -1 ; Remove after getting access to BP.
