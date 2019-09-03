	const_def 2 ; object constants
	const ELMSLAB_ELM
	const ELMSLAB_ELMS_AIDE
	const ELMSLAB_POKE_BALL1
	const ELMSLAB_POKE_BALL2
	const ELMSLAB_POKE_BALL3
	const ELMSLAB_GAMEBOY_KID
	const ELMSLAB_LASS
	const ELMSLAB_YOUNGSTER
	const ELMSLAB_PAPER1
	const ELMSLAB_PAPER2

ElmsLab_MapScripts:
	db 6 ; scene scripts
	scene_script .MeetElm ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_ELMSLAB_CANT_LEAVE
	scene_script .DummyScene2 ; SCENE_ELMSLAB_NOTHING
	scene_script .DummyScene3 ; SCENE_ELMSLAB_MEET_OFFICER
	scene_script .DummyScene4 ; SCENE_ELMSLAB_UNUSED
	scene_script .DummyScene5 ; SCENE_ELMSLAB_AIDE_GIVES_POTION

	db 0 ; callbacks

.MeetElm:
	priorityjump .WalkUpToElm
	end

.DummyScene1:
	end

.DummyScene2:
	end

.DummyScene3:
	end

.DummyScene4:
	end

.DummyScene5:
	end

.WalkUpToElm:
	applymovement PLAYER, ElmsLab_WalkUpToElmMovement
	showemote EMOTE_SHOCK, ELMSLAB_ELM, 15
	turnobject ELMSLAB_ELM, DOWN
	opentext
	writetext ElmText_Intro
.MustSayYes:
	yesorno
	iftrue .ElmGetsEmail
	writetext ElmText_Refused
	jump .MustSayYes

.ElmGetsEmail:
	writetext ElmText_ChooseAPokemon
	waitbutton
	setscene SCENE_ELMSLAB_CANT_LEAVE
	closetext
	end

ProfElmScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iffalse ChooseAPokemon
	writetext ElmDescribesMrPokemonText
	waitbutton
	closetext
	end
	
ChooseAPokemon
	writetext ElmText_ChooseAPokemon
	waitbutton
	closetext
	end

LabTryToLeaveScript:
	turnobject ELMSLAB_ELM, DOWN
	opentext
	writetext LabWhereGoingText
	waitbutton
	closetext
	applymovement PLAYER, ElmsLab_CantLeaveMovement
	end

CyndaquilPokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue LookAtElmPokeBallScript
	turnobject ELMSLAB_ELM, DOWN
	refreshscreen
	pokepic CHARMANDER
	cry CHARMANDER
	waitbutton
	closepokepic
	opentext
	writetext TakeCyndaquilText
	yesorno
	iffalse DidntChooseStarterScript
	disappear ELMSLAB_POKE_BALL1
	setevent EVENT_GOT_CYNDAQUIL_FROM_ELM
	writetext ChoseStarterText
	buttonsound
	waitsfx
	pokenamemem CHARMANDER, MEM_BUFFER_0
	writetext ReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	givepoke CHARMANDER, 10, BERRY
	closetext
	checkcode VAR_FACING
	ifequal RIGHT, ElmDirectionsScript
	applymovement PLAYER, AfterCyndaquilMovement
	jump ElmDirectionsScript

TotodilePokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue LookAtElmPokeBallScript
	turnobject ELMSLAB_ELM, DOWN
	refreshscreen
	pokepic SQUIRTLE
	cry SQUIRTLE
	waitbutton
	closepokepic
	opentext
	writetext TakeTotodileText
	yesorno
	iffalse DidntChooseStarterScript
	disappear ELMSLAB_POKE_BALL2
	setevent EVENT_GOT_TOTODILE_FROM_ELM
	writetext ChoseStarterText
	buttonsound
	waitsfx
	pokenamemem SQUIRTLE, MEM_BUFFER_0
	writetext ReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	givepoke SQUIRTLE, 10, BERRY
	closetext
	applymovement PLAYER, AfterTotodileMovement
	jump ElmDirectionsScript

ChikoritaPokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue LookAtElmPokeBallScript
	turnobject ELMSLAB_ELM, DOWN
	refreshscreen
	pokepic BULBASAUR
	cry BULBASAUR
	waitbutton
	closepokepic
	opentext
	writetext TakeChikoritaText
	yesorno
	iffalse DidntChooseStarterScript
	disappear ELMSLAB_POKE_BALL3
	setevent EVENT_GOT_CHIKORITA_FROM_ELM
	writetext ChoseStarterText
	buttonsound
	waitsfx
	pokenamemem BULBASAUR, MEM_BUFFER_0
	writetext ReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	givepoke BULBASAUR, 10, BERRY
	closetext
	checkcode VAR_FACING
	ifequal LEFT, .StandingLeft
	applymovement PLAYER, AfterChikoritaMovement
	jump ElmDirectionsScript
	
.StandingLeft:
	turnobject PLAYER, UP
	jump ElmDirectionsScript

DidntChooseStarterScript:
	writetext DidntChooseStarterText
	waitbutton
	closetext
	end

ElmDirectionsScript:
	turnobject PLAYER, UP
	opentext
	writetext ElmDirectionsText1
	waitbutton
	writetext ElmText_MissionFromMrPokemon
	playsound SFX_ITEM
	waitsfx
	setflag ENGINE_POKEDEX
	writetext ElmDirectionsText3
	waitbutton
	closetext
	setevent EVENT_GOT_A_POKEMON_FROM_ELM
	setevent EVENT_RIVAL_CHERRYGROVE_CITY
	setscene SCENE_ELMSLAB_AIDE_GIVES_POTION
	setmapscene CHERRYGROVE_CITY, SCENE_CHERRYGROVECITY_MEET_RIVAL
	setmapscene PLAYERS_HOUSE_1F, SCENE_FINISHED
	end

ElmDescribesMrPokemonScript:
	writetext ElmDescribesMrPokemonText
	waitbutton
	closetext
	end

LookAtElmPokeBallScript:
	opentext
	writetext ElmPokeBallText
	waitbutton
	closetext
	end

ElmGiveMasterBallScript:
	writetext ElmGiveMasterBallText1
	buttonsound
	verbosegiveitem MASTER_BALL
	iffalse .notdone
	setevent EVENT_GOT_MASTER_BALL_FROM_ELM
	writetext ElmGiveMasterBallText2
	waitbutton
.notdone
	closetext
	end

ElmGiveTicketScript:
	writetext ElmGiveTicketText1
	buttonsound
	verbosegiveitem S_S_TICKET
	setevent EVENT_GOT_SS_TICKET_FROM_ELM
	writetext ElmGiveTicketText2
	waitbutton
	closetext
	end

AideScript_WalkPotion1:
	applymovement ELMSLAB_ELMS_AIDE, AideWalksRight1
	turnobject PLAYER, UP
	scall AideScript_GivePotion
	applymovement ELMSLAB_ELMS_AIDE, AideWalksLeft1
	end

AideScript_WalkPotion2:
	applymovement ELMSLAB_ELMS_AIDE, AideWalksRight2
	turnobject PLAYER, UP
	scall AideScript_GivePotion
	applymovement ELMSLAB_ELMS_AIDE, AideWalksLeft2
	end

AideScript_GivePotion:
	opentext
	writetext AideText_GiveYouPotion
	buttonsound
	itemtotext POKE_BALL, MEM_BUFFER_1
	scall AideScript_ReceiveTheBalls
	giveitem POKE_BALL, 5
	writetext AideText_AlwaysBusy
	waitbutton
	closetext
	setscene SCENE_ELMSLAB_NOTHING
	end

AideScript_ReceiveTheBalls:
	jumpstd receiveitem
	end

ElmsAideScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iffalse .ElmsAideNoMon
	checkitem POKE_BALL
	iffalse .ElmsAideNoMon
	writetext AideText_AlwaysBusy
	waitbutton
	closetext
	end
	
.ElmsAideNoMon:
	writetext AideText_SoExcited
	waitbutton
	closetext
	end

ElmsLabLass:
	jumptextfaceplayer ElmsLabLassText
	
