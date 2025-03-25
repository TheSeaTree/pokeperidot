	const_def 2 ; object constants
	const ROUTE2_CAMPER
	const ROUTE2_COOLTRAINER_F2
	const ROUTE2_COOLTRAINER_F3
	const ROUTE2_COOLTRAINER_F4
	const ROUTE2_COOLTRAINER_F5
	const ROUTE2_COOLTRAINER_F6
	const ROUTE2_POKE_BALL1
	const ROUTE2_POKE_BALL2
	const ROUTE2_POKE_BALL3
	const ROUTE2_FRUIT_TREE1
	const ROUTE2_FRUIT_TREE2

Route2_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerCamperNicholas:
	trainer CAMPER, NICHOLAS, EVENT_BEAT_CAMPER_NICHOLAS, CamperNicholasText, CamperNicholasWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperNicholasAfterText
	waitbutton
	closetext
	end
	
TrainerPicnickerJamie:
	trainer PICNICKER, JAMIE, EVENT_BEAT_PICNICKER_JAMIE, PicnickerJamieText, PicnickerJamieWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerJamieAfterText
	waitbutton
	closetext
	end
	
TrainerBugCatcherLiam:
	trainer BUG_CATCHER, LIAM, EVENT_BEAT_BUG_CATCHER_LIAM, BugCatcherLiamText, BugCatcherLiamWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BugCatcherLiamAfterText
	waitbutton
	closetext
	end
	
TrainerLassNicole:
	trainer LASS, NICOLE, EVENT_BEAT_LASS_NICOLE, LassNicoleText, LassNicoleWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassNicoleAfterText
	waitbutton
	closetext
	end
	
TrainerBirdKeeperPhillip:
	trainer BIRD_KEEPER, PHIL, EVENT_BEAT_BIRD_KEEPER_PHIL, BirdKeeperPhilText, BirdKeeperPhilWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperPhilAfterText
	waitbutton
	closetext
	end
	
TrainerLadJack:
	trainer LAD, JACK, EVENT_BEAT_LAD_JACK, LadJackText, LadJackWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LadJackAfterText
	waitbutton
	closetext
	end
	
TrainerTeacherAndrea:
	trainer TEACHER, ANDREA, EVENT_BEAT_TEACHER_ANDREA, TeacherAndreaText, TeacherAndreaWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TeacherAndreaAfterText
	waitbutton
	closetext
	end
	
TrainerSchoolboyJohnny:
	trainer SCHOOLBOY, JOHNNY, EVENT_BEAT_SCHOOLBOY_JOHNNY, SchoolboyJohnnyText, SchoolboyJohnnyWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SchoolboyJohnnyAfterText
	waitbutton
	closetext
	end
	
TrainerSchoolboyDanny:
	trainer SCHOOLBOY, DANNY, EVENT_BEAT_SCHOOLBOY_DANNY, SchoolboyDannyText, SchoolboyDannyWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SchoolboyDannyAfterText
	waitbutton
	closetext
	end

Route2Sign:
	jumptext Route2SignText

Route2TrainerTips:
	jumptext Route2TrainerTipsText

Route2Potion1:
	itemball POTION
	
Route2Potion2:
	itemball SUPER_POTION
	
Route2PokeBall:
	itemball POKE_BALL	
	
Route2LeafStone:
	itemball LEAF_STONE
	
Route2FruitTree1:
	fruittree FRUITTREE_ROUTE_2_1

Route2FruitTree2:
	fruittree FRUITTREE_ROUTE_2_2

CamperNicholasText:
	text "I bet you couldn't"
	line "see me here with"
	cont "my camouflage!"
	done

CamperNicholasWinText:
	text "I didn't plan on"
	line "anyone actually"
	cont "seeing me…"
	done

CamperNicholasAfterText:
	text "I should learn to"
	line "battle better than"
	cont "I can hide."
	done
	
PicnickerJamieText:
	text "I found this"
	line "#MON all"
	cont "on my own!"
	done
	
PicnickerJamieWinText:
	text "It was a lot of"
	line "fun battling you!"
	done
	
PicnickerJamieAfterText:
	text "I don't know many"
	line "girls that like to"
	cont "play out here"
	cont "in the woods."
	done

BugCatcherLiamText:
	text "Bug #MON are"
	line "fascinating!"
	
	para "Let me show you"
	line "my collection!"
	done
	
