	const_def 2 ; object constants
	

RidgeGymB1_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .Sand

.Sand:
	checkevent EVENT_BEAT_SWIMMERM_VINNY
	iffalse .skip1
	changeblock 14, 16, $21
.skip1
	checkevent EVENT_BEAT_SWIMMERM_JIMMY
	iffalse .skip2
	changeblock 30, 16, $21
.skip2
	checkevent EVENT_BEAT_SWIMMERF_VIVIAN
	iffalse .skip3
	changeblock  6, 10, $21
.skip3
	checkevent EVENT_BEAT_SWIMMERM_RONNIE
	iffalse .skip4
	changeblock 18,  6, $21
.skip4
	return

RidgeGymB1CecilScript:
	faceplayer
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .Rematch
	opentext
	checkevent EVENT_BEAT_CECIL
	iftrue .FightDone
	writetext CecilIntroText
	waitbutton
	closetext
	winlosstext CecilWinLossText, 0
	checkflag ENGINE_FLYPOINT_RUGOSA
	iftrue .Team5
	checkflag ENGINE_FLYPOINT_STAGHORN
	iftrue .Team4
	checkflag ENGINE_FLYPOINT_HEPATICA
	iftrue .Team3
	checkflag ENGINE_FLYPOINT_FAVIA
	iftrue .Team2
	ifgreater 2, .Team2
	loadtrainer CECIL, CECIL1
	startbattle
	reloadmapafterbattle
	jump .After
.Team2:
	loadtrainer CECIL, CECIL2
	startbattle
	reloadmapafterbattle
	jump .After
.Team3:
	loadtrainer CECIL, CECIL3
	startbattle
	reloadmapafterbattle
	jump .After
.Team4:
	loadtrainer CECIL, CECIL4
	startbattle
	reloadmapafterbattle
	jump .After
.Team5:
	loadtrainer CECIL, CECIL5
	startbattle
	reloadmapafterbattle
	
.After:
	setevent EVENT_BEAT_CECIL
	special HealParty
	opentext
	writetext ReceivedWaveBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_WAVEBADGE
	checkcode VAR_BADGES
	checkflag ENGINE_FISTBADGE
	iftrue .FightDone
	writetext CecilWaveBadgeFirstText
	waitbutton
.FightDone:
	checkevent EVENT_GOT_TM_WHIRLPOOL
	iftrue .SpeechAfterTM
	writetext CecilWaveBadgeText
	buttonsound
	verbosegiveitem TM_WHIRLPOOL
	iffalse .NoRoomForWhirlpool
	setevent EVENT_GOT_TM_WHIRLPOOL
	writetext CecilTMWhirlpoolText
	waitbutton
	closetext
	setmapscene RIDGE_VILLAGE, SCENE_RIDGEVILLAGE_RUNNING_SHOES
	end

.SpeechAfterTM:
	writetext CecilFightDoneText
	waitbutton
.NoRoomForWhirlpool:
	closetext
	end

.Rematch:
	checkflag ENGINE_REMATCH_CECIL
	iftrue .DoneRematch
	
	opentext
	writetext CecilRematchText
	waitbutton
	closetext
	
	winlosstext CecilRematchWinText, 0

	copybytetovar wCecilFightCount
	ifgreater 3, .FinalRematch
	ifequal 3, .RematchTeam4
	ifequal 2, .RematchTeam3
	ifequal 1, .RematchTeam2

.RematchTeam1:
	loadtrainer CECIL, CECIL_REMATCH1
	jump .DoRematch
.RematchTeam2:
	loadtrainer CECIL, CECIL_REMATCH2
	jump .DoRematch
.RematchTeam3:
	loadtrainer CECIL, CECIL_REMATCH3
	jump .DoRematch
.RematchTeam4:
	loadtrainer CECIL, CECIL_REMATCH4
	jump .DoRematch
.FinalRematch:
	loadtrainer CECIL, CECIL_REMATCH5
.DoRematch
	startbattle
	reloadmapafterbattle

	setflag ENGINE_REMATCH_CECIL
	copybytetovar wCecilFightCount
	ifgreater 3, .DoneRematch
	addvar 1
	copyvartobyte wCecilFightCount

.DoneRematch
	jumptext CecilAfterRematchText

RidgeGymB1TriggerScript1:
	faceplayer
	opentext
	checkevent EVENT_BEAT_SWIMMERM_VINNY
	iftrue .true
	writetext SwimmerVinnyText
	waitbutton
	playmusic MUSIC_HIKER_ENCOUNTER
	writetext SwimmerVinnyChallengeText
	waitbutton
	closetext
	winlosstext SwimmerVinnyWinText, 0
	loadtrainer SWIMMERM, VINNY
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_SWIMMERM_VINNY
	opentext
	writetext SwimmerVinnyConfirmText
	waitbutton
	closetext
	playsound SFX_HYDRO_PUMP
	earthquake 30
	changeblock 14, 16, $21
	reloadmappart
	waitsfx
	end
	
.true
	writetext SwimmerVinnyAfterText
	waitbutton
	closetext
	end
	
RidgeGymB1TriggerScript2:
	faceplayer
	opentext
	checkevent EVENT_BEAT_SWIMMERM_JIMMY
	iftrue .true
	playmusic MUSIC_HIKER_ENCOUNTER
	writetext SwimmerJimmyText
	waitbutton
	closetext
	winlosstext SwimmerJimmyWinText, 0
	loadtrainer SWIMMERM, JIMMY1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_SWIMMERM_JIMMY
	opentext
	writetext SwimmerJimmyConfirmText
	waitbutton
	closetext
	playsound SFX_HYDRO_PUMP
	earthquake 40
	changeblock 30, 16, $21
	reloadmappart
	waitsfx
	end
	
.true
	writetext SwimmerJimmyAfterText
	waitbutton
	closetext
	end
	
RidgeGymB1TriggerScript3:
	faceplayer
	opentext
	checkevent EVENT_BEAT_SWIMMERF_VIVIAN
	iftrue .true
	playmusic MUSIC_BEAUTY_ENCOUNTER
	writetext SwimmerVivianText
	waitbutton
	closetext
	winlosstext SwimmerVivianWinText, 0
	loadtrainer SWIMMERF, VIVIAN
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_SWIMMERF_VIVIAN
	opentext
	writetext SwimmerVivianConfirmText
	waitbutton
	closetext
	playsound SFX_HYDRO_PUMP
	earthquake 40
	changeblock  6, 10, $21
	reloadmappart
	waitsfx
	end	
	
.true
	writetext SwimmerVivianAfterText
	waitbutton
	closetext
	end
	
RidgeGymB1TriggerScript4:
	faceplayer
	opentext
	checkevent EVENT_BEAT_SWIMMERM_RONNIE
	iftrue .true
	playmusic MUSIC_HIKER_ENCOUNTER
	writetext SwimmerRonnieText
	waitbutton
	closetext
	winlosstext SwimmerRonnieWinText, 0
	loadtrainer SWIMMERM, RONNIE
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_SWIMMERM_RONNIE
	opentext
	writetext SwimmerRonnieConfirmText
	waitbutton
	closetext
	playsound SFX_HYDRO_PUMP
	earthquake 40
	changeblock 18,  6, $21
	reloadmappart
	waitsfx
	end	
	
.true
	writetext SwimmerRonnieAfterText
	waitbutton
	closetext
	end
	
CecilIntroText:
	text "I am CECIL, the"
	line "GYM LEADER of"
	cont "RIDGE VILLAGE!"

	para "You have been down"
	line "in this gym long"
	cont "enough to notice I"
	cont "train WATER-type"
	cont "#MON."

	para "I won't waste your"
	line "time with talk."
	
	para "Let us dive right"
	line "into battle!"
	done

CecilWinLossText:
	text "Oh, what has"
	line "become of me?"

	para "You put up a great"
	line "fight, trainer."
	
	para "And with that, you"
	line "have earned a new"
	cont "BADGE!"
	done

ReceivedWaveBadgeText:
	text "<PLAYER> received"
	line "WAVEBADGE."
	done

CecilWaveBadgeFirstText:
	text "With my BADGE,"
	line "#MON up to Lv30"
	cont "will obey you."
	done

CecilWaveBadgeText:
	text "Here--take this"
	line "too."
	done

CecilTMWhirlpoolText:
	text "TM45 contains"
	line "WHIRLPOOL."

	para "An enemy trapped"
	line "by this move will"
	cont "be unable to flee."

	para "That #MON will"
	line "also take damage"
	cont "each turn."

	para "I trust you will"
	line "be able to use it"
	cont "effectively!"
	done

