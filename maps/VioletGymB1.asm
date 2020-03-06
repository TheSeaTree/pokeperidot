	const_def 2 ; object constants
	const VIOLET_GYM_B1_FALKNER
	const VIOLET_GYM_B1_BEAUTY

VioletGymB1_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .Sand

.Sand:
	checkevent EVENT_BEAT_SWIMMERM_VINNY
	iffalse .skip1
	changeblock 14, 16, $11
	changeblock 14, 18, $11
.skip1
	checkevent EVENT_BEAT_SWIMMERM_JIMMY
	iffalse .skip2
	changeblock 24, 10, $11
.skip2
	checkevent EVENT_BEAT_SWIMMERF_VIVIAN
	iffalse .skip3
	changeblock 10, 10, $11
	changeblock  8, 10, $11
.skip3
	checkevent EVENT_BEAT_SWIMMERM_RONNIE
	iffalse .skip4
	changeblock 18,  6, $11
	changeblock 18,  8, $11
.skip4
	return

VioletGymB1FalknerScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_FALKNER
	iftrue .FightDone
	writetext FalknerIntroText
	waitbutton
	closetext
	winlosstext FalknerWinLossText, 0
	checkflag ENGINE_FLYPOINT_OLIVINE
	iftrue .Team5
	checkflag ENGINE_FLYPOINT_ECRUTEAK
	iftrue .Team4
	checkflag ENGINE_FLYPOINT_CIANWOOD
	iftrue .Team3
	checkflag ENGINE_FLYPOINT_GOLDENROD
	iftrue .Team2
	ifgreater 2, .Team2
	loadtrainer FALKNER, FALKNER1
	startbattle
	reloadmapafterbattle
	jump .After
.Team2:
	loadtrainer FALKNER, FALKNER2
	startbattle
	reloadmapafterbattle
	jump .After
.Team3:
	loadtrainer FALKNER, FALKNER3
	startbattle
	reloadmapafterbattle
	jump .After
.Team4:
	loadtrainer FALKNER, FALKNER4
	startbattle
	reloadmapafterbattle
	jump .After
.Team5:
	loadtrainer FALKNER, FALKNER5
	startbattle
	reloadmapafterbattle
	
.After:
	setevent EVENT_BEAT_FALKNER
	special HealParty
	opentext
	writetext ReceivedZephyrBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_HIVEBADGE
	checkcode VAR_BADGES
.FightDone:
	checkevent EVENT_GOT_TM_WHIRLPOOL
	iftrue .SpeechAfterTM
	writetext FalknerZephyrBadgeText
	buttonsound
	verbosegiveitem TM_WHIRLPOOL
	iffalse .NoRoomForMudSlap
	setevent EVENT_GOT_TM_WHIRLPOOL
	writetext FalknerTMMudSlapText
	waitbutton
	closetext
	setmapscene VIOLET_CITY, SCENE_VIOLETCITY_RUNNING_SHOES
	end
.GotFuryCutter:
	writetext FalknerTMMudSlapText
	waitbutton
.SpeechAfterTM:
	writetext FalknerFightDoneText
	waitbutton
.NoRoomForMudSlap:
	closetext
	end
	
VioletGymB1TriggerScript1:
	faceplayer
	opentext
	checkevent EVENT_BEAT_SWIMMERM_VINNY
	iftrue .true
	playmusic MUSIC_HIKER_ENCOUNTER
	writetext VioletGymChallenge
	waitbutton
	closetext
	winlosstext VioletGymWin, 0
	loadtrainer SWIMMERM, VINNY
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_SWIMMERM_VINNY
	opentext
	writetext VioletGymBarrierConfirm
	waitbutton
	closetext
	playsound SFX_HYDRO_PUMP
	earthquake 30
	changeblock 14, 16, $11
	changeblock 14, 18, $11
	reloadmappart
	waitsfx
	end
	
.true
	writetext VioletGymBarrierConfirm
	waitbutton
	closetext
	end
	
VioletGymB1TriggerScript2:
	faceplayer
	opentext
	checkevent EVENT_BEAT_SWIMMERM_JIMMY
	iftrue .true
	playmusic MUSIC_HIKER_ENCOUNTER
	writetext VioletGymChallenge
	waitbutton
	closetext
	winlosstext VioletGymWin, 0
	loadtrainer SWIMMERM, JIMMY1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_SWIMMERM_JIMMY
	opentext
	writetext VioletGymBarrierConfirm
	waitbutton
	closetext
	playsound SFX_HYDRO_PUMP
	earthquake 40
	changeblock 24, 10, $11
	reloadmappart
	waitsfx
	end
	
.true
	writetext VioletGymBarrierConfirm
	waitbutton
	closetext
	end
	
VioletGymB1TriggerScript3:
	faceplayer
	opentext
	checkevent EVENT_BEAT_SWIMMERF_VIVIAN
	iftrue .true
	playmusic MUSIC_BEAUTY_ENCOUNTER
	writetext VioletGymChallenge
	waitbutton
	closetext
	winlosstext VioletGymWin, 0
	loadtrainer SWIMMERF, VIVIAN
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_SWIMMERF_VIVIAN
	opentext
	writetext VioletGymBarrierConfirm
	waitbutton
	closetext
	playsound SFX_HYDRO_PUMP
	earthquake 40
	changeblock 10, 10, $11
	changeblock  8, 10, $11
	reloadmappart
	waitsfx
	end	
	
.true
	writetext VioletGymBarrierConfirm
	waitbutton
	closetext
	end
	
VioletGymB1TriggerScript4:
	opentext
	faceplayer
	checkevent EVENT_BEAT_SWIMMERM_RONNIE
	iftrue .true
	playmusic MUSIC_HIKER_ENCOUNTER
	writetext VioletGymChallenge
	waitbutton
	closetext
	winlosstext VioletGymWin, 0
	loadtrainer SWIMMERM, RONNIE
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_SWIMMERM_RONNIE
	opentext
	writetext VioletGymBarrierConfirm
	waitbutton
	closetext
	playsound SFX_HYDRO_PUMP
	earthquake 40
	changeblock 18,  6, $11
	changeblock 18,  8, $11
	reloadmappart
	waitsfx
	end	
	
.true
	writetext VioletGymBarrierConfirm
	waitbutton
	closetext
	end

VioletGymB1BarrierScript:
	opentext
	writetext VioletGymB1Barrier
	waitbutton
	closetext
	end
	
FalknerIntroText:
	text "I'm FALKNER, the"
	line "VIOLET #MON"
	cont "Gym leader!"

	para "People say you can"
	line "clip flying-type"

	para "#MON's wings"
	line "with a jolt of"
	cont "electricity…"

	para "I won't allow such"
	line "insults to bird"
	cont "#MON!"

	para "I'll show you the"
	line "real power of the"

	para "magnificent bird"
	line "#MON!"
	done

FalknerWinLossText:
	text "…Darn! My dad's"
	line "cherished bird"
	cont "#MON…"

	para "All right."
	line "Take this."

	para "It's the official"
	line "#MON LEAGUE"
	cont "ZEPHYRBADGE."
	done

ReceivedZephyrBadgeText:
	text "<PLAYER> received"
	line "ZEPHYRBADGE."
	done

FalknerZephyrBadgeText:
	text "ZEPHYRBADGE"
	line "raises the attack"
	cont "power of #MON."

	para "It also enables"
	line "#MON to use"

	para "FLASH, if they"
	line "have it, anytime."

	para "Here--take this"
	line "too."
	done

FalknerTMMudSlapText:
	text "By using a TM, a"
	line "#MON will"

	para "instantly learn a"
	line "new move."

	para "Think before you"
	line "act--a TM can be"
	cont "used only once."

	para "TM31 contains"
	line "MUD-SLAP."

	para "It reduces the"
	line "enemy's accuracy"

	para "while it causes"
	line "damage."

	para "In other words, it"
	line "is both defensive"
	cont "and offensive."
	done

FalknerFightDoneText:
	text "There are #MON"
	line "Gyms in cities and"
	cont "towns ahead."

	para "You should test"
	line "your skills at"
	cont "these Gyms."

	para "I'm going to train"
	line "harder to become"

	para "the greatest bird"
	line "master!"
	done
	
VioletGymChallenge:
	text "I am a"
	line "#MON trainer!"
	done

VioletGymWin:
	text "I lost."
	done

VioletGymBarrierConfirm:
	text "CLICK!"
	done
	
VioletGymB1Barrier:
	text "No!"
	line "You cannot pass!"
	done
	
VioletGymB1_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 19, 25, VIOLET_GYM, 1

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	object_event 19,  3, SPRITE_FALKNER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, VioletGymB1FalknerScript, -1
	object_event 13, 21, SPRITE_SWIMMER_GUY_LAND, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, VioletGymB1TriggerScript1, -1 ;Vinny
	object_event 16, 12, SPRITE_SWIMMER_GUY_LAND, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, VioletGymB1TriggerScript2, -1 ;Jimmy
	object_event 28, 14, SPRITE_SWIMMER_GIRL_LAND, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, VioletGymB1TriggerScript3, -1 ;Vivian
	object_event  3,  9, SPRITE_SWIMMER_GUY_LAND, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, VioletGymB1TriggerScript4, -1 ;Ronnie
