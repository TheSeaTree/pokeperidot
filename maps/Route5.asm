	const_def 2 ; object constants
	const ROUTE5_POKEFAN_M

Route5_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .SmashWall
	
.SmashWall:
	checkevent EVENT_UNOWN_CHAMBER_AG_OPEN
	iffalse .skip
	changeblock 46, 10, $73
.skip
	return

TrainerBugCatcherEddie:
	trainer BUG_CATCHER, EDDIE, EVENT_BEAT_BUG_CATCHER_EDDIE, BugCatcherEddieText, BugCatcherEddieWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BugCatcherEddieAfterText
	waitbutton
	closetext
	end	
	
TrainerBeautyLily:
	trainer BEAUTY, LILY, EVENT_BEAT_BEAUTY_LILY, BeautyLilyText, BeautyLilyWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BeautyLilyAfterText
	waitbutton
	closetext
	end		

TrainerCamperJames:
	trainer CAMPER, JAMES, EVENT_BEAT_CAMPER_JAMES, CamperJamesText, CamperJamesWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperJamesAfterText
	waitbutton
	closetext
	end	

TrainerPicnickerJess:
	trainer PICNICKER, JESS, EVENT_BEAT_PICNICKER_JESS, PicnickerJessText, PicnickerJessWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerJessAfterText
	waitbutton
	closetext
	end	
	
TrainerLadBen:
	trainer LAD, BEN, EVENT_BEAT_LAD_BEN, LadBenText, LadBenWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LadBenAfterText
	waitbutton
	closetext
	end	
	
TrainerLassElizabeth:
	trainer LASS, ELIZABETH, EVENT_BEAT_LASS_ELIZABETH, LassElizabethText, LassElizabethWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassElizabethAfterText
	waitbutton
	closetext
	end
	
TrainerBugCatcherLonnie:
	trainer BUG_CATCHER, LONNIE, EVENT_BEAT_BUG_CATCHER_LONNIE, BugCatcherLonnieText, BugCatcherLonnieWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BugCatcherLonnieAfterText
	waitbutton
	closetext
	end

TrainerBugCatcherOwen:
	trainer BUG_CATCHER, OWEN, EVENT_BEAT_BUG_CATCHER_OWEN, BugCatcherOwenText, BugCatcherOwenWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BugCatcherOwenAfterText
	waitbutton
	closetext
	end
	
TrainerLassHolly:
	trainer LASS, HOLLY, EVENT_BEAT_LASS_HOLLY, LassHollyText, LassHollyWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassHollyAfterText
	waitbutton
	closetext
	end
	
TrainerSchoolboyGus:
	trainer SCHOOLBOY, GUS, EVENT_BEAT_SCHOOLBOY_GUS, SchoolboyGusText, SchoolboyGusWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SchoolboyGusAfterText
	waitbutton
	closetext
	end
	
TrainerCooltrainerFAnya:
	faceplayer
	opentext
	checkevent EVENT_BEAT_COOLTRAINERF_ANYA
	iftrue .FightDone
	checkevent EVENT_BEAT_BUG_CATCHER_EDDIE
	iffalse .Explain	
	checkevent EVENT_BEAT_BEAUTY_LILY
	iffalse .Explain
	checkevent EVENT_BEAT_CAMPER_JAMES
	iffalse .Explain
	checkevent EVENT_BEAT_PICNICKER_JESS
	iffalse .Explain
	checkevent EVENT_BEAT_LAD_BEN
	iffalse .Explain
	checkevent EVENT_BEAT_LASS_ELIZABETH
	iffalse .Explain
	checkevent EVENT_BEAT_LASS_HOLLY
	iffalse .Explain	
	checkevent EVENT_BEAT_BUG_CATCHER_OWEN
	iffalse .Explain
	checkevent EVENT_BEAT_BUG_CATCHER_LONNIE
	iffalse .Explain
	checkevent EVENT_BEAT_SCHOOLBOY_GUS
	iffalse .Explain
	writetext AnyaYouDidIt
	waitbutton
	playmusic MUSIC_BEAUTY_ENCOUNTER
	writetext AnyaChallengeText
	waitbutton
	closetext
	winlosstext CooltrainerAnyaWin, CooltrainerAnyaLoss
	loadtrainer COOLTRAINERF, ANYA
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_COOLTRAINERF_ANYA
	opentext
	jump .FightDone
	
.FightDone
	checkevent GOT_TOTODILE
	iftrue .Totodile
	writetext AnyaAfterBattleText
	waitbutton
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFull
	writetext AnyaGaveTotodile
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke TOTODILE, 10
	special TotodileGiftMon
	setevent GOT_TOTODILE
	closetext
	end
	
.PartyFull
	writetext AnyaNotEnoughRoom
	waitbutton
	closetext
	end
	
.Totodile
	writetext AlreadyGotTotodile
	waitbutton
	closetext
	end
	
.Explain
	checkevent ROUTE_5_TALKED_TO_ANYA
	iftrue .Waiting
	writetext AnyaExplaination
	setevent ROUTE_5_TALKED_TO_ANYA
	waitbutton
	closetext
	end
	
.Waiting
	writetext AnyaMoreToGo
	waitbutton
	closetext
	end
	
Route5Sign:
	jumptext Route5SignText
	
Route5FishingGuruSign:
	jumptext Route5FishingGuruSignText

Route5FruitTree:
	fruittree FRUITTREE_ROUTE_5
	
Route5Rock:
	jumpstd smashrock
	
LassElizabethText:
	text "You just made it"
	line "to this route too?"
	
	para "Hehe! Show me what"
	line "you found!"
	done
	
LassElizabethWinText:
	text "Where did you come"
	line "from? Your team is"
	cont "strong!"
	done
	
LassElizabethAfterText:
	text "You can find some"
	line "really strong"
	cont "#MON if you"
	cont "explore!"
	done
	
CamperJamesText:
	text "My #MON changed"
	line "shape after a"
	cont "battle!"
	done
	
CamperJamesWinText:
	text "Darn, I thought"
	line "this new form"
	cont "would be strong."
	done
	
CamperJamesAfterText:
	text "Not every #MON"
	line "will evolve with"
	cont "battles."
	done
	
PicnickerJessText:
	text "It's good to have"
	line "a well-rounded"
	cont "group of #MON!"
	done
	
PicnickerJessWinText:
	text "Ah! I didn't think"
	line "of that weakness!"
	done
	
PicnickerJessAfterText:
	text "Every #MON will"
	line "have some kind of"
	cont "weakness. Nothing"
	cont "is perfect."
	done

LadBenText:
	text "Hey! You scared"
	line "away that #MON!"
	done
	
LadBenWinText:
	text "I was trying to"
	line "take a picture of"
	cont "a PSYDUCK!"
	done
	
LadBenAfterText:
	text "I hope I can find"
	line "another PSYDUCK"
	cont "to photograph."
	done
	
BeautyLilyText:	
	text "Flower #MON are"
	line "so pretty!"
	done
	
BeautyLilyWinText:
	text "Don't you think my"
	line "#MON are cute?"
	done

BeautyLilyAfterText:
	text "I love the smell"
	line "of these flowers"
	cont "combined with the"
	cont "ocean breeze!"
	done
	
BugCatcherEddieText:
	text "Buzz buzz!"
	done

BugCatcherEddieWinText:
	text "Buzzzzz? Buzz…"
	done
	
BugCatcherEddieAfterText:
	text "Ahem… Sorry."
	
	para "I can get carried"
	line "away."
	done

BugCatcherLonnieText:
	text "BUG #MON grow"
	line "quickly!"
	done

BugCatcherLonnieWinText:
	text "My #MON haven't"
	line "grown fast enough."
	done
	
BugCatcherLonnieAfterText:
	text "This won't stop me"
	line "from training BUG"
	cont "#MON!"
	done
	
BugCatcherOwenText:
	text "GUS told me not to"
	line "let anyone bug him"
	cont "on his date."
	done
	
BugCatcherOwenWinText:
	text "GUS isn't going to"
	line "like this…"
	done

