	const_def 2 ; object constants
	const SSMAKOLOWERDECK_FANGIRL
	const SSMAKOLOWERDECK_FISHER

SSMakoLowerDeck_MapScripts:
	db 4 ; scene scripts
	scene_script .DummyScene0 ; SCENE_SSMAKOLOWERDECK_DEFAULT
	scene_script .DummyScene1 ; SCENE_SSMAKOLOWERDECK_FOLLOWING
	scene_script .DummyScene2 ; SCENE_SSMAKOLOWERDECK_FINISHED
	scene_script .DummyScene3 ; SCENE_SSMAKOLOWERDECK_FISHING

	db 0 ; callbacks

.DummyScene0:
	setmapscene SS_MAKO_1F_ROOMS, SCENE_SSMAKO1FROOMS_FOLLOWING
	setmapscene SS_MAKO_1F, SCENE_SSMAKO1F_DEFAULT
.DummyScene1:
.DummyScene2:
	end

.DummyScene3:
	follow PLAYER, SSMAKOLOWERDECK_FANGIRL
	setscene SCENE_SSMAKOLOWERDECK_FOLLOWING
	end

FangirlLowerDeckTeleport1:
	moveobject SSMAKOLOWERDECK_FANGIRL,  13,  4
	jump FangirlLowerDeckContinueFollow
	
FangirlLowerDeckTeleport2:
	moveobject SSMAKOLOWERDECK_FANGIRL,  13,  5

FangirlLowerDeckContinueFollow:
	appear SSMAKOLOWERDECK_FANGIRL
	follow PLAYER, SSMAKOLOWERDECK_FANGIRL
	setscene SCENE_SSMAKOLOWERDECK_FOLLOWING
	end

FangirlReturnFromFishingFollow:
	follow PLAYER, SSMAKOLOWERDECK_FANGIRL
	setscene SCENE_SSMAKOLOWERDECK_FOLLOWING
	end

SSMakoLowerDeckFangirl:
	jumpstd emilycompanion
	
SSMakoLowerDeckFisherman:
	faceplayer
	opentext
	checkevent EVENT_GOT_SUPER_ROD
	iftrue .CheckBalls
	writetext SSMakoLowerDeckFishermanNoRodText
	waitbutton
	verbosegiveitem SUPER_ROD
	setevent EVENT_GOT_SUPER_ROD
.CheckBalls
	checkcode VAR_BALL_POCKET
	ifequal  0, .GiftBall
	writetext SSMakoLowerDeckFishermanAfterText
	waitbutton
	closetext
	turnobject SSMAKOLOWERDECK_FISHER, UP
	end
	
.GiftBall
	writetext SSMakoLowerDeckFishermanNoBallText
	waitbutton
	verbosegiveitem POKE_BALL
	writetext SSMakoLowerDeckFishermanAfterBallText
	waitbutton
	closetext
	turnobject SSMAKOLOWERDECK_FISHER, UP
	end
	
SSMakoLowerDeckFishermanNoRodText:
	text "Fishing is what I"
	line "live for! You get"
	cont "to see so many"
	cont "kinds of #MON"
	cont "in the sea!"
	
	para "Would you like to"
	line "try fishing too?"
	
	para "I know you would!"
	
	para "I have a spare ROD"
	line "here, join me!"
	done
	
SSMakoLowerDeckFishermanNoBallText:
	text "What? You don't"
	line "have anything to"
	cont "keep what you"
	cont "caught?"

	para "You're really un-"
	line "prepared kid…"
	done

SSMakoLowerDeckFishermanAfterBallText:
	text "I have plenty of"
	line "# BALLs. If you"
	cont "need any more,"
	cont "just ask!"

	para "I only use LURE"
	line "BALLs, myself."

	para "I have no need for"
	line "the regular #"
	cont "BALLs."
	done
	
SSMakoLowerDeckFishermanAfterText:
	text "Nothing can beat"
	line "some good fishing."
	
	para "I'm taking all of"
	line "this time to relax"
	cont "before the #MON"
	cont "LEAGUE."
	
	para "And that time is"
	line "even better spent"
	cont "with a fishing"
	cont "buddy beside me."
	done

SSMakoLowerDeck_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 13,  4, SS_MAKO_1F, 10
	warp_event 13,  5, SS_MAKO_1F, 11

	db 4 ; coord events
	coord_event 12,  4, SCENE_DEFAULT, FangirlLowerDeckTeleport1
	coord_event 13,  5, SCENE_DEFAULT, FangirlLowerDeckTeleport1
	coord_event 12,  5, SCENE_DEFAULT, FangirlLowerDeckTeleport2
	coord_event 13,  4, SCENE_DEFAULT, FangirlLowerDeckTeleport2

	db 0 ; bg events

	db 2 ; object events
	object_event -1, -1, SPRITE_FANGIRL, SPRITEMOVEDATA_FOLLOWING, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSMakoLowerDeckFangirl, -1
	object_event  9,  1, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSMakoLowerDeckFisherman, -1
