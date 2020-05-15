	const_def 2 ; object constants
	const ROUTE1_GRANNY
	const ROUTE1_COOLTRAINER_F
	const ROUTE1_FRUIT_TREE

Route1_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_ROUTE_1_NOTHING

	db 0 ; callbacks

.DummyScene0:
	end

.DummyScene1:
	end
	
Route1LedgeGirl:
	jumptextfaceplayer LedgeDescription
	
Route1Lass:	
	jumptextfaceplayer Route1LassText
	
TrainerFisherLeo:
	trainer FISHER, LEO, EVENT_BEAT_FISHER_LEO, FisherLeoText, FisherLeoWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherLeoAfterText
	waitbutton
	closetext
	end
	
TrainerFisherMarshall:
	trainer FISHER, MARSHALL, EVENT_BEAT_FISHER_MARSHALL, FisherMarshallText, FisherMarshallWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherMarshallAfterText
	waitbutton
	closetext
	end
	
MoveSuperNerds:
	setevent EVENT_MOVED_NERDS
	setscene SCENE_ROUTE_1_NOTHING
	end
	
TrainerSuperNerdShane:
	trainer SUPER_NERD, SHANE, EVENT_BEAT_SUPER_NERD_SHANE, SuperNerdShaneText, SuperNerdShaneWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SuperNerdShaneAfterText
	waitbutton
	closetext
	end

TrainerSuperNerdSteven:
	trainer SUPER_NERD, STEVEN, EVENT_BEAT_SUPER_NERD_STEVEN, SuperNerdStevenText, SuperNerdStevenWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SuperNerdStevenAfterText
	waitbutton
	closetext
	end

TrainerPokemaniacScott:
	trainer POKEMANIAC, SCOTT, EVENT_BEAT_POKEMANIAC_SCOTT, PokemaniacScottText, PokemaniacScottWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokemaniacScottAfterText
	waitbutton
	closetext
	end

TrainerPokemaniacDylan:
	trainer POKEMANIAC, DYLAN, EVENT_BEAT_POKEMANIAC_DYLAN, PokemaniacDylanText, PokemaniacDylanWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokemaniacDylanAfterText
	waitbutton
	closetext
	end
	
TrainerBeautyJill:
	trainer BEAUTY, JILL, EVENT_BEAT_BEAUTY_JILL, BeautyJillText, BeautyJillWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BeautyJillAfterText
	waitbutton
	closetext
	end	
	
TrainerBeautyTracey:
	trainer BEAUTY, TRACEY, EVENT_BEAT_BEAUTY_TRACEY, BeautyTraceyText, BeautyTraceyWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BeautyTraceyAfterText
	waitbutton
	closetext
	end

TrainerCooltrainerMLeon:
	faceplayer
	opentext
	checkevent EVENT_BEAT_COOLTRAINERM_LEON
	iftrue .FightDone
	checkevent EVENT_BEAT_FISHER_LEO
	iffalse .Explain	
	checkevent EVENT_BEAT_FISHER_MARSHALL
	iffalse .Explain
	checkevent EVENT_BEAT_SUPER_NERD_SHANE
	iffalse .Explain
	checkevent EVENT_BEAT_SUPER_NERD_STEVEN
	iffalse .Explain
	checkevent EVENT_BEAT_POKEMANIAC_SCOTT
	iffalse .Explain
	checkevent EVENT_BEAT_POKEMANIAC_DYLAN
	iffalse .Explain
	checkevent EVENT_BEAT_BEAUTY_JILL
	iffalse .Explain	
	checkevent EVENT_BEAT_BEAUTY_TRACEY
	iffalse .Explain
	writetext LeonGoodJob
	waitbutton
	playmusic MUSIC_HIKER_ENCOUNTER
	writetext LeonChallengeText
	waitbutton
	closetext
	winlosstext CooltrainerLeonWin, CooltrainerLeonLoss
	loadtrainer COOLTRAINERM, LEON
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_COOLTRAINERM_LEON
	jump .FightDone
	
.FightDone:
	opentext
	checkevent EVENT_GOT_TM_HEADBUTT
	iftrue .Headbutt
	verbosegiveitem TM_HEADBUTT
	setevent EVENT_GOT_TM_HEADBUTT
	
.Headbutt:
	writetext AlreadyGotHeadbutt
	waitbutton
	closetext
	end
	
.Explain:
	checkevent ROUTE_1_TALKED_TO_LEON
	iftrue .Waiting
	writetext LeonExplaination
	setevent ROUTE_1_TALKED_TO_LEON
	waitbutton
	closetext
	end
	
.Waiting:
	writetext LeonMoreToGo
	waitbutton
	closetext
	end

Route1Sign:
	jumptext Route1SignText
	
Route1HiddenPowerHerb:
	hiddenitem POWER_HERB, EVENT_ROUTE_1_HIDDEN_POWER_HERB

Route1FruitTree:
	fruittree FRUITTREE_ROUTE_1
	
Route1TMPlayRough:
	itemball TM_PLAY_ROUGH

LedgeDescription:
	text "You can jump down"
	line "from ledges like"
	cont "this one."
	
	para "I would show you,"
	line "but it's too scary"
	cont "for me!"
	done
	
