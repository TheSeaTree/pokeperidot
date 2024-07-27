	const_def 2 ; object constants

DevelopersHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

DeveloperScript:
	faceplayer
	opentext
	checkcode VAR_DEXCAUGHT
	ifnotequal NUM_POKEMON, .Nothing
	checkflag ENGINE_BATTLED_DEVELOPER
	iftrue .AfterBattle

	writetext DeveloperBeatLeadersText
	yesorno
	iffalse .Decline
	playmusic MUSIC_HIKER_ENCOUNTER
	writetext DeveloperChallengeAcceptText
	waitbutton
	closetext
	winlosstext DeveloperWinText, 0
	loadtrainer DEVELOPER, FRANK1
	random 4
	ifequal 0, .DoBattle
	ifequal 1, .Team2
	ifequal 2, .Team3
	ifequal 3, .Team4

.Team2
	loadtrainer DEVELOPER, FRANK2
	jump .DoBattle
.Team3
	loadtrainer DEVELOPER, FRANK3
	jump .DoBattle
.Team4
	loadtrainer DEVELOPER, FRANK4
	checkevent EVENT_GOT_SQUIRTLE_FROM_MAPLE
	iftrue .DoBattle

	loadtrainer DEVELOPER, FRANK5
	checkevent EVENT_GOT_BULBASAUR_FROM_MAPLE
	iftrue .DoBattle
.Charmander
	loadtrainer DEVELOPER, FRANK6
.DoBattle
	startbattle
	reloadmapafterbattle
	setflag ENGINE_BATTLED_DEVELOPER
.Loop
	random 11
	ifequal  1, .Zapdos
	ifequal  2, .Moltres
	ifequal  3, .Mewtwo
	ifequal  4, .Mew
	ifequal  5, .Entei
	ifequal  6, .Raikou
	ifequal  7, .Suicune
	ifequal  8, .HoOh
	ifequal  9, .Lugia
	ifequal 10, .Celebi

	special InitRoamArticuno
	pokenamemem ARTICUNO, MEM_BUFFER_0
	jump .RespawnLegendary

.Zapdos
	special InitRoamZapdos
	pokenamemem ZAPDOS, MEM_BUFFER_0
	jump .RespawnLegendary

.Moltres
	special InitRoamMoltres
	pokenamemem MOLTRES, MEM_BUFFER_0
	jump .RespawnLegendary

.Mewtwo
	checkevent EVENT_CAUGHT_MEWTWO
	iftrue .Loop
	clearevent EVENT_FOUGHT_MEWTWO
	clearevent EVENT_CAUGHT_MEWTWO
	pokenamemem MEWTWO, MEM_BUFFER_0
	jump .RespawnLegendary

.Mew
	checkevent EVENT_CAUGHT_MEW
	iftrue .Loop
	clearevent EVENT_FOUGHT_MEW
	clearevent EVENT_CAUGHT_MEW
	pokenamemem MEW, MEM_BUFFER_0
	jump .RespawnLegendary

.Raikou
	checkevent EVENT_CAUGHT_RAIKOU
	iftrue .Loop
	clearevent EVENT_HIDE_RAIKOU
	clearevent EVENT_CAUGHT_RAIKOU
	pokenamemem RAIKOU, MEM_BUFFER_0
	jump .RespawnLegendary

.Entei
	checkevent EVENT_CAUGHT_ENTEI
	iftrue .Loop
	clearevent EVENT_HIDE_ENTEI
	clearevent EVENT_CAUGHT_ENTEI
	pokenamemem ENTEI, MEM_BUFFER_0
	jump .RespawnLegendary

.Suicune
	checkevent EVENT_CAUGHT_SUICUNE
	iftrue .Loop
	clearevent EVENT_HIDE_SUICUNE
	clearevent EVENT_CAUGHT_SUICUNE
	pokenamemem SUICUNE, MEM_BUFFER_0
	jump .RespawnLegendary

.HoOh
	checkevent EVENT_CAUGHT_HO_OH
	iftrue .Loop
	clearevent EVENT_FOUGHT_HO_OH
	clearevent EVENT_CAUGHT_HO_OH
	pokenamemem HO_OH, MEM_BUFFER_0
	jump .RespawnLegendary

.Lugia
	checkevent EVENT_CAUGHT_LUGIA
	iftrue .Loop
	clearevent EVENT_FOUGHT_LUGIA
	clearevent EVENT_CAUGHT_LUGIA
	pokenamemem LUGIA, MEM_BUFFER_0
	jump .RespawnLegendary

.Celebi
	checkevent EVENT_CAUGHT_CELEBI
	iftrue .Loop
	clearevent EVENT_FOUGHT_CELEBI
	clearevent EVENT_CAUGHT_CELEBI
	pokenamemem CELEBI, MEM_BUFFER_0
.RespawnLegendary
	opentext
	writetext DeveloperLegendaryRespawnText
	waitbutton
	closetext
	end

.AfterBattle
	writetext DeveloperAfterText
	waitbutton
	closetext
	end

.Decline
	writetext DeveloperChallengeDeclineText
	waitbutton
	closetext
	end

.Nothing
	writetext DeveloperText
	waitbutton
	closetext
	end

DevelopersPeridotTrophy:
	jumptext DevelopersPeridotTrophyText

DevelopersGameShelf:
	opentext
	writetext DevelopersGameShelfText
	waitbutton
	writetext DevelopersNoteText
	waitbutton
	closetext
	end

DevelopersHouseStarPiece:
	itemball STAR_PIECE

DevelopersGameShelf2:
	jumptext DevelopersGameShelfText

DevelopersTV:
	jumptext DevelopersTVText

DeveloperText:
	text "Hello! I made this"
	line "game."

	para "Have you caught"
	line "every kind of"
	cont "#MON yet?"

	para "Let's have a battle"
	line "when you do!"
	done

DeveloperBeatLeadersText:
	text "Whoa! You complet-"
	line "ted your #DEX?"

	para "You must have a"
	line "good team! Do you"
	cont "want to battle?"
	done

DeveloperChallengeText:
	text "Hey again!"

	para "Do you want to"
	line "have a battle?"
	done

DeveloperChallengeAcceptText:
	text "Nice! Let's go!"
	done

DeveloperChallengeDeclineText:
	text "No? Alright."

	para "Whenever you're"
	line "ready. I'm down to"
	cont "battle every day!"
	done

DeveloperWinText:
	text "Impressive!"

	para "Come back tomorrow"
	line "and we can have"
	cont "another battle!"
	done

DeveloperLegendaryRespawnText:
	text "Have you heard"
	line "that a @"
	text_ram wStringBuffer3
	text "<CONT>was spotted in the"
	cont "wild recently?"

	para "I thought you"
	line "might want to"
	cont "check it out."
	done

DeveloperAfterText:
	text "I hope you'll stop"
	line "by again to have"
	cont "another battle."
	done

DevelopersPeridotTrophyText:
	text "It's a PERIDOT"
	line "TROPHY."

	para "It says here it is"
	line "awarded for win-"
	cont "ning against a"
	cont "SUBWAY ACE at the"
	cont "BATTLE SUBWAY."
	done

DevelopersGameShelfText:
	text "There's all sorts"
	line "of games for PC"
	cont "and console on"
	cont "this shelf."
	done

DevelopersNoteText:
	text "There's note, too…"

	para "“Check out my DOOM"
	line "megawad, TERROR"
	cont "SIGNAL."

	para "Also check out my"
	line "maps featured in"
	cont "AD MORTEM, 400"
	cont "Minutes of /vr/,"
	cont "and HFFM.”"
	done

DevelopersTVText:
	text "There's a movie on"
	line "the TV."

	para "A jeep is being"
	line "pushed over a"
	cont "cliff by some"
	cont "gigantic creature."

	para "It doesn't look"
	line "like a #MON…"
	done

DevelopersHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, ROUTE_22, 7
	warp_event  5,  7, ROUTE_22, 7

	db 0 ; coord events

	db 3 ; bg events
	bg_event  8,  1, BGEVENT_READ, DevelopersGameShelf
	bg_event  9,  1, BGEVENT_READ, DevelopersGameShelf2
	bg_event  6,  1, BGEVENT_UP, DevelopersTV

	db 3 ; object events
	object_event  3,  2, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_UP, 0, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, DeveloperScript, -1
	object_event  7,  1, SPRITE_PERIDOT_TROPHY, SPRITEMOVEDATA_STILL, 0, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DevelopersPeridotTrophy, -1
	object_event  8,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 2, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DevelopersHouseStarPiece, EVENT_DEVELOPERS_HOUSE_STAR_PIECE