ElmsLabBugCatcher:
	opentext
	writetext ElmsLabBugCatcherText1
	waitbutton
	faceplayer
	writetext ElmsLabBugCatcherText2
	waitbutton
	turnobject LAST_TALKED, UP
	closetext
	end
	
ElmsLabGameboyKid:
	jumptextfaceplayer ElmsLabGameboyKidText

ElmsLabBookshelf:
	jumpstd difficultbookshelf
	
ElmsLabBook:
	jumptext ElmsLabBookText
	
ElmsLabShifurBook:
	refreshscreen
	pokepic SHIFUR
	waitbutton
	closepokepic
	writebyte SHIFUR
	special UnusedSetSeenMon
	jumptext ElmsLabPictureBook

ElmsLab_WalkUpToElmMovement:
	step UP
	step UP
	step UP
	step UP
	step LEFT
	turn_head UP
	step_end

ElmsLab_CantLeaveMovement:
	step UP
	step_end

AideWalksRight1:
	step RIGHT
	step RIGHT
	turn_head DOWN
	step_end

AideWalksRight2:
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head DOWN
	step_end

AideWalksLeft1:
	step LEFT
	step LEFT
	turn_head DOWN
	step_end

AideWalksLeft2:
	step LEFT
	step LEFT
	step LEFT
	turn_head DOWN
	step_end

ElmJumpUpMovement:
	fix_facing
	run_step UP
	remove_fixed_facing
	step_end

ElmJumpDownMovement:
	fix_facing
	run_step DOWN
	remove_fixed_facing
	step_end

ElmJumpLeftMovement:
	fix_facing
	run_step LEFT
	remove_fixed_facing
	step_end

ElmJumpRightMovement:
	fix_facing
	run_step RIGHT
	remove_fixed_facing
	step_end

ElmsLab_ElmToDefaultPositionMovement1:
	step UP
	step_end

ElmsLab_ElmToDefaultPositionMovement2:
	step RIGHT
	step RIGHT
	step UP
	turn_head DOWN
	step_end

AfterCyndaquilMovement:
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step_end

AfterTotodileMovement:
	step RIGHT
	step RIGHT
	step UP
	step_end

AfterChikoritaMovement:
	step RIGHT
	step UP
	step_end

ElmText_Intro:
	text "ELM: <PLAY_G>!"
	line "Hello!"

	para "We've been set up"
	line "all day waiting"
	cont "for you."

	para "I bet you simply"
	line "can't wait to"
	cont "choose a #MON!"

	para "So!"

	para "Are you ready to"
	line "select a #MON"
	
	para "und begin your"
	line "journey as a"
	cont "#MON trainer?"
	done

ElmText_Refused:
	text "Don't lie."
	
	para "Your mother told"
	line "me how excited"
	cont "you've been!"
	
	para "So vhat do"
	line "you say?"
	done

ElmText_MissionFromMrPokemon:
	text "<PLAYER> received"
	line "#DEX!"
	done

ElmText_ChooseAPokemon:
	text "Splendid!"

	para "You can select any"
	line "one of the"

	para "#MON contained"
	line "in these BALLS."

	para "You'll be that"
	line "#MON's first"
	cont "partner, <PLAY_G>!"

	para "Go on. Pick one!"
	done

ElmText_LetYourMonBattleIt:
	text "If a wild #MON"
	line "appears, let your"
	cont "#MON battle it!"
	done

LabWhereGoingText:
	text "ELM: Wait! Where"
	line "are you going?"
	done

TakeCyndaquilText:
	text "ELM: You'll take"
	line "CHARMANDER, the"
	cont "fire #MON?"
	done

TakeTotodileText:
	text "ELM: Do you want"
	line "SQUIRTLE, the"
	cont "water #MON?"
	done

TakeChikoritaText:
	text "ELM: So, you like"
	line "BULBASAUR, the"
	cont "grass #MON?"
	done

DidntChooseStarterText:
	text "ELM: Think it over"
	line "carefully."

	para "Your partner is"
	line "important."
	done

ChoseStarterText:
	text "ELM: I think"
	line "that's a great"
	cont "#MON too!"
	done

ReceivedStarterText:
	text "<PLAYER> received"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

