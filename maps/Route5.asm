	const_def 2 ; object constants
	const ROUTE5_POKEFAN_M

Route5_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerBugCatcherEddie:
	trainer BUG_CATCHER, EDDIE, EVENT_BEAT_BUG_CATCHER_EDDIE, Route5TrainerText, Route5WinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext Route5WinText
	waitbutton
	closetext
	end	
	
TrainerBeautyLily:
	trainer BEAUTY, LILY, EVENT_BEAT_BEAUTY_LILY, Route5TrainerText, Route5WinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext Route5WinText
	waitbutton
	closetext
	end		

TrainerCamperJames:
	trainer CAMPER, JAMES, EVENT_BEAT_CAMPER_JAMES, Route5TrainerText, Route5WinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext Route5WinText
	waitbutton
	closetext
	end	

TrainerPicnickerJess:
	trainer PICNICKER, JESS, EVENT_BEAT_PICNICKER_JESS, Route5TrainerText, Route5WinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext Route5WinText
	waitbutton
	closetext
	end	
	
TrainerYoungsterBen:
	trainer YOUNGSTER, BEN, EVENT_BEAT_YOUNGSTER_BEN, Route5TrainerText, Route5WinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext Route5WinText
	waitbutton
	closetext
	end	
	
TrainerLassElizabeth:
	trainer LASS, ELIZABETH, EVENT_BEAT_LASS_ELIZABETH, Route5TrainerText, Route5WinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext Route5WinText
	waitbutton
	closetext
	end
	
TrainerBugCatcherLonnie:
	trainer BUG_CATCHER, LONNIE, EVENT_BEAT_BUG_CATCHER_LONNIE, Route5TrainerText, Route5WinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext Route5WinText
	waitbutton
	closetext
	end

TrainerBugCatcherOwen:
	trainer BUG_CATCHER, OWEN, EVENT_BEAT_BUG_CATCHER_OWEN, Route5TrainerText, Route5WinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext Route5WinText
	waitbutton
	closetext
	end
	
TrainerLassHolly:
	trainer LASS, HOLLY, EVENT_BEAT_LASS_HOLLY, Route5TrainerText, Route5WinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext Route5WinText
	waitbutton
	closetext
	end
	
TrainerSchoolboyGus:
	trainer SCHOOLBOY, GUS, EVENT_BEAT_SCHOOLBOY_GUS, Route5TrainerText, Route5WinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext Route5WinText
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
	checkevent EVENT_BEAT_YOUNGSTER_BEN
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
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFull
	writetext AnyaGaveTotodile
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke TOTODILE, 10
	special GiftMonMoves
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

Route5FruitTree:
	fruittree FRUITTREE_ROUTE_5
	
Route5UndergroundPathSign:
	jumptext Route5UndergroundPathSignText

HouseForSaleSign:
	jumptext HouseForSaleSignText

Route5TrainerText:
	text "I am a"
	line "#MON trainer!"
	done	

Route5WinText:
	text "I lost."
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
	
AnyaGaveTotodile:
	text "<PLAYER>"
	line "received TOTODILE!"
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

Route5UndergroundPathSignText:
	text "UNDERGROUND PATH"

	para "CERULEAN CITY -"
	line "VERMILION CITY"
	done

HouseForSaleSignText:
	text "What's this?"

	para "House for Sale…"
	line "Nobody lives here."
	done

Route5_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 43, 13, ROUTE_5_SUPER_ROD_HOUSE, 1
	warp_event 25, 3, ROUTE_5_SUPER_ROD_HOUSE, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event 17, 17, BGEVENT_READ, Route5UndergroundPathSign

	db 12 ; object events
	object_event 4, 15, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerBugCatcherEddie, -1
	object_event 15, 18, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 2, TrainerLassElizabeth, -1
	object_event 16,  2, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerYoungsterBen, -1
	object_event 8,  7, SPRITE_BUENA, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerBeautyLily, -1
	object_event 23,  7, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerPicnickerJess, -1
	object_event 18, 13, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerCamperJames, -1
	object_event 20, 23, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBugCatcherLonnie, -1
	object_event 30, 25, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBugCatcherOwen, -1
	object_event 39, 23, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerLassHolly, -1
	object_event 37, 25, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerSchoolboyGus, -1
	object_event 36, 12, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 1, TrainerCooltrainerFAnya, -1
	object_event 37, 23, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route5FruitTree, -1
	