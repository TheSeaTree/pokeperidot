	const_def 2 ; object constants
	const PASTHIDDENPOWERCAVE_SCIENTIST1
	const PASTHIDDENPOWERCAVE_SCIENTIST2

PastHiddenPowerCave_MapScripts:
	db 2 ; scene scripts
	scene_script .MeetScientist ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	db 0 ; callbacks

.MeetScientist
	turnobject PASTHIDDENPOWERCAVE_SCIENTIST1, LEFT
	showemote EMOTE_SHOCK, PASTHIDDENPOWERCAVE_SCIENTIST1, 15
	turnobject PLAYER, RIGHT
	opentext
	writetext PastHiddenPowerCaveScientistIntroText
	waitbutton
	writetext PastHiddenPowerCaveScientistText
	waitbutton
	closetext
	variablesprite SPRITE_PAST_MOM, SPRITE_RED_PAST_MOM
	checkflag ENGINE_PLAYER_IS_FEMALE
	iffalse .CheckStarter
	variablesprite SPRITE_PAST_MOM, SPRITE_BLUE_PAST_MOM
.CheckStarter
	checkevent EVENT_GOT_SQUIRTLE_FROM_MAPLE
	iftrue .Squirtle
	checkevent EVENT_GOT_CHARMANDER_FROM_MAPLE
	iftrue .Charmander
	pokenamemem BULBASAUR, MEM_BUFFER_0
	variablesprite SPRITE_PAST_MOM_DOLL, SPRITE_BULBASAUR
	jump .Done

.Squirtle
	variablesprite SPRITE_PAST_MOM_DOLL, SPRITE_SQUIRTLE
	jump .Done

.Charmander
	variablesprite SPRITE_PAST_MOM_DOLL, SPRITE_CHARMANDER

.Done
	setscene SCENE_FINISHED
.DummyScene
	end

PastHiddenPowerCaveScientist1:
	faceplayer
	opentext
	writetext PastHiddenPowerCaveScientistText
	waitbutton
	writetext PastHiddenPowerCaveScientistAskText
	yesorno
	iffalse .Decline
	writetext PastHiddenPowerCaveScientistReturnText
	waitbutton
	closetext
	special FadeOutPalettes
	setmapscene BATTLE_SIMULATION, SCENE_BATTLESIMULATION_RETURNED_TO_PRESENT
	playsound SFX_WARP_FROM
	special FadeOutPalettes
	waitsfx
	writecode VAR_MOVEMENT, PLAYER_NORMAL
	warpfacing DOWN, BATTLE_SIMULATION, 2, 9
	end

.Decline
	writetext PastHiddenPowerCaveScientistDeclineText
	waitbutton
	closetext
	end

PastHiddenPowerCaveScientist2:
	givepoke CROBAT, 20
	jumptextfaceplayer PastHiddenPowerCaveScientist2Text

PastHiddenPowerCaveScientistIntroText:
	text "Oh! You've finally"
	line "made it!"

	para "The team discussed"
	line "not wanting to"
	cont "send any more"
	cont "people through"
	cont "time until the"
	cont "TETHER SYSTEM was"
	cont "finalized."

	para "……………"

	para "I see! You helped"
	line "find a PART neces-"
	cont "sary for it to"
	cont "function."
	done

PastHiddenPowerCaveScientistText:
	text "I should be able"
	line "to activate the"
	cont "TETHER SYSTEM if"
	cont "you wish to return"
	cont "to the present."
	done

PastHiddenPowerCaveScientistAskText:
	text "Would you like to"
	line "return to the"
	cont "present day?"
	done
	
PastHiddenPowerCaveScientistReturnText:
	text "Okay! I will acti-"
	line "vate your thether"
	cont "right away!"
	done
	
PastHiddenPowerCaveScientistDeclineText:
	text "Understood."

	para "If your #MON"
	line "faint, the tether"
	cont "will activate au-"
	cont "tomatically."
	done

PastHiddenPowerCaveScientist2Text:
	text "This cave was"
	line "chosen as a desti-"
	cont "nation as a means"
	cont "to minimize the"
	cont "effect we have on"
	cont "the past."

	para "The fewer people"
	line "here who know"
	cont "about the research"
	cont "we're conducting,"
	cont "the better."
	done

PastHiddenPowerCave_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
;	warp_event  9,  7, PAST_ROUTE_1, 2
	warp_event  9,  7, PAST_PECTINIA_CITY, 7

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  5,  4, SPRITE_SCIENTIST, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PastHiddenPowerCaveScientist1, -1
	object_event  6,  6, SPRITE_SCIENTIST, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PastHiddenPowerCaveScientist2, -1
