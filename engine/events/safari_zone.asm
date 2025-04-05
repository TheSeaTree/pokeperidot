InitializeSafariZone:
	ld a, 30
	ld [wSafariBallsRemaining], a
	ld a, 300 / $100
	ld [wSafariStepsRemaining], a
	ld a, 300 % $100
	ld [wSafariStepsRemaining + 1], a
	jp ContinueInitializeSafariZone

InitializeExtendedSafariZone:
	ld a, 45
	ld [wSafariBallsRemaining], a
	ld a, 500 / $100
	ld [wSafariStepsRemaining], a
	ld a, 500 % $100
	ld [wSafariStepsRemaining + 1], a
	; fallthrough
ContinueInitializeSafariZone:
	; Hide Area 5 & 6 encounters from the Pokedex
	ld a, GROUP_SAFARI_ZONE_AREA_1
	ld [wBackupMapGroup], a
	ld a, MAP_SAFARI_ZONE_AREA_1
	ld [wBackupMapNumber], a
	ret

SafariZoneEncounterScript::
	writecode VAR_BATTLETYPE, BATTLETYPE_SAFARI
	randomwildmon
	startbattle
	reloadmapafterbattle
	copybytetovar wSafariBallsRemaining
	iffalse BugCatchingContestOutOfBallsScript
	end

SafariGameOverScript::
	special StopPlayerRunning
	playsound SFX_ELEVATOR_END
	opentext
	writetext SafariGameText_TimesUp
	waitbutton
	clearflag ENGINE_SAFARI_GAME_ACTIVE
	jump SafariZoneReturnToGateScript

BugCatchingContestOutOfBallsScript:
	playsound SFX_ELEVATOR_END
	opentext
	writetext SafariGameText_OutOfBalls
	waitbutton

SafariZoneReturnToGateScript:
	closetext
	jumpstd safarizonewarp

SafariGameText_TimesUp:
	; PA: DING DONG! Time's up!
	text_far UnknownText_0x1bd2ca
	text_end

SafariGameText_OutOfBalls:
	; PA: You are out of SAFARI BALLS.
	text_far UnknownText_0x1bd2e7
	text_end