BugCatcherLiamWinText:
	text "Aw man, I lost!"
	done
	
BugCatcherLiamAfterText:
	text "I'm proud of my"
	line "#MON."
	
	para "They put up"
	line "a good fight!"
	done
	
LassNicoleText:
	text "I love cute"
	line "#MON!"
	done
	
LassNicoleWinText:
	text "My babies!"
	done
	
LassNicoleAfterText:
	text "Some #MON"
	line "can only be found"
	cont "after dark."
	
	para "They must sleep"
	line "during the day."
	done

BirdKeeperPhilText:
	text "I flew here using"
	line "my bird #MON!"
	done
	
BirdKeeperPhilWinText:
	text "Now I'll have to"
	line "walk home…"
	done
	
BirdKeeperPhilAfterText:
	text "Bird #MON are"
	line "much more common"
	cont "to the east."
	done
	
LadJackText:
	text "My big brother"
	line "let me borrow"
	cont "his #MON!"
	done
	
LadJackWinText:
	text "He told me these"
	line "were strong…"
	done
	
LadJackAfterText:
	text "I will just have"
	line "to explore other"
	cont "routes to find my"
	cont "own #MON."
	done
	
TeacherAndreaText:
	text "One of my students"
	line "has run off alone!"
	done
	
TeacherAndreaWinText:
	text "Can you help me"
	line "find him?"
	done
	
TeacherAndreaAfterText:
	text "My students always"
	line "say they like me."
	
	para "I don't know why"
	line "one would run off."
	done
	
SchoolboyJohnnyText:
	text "My classmate went"
	line "off alone to find"
	cont "rare items."
	done

SchoolboyJohnnyWinText:
	text "I should have"
	line "joined him!"
	done
	
SchoolboyJohnnyAfterText:
	text "He promised to"
	line "share with me if"
	cont "I didn't snitch on"
	cont "him."
	done
	
SchoolboyDannyText:
	text "I'm hiding!"
	
	para "Don't tell anyone!"
	done

SchoolboyDannyWinText:
	text "I wanted to find"
	line "some items around"
	cont "here."
	done
	
SchoolboyDannyAfterText:
	text "I can't find any-"
	line "thing! Can you"
	cont "help me find my"
	cont "teacher now?"
	done
	
Route2SignText:
	text "ROUTE 2"

	para "PAVONA VILLAGE -"
	line "PECTINIA CITY"
	done

Route2TrainerTipsText:
	text "TRAINER TIPS "
	
	para "It is usually"
	line "safer to walk"
	cont "through pathways"
	cont "with tall grass."
	
	para "You will avoid"
	line "trainers looking"
	cont "for a battle."
	done

Route2_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  39, 32, ROUTE_2_PECTINIA_GATE, 1
	warp_event  39, 33, ROUTE_2_PECTINIA_GATE, 2
	warp_event  39,  2, ROUTE_2_GATE, 1
	warp_event  39,  3, ROUTE_2_GATE, 2
	
	db 0 ; coord events
	
	db 2 ; bg events
	bg_event  4,  5, BGEVENT_READ, Route2Sign
	bg_event 18, 30, BGEVENT_READ, Route2TrainerTips

	db 16 ; object events
	object_event  8,  2, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerCamperNicholas, -1
	object_event 10,  8, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerPicnickerJamie, -1
	object_event 10, 17, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerBugCatcherLiam, -1
	object_event  5, 19, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerLassNicole, -1
	object_event 20, 17, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerBirdKeeperPhillip, -1
	object_event 28, 33, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerLadJack, -1
	object_event 35, 25, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route2Potion1, EVENT_ROUTE_2_POKE_BALL
	object_event 11,  0, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route2PokeBall, EVENT_ROUTE_2_POTION1
	object_event 18, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route2Potion2, EVENT_ROUTE_2_POTION2
	object_event  9, 15, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route2FruitTree1, -1
	object_event  5, 36, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route2FruitTree2, -1
	object_event 28,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerSchoolboyDanny, -1
	object_event 31, 17, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerSchoolboyJohnny, -1
	object_event 35, 16, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerTeacherAndrea, -1
	object_event 28,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route2LeafStone, EVENT_ROUTE_2_LEAF_STONE
	object_event -5,  8, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	