Route1LassText:
	text "You may not be"
	line "able to reach some"
	cont "areas right away."
	
	para "Come back later,"
	line "you never know"
	cont "what you may find!"
	done
	
FisherLeoText:
	text "I am a"
	line "#MON trainer!"
	done
	
FisherLeoWinText:
	text "I lost."
	done
	
FisherLeoAfterText:
	text "I lost."
	done
	
FisherMarshallText:
	text "I am a"
	line "#MON trainer!"
	done
	
FisherMarshallWinText:
	text "I lost."
	done
	
FisherMarshallAfterText:
	text "I lost."
	done
	
SuperNerdShaneText:
	text "I am a"
	line "#MON trainer!"
	done
	
SuperNerdShaneWinText:
	text "I lost."
	done
	
SuperNerdShaneAfterText:
	text "I lost."
	done	

SuperNerdStevenText:
	text "I am a"
	line "#MON trainer!"
	done
	
SuperNerdStevenWinText:
	text "I lost."
	done
	
SuperNerdStevenAfterText:
	text "I lost."
	done

PokemaniacScottText:
	text "I am a"
	line "#MON trainer!"
	done
	
PokemaniacScottWinText:
	text "I lost."
	done
	
PokemaniacScottAfterText:
	text "I lost."
	done
	
PokemaniacDylanText:
	text "I am a"
	line "#MON trainer!"
	done
	
PokemaniacDylanWinText:
	text "I lost."
	done
	
PokemaniacDylanAfterText:
	text "I lost."
	done
	
BeautyJillText:
	text "I am a"
	line "#MON trainer!"
	done
	
BeautyJillWinText:
	text "I lost."
	done
	
BeautyJillAfterText:
	text "I lost."
	done

BeautyTraceyText:
	text "I am a"
	line "#MON trainer!"
	done
	
BeautyTraceyWinText:
	text "I lost."
	done
	
BeautyTraceyAfterText:
	text "I lost."
	done
	
LeonGoodJob:
	text "So you beat every"
	line "trainer on this"
	cont "route, huh?"
	done
	
LeonChallengeText:
	text "Not quite."
	
	para "Don't think I was"
	line "going to let you"
	cont "have all the fun."
	done

CooltrainerLeonWin:
	text "It's nice to"
	line "finally see"
	cont "defeat. Good job,"
	cont "<PLAYER>."
	done

CooltrainerLeonLoss:
	text "I expected more"
	line "from you. Perhaps"
	cont "I should find"
	cont "somewhere else to"
	cont "train."
	done
	
LeonExplaination:
	text "Hey, kid. I never"
	line "thought SCOTT or"
	cont "STEVEN would let"
	cont "any new trainers"
	cont "over here."
	
	para "I've already won"
	line "against them so"
	cont "many times, it's"
	cont "become boring."
	
	para "If you can prove"
	line "you're at least"
	cont "better than all of"
	cont "the trainers on"
	cont "this route, I'll"
	cont "reward you."
	done
	
LeonMoreToGo:
	text "It doesn't look"
	line "like you have"
	cont "defeated everyone"
	cont "on ROUTE 1."
	done

AlreadyGotHeadbutt:
	text "That TM contains"
	line "HEADBUTT."
	
	para "Try using it on"
	line "some of these"
	cont "small trees. You"
	cont "might knock a"
	cont "#MON out of it."
	done
	
Route1SignText:
	text "ROUTE 1"

	para "NEW BARK TOWN -"
	line "CHERRYGROVE CITY"
	done

Route1_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event  23,  3, ROUTE_1_NEW_BARK_GATE, 3
	warp_event   9, 29, ROUTE_1_CHERRYGROVE_GATE, 1
	warp_event  10, 29, ROUTE_1_CHERRYGROVE_GATE, 2
	warp_event  61,  5, ROUTE_1_GOLDENROD_GATE, 3
	warp_event  39,  7, CHARCOAL_KILN, 1

	db 1 ; coord events
	coord_event 14, 18, SCENE_DEFAULT, MoveSuperNerds

	db 2 ; bg events
	bg_event  12, 26, BGEVENT_READ, Route1Sign
	bg_event   4,  5, BGEVENT_READ, Route1HiddenPowerHerb

	db 13 ; object events
	object_event  18, 18, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route1Lass, -1
	object_event  28,  9, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 2, Route1LedgeGirl, -1
	object_event   7,  4, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSuperNerdSteven, -1
	object_event   4,  7, SPRITE_BUENA, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerBeautyTracey, -1
	object_event   9, 11, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerSuperNerdShane, -1
	object_event  14,  8, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerPokemaniacDylan, -1
	object_event   4, 15, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerPokemaniacScott, -1
	object_event   0,  4, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerBeautyJill, -1
	object_event  19,  5, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, TrainerCooltrainerMLeon, -1
	object_event  40, 13, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerFisherMarshall, -1
	object_event  62, 13, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerFisherLeo, -1
	object_event  57, 20, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route1FruitTree, -1
	object_event  50,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_SILVER, OBJECTTYPE_ITEMBALL, 0, Route1TMPlayRough, EVENT_GOT_TM_PLAY_ROUGH
