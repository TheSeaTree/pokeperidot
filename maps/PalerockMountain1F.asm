	const_def 2 ; object constants
	const PALEROCK1F_BOULDER1
	const PALEROCK1F_BOULDER2
	const PALEROCK1F_BOULDER3
	const PALEROCK1F_ROCK1
	const PALEROCK1F_ROCK2
	const PALEROCK1F_ROCK3
	const PALEROCK1F_HIKER1
	const PALEROCK1F_HIKER2
	const PALEROCK1F_HIKER3
	const PALEROCK1F_HIKER4
	const PALEROCK1F_ROCKER
	const PALEROCK1F_POKEBALL1
	const PALEROCK1F_POKEBALL2
	const PALEROCK1F_POKEBALL3
	const PALEROCK1F_POKEBALL4
	
PalerockMountain1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PalerockMountain1FBoulder:
	jumpstd strengthboulder
	
PalerockMountain1FRock:
	jumpstd smashrock
	
TrainerHikerJose:
	trainer HIKER, JOSE, EVENT_BEAT_HIKER_JOSE, HikerJoseText, HikerJoseWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerJoseAfterText
	waitbutton
	closetext
	end	
	
TrainerHikerJay:
	trainer HIKER, JAY, EVENT_BEAT_HIKER_JAY, HikerJayText, HikerJayWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerJayAfterText
	waitbutton
	closetext
	end	
	
TrainerHikerJacob:
	trainer HIKER, JACOB, EVENT_BEAT_HIKER_JACOB, HikerJacobText, HikerJacobWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerJacobAfterText
	waitbutton
	closetext
	end	
	
TrainerHikerGeorge:
	trainer HIKER, GEORGE, EVENT_BEAT_HIKER_GEORGE, HikerGeorgeText, HikerGeorgeWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerGeorgeAfterText
	waitbutton
	closetext
	end	

Palerock1FRocker:
	faceplayer
	opentext
	writetext Palerock1RockerText
	waitbutton
	closetext
	applymovement PALEROCK1F_ROCKER, Palerock1RockerKick
	playsound SFX_TACKLE
	applymovement PLAYER, Palerock1PlayerMovement
	applymovement PALEROCK1F_ROCKER, Palerock1RockerMovement1
	opentext
	writetext Palerock1RockerWontTell
	waitbutton
	closetext
	applymovement PALEROCK1F_ROCKER, Palerock1RockerMovement2
	disappear PALEROCK1F_ROCKER
	setevent EVENT_SAVED_PALEROCK_ROCKER
	end
	
Palerock1PokeBall:
	itemball POKE_BALL, 3
	
Palerock1Repel:
	itemball REPEL
	
Palerock1MoonStone:
	itemball MOON_STONE
	
Palerock1SodaPop:
	itemball SODA_POP

Palerock1RockerKick:
	turn_step LEFT
	step_end
	
Palerock1RockerMovement1:
	step LEFT
	step UP
	turn_head DOWN
	step_end
	
Palerock1PlayerMovement:
	fix_facing
	run_step LEFT
	remove_fixed_facing
	step_end

Palerock1RockerMovement2:
	run_step UP
	run_step UP
	run_step RIGHT
	run_step UP
	run_step UP
	step_end
	
HikerJoseText:
	text "Hey kid! Do you"
	line "have any idea how"
	cont "loud those"
	cont "boulders are?"
	done

HikerJoseWinText:
	text "Fine, you win."
	
	para "Just let me go"
	line "back to sleep."
	done

HikerJoseAfterText:
	text "I put that boulder"
	line "there so nobody"
	cont "would bother me"
	cont "while I napped!"
	done
	
HikerJayText:
	text "Is this your first"
	line "time climbing a"
	cont "mountain?"
	done

HikerJayWinText:
	text "Right back down to"
	line "the bottom I go!"
	done

HikerJayAfterText:
	text "I travel the world"
	line "in search of the"
	cont "highest peaks to"
	cont "conquer."
	done
	
HikerJacobText:
	text "My #MON likes"
	line "dark places, so we"
	cont "train inside."
	done
	
HikerJacobWinText:
	text "Oh no! We've been"
	line "exposed!"
	done
	
HikerJacobAfterText:
	text "Some people say"
	line "DUNSPARCE can fly,"
	cont "but I have never"
	cont "seen it happen my-"
	cont "self."
	done
	
HikerGeorgeText:
	text "Here I am!"
	done
	
HikerGeorgeWinText:
	text "You rocked us like"
	line "a hurricane!"
	done
	
HikerGeorgeAfterText:
	text "I'm here all day."
	
	para "The only thing I"
	line "have is my music"
	cont "and my #MON."
	done
	
Palerock1RockerText:
	text "Hey, how did a kid"
	line "like you get"
	cont "in here?"
	
	para "You were able to"
	line "shove those"
	cont "boulders around"
	cont "like they were"
	cont "nothin'!"
	
	para "That's a pretty"
	line "brutal task"
	cont "my dude."
	
	para "How about I put in"
	line "a good word for"
	cont "with the guys out-"
	cont "side?"
	done
	
Palerock1RockerWontTell:
	text "One last thing."

	para "…Don't tell the"
	line "guys about this."
	
	para "I have an image"
	line "to uphold!"
	done
	
PalerockMountain1F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  13, 23, ROUTE_3, 5
	warp_event   7,  3, PALEROCK_MOUNTAIN_2F, 1
	warp_event  32, 23, PALEROCK_MOUNTAIN_B1, 1
	warp_event   3, 23, PALEROCK_MOUNTAIN_B2, 2

	db 0 ; coord events

	db 0 ; bg events

	db 15 ; object events
	object_event   9, 21, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PalerockMountain1FBoulder, -1
	object_event  23, 21, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PalerockMountain1FBoulder, -1
	object_event  4, 12, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PalerockMountain1FBoulder, -1
	object_event  5, 15, SPRITE_ROCK, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PalerockMountain1FRock, -1
	object_event 21,  8, SPRITE_ROCK, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PalerockMountain1FRock, -1
	object_event 22,  9, SPRITE_ROCK, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PalerockMountain1FRock, -1
	object_event 10, 20, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerHikerJose, -1
	object_event 21, 11, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerHikerJay, -1
	object_event 11,  4, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerHikerJacob, -1
	object_event 31,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerHikerGeorge, -1
	object_event  5, 14, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Palerock1FRocker, EVENT_SAVED_PALEROCK_ROCKER
	object_event  8, 20, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Palerock1MoonStone, EVENT_PALEROCK_1_MOON_STONE
	object_event  9, 25, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Palerock1Repel, EVENT_PALEROCK_1_REPEL
	object_event 29, 17, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Palerock1PokeBall, EVENT_PALEROCK_1_POKE_BALL
	object_event  7, 17, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Palerock1SodaPop, EVENT_PALEROCK_1_SODA_POP
	