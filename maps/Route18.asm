	const_def 2 ; object constants
	const ROUTE18_TRAINER1
	const ROUTE18_TRAINER2
	const ROUTE18_TRAINER3
	const ROUTE18_TRAINER4
	const ROUTE18_TRAINER5
	const ROUTE18_TAUROS1
	const ROUTE18_TAUROS2
	const ROUTE18_MARIE1
	const ROUTE18_BESSIE1
	const ROUTE18_MARIE2
	const ROUTE18_BESSIE2
	const ROUTE18_GRAMPS
	const ROUTE18_POKEBALL1
	const ROUTE18_POKEBALL2

Route18_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerBirdKeeperRicky:
	trainer BIRD_KEEPER, RICKY, EVENT_BEAT_BIRD_KEEPER_RICKY, BirdKeeperRickyText, BirdKeeperRickyWinText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext BirdKeeperRickyAfterText
	waitbutton
	closetext
	end

TrainerPokefanFMarci:
	trainer POKEFANF, MARCI, EVENT_BEAT_POKEFANF_MARCI, PokefanFMarciText, PokefanFMarciWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanFMarciAfterText
	waitbutton
	closetext
	end

TrainerBeautyBrianna:
	trainer BEAUTY, BRIANNA, EVENT_BEAT_BEAUTY_BRIANNA, BeautyBriannaText, BeautyBriannaWinText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext BeautyBriannaAfterText
	waitbutton
	closetext
	end

TrainerPicnickerTammy:
	trainer PICNICKER, TAMMY, EVENT_BEAT_PICNICKER_TAMMY, PicnickerTammyText, PicnickerTammyWinText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext PicnickerTammyAfterText
	waitbutton
	closetext
	end
	
TrainerFisherFisher:
	trainer FISHER, FISHER_TRAINER, EVENT_BEAT_FISHER_FISHER, FisherFisherText, FisherFisherWinText, 0, .AfterScript
	
.AfterScript:
	endifjustbattled
	opentext
	writetext FisherFisherAfterText
	waitbutton
	closetext
	end

TrainerMarieScript:
	faceplayer
	opentext
	writetext Route18DaughterText
	waitbutton
	checkevent EVENT_TALKED_TO_MARIES_GRANDFATHER
	iffalse .No
	writetext Route18DaughterNoticeBadges
	waitbutton
	playmusic MUSIC_LASS_ENCOUNTER
	writetext Route18DaughterChallengeText
	waitbutton
	closetext
	winlosstext Route18DaughterWinText, 0
    loadtrainer BEAUTY, MARIE1
	startbattle
	reloadmapafterbattle
	opentext
	writetext Route18DaughterAfterText
	waitbutton
	closetext
	setevent EVENT_MARIE_GONE_HOME
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	pause 12
	disappear ROUTE18_MARIE1
	disappear ROUTE18_BESSIE1
	disappear ROUTE18_GRAMPS
	setmapscene ROUTE_18_FARMHOUSE, SCENE_FINISHED
	special FadeInQuickly
	end
	
.No
	closetext
	end

TrainerMarieAfterScript:
	checkevent EVENT_BEAT_BEAUTY_MARIE_POSTGAME
	iftrue .AfterBattle
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .Postgame
	jumptextfaceplayer TrainerMarieBackHomeText

.Postgame
	faceplayer
	opentext
	writetext TrainerMariePostgameChallengeText
	yesorno
	iffalse .Decline
	writetext TrainerMariePostgameAcceptText
	waitbutton
	closetext
	winlosstext TrainerMariePostgameWinText, 0
    loadtrainer BEAUTY, MARIE2
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_BEAUTY_MARIE_POSTGAME
.AfterBattle
	faceplayer
	opentext
	writetext TrainerMariePostgameAfterText
	waitbutton
	closetext
	end

.Decline
	writetext TrainerMariePostgameDeclineText
	waitbutton
	closetext
	end
	
MariesGrandfatherScript:
	faceplayer
	opentext
	writetext Route18GrandfatherText
	waitbutton
	closetext
	setevent EVENT_TALKED_TO_MARIES_GRANDFATHER
	end