BugCatcherOwenAfterText:
	text "Maybe if you beat"
	line "him too he won't"
	cont "be as mad at me."
	done
	
LassHollyText:
	text "I'm on a date"
	line "right now!"
	done
	
LassHollyWinText:
	text "To be honest, it's"
	line "not going well."
	done
	
LassHollyAfterText:	
	text "I told GUS that I"
	line "would hang out if"
	cont "he would give me"
	cont "a berry."
	done
	
SchoolboyGusText:
	text "I discovered this"
	line "SILVER BERRY tree"
	cont "all on my own!"
	done
	
SchoolboyGusWinText:
	text "You won fair and"
	line "square. Take a"
	cont "SILVER BERRY."
	done

SchoolboyGusAfterText:
	text "SILVER BERRIES are"
	line "very rare."
	
	para "Girls love them."
	done
	
Route5SignText:
	text "ROUTE 5"

	para "RIDGE VILLAGE"
	line "ahead."
	done
	
Route5FishingGuruSignText:
	text "FISHING GURU's"
	line "house."
	done
	
AnyaExplaination:
	text "Hey trainer, you"
	line "look new here."
	
	para "My name is ANYA."
	
	para "I've been looking"
	line "for a challenge"
	cont "around here, but"
	cont "nobody is good"
	cont "enough to battle"
	cont "me."
	
	para "Since you're not"
	line "from around here,"
	cont "I'm hoping you are"
	cont "stronger than"
	cont "the trainers here."
	
	para "Prove you can beat"
	line "everyone here, and"
	cont "we can battle."
	
	para "If you win, I'll"
	line "give you a prize."
	done
	
AnyaMoreToGo:
	text "You still have"
	line "more trainers to"
	cont "battle."
	
	para "Come back when you"
	line "have beaten all of"
	cont "them if you want"
	cont "my prize."
	done
	
AnyaYouDidIt:
	text "You beat everyone"
	line "on this route?"
	
	para "How wonderful!"
	done
	
AnyaChallengeText:	
	text "I won't hold back"
	line "on you, trainer!"
	done
	
CooltrainerAnyaWin:
	text "Miraculous!"
	
	para "Someone who could"
	line "beat me!"
	
	para "You have earned my"
	line "TOTODILE!"
	done
	
CooltrainerAnyaLoss:
	text "Frankly, I'm dis-"
	line "appointed."
	
	para "You showed"
	line "promise, kid."
	done
	
AnyaAfterBattleText:
	text "Enjoy your reward,"
	line "trainer."
	done
	
AnyaGaveTotodile:
	text "<PLAYER> received"
	line "TOTODILE!"
	done

AnyaNotEnoughRoom:
	text "You will need to"
	line "free up a space in"
	cont "your party if you"
	cont "want my gift."
	done
	
AlreadyGotTotodile:
	text "My, my! You really"
	line "are a special kind"
	cont "of trainer to have"
	cont "beaten me."
	done

Route5_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 39, 13, ROUTE_5_SUPER_ROD_HOUSE, 1
	warp_event 46, 11, UNOWN_CHAMBER_AG, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event  3, 21, BGEVENT_READ, Route5Sign
	bg_event 37, 13, BGEVENT_READ, Route5FishingGuruSign

	db 15 ; object events
	object_event  0, 15, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerBugCatcherEddie, -1
	object_event 11, 18, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerLassElizabeth, -1
	object_event 12,  2, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerLadBen, -1
	object_event  4,  7, SPRITE_BUENA, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerBeautyLily, -1
	object_event 19,  7, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerPicnickerJess, -1
	object_event 14, 13, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerCamperJames, -1
	object_event 16, 23, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBugCatcherLonnie, -1
	object_event 26, 25, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBugCatcherOwen, -1
	object_event 35, 23, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerLassHolly, -1
	object_event 33, 25, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerSchoolboyGus, -1
	object_event 32, 12, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 1, TrainerCooltrainerFAnya, -1
	object_event 33, 23, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route5FruitTree, -1
	object_event 46, 15, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route5Rock, -1
	object_event 47, 16, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route5Rock, -1
	object_event 44, 12, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route5Rock, -1
	