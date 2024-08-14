	const_def 2 ; object constants
	const ORCHIDENTEISHRINE_GYM_GUY
	const ORCHIDENTEISHRINE_BLACKBELT1
	const ORCHIDENTEISHRINE_BLACKBELT2 ; Nicholas
	const ORCHIDENTEISHRINE_BLACKBELT3 ; Jamie
	const ORCHIDENTEISHRINE_BLACKBELT4 ; Liam
	const ORCHIDENTEISHRINE_BLACKBELT5 ; Lily
	const ORCHIDENTEISHRINE_BLACKBELT6 ; Melissa
	const ORCHIDENTEISHRINE_BLACKBELT7 ; Gus
	const ORCHIDENTEISHRINE_MACHAMP
	const ORCHIDENTEISHRINE_ELDER
	const ORCHIDENTEISHRINE_BLACKBELT_DUMMY_2
	const ORCHIDENTEISHRINE_BLACKBELT_DUMMY_4
	const ORCHIDENTEISHRINE_BLACKBELT_DUMMY_7
	const ORCHIDENTEISHRINE_BLACKBELT_DUMMY_ROUND_3

OrchidEnteiShrine_MapScripts:
	db 3 ; scene scripts
	scene_script .DummyScene ; SCENE_ORCHIDENTEISHRINE_DEFAULT
	scene_script .DummyScene ; SCENE_ORCHIDENTEISHRINE_CHALLENGE
	scene_script .DummyScene ; SCENE_ORCHIDENTEISHRINE_FINISHED

	db 0 ; callbacks

.DummyScene:
	end

MachampTournamentTest:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_5
	iftrue .EndTournament
	checkevent EVENT_ENTEI_SHRINE_EXPLAINED
	iftrue .NotFirstTime
	writetext OrchidEnteiShrineIntroText
	waitbutton
.CheckEntei
	checkevent EVENT_CAUGHT_ENTEI
	iftrue .HaveEntei
	checkevent EVENT_HIDE_ENTEI
	iffalse .NoEntei
.HaveEntei
	writetext OrchidEnteiShrineSeenEnteiText
	waitbutton
	closetext
	opentext 
	writetext OrchidEnteiShrinePlayerShowsDexEntry
	waitbutton
	closetext
	showemote EMOTE_SHOCK, ORCHIDENTEISHRINE_GYM_GUY, 30
	opentext
	writetext OrchidEnteiShrineShowedEnteiText
	waitbutton
	setevent EVENT_ENTEI_SHRINE_EXPLAINED
.NotFirstTime
	writetext OrchidEnteiShrineAskTournamentText
	yesorno
	iffalse .Declined
	writetext OrchhidEnteiShrineRematchTournamentText
	waitbutton
	checkevent EVENT_ENTEI_SHRINE_RUBY_PENDANT
	iftrue .StartChallenge
	writetext OrchidEnteiShrineAcceptTournamentText
	waitbutton
.StartChallenge
	closetext

	setscene SCENE_ORCHIDENTEISHRINE_CHALLENGE

	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_4
	iffalse .RightSide
	checkevent EVENT_ENTEI_SHRINE_RUBY_PENDANT
	iffalse .FirstTime
	applymovement PLAYER, EnteiShrinePlayerRematchTournamentMovement
	jump .StartRound1
.FirstTime
	applymovement ORCHIDENTEISHRINE_GYM_GUY, EnteiShrineGymGuyStopBlockingPlayer
	applymovement PLAYER, EnteiShinePlayerEnterTournamentMovement_Left
	jump .StartRound1
.RightSide
	applymovement PLAYER, EnteiShinePlayerEnterTournamentMovement_Right
.StartRound1
; Round 1
	opentext
	writetext Blackbelt1IntroText
	waitbutton
	closetext

	setlasttalked ORCHIDENTEISHRINE_BLACKBELT1
	winlosstext Blackbelt1WinText, 0
	loadtrainer BLACKBELT_T, TOURNAMENT_1
	startbattle
	reloadmapafterbattle

; Round 2
	applymovement PLAYER, EnteiShrinePlayerRound1Movement
	random 2
	ifequal 1, .MoveBlackbelt3
	applymovement ORCHIDENTEISHRINE_BLACKBELT2, EnteiShrineBlackbelt2Movement
	moveobject ORCHIDENTEISHRINE_BLACKBELT_DUMMY_2, 9, 9
	appear ORCHIDENTEISHRINE_BLACKBELT_DUMMY_2
	moveobject ORCHIDENTEISHRINE_BLACKBELT2, 0, 0
	applymovement ORCHIDENTEISHRINE_BLACKBELT2, EnteiShrineHideBlackbelt

	setlasttalked ORCHIDENTEISHRINE_BLACKBELT_DUMMY_2
	winlosstext Blackbelt2WinText, 0
	loadtrainer BLACKBELT_T, TOURNAMENT_2

.Blackbelt2and3
	random 2
	ifequal 1, .MoveBlackbelt5
	moveobject ORCHIDENTEISHRINE_BLACKBELT4, 15, 11
	appear ORCHIDENTEISHRINE_BLACKBELT4
	applymovement ORCHIDENTEISHRINE_BLACKBELT4, EnteiShrineBlackbelt4Movement
	moveobject ORCHIDENTEISHRINE_BLACKBELT_DUMMY_4, 14, 10
	appear ORCHIDENTEISHRINE_BLACKBELT_DUMMY_4
	moveobject ORCHIDENTEISHRINE_BLACKBELT4, 0, 0
	applymovement ORCHIDENTEISHRINE_BLACKBELT4, EnteiShrineHideBlackbelt

.Blackbelt4and5
	random 2
	ifequal 1, .MoveBlackbelt7
	moveobject ORCHIDENTEISHRINE_BLACKBELT6, 15, 7
	appear ORCHIDENTEISHRINE_BLACKBELT6
	applymovement ORCHIDENTEISHRINE_BLACKBELT6, EnteiShrineBlackbelt6Movement
	moveobject ORCHIDENTEISHRINE_BLACKBELT6, 14, 9
.Blackbelt6and7
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .Blackbelt3Intro
	writetext Blackbelt2IntroText
	jump .StartRound2Battle
.Blackbelt3Intro
	writetext Blackbelt3IntroText
.StartRound2Battle
; Round 3
	waitbutton
	closetext
	startbattle
	reloadmapafterbattle
	applymovement PLAYER, EnteiShrinePlayerRound2Movement

	random 2
	ifequal 1, .MoveBlackbelt6or7
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftrue .Round2Blackbelt5
	applymovement ORCHIDENTEISHRINE_BLACKBELT_DUMMY_4, Round2_Blackbelt4or5Movement
	moveobject ORCHIDENTEISHRINE_BLACKBELT_DUMMY_ROUND_3, 12, 6
	appear ORCHIDENTEISHRINE_BLACKBELT_DUMMY_ROUND_3
	moveobject ORCHIDENTEISHRINE_BLACKBELT_DUMMY_4, 0, 0
	applymovement ORCHIDENTEISHRINE_BLACKBELT_DUMMY_4, EnteiShrineHideBlackbelt

	setlasttalked ORCHIDENTEISHRINE_BLACKBELT_DUMMY_ROUND_3
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_6
	winlosstext Blackbelt4WinText, 0
	loadtrainer BLACKBELT_T, TOURNAMENT_4
	opentext
	writetext Blackbelt4IntroText

.ContinueRound2
	waitbutton
	closetext
	startbattle
	reloadmapafterbattle

	opentext
	checkevent EVENT_ENTEI_SHRINE_RUBY_PENDANT
	iftrue .WonRematch
	writetext OrchidEnteiShrineWonTournamentText
	waitbutton
	closetext

	applymovement PLAYER, EnteiShinePlayerApproachElder

	opentext
	writetext OrchidEnteiShrineIntroduceMachampText
	waitbutton
	closetext
	end

.MoveBlackbelt3:
	applymovement ORCHIDENTEISHRINE_BLACKBELT3, EnteiShrineBlackbelt3Movement
	moveobject ORCHIDENTEISHRINE_BLACKBELT3, 9, 9
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1

	setlasttalked ORCHIDENTEISHRINE_BLACKBELT3
	winlosstext Blackbelt3WinText, 0
	loadtrainer BLACKBELT_T, TOURNAMENT_3
	jump .Blackbelt2and3

.MoveBlackbelt5:
	moveobject ORCHIDENTEISHRINE_BLACKBELT5, 15, 12
	appear ORCHIDENTEISHRINE_BLACKBELT5
	applymovement ORCHIDENTEISHRINE_BLACKBELT5, EnteiShrineBlackbelt5Movement
	moveobject ORCHIDENTEISHRINE_BLACKBELT5, 14, 10
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	jump .Blackbelt4and5

.MoveBlackbelt7:
	moveobject ORCHIDENTEISHRINE_BLACKBELT7, 15, 8
	appear ORCHIDENTEISHRINE_BLACKBELT7
	applymovement ORCHIDENTEISHRINE_BLACKBELT7, EnteiShrineBlackbelt7Movement
	moveobject ORCHIDENTEISHRINE_BLACKBELT_DUMMY_7, 14, 9
	appear ORCHIDENTEISHRINE_BLACKBELT_DUMMY_7
	moveobject ORCHIDENTEISHRINE_BLACKBELT7, 0, 0
	applymovement ORCHIDENTEISHRINE_BLACKBELT7, EnteiShrineHideBlackbelt
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	jump .Blackbelt6and7

.MoveBlackbelt6or7
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	iftrue .Round2Blackbelt7
	applymovement ORCHIDENTEISHRINE_BLACKBELT6, Round2_Blackbelt6or7Movement
	moveobject ORCHIDENTEISHRINE_BLACKBELT_DUMMY_ROUND_3, 12, 6
	appear ORCHIDENTEISHRINE_BLACKBELT_DUMMY_ROUND_3
	moveobject ORCHIDENTEISHRINE_BLACKBELT6, 0, 0
	applymovement ORCHIDENTEISHRINE_BLACKBELT6, EnteiShrineHideBlackbelt

	setlasttalked ORCHIDENTEISHRINE_BLACKBELT_DUMMY_ROUND_3
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_8
	winlosstext Blackbelt6WinText, 0
	loadtrainer BLACKBELT_T, TOURNAMENT_6
	opentext
	writetext Blackbelt6IntroText
	jump .ContinueRound2

.Round2Blackbelt5
	applymovement ORCHIDENTEISHRINE_BLACKBELT5, Round2_Blackbelt4or5Movement
	moveobject ORCHIDENTEISHRINE_BLACKBELT_DUMMY_ROUND_3, 12, 6
	appear ORCHIDENTEISHRINE_BLACKBELT_DUMMY_ROUND_3
	moveobject ORCHIDENTEISHRINE_BLACKBELT5, 0, 0
	applymovement ORCHIDENTEISHRINE_BLACKBELT5, EnteiShrineHideBlackbelt

	setlasttalked ORCHIDENTEISHRINE_BLACKBELT_DUMMY_ROUND_3
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_7
	winlosstext Blackbelt5WinText, 0
	loadtrainer BLACKBELT_T, TOURNAMENT_5
	opentext
	writetext Blackbelt5IntroText
	jump .ContinueRound2

.Round2Blackbelt7
	applymovement ORCHIDENTEISHRINE_BLACKBELT_DUMMY_7, Round2_Blackbelt6or7Movement
	moveobject ORCHIDENTEISHRINE_BLACKBELT_DUMMY_ROUND_3, 12, 6
	appear ORCHIDENTEISHRINE_BLACKBELT_DUMMY_ROUND_3
	moveobject ORCHIDENTEISHRINE_BLACKBELT_DUMMY_7, 0, 0
	applymovement ORCHIDENTEISHRINE_BLACKBELT_DUMMY_7, EnteiShrineHideBlackbelt

	setlasttalked ORCHIDENTEISHRINE_BLACKBELT_DUMMY_ROUND_3
	winlosstext Blackbelt7WinText, 0
	loadtrainer BLACKBELT_T, TOURNAMENT_7
	opentext
	writetext Blackbelt7IntroText
	jump .ContinueRound2

.EndTournament:
	writetext OrchidEnteiShrineAfterTournamentText
	waitbutton
	closetext
	end

.NoEntei:
	closetext
	end

.Declined:
	checkevent EVENT_ENTEI_SHRINE_RUBY_PENDANT
	iftrue .RematchDeclined
	writetext OrchidEnteiShrineDeclinedText
	waitbutton
	closetext
	end

.RematchDeclined:
	writetext OrchidEnteiShrineRematchDeclinedText
	waitbutton
	closetext
	end

.WonRematch:
	setscene SCENE_ORCHIDENTEISHRINE_FINISHED
	writetext OrchidEnteiShrineWonRematchText
	waitbutton
	closetext
	applymovement PLAYER, EnteiShinePlayerApproachElder
	opentext
	writetext OrchidEnteiShrineRematchRewardText
	waitbutton
	verbosegiveitem STARDUST, 3
	playsound SFX_ITEM
	waitsfx
	iffalse .NoRoom
	closetext
	end

.NoRoom:
	writetext OrchidEnteiShrineNoRoomText
	waitbutton
	writetext OrchidEnteiShrineCashRewardText
	givemoney YOUR_MONEY, 6000
	playsound SFX_ITEM
	waitsfx
	closetext
	end

OrchidEnteiShineBossMachamp:
	opentext
	writetext OrchidEnteiShrineMachampText
	cry MACHAMP
	waitbutton
	closetext
	checkevent EVENT_ENTEI_SHRINE_RUBY_PENDANT
	iftrue .FoughtMachamp
	loadwildmon MACHAMP, 60
	writecode VAR_BATTLETYPE, BATTLETYPE_BOSS
	startbattle
	reloadmapafterbattle
	setscene SCENE_ORCHIDENTEISHRINE_FINISHED
	applymovement PLAYER, EnteiShrinePlayerGetTreasureMovement
	opentext
	writetext OrchidEnteiShrineDefeatedMachampText
	waitbutton
	verbosegiveitem RUBY_PENDANT
	setevent EVENT_ENTEI_SHRINE_RUBY_PENDANT
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_5
	closetext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_6
	iftrue .ReappearBlackbelt4
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_7
	iftrue .ReappearBlackbelt5
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_8
	iftrue .ReappearBlackbelt6
	moveobject ORCHIDENTEISHRINE_BLACKBELT_DUMMY_7, 12, 6
	appear ORCHIDENTEISHRINE_BLACKBELT_DUMMY_7
	applymovement ORCHIDENTEISHRINE_BLACKBELT_DUMMY_7, EnteiShrineReappearBlackbelt
	jump .HideDummy
.ReappearBlackbelt4
	moveobject ORCHIDENTEISHRINE_BLACKBELT_DUMMY_4, 12, 6
	appear ORCHIDENTEISHRINE_BLACKBELT_DUMMY_4
	applymovement ORCHIDENTEISHRINE_BLACKBELT_DUMMY_4, EnteiShrineReappearBlackbelt
	jump .HideDummy
.ReappearBlackbelt5
	moveobject ORCHIDENTEISHRINE_BLACKBELT5, 12, 6
	appear ORCHIDENTEISHRINE_BLACKBELT5
	applymovement ORCHIDENTEISHRINE_BLACKBELT5, EnteiShrineReappearBlackbelt
	jump .HideDummy
.ReappearBlackbelt6
	moveobject ORCHIDENTEISHRINE_BLACKBELT6, 12, 6
	appear ORCHIDENTEISHRINE_BLACKBELT6
	applymovement ORCHIDENTEISHRINE_BLACKBELT6, EnteiShrineReappearBlackbelt
.HideDummy
	disappear ORCHIDENTEISHRINE_BLACKBELT_DUMMY_ROUND_3
.FoughtMachamp:
	end

EnteiShrineGymGuyReEnterTournament:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_4
	turnobject ORCHIDENTEISHRINE_GYM_GUY, LEFT
	turnobject PLAYER, RIGHT
	scall MachampTournamentTest
	applymovement PLAYER, EnteiShinePlayerStepDownMovement
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_4
	end

EnteiShrineGymGuyBlockLeft:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_4
	iftrue .DontMove
	applymovement ORCHIDENTEISHRINE_GYM_GUY, EnteiShrineGymGuyBlockMovementLeft
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_4
.DontMove
	end

EnteiShrineGymGuyBlockRight:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_4
	iffalse .DontMove
	applymovement ORCHIDENTEISHRINE_GYM_GUY, EnteiShrineGymGuyBlockMovementRight
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_4
.DontMove
	end

EnteiShrineResetScene:
	setscene SCENE_ORCHIDENTEISHRINE_CHALLENGE
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_4
	end

OrchidEnteiShrineCantLeave:
	opentext
	writetext OrchidEnteiShrineCantLeaveText
	waitbutton
	closetext
	applymovement PLAYER, EnteiShinePlayerStepUpMovement
	end

OrchidEnteiShrineElder:
	faceplayer
	opentext
	checkevent EVENT_ENTEI_SHRINE_RUBY_PENDANT
	iftrue .Rematch
	writetext OrchidEnteiShrineIntroduceMachampText
	waitbutton
	closetext
	end

.Rematch
	writetext OrchidEnteiShrineElderRematchText
	waitbutton
	closetext
	end

Blackbelt1:
	jumptextfaceplayer Blackbelt1AfterText

Blackbelt2:
	jumptextfaceplayer Blackbelt2AfterText

Blackbelt3:
	jumptextfaceplayer Blackbelt3AfterText

Blackbelt4:
	jumptextfaceplayer Blackbelt4AfterText

Blackbelt5:
	jumptextfaceplayer Blackbelt5AfterText

Blackbelt6:
	jumptextfaceplayer Blackbelt6AfterText

Round3Dummy:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_6
	iftrue Blackbelt4
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_7
	iftrue Blackbelt5
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_8
	iftrue Blackbelt6
Blackbelt7:
	jumptextfaceplayer Blackbelt7AfterText

EnteiShrineGymGuyBlockMovementLeft:
	fix_facing
	run_step LEFT
	step_resume

EnteiShrineGymGuyBlockMovementRight:
	fix_facing
	run_step RIGHT
	step_resume

EnteiShrineGymGuyStopBlockingPlayer:
	turn_head LEFT
	fix_facing
	step RIGHT
	step_resume

EnteiShinePlayerEnterTournamentMovement_Right:
	step LEFT
EnteiShinePlayerEnterTournamentMovement_Left:
	step UP
EnteiShrinePlayerRematchTournamentMovement:
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step UP
	step_end

EnteiShinePlayerStepDownMovement:
	step DOWN
	step_end

EnteiShinePlayerStepUpMovement:
	step UP
	step_end

EnteiShrinePlayerRound1Movement:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step UP
	step_end

EnteiShrinePlayerRound2Movement:
	step RIGHT
	step RIGHT
	step UP
	step UP
	step UP
	step UP
	turn_head RIGHT
	step_end

EnteiShinePlayerApproachElder:
	step UP
	step UP
	step UP
	step UP
	step_end

EnteiShrinePlayerGetTreasureMovement:
	step LEFT
	turn_head UP
	step_end

EnteiShrineBlackbelt2Movement:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step DOWN
	step_end

EnteiShrineBlackbelt3Movement:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step_end

EnteiShrineBlackbelt4Movement:
	step LEFT
	step UP
	step_end

EnteiShrineBlackbelt5Movement:
	step LEFT
	step UP
	step UP
	step_end

EnteiShrineBlackbelt6Movement:
	step LEFT
	step DOWN
	step DOWN
	step_end

EnteiShrineBlackbelt7Movement:
	step LEFT
	step DOWN
	step_end

Round2_Blackbelt4or5Movement:
	step LEFT
	step LEFT
	step UP
	step UP
	step UP
	step UP
	turn_head LEFT
	step_end

Round2_Blackbelt6or7Movement:
	step LEFT
	step LEFT
	step UP
	step UP
	step UP
	turn_head LEFT
	step_end

EnteiShrineHideBlackbelt:
	hide_person
	step_end

EnteiShrineReappearBlackbelt:
	turn_head LEFT
	show_person
	step_end

Round1FightersReadyText:
	text "Round 1!"
	line "Ready?"

	para "FIGHT!"
	done

Round2FightersReadyText:
	text "Round 2!"
	line "Fighters ready?"

	para "FIGHT!"
	done

Round3FightersReadyText:
	text "Final round!"
	line "Ready?"

	para "FIGHT!"
	done

Blackbelt1IntroText:
	text "No outsider will"
	line "sway my beliefs!"
	done

Blackbelt1WinText:
	text "Oh, ENTEI!"
	line "Please forgive me"
	cont "for losing to this"
	cont "non-believer!"
	done

Blackbelt1AfterText:
	text "If you have really"
	line "encountered ENTEI,"
	cont "I must apologize"
	cont "for calling you a"
	cont "non-believer."
	done

Blackbelt2IntroText:
	text "You will be no"
	line "match for the"
	cont "speed of my fists!"
	done

Blackbelt2WinText:
	text "How did you anti-"
	line "cipate my moves?"
	done

Blackbelt2AfterText:
	text "My speed has"
	line "failed me."

	para "I must hit harder"
	line "with my speed."
	done

Blackbelt3IntroText:
	text "Oooarrgh!"

	para "I will throw your"
	line "weak #MON out"
	cont "of the ring!"
	done

Blackbelt3WinText:
	text "My tactics were no"
	line "use against your"
	cont "sturdy stance."
	done

Blackbelt3AfterText:
	text "I must learn to"
	line "lift the heaviest"
	cont "objects possible!"

	para "I must be a good"
	line "example for my"
	cont "#MON!"
	done

Blackbelt4IntroText:
	text "My strategy will"
	line "leave you shocked!"
	done

Blackbelt4WinText:
	text "This is what I get"
	line "for betraying the"
	cont "PHYSICAL nature of"
	cont "the FIGHTING type."
	done

Blackbelt4AfterText:
	text "FIGHTING #MON"
	line "are resilient to"
	cont "PHYSICAL moves, so"
	cont "I am hesitant to"
	cont "rely on them."
	done

Blackbelt5IntroText:
	text "Things are really"
	line "heating up here!"
	done

Blackbelt5WinText:
	text "What was I"
	line "thinking?"

	para "ALMIGHTY ENTEI"
	line "would never app-"
	cont "rove the usage of"
	cont "SPECIAL moves."
	done

Blackbelt5AfterText:
	text "I want to exploit"
	line "FIGHTING-type's"
	cont "vulnerability to"
	cont "SPECIAL moves as"
	cont "much as possible."
	done

Blackbelt6IntroText:
	text "You won't win with"
	line "brute force alone!"
	done

Blackbelt6WinText:
	text "That didn't work?"

	para "I must rethink my"
	line "strategy!"
	done

Blackbelt6AfterText:
	text "I train my brain"
	line "as hard as I do"
	cont "my body."

	para "Both will become"
	line "unstoppable!"
	done

Blackbelt7IntroText:
	text "Final round!"

	para "I didn't make it"
	line "this far to lose!"
	done

Blackbelt7WinText:
	text "I… lost…?"

	para "Where did such a"
	line "powerful trainer"
	cont "come from?"

	para "Are you really the"
	line "one who met ENTEI?"
	done

Blackbelt7AfterText:
	text "Being defeated is"
	line "the greatest"
	cont "encouragement to"
	cont "grow stronger."

	para "I mustn't become"
	line "soft!"
	done

OrchidEnteiShrineIntroText:
	text "This FIGHTING CLUB"
	line "is only for those"
	cont "who follow in our"
	cont "beliefs."

	para "Here we fight to"
	line "prove our worth to" 
	cont "ALMIGHTY ENTEI!"

	para "No outsiders"
	line "allowed!"
	done

OrchidEnteiShrineSeenEnteiText:
	text "What's this? You've"
	line "seen ALMIGHTY"
	cont "ENTEI with your"
	cont "own eyes?"

	para "Prove it!"
	done

OrchidEnteiShrinePlayerShowsDexEntry:
	text "<PLAYER> showed"
	line "ENTEI's #DEX"
	cont "entry to the man."
	done

OrchidEnteiShrineShowedEnteiText:
	text "I don't believe it!"

	para "ALMIGHTY ENTEI has"
	line "revealed itself to"
	cont "an outsider!"

	para "Perhaps you were"
	line "meant to be here."
	done

OrchidEnteiShrineAskTournamentText:
	text "Would you like to"
	line "take part in a"
	cont "tournament with"
	cont "the fighters who"
	cont "train here?"
	done

OrchidEnteiShrineAcceptTournamentText:
	text "Don't disappoint"
	line "me. ENTEI must"
	cont "have seen some-"
	cont "thing in you to"
	cont "reveal itself."
	done

OrchhidEnteiShrineRematchTournamentText:
	text "Your opponent is"
	line "waiting."
	done

OrchidEnteiShrineDeclinedText:
	text "Ha! Do you fear"
	line "the fighters in"
	cont "the ring?"

	para "I do not blame"
	line "you."
	done

OrchidEnteiShrineRematchDeclinedText:
	text "I hope you recon-"
	line "sider. I wish to"
	cont "learn more from"
	cont "how you battle."
	done

OrchidEnteiShrineAfterTournamentText:
	text "The tournament has"
	line "concluded."

	para "The fighters are"
	line "not ready for more"
	cont "battles right now."

	para "Return later if"
	line "want to issue fur-"
	cont "ther challenges."
	done

OrchidEnteiShrineWonTournamentText:
	text "Congratulations to"
	line "the outsider!"

	para "The first one to"
	line "prove their worth"
	cont "to ALMIGHTY ENTEI!"

	para "Please, come here"
	line "for your reward."
	done

OrchidEnteiShrineWonRematchText:
	text "Congratulations"
	line "once again to the"
	cont "outsider, <PLAYER>!"
	done

OrchidEnteiShrineRematchRewardText:
	text "For showing us how"
	line "a true disciple of"
	cont "ENTEI battles,"
	cont "please accept this"
	cont "STARDUST."
	done

OrchidEnteiShrineNoRoomText:
	text "You defeated my"
	line "students with a"
	cont "full PACK?"

	para "What other skills"
	line "do you possess?"

	para "I will reward you"
	line "with cash instead."
	done

OrchidEnteiShrineCashRewardText:
	text "<PLAYER> received"
	line "¥6000."
	done

OrchidEnteiShrineIntroduceMachampText:
	text "There is one more"
	line "opponent for you"
	cont "to face."

	para "No, it is not me."

	para "It is the strong-"
	line "est #MON here."

	para "The FOUR-ARMED"
	line "FLEXER, MACHAMP!"

	para "If you can defeat"
	line "him in battle, I"
	cont "will reward you"
	cont "with our most"
	cont "sacred treasure."

	para "No one here has"
	line "been able to beat"
	cont "MACHAMP in battle."

	para "Let ENTEI's will"
	line "guide you toward"
	cont "being the first."
	done

OrchidEnteiShrineDefeatedMachampText:
	text "MACHAMP seemed to"
	line "pose no threat to"
	cont "your #MON."

	para "I'm greatly"
	line "impressed."

	para "As promised, here"
	line "is our sacred"
	cont "treasure. I know I"
	cont "can entrust it"
	cont "with you."
	done

OrchidEnteiShrineElderRematchText:
	text "I am in awe at how"
	line "strong a mere"
	cont "child can become."

	para "It is no wonder"
	line "that ENTEI allowed"
	cont "you to meet it."

	para "I only pray that"
	line "one day we will"
	cont "all be so lucky."
	done

OrchidEnteiShrineCantLeaveText:
	text "Where are you"
	line "going?"

	para "MACHAMP wishes to"
	line "battle you."
	done

OrchidEnteiShrineMachampText:
	text "MACHAMP: Guoohgoh!"
	done

OrchidEnteiShrine_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 11, 25, ORCHID_BLACKBELTS_HOUSE, 2

	db 8 ; coord events
	coord_event 11, 22, SCENE_ORCHIDENTEISHRINE_DEFAULT, EnteiShrineGymGuyBlockLeft
	coord_event 12, 22, SCENE_ORCHIDENTEISHRINE_DEFAULT, EnteiShrineGymGuyBlockRight
	coord_event 11, 21, SCENE_ORCHIDENTEISHRINE_CHALLENGE, EnteiShrineGymGuyReEnterTournament
	coord_event 11, 21, SCENE_ORCHIDENTEISHRINE_FINISHED, EnteiShrineResetScene
	coord_event 10,  4, SCENE_ORCHIDENTEISHRINE_CHALLENGE, OrchidEnteiShrineCantLeave
	coord_event 11,  4, SCENE_ORCHIDENTEISHRINE_CHALLENGE, OrchidEnteiShrineCantLeave
	coord_event 12,  4, SCENE_ORCHIDENTEISHRINE_CHALLENGE, OrchidEnteiShrineCantLeave
	coord_event 13,  4, SCENE_ORCHIDENTEISHRINE_CHALLENGE, OrchidEnteiShrineCantLeave

	db 0 ; bg events

	db 14 ; object events
	object_event 12, 21, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, MachampTournamentTest, -1
	object_event  5, 11, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Blackbelt1, -1
	object_event  5,  8, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Blackbelt2, -1
	object_event  5,  7, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Blackbelt3, -1
	object_event 18, 11, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Blackbelt4, -1
	object_event 18, 12, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Blackbelt5, -1
	object_event 18,  7, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Blackbelt6, -1
	object_event 18,  8, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Blackbelt7, -1
	object_event 12,  1, SPRITE_MACHOP, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, OrchidEnteiShineBossMachamp, -1
	object_event 11,  1, SPRITE_ELDER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, OrchidEnteiShrineElder, -1
	object_event  0,  0, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Blackbelt2, -1 ; Dummy for 2
	object_event  0,  0, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Blackbelt4, -1 ; Dummy for 4
	object_event  0,  0, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Blackbelt7, -1 ; Dummy for 7
	object_event  0,  0, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Round3Dummy, -1 ; Dummy for Round 3
