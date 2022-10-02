	const_def 2 ; object constants

PectiniaMall_MapScripts:
	db 1 ; scene scripts
	scene_script .DummyScene ; SCENE_DEFAULT

	db 0 ; callbacks

.DummyScene:
	end

PectiniaMallLass:
	jumptextfaceplayer PectiniaMallLassText
	
PectiniaMallBugCatcher:
	jumptext PectiniaMallBugCatcherText

PectiniaMallCooltrainerM:
	jumptextfaceplayer PectiniaMallCooltrainerMText

PectiniaMallTeacher:
	jumptextfaceplayer PectiniaMallTeacherText

BattleSubwayBlock:
	jumptextfaceplayer BattleSubwayBlockText

AwakeningGuy:
	jumptextfaceplayer AwakeningGuyText

PectiniaMallOfficer:
	jumptextfaceplayer PectiniaMallOfficerText

PectiniaMallRocker:
	jumptextfaceplayer PectiniaMallRockerText

PectiniaMallBeauty:
	jumptextfaceplayer PectiniaMallBeautyText

PectiniaMallPokefanM:
	jumptextfaceplayer PectiniaMallPokefanMText

PectiniaMallCooltrainerF:
	jumptextfaceplayer PectiniaMallCooltrainerFText

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

PectiniaMallLassText:
	text "Sometimes I like"
	line "to take a break"
	cont "from shopping and"
	cont "watch all of the"
	cont "people who pass"
	cont "through here."
	done

PectiniaMallBugCatcherText:
	text "Wow! Look at how"
	line "big that LAPRAS"
	cont "DOLL is!"
	done

PectiniaMallCooltrainerMText:
	text "The shops upstairs"
	line "sell all kinds of"
	cont "furnishing for"
	cont "your room."

	para "I'm just here for"
	line "the BATTLE SUBWAY."
	done

PectiniaMallTeacherText:
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

PectiniaMallOfficerText:
	text "We rely on our"
	line "community to keep"
	cont "this MALL a clean"
	cont "and safe place."

	para "Please report any"
	line "suspicious activ-"
	cont "ity you may see."
	done

PectiniaMallRockerText:
	text "Hey kid, why don't"
	line "you mind your own"
	cont "business here?"

	para "I'm just checking"
	line "out some of the"
	cont "magazines I bought"
	cont "in the COMIC SHOP."

	para "I can't let you"
	line "look. They're way"
	cont "too graphic for a"
	cont "kid to see!"
	done

PectiniaMallBeautyText:
	text "Ugh! I bought too"
	line "much, and my bags"
	cont "are so heavy."

	para "Hey, you look"
	line "pretty strong."

	para "Would you like to"
	line "help carry my bags"
	cont "for me?"
	done

PectiniaMallPokefanMText:
	text "Oh man, do my eyes"
	line "hurt."

	para "I got too used to"
	line "how dark it is in"
	cont "the ARCADE."

	para "They weren't adjus-"
	line "ted to the lights"
	cont "out here at all."
	done

PectiniaMallCooltrainerFText:
	text "I want to complet-"
	line "ely change how my"
	cont "home looks."

	para "It gets boring to"
	line "come home to the"
	cont "same interior"
	cont "every day."
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

PectiniaCarpetStoreSignText:
	text "DITTO's CAPRETs &"
	line "INTERIOR DESIGN"
	done

PectiniaComicStoreSignText:
	text "SMEARGLE's COMICS"
	line "& COLLECTABLES"
	done

PectiniaBattleItemStoreSignText:
	text "DODRIO'S ROOST"
	done

PectiniaArcadeSignText:
	text "PORYGON's VIRTUAL"
	line "PLAYGROUND"
	done

PectiniaMall_MapEvents:
	db 0, 0 ; filler

	db 9 ; warp events
	warp_event 16, 19, PECTINIA_CITY, 2
	warp_event 17, 19, PECTINIA_CITY, 2
	warp_event 17, 10, BATTLE_SUBWAY_PLATFORM, 1
	warp_event 22,  2, PECTINIA_BED_STORE, 1
	warp_event 11,  2, PECTINIA_DOLL_STORE, 1
	warp_event 27, 14, PECTINIA_CARPET_STORE, 1
	warp_event  6, 14, PECTINIA_COMIC_STORE, 1
	warp_event  2,  8, PECTINIA_BATTLE_ITEM_STORE, 1
	warp_event 31,  8, PECTINIA_ARCADE, 1

	db 0 ; coord events

	db 7 ; bg events
	bg_event 16, 10, BGEVENT_READ, BattleSubwayEntranceSign
	bg_event 21,  2, BGEVENT_READ, PectiniaBedStoreSign
	bg_event 12,  2, BGEVENT_READ, PectiniaDollStoreSign
	bg_event 28, 14, BGEVENT_READ, PectiniaCarpetStoreSign
	bg_event  5, 14, BGEVENT_READ, PectiniaComicStoreSign
	bg_event  1,  8, BGEVENT_READ, PectiniaBattleItemStoreSign
	bg_event 32,  8, BGEVENT_READ, PectiniaArcadeSign

	db 11 ; object events
	object_event 16,  7, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PectiniaMallLass, -1
	object_event 13,  3, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PectiniaMallBugCatcher, -1
	object_event 18, 15, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PectiniaMallCooltrainerM, -1
	object_event 12, 18, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_UP_DOWN, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PectiniaMallTeacher, -1
	object_event 23,  4, SPRITE_CLERK, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AwakeningGuy, -1
	object_event  0, 15, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PectiniaMallRocker, -1
	object_event  5,  6, SPRITE_BUENA, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PectiniaMallBeauty, -1
	object_event 28, 12, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PectiniaMallPokefanM, -1
	object_event 27, 18, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PectiniaMallCooltrainerF, -1
	object_event 17,  3, SPRITE_OFFICER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PectiniaMallOfficer, -1
	object_event 17, 11, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BattleSubwayBlock, EVENT_BEAT_ELITE_FOUR