ElmDirectionsText1:
	text "Take this #DEX"
	line "as well."

	para "Every trainer"
	line "needs one to train"
	cont "a #MON."
	done

ElmDirectionsText3:
	text "Best of luck on"
	line "your adventure!"
	done

ElmDescribesMrPokemonText:
	text "Now that you have"
	line "a #MON of your"
	cont "own, you may take"
	cont "part in the"
	cont "#MON LEAGUE"
	cont "challenge!"

	para "To qualify, you"
	line "must collect 8"
	cont "BADGES from GYM"
	cont "LEADERS."
	
	para "The closest GYM"
	line "is in PECTINIA"
	cont "CITY. Check your"
	cont "TOWN MAP to find"
	cont "it."
	done

ElmPokeBallText:
	text "It contains a"
	line "#MON caught by"
	cont "PROF.ELM."
	done

ElmGiveMasterBallText1:
	text "ELM: Hi, <PLAY_G>!"
	line "Thanks to you, my"

	para "research is going"
	line "great!"

	para "Take this as a"
	line "token of my"
	cont "appreciation."
	done

ElmGiveMasterBallText2:
	text "The MASTER BALL is"
	line "the best!"

	para "It's the ultimate"
	line "BALL! It'll catch"

	para "any #MON with-"
	line "out fail."

	para "It's given only to"
	line "recognized #MON"
	cont "researchers."

	para "I think you can"
	line "make much better"

	para "use of it than I"
	line "can, <PLAY_G>!"
	done

ElmGiveTicketText1:
	text "ELM: <PLAY_G>!"
	line "There you are!"

	para "I called because I"
	line "have something for"
	cont "you."

	para "See? It's an"
	line "S.S.TICKET."

	para "Now you can catch"
	line "#MON in KANTO."
	done

ElmGiveTicketText2:
	text "The ship departs"
	line "from OLIVINE CITY."

	para "But you knew that"
	line "already, <PLAY_G>."

	para "After all, you've"
	line "traveled all over"
	cont "with your #MON."

	para "Give my regards to"
	line "PROF.OAK in KANTO!"
	done

ElmsLabSignpostText_Egg:
	text "It's the #MON"
	line "EGG being studied"
	cont "by PROF.ELM."
	done

AideText_GiveYouPotion:
	text "<PLAY_G>, I want"
	line "you to have this."

	para "Think of it as a"
	line "going-away"
	cont "present!"
	done

AideText_SoExcited:
	text "Not everyone gets"
	line "to pick one of our"
	cont "#MON to start"
	cont "out. You're very"
	cont "lucky."
	done
	
AideText_AlwaysBusy:
	text "You will need to"
	line "weaken a #MON"
	cont "before you are"
	cont "able to catch it."
	
	para "A strong #MON"
	line "may break free!"
	done

ElmsLabOfficerText1:
	text "I heard a #MON"
	line "was stolen here…"

	para "I was just getting"
	line "some information"
	cont "from PROF.ELM."

	para "Apparently, it was"
	line "a young male with"
	cont "long, red hair…"

	para "What?"

	para "You battled a"
	line "trainer like that?"

	para "Did you happen to"
	line "get his name?"
	done

ElmsLabOfficerText2:
	text "OK! So <RIVAL>"
	line "was his name."

	para "Thanks for helping"
	line "my investigation!"
	done

ElmsLabWindowText1:
	text "The window's open."

	para "A pleasant breeze"
	line "is blowing in."
	done

ElmsLabWindowText2:
	text "He broke in"
	line "through here!"
	done

ElmsLabTravelTip1Text:
	text "<PLAYER> opened a"
	line "book."

	para "Travel Tip 1:"

	para "Press START to"
	line "open the MENU."
	done

ElmsLabTravelTip2Text:
	text "<PLAYER> opened a"
	line "book."

	para "Travel Tip 2:"

	para "Record your trip"
	line "with SAVE!"
	done

ElmsLabTravelTip3Text:
	text "<PLAYER> opened a"
	line "book."

	para "Travel Tip 3:"

	para "Open your PACK and"
	line "press SELECT to"
	cont "move items."
	done

ElmsLabTravelTip4Text:
	text "<PLAYER> opened a"
	line "book."

	para "Travel Tip 4:"

	para "Check your #MON"
	line "moves. Press the"

	para "A Button to switch"
	line "moves."
	done

ElmsLabTrashcanText:
	text "The wrapper from"
	line "the snack PROF.ELM"
	cont "ate is in there…"
	done

ElmsLabPCText:
	text "OBSERVATIONS ON"
	line "#MON EVOLUTION"

	para "…It says on the"
	line "screen…"
	done
	
ElmsLabBookText:
	text "It looks like a"
	line "book all about"
	cont "#MON."
	done
	
ElmsLabPictureBook:
	text "This looks like"
	line "a newly-discovered"
	cont "#MON!"
	done
	
ElmsLabLassText:
	text "If your #MON"
	line "get hurt, you"
	cont "should visit the"
	cont "PAVONA INN."
	
	para "My big sister runs"
	line "it!"
	done
	
ElmsLabBugCatcherText1:
	text "Hmm..."
	
	para "It says here that"
	line "SHIFUR is weak to"
	cont "FIRE and FIGHTING-"
	cont "type moves."
	done
	
ElmsLabBugCatcherText2:
	text "Have you ever seen"
	line "one? It looks"
	cont "really cool!"
	done
	
ElmsLabGameboyKidText:
	text "This is amazing!"
	
	para "They got every"
	line "character I could"
	cont "ever want in this"
	cont "game. Even the"
	cont "ones that nobody"
	cont "thought would ever"
	cont "happen!"
	done

ElmsLab_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 11, CHERRYGROVE_CITY, 3
	warp_event  5, 11, CHERRYGROVE_CITY, 3

	db 4 ; coord events
	coord_event  4, 11, SCENE_ELMSLAB_CANT_LEAVE, LabTryToLeaveScript
	coord_event  5, 11, SCENE_ELMSLAB_CANT_LEAVE, LabTryToLeaveScript
	coord_event  4, 11, SCENE_ELMSLAB_AIDE_GIVES_POTION, AideScript_WalkPotion1
	coord_event  5, 11, SCENE_ELMSLAB_AIDE_GIVES_POTION, AideScript_WalkPotion2

	db 13 ; bg events
	bg_event  0,  1, BGEVENT_READ, ElmsLabBookshelf
	bg_event  1,  1, BGEVENT_READ, ElmsLabBookshelf
	bg_event  2,  1, BGEVENT_READ, ElmsLabBookshelf
	bg_event  3,  1, BGEVENT_READ, ElmsLabBookshelf
	bg_event  0,  5, BGEVENT_READ, ElmsLabBookshelf
	bg_event  1,  5, BGEVENT_READ, ElmsLabBookshelf
	bg_event  2,  5, BGEVENT_READ, ElmsLabBookshelf
	bg_event  6,  7, BGEVENT_READ, ElmsLabBookshelf
	bg_event  7,  7, BGEVENT_READ, ElmsLabBookshelf
	bg_event  8,  7, BGEVENT_READ, ElmsLabBookshelf
	bg_event  9,  7, BGEVENT_READ, ElmsLabBookshelf
	bg_event  8,  3, BGEVENT_READ, ElmsLabShifurBook
	bg_event  8,  9, BGEVENT_READ, ElmsLabBook

	db 8 ; object events
	object_event  3,  6, SPRITE_PROFESSOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ProfElmScript, -1
	object_event  2, 10, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ElmsAideScript, EVENT_ELMS_AIDE_IN_LAB
	object_event  0,  7, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CyndaquilPokeBallScript, EVENT_CYNDAQUIL_POKEBALL_IN_ELMS_LAB
	object_event  1,  7, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, TotodilePokeBallScript, EVENT_TOTODILE_POKEBALL_IN_ELMS_LAB
	object_event  2,  7, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ChikoritaPokeBallScript, EVENT_CHIKORITA_POKEBALL_IN_ELMS_LAB
	object_event  7,  1, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ElmsLabGameboyKid, -1
	object_event  8, 10, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ElmsLabLass, -1
	object_event  8,  4, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ElmsLabBugCatcher, -1