Route18MiltankScript:
	opentext
	writetext Route18MiltankText
	cry MILTANK
	waitbutton
	closetext
	end

Route18FarmSign:
	jumptext Route18FarmSignText
	
Route18HiddenUltraBall:
	hiddenitem ULTRA_BALL, EVENT_ROUTE_18_HIDDEN_ULTRA_BALL
	
Route18HiddenPowerHerb:
	hiddenitem POWER_HERB, EVENT_ROUTE_18_HIDDEN_POWER_HERB

Route18LeafStone:
	itemball LEAF_STONE

Route18MaxRepel:
	itemball MAX_REPEL
	
BirdKeeperRickyText:
	text "Going around the"
	line "world finding new"
	cont "bird #MON."
	
	para "That's the life!"
	done
	
BirdKeeperRickyWinText:
	text "Prepare for a"
	line "crash landing!"
	done
	
BirdKeeperRickyAfterText:
	text "My loss is no"
	line "matter. I will"
	cont "find even better"
	cont "bird #MON"
	cont "somewhere else!"
	done
	
PokefanFMarciText:
	text "My children are"
	line "#MON trainers"
	cont "just like their"
	cont "mother!"
	done
	
PokefanFMarciWinText:
	text "It seems like time"
	line "for a new generat-"
	cont "ion of trainers."
	done
	
PokefanFMarciAfterText:
	text "I taught my"
	line "daughter how to"
	cont "evolve #MON"
	cont "using a stone!"
	done
	
BeautyBriannaText:
	text "I love to take my"
	line "pet #MON for"
	cont "walks out here."
	done
	
BeautyBriannaWinText:
	text "That's okay,"
	line "babies. Mommy will"
	cont "carry you home!"
	done
	
BeautyBriannaAfterText:
	text "This farm is so"
	line "cozy!"
	done
	
PicnickerTammyText:
	text "My mom taught me"
	line "how to evolve my"
	cont "#MON!"
	done
	
PicnickerTammyWinText:
	text "Wah! Why didn't"
	line "they get stronger!"
	done
	
PicnickerTammyAfterText:
	text "I don't get it."
	line "All of my #MON"
	cont "are fully evolved."
	done
	
FisherFisherText:
	text "Hey, that's my"
	line "item!"
	
	para "I saw it first!"
	done
	
FisherFisherWinText:
	text "Okay, okay."
	line "You can take it."
	done

FisherFisherAfterText:
	text "My parents must be"
	line "PSYCHIC-types to"
	cont "choose my name the"
	cont "way they did."
	done

Route18MiltankText:
	text "MILTANK: Moo!"
	done
	
Route18GrandfatherText:
	text "My granddaughter"
	line "has been shirking"
	cont "out of her respon-"
	cont "sibilities on this"
	cont "farm."
	
	para "She even snuck off"
	line "with our best"
	cont "MILTANK!"
	
	para "She is always"
	line "talking about"
	cont "making it big as a"
	cont "#MON trainer,"
	cont "but she never"
	cont "thinks about the"
	cont "well-being of her"
	cont "family!"
	done
	
Route18DaughterText:
	text "Isn't this"
	line "amazing? I taught"
	cont "BESSIE how to swim"
	cont "all on my own!"
	
	para "I take her out"
	line "here to get away"
	cont "from the farm."
	
	para "I wasn't meant to"
	line "stay cooped up"
	cont "there forever! I"
	cont "want to travel the"
	cont "world with #MON"
	cont "that I caught!"
	done

Route18DaughterNoticeBadges:
	text "Those things you"
	line "have pinned to"
	cont "your jacket…"
	
	para "Are those badges?"
	
	para "Grandpa would have"
	line "to let me go out"
	cont "on an adventure if"
	cont "I was able to beat"
	cont "someone who bested"
	cont "GYM LEADERs!"
	done
	
Route18DaughterChallengeText:
	text "Come on, BESSIE!"
	
	para "Let's prove that I"
	line "deserve to be a"
	cont "#MON trainer!"
	done
	
Route18BessieText:
	text "BESSIE: Moo!"
	done
	
Route18DaughterWinText:
	text "I will never give"
	line "up!"
	
	para "My dream will not"
	line "die!"
	done

Route18DaughterAfterText:
	text "You won, but you"
	line "have a lot more"
	cont "experience than"
	cont "I do!"
	
	para "I will catch more"
	line "#MON."
	
	para "When I do, we will"
	line "battle again!"
	done

TrainerMarieBackHomeText:
	text "Heya, <PLAYER>!"
	
	para "I've put my dreams"
	line "of being a #MON"
	cont "trainer on hold"
	cont "for a while, but I"
	cont "promise we will"
	cont "battle again!"
	done

TrainerMariePostgameChallengeText:
	text "Oh! <PLAYER>!"
	
	para "I saw on the TV"
	line "that you and your"
	cont "#MON became the"
	cont "CHAMPION!"

	para "You know, grandpa"
	line "has allowed me to"
	cont "train some with"
	cont "BESSIE!"

	para "Can I show you"
	line "what I've learned?"
	done

TrainerMariePostgameAcceptText:
	text "Yipee!"

	para "I won't waste your"
	line "time, I promise!"
	done

TrainerMariePostgameWinText:
	text "Gah! I'm not quite"
	line "there yet!"

	para "Good battle!"
	done

TrainerMariePostgameAfterText:
	text "I don't feel bad"
	line "about losing to a"
	cont "CHAMPION, not one"
	cont "bit!"
	
	para "The fact I stood"
	line "any chance gives"
	cont "me so much hope!"
	done

TrainerMariePostgameDeclineText:
	text "…Oh, I see."

	para "You must be so"
	line "busy these days."

	para "If you find the"
	line "time for me, I"
	cont "would love to show"
	cont "you my #MON!"
	done

Route18FarmSignText:
	text "MOOMOO FARMS"
	
	para "Fresh milk daily!"
	done

Route18_MapEvents:
	db 0, 0 ; filler

	db 6 ; warp events
	warp_event 27, 35, ROUTE_14_GATE, 3
	warp_event 28, 35, ROUTE_14_GATE, 4
	warp_event  4, 18, ROUTE_18_CARNATION_GATE, 3
	warp_event  4, 19, ROUTE_18_CARNATION_GATE, 4
	warp_event 27,  3, ROUTE_18_BARN, 1
	warp_event 31,  3, ROUTE_18_FARMHOUSE, 1

	db 0 ; coord events

	db 3 ; bg events
	bg_event 23,  9, BGEVENT_READ, Route18FarmSign
	bg_event 20, 19, BGEVENT_ITEM, Route18HiddenUltraBall
	bg_event 19,  8, BGEVENT_ITEM, Route18HiddenPowerHerb

	db 14 ; object events 
	object_event 25, 25, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerBirdKeeperRicky, -1
	object_event 22, 22, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerPokefanFMarci, -1
	object_event 10, 17, SPRITE_BUENA, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBeautyBrianna, -1
	object_event 16, 15, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerPicnickerTammy, -1
	object_event 11, 25, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerFisherFisher, -1
	object_event 20,  3, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route18MiltankScript, -1
	object_event 14,  7, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route18MiltankScript, -1
	object_event 16, 33, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, TrainerMarieScript, EVENT_MARIE_GONE_HOME
	object_event 15, 33, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route18MiltankScript, EVENT_MARIE_GONE_HOME
	object_event 12,  5, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, TrainerMarieAfterScript, -1 ; Runaway Daughter After
	object_event 11,  5, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route18MiltankScript, -1 ; Her Miltank After
	object_event 24,  2, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, MariesGrandfatherScript, EVENT_MARIE_GONE_HOME
	object_event 18, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route18LeafStone, EVENT_ROUTE_18_LEAF_STONE
	object_event 12, 24, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route18MaxRepel, EVENT_ROUTE_18_MAX_REPEL
