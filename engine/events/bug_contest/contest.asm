InitializeSafariZone:
	ld a, 30
	ld [wParkBallsRemaining], a
	ld a, 300 / $100
	ld [wSafariStepsRemaining], a
	ld a, 300 % $100
	ld [wSafariStepsRemaining + 1], a
	ret

SafariZoneEncounterScript::
	writecode VAR_BATTLETYPE, BATTLETYPE_CONTEST
	randomwildmon
	startbattle
	reloadmapafterbattle
	copybytetovar wParkBallsRemaining
	iffalse BugCatchingContestOutOfBallsScript
	end

SafariGameOverScript::
	playsound SFX_ELEVATOR_END
	opentext
	writetext SafariGameText_TimesUp
	waitbutton
	clearflag ENGINE_SAFARI_ZONE
	writecode VAR_MOVEMENT, PLAYER_NORMAL
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