CecilFightDoneText:
	text "I sank like a rock"
	line "in our battle."
	
	para "I assure you, that"
	line "will not happen in"
	cont "the future!"
	done

CecilRematchText:
	text "Ah, CHAMPION! Have"
	line "you resurfaced for"
	cont "a rematch?"

	para "What an honor!"

	para "I can't wait to"
	line "show you how much"
	cont "my #MON have"
	cont "grown since our"
	cont "last battle!"
	done

CecilRematchWinText:
	text "You've pulled me"
	line "under again."

	para "Oh, how could that"
	line "happen to me?"
	done

CecilAfterRematchText:
	text "I promise you that"
	line "I won't stay down"
	cont "for long."

	para "When I float back"
	line "up, we will have"
	cont "another battle."

	para "Until then, I will"
	line "make sure my"
	cont "#MON become"
	cont "even stronger!"
	done

SwimmerVinnyText:
	text "Welcome to the"
	line "RIDGE GYM!"
	
	para "Did you notice the"
	line "geysers blocking"
	cont "your path?"
	done
	
SwimmerVinnyChallengeText:
	text "I can turn them"
	line "off for you, but"
	cont "you need to beat"
	cont "me in a battle!"
	done
	
SwimmerVinnyWinText:
	text "Gah! You cracked"
	line "our shell!"
	done
	
SwimmerVinnyConfirmText:
	text "Now that you've"
	line "won, I will turn"
	cont "off the geyser for"
	cont "you."
	done
	
SwimmerVinnyAfterText:
	text "There will be many"
	line "more trainers you"
	cont "will need to"
	cont "defeat before the"
	cont "LEADER will accept"
	cont "your challenge."
	done
	
SwimmerJimmyText:
	text "Are you caught in"
	line "the middle of two"
	cont "geysers?"
	
	para "I can do something"
	line "about that!"
	done
	
SwimmerJimmyWinText:
	text "You have left me"
	line "breathless!"
	done
	
SwimmerJimmyConfirmText:
	text "Alright, time to"
	line "move on."
	
	para "CLICK!"
	done
	
SwimmerJimmyAfterText:
	text "You can't rely on"
	line "just one #MON"
	cont "to carry you"
	cont "through a GYM."

	para "You need variety."
	done
	
SwimmerVivianText:
	text "Don't go easy on"
	line "me just because"
	cont "I'm a woman!"
	done
	
SwimmerVivianWinText:
	text "I saw a rainbow"
	line "during our battle!"
	done
	
SwimmerVivianConfirmText:
	text "One more trainer"
	line "to go."
	
	para "Do you think you"
	line "are ready?"
	done
	
SwimmerVivianAfterText:
	text "You came close to"
	line "making me cry"
	cont "after our battle."
	done

SwimmerRonnieText:
	text "You know the drill"
	line "by now."

	para "If you can defeat"
	line "me, I will clear"
	cont "the path to LEADER"
	cont "CECIL."
	done
	
SwimmerRonnieWinText:
	text "You've left me"
	line "starstruck!"
	done
	
SwimmerRonnieConfirmText:
	text "I was the last in"
	line "line on your way"
	cont "to the LEADER."
	
	para "Go on, CECIL is"
	line "waiting."
	done
	
SwimmerRonnieAfterText:
	text "What's the holdup?"
	
	para "Go, challenge the"
	line "GYM LEADER."
	done
	
RidgeGymB1_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 19, 25, RIDGE_GYM, 1

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	object_event 19,  3, SPRITE_CECIL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RidgeGymB1CecilScript, -1
	object_event 13, 21, SPRITE_SWIMMER_GUY_LAND, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RidgeGymB1TriggerScript1, -1 ;Vinny
	object_event 17, 13, SPRITE_SWIMMER_GUY_LAND, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RidgeGymB1TriggerScript2, -1 ;Jimmy
	object_event 31, 14, SPRITE_SWIMMER_GIRL_LAND, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RidgeGymB1TriggerScript3, -1 ;Vivian
	object_event  7,  8, SPRITE_SWIMMER_GUY_LAND, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RidgeGymB1TriggerScript4, -1 ;Ronnie
