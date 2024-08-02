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
	opentext
.FightDone:
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

Route1Beauty:
	jumptextfaceplayer Route1BeautyText

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
	text "Fishin' up #MON"
	line "all day is what I"
	cont "love to do!"
	
	para "Fishin' up #MON"
	line "just to battle"
	cont "with you!"
	done

FisherLeoWinText:
	text "I am done!"
	line "But that was fun!"
	done
	
FisherLeoAfterText:
	text "I'm not rhymin'"
	line "deliberately!"
	
	para "These are the"
	line "only words comin'"
	cont "to me!"
	done
	
FisherMarshallText:
	text "Argh! Another dup-"
	line "licate!"
	
	para "Hey! Help me take"
	line "my mind off this"
	cont "terrible luck!"
	done
	
FisherMarshallWinText:
	text "This would be dif-"
	line "ferent if I could"
	cont "find what I'm look-"
	cont "ing for!"
	done
	
FisherMarshallAfterText:
	text "I am far too stub-"
	line "born to stop until"
	cont "I see another"
	cont "GYARADOS."
	
	para "It happened once,"
	line "it will happen"
	cont "again!"
	done
	
SuperNerdShaneText:
	text "Hey! You're not a"
	line "regular here!"
	
	para "How did you get"
	line "in?"
	done
	
SuperNerdShaneWinText:
	text "I don't care that"
	line "you won! We keep"
	cont "this place exclus-"
	cont "ive for a reason!"
	done
	
SuperNerdShaneAfterText:
	text "You used CUT to"
	line "sneak in? That's"
	cont "honestly pretty"
	cont "clever."

	para "For a dork."
	done	

SuperNerdStevenText:
	text "You're the kid"
	line "from ELKHORN TOWN!"
	
	para "That means you are"
	line "new. This will be"
	cont "easy!"
	done
	
SuperNerdStevenWinText:
	text "What? How?"
	
	para "I have more exper-"
	line "ience than you!"
	done
	
SuperNerdStevenAfterText:
	text "Tch… Whatever."
	
	para "I was just going"
	line "easy on you…"
	done

PokemaniacScottText:
	text "Did you sneak in?"
	
	para "Oh, man. SHANE is"
	line "gonna be mad!"
	done
	
PokemaniacScottWinText:
	text "No worries, they"
	line "will handle you"
	cont "with ease!"
	done
	
PokemaniacScottAfterText:
	text "We keep this path"
	line "blocked so no"
	cont "newbie trainers"
	cont "cramp our styles!"
	done
	
PokemaniacDylanText:
	text "I will defend the"
	line "honor of JILL and"
	cont "TRACEY!"
	done
	
PokemaniacDylanWinText:
	text "Keep it down!"
	
	para "I don't want the"
	line "girls to notice!"
	done
	
PokemaniacDylanAfterText:
	text "I only come here"
	line "to admire the"
	cont "beautiful girls."
	
	para "#MON battles"
	line "are secondary."
	done
	
BeautyJillText:
	text "Hey, guess what my"
	line "favorite color is!"
	done
	
BeautyJillWinText:
	text "Could you guess?"
	
	para "Well, could you?"
	done
	
BeautyJillAfterText:
	text "Pink, round, and"
	line "huggable."
	
	para "Those are all the"
	line "qualities of a"
	cont "good #MON."
	done

BeautyTraceyText:
	text "Oh, you're a"
	line "fresh face!"
	
	para "Show me what"
	line "#MON you have!"
	done
	
BeautyTraceyWinText:
	text "Where did you find"
	line "those?"
	done
	
BeautyTraceyAfterText:
	text "Y'know, it's nice"
	line "to battle someone"
	cont "and not be hit on."
	
	para "I think that makes"
	line "you pretty cool."
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

Route1BeautyText:
	text "I wanted to go"
	line "hiking on PALEROCK"
	cont "MOUNTAIN, but the"
	cont "path on ROUTE 2"
	cont "has been blocked"
	cont "by a tree!"

	para "None of my #MON"
	line "know how to CUT"
	cont "it down either…"
	done

Route1SignText:
	text "ROUTE 1"

	para "ELKHORN TOWN -"
	line "PAVONA VILLAGE"
	done

Route1_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event  23,  3, ROUTE_1_ELKHORN_GATE, 3
	warp_event   9, 29, ROUTE_1_PAVONA_GATE, 1
	warp_event  10, 29, ROUTE_1_PAVONA_GATE, 2
	warp_event  61,  5, ROUTE_1_FAVIA_GATE, 3
	warp_event  39,  7, CHARCOAL_KILN, 1

	db 1 ; coord events
	coord_event 14, 18, SCENE_DEFAULT, MoveSuperNerds

	db 2 ; bg events
	bg_event  12, 26, BGEVENT_READ, Route1Sign
	bg_event   4,  5, BGEVENT_READ, Route1HiddenPowerHerb

	db 14 ; object events
	object_event  18, 18, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route1Lass, -1
	object_event  28,  9, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 2, Route1LedgeGirl, -1
	object_event   7,  4, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerSuperNerdSteven, -1
	object_event   4,  7, SPRITE_BUENA, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerBeautyTracey, -1
	object_event   9, 11, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerSuperNerdShane, -1
	object_event  14,  8, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerPokemaniacDylan, -1
	object_event   4, 15, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerPokemaniacScott, -1
	object_event   0,  4, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerBeautyJill, -1
	object_event  19,  5, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, TrainerCooltrainerMLeon, -1
	object_event  40, 13, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerFisherMarshall, -1
	object_event 62, 13, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerFisherLeo, -1
	object_event 37, 10, SPRITE_BUENA, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route1Beauty, -1
	object_event  57, 20, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route1FruitTree, -1
	object_event  50,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_ITEMBALL, 0, Route1TMPlayRough, EVENT_GOT_TM_PLAY_ROUGH
