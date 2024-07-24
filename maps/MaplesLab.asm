	const_def 2 ; object constants
	const MAPLESLAB_MAPLE
	const MAPLESLAB_MAPLES_AIDE
	const MAPLESLAB_POKE_BALL1
	const MAPLESLAB_POKE_BALL2
	const MAPLESLAB_POKE_BALL3
	const MAPLESLAB_GAMEBOY_KID
	const MAPLESLAB_LASS
	const MAPLESLAB_YOUNGSTER
	const MAPLESLAB_PAPER1
	const MAPLESLAB_PAPER2

MaplesLab_MapScripts:
	db 6 ; scene scripts
	scene_script .MeetMaple ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_MAPLESLAB_CANT_LEAVE
	scene_script .DummyScene2 ; SCENE_MAPLESLAB_NOTHING
	scene_script .DummyScene3 ; SCENE_MAPLESLAB_MEET_OFFICER
	scene_script .DummyScene4 ; SCENE_MAPLESLAB_UNUSED
	scene_script .DummyScene5 ; SCENE_MAPLESLAB_AIDE_GIVES_POTION

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .ChangeTiles

.MeetMaple:
	priorityjump .WalkUpToMaple
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

.WalkUpToMaple:
	applymovement PLAYER, MaplesLab_WalkUpToMapleMovement
	showemote EMOTE_SHOCK, MAPLESLAB_MAPLE, 15
	turnobject MAPLESLAB_MAPLE, DOWN
	opentext
	writetext MapleText_Intro
.MustSayYes:
	yesorno
	iftrue .MapleGetsEmail
	writetext MapleText_Refused
	jump .MustSayYes

.MapleGetsEmail:
	writetext MapleText_Splendid
	writetext MapleText_ChooseAPokemon
	waitbutton
	setscene SCENE_MAPLESLAB_CANT_LEAVE
	closetext
	end

.ChangeTiles
	checkevent EVENT_BEAT_ELITE_FOUR
	iffalse .WateredPlant
	changeblock 0, 0, $31
	changeblock 2, 0, $32

.WateredPlant:
	checkevent EVENT_GOT_TM_CUT
	iftrue .WaterPlant
	return
	
.WaterPlant:
	changeblock 8, 0, $30
	return

ProfMapleScript:
	faceplayer
	opentext
	checkevent EVENT_DECO_POSTER_7
	iftrue .AfterDiploma
	checkcode VAR_DEXCAUGHT
	ifequal NUM_POKEMON, .CompletedPokedex
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .Postgame
	checkevent EVENT_SHOWED_MAPLE_COGBADGE
	iftrue .AfterCogBadge
	checkflag ENGINE_COGBADGE
	iftrue .DefeatedBrother
	checkevent EVENT_BACKUP_REQUESTED
	iftrue .MetBrother
	checkcode VAR_BADGES
	ifgreater 0, .AfterFirstBadge
	checkevent EVENT_GOT_A_POKEMON_FROM_MAPLE
	iffalse ChooseAPokemon
	writetext MapleDescribesLeagueText
	waitbutton
	closetext
	end

.MetBrother
	writetext MapleMetBrotherText
	waitbutton
	closetext
	end

.DefeatedBrother
	writetext MapleDefeatedBrotherText
	waitbutton
	closetext
	setevent EVENT_SHOWED_MAPLE_COGBADGE
	end
	
.AfterFirstBadge:
	writetext MapleAfterBadgeText
	waitbutton
	closetext
	end
	
.AfterCogBadge:
	writetext MapleAfterCogbadgeText
	waitbutton
	closetext
	end

.Postgame:
	writetext MaplePostgameText
	waitbutton
	closetext
	end

.CompletedPokedex
	writetext MapleDiplomaText
	playsound SFX_DEX_FANFARE_230_PLUS
	waitsfx
	special Diploma
	writetext MapleSendDiplomaHomeText
	waitbutton
	setevent EVENT_DECO_POSTER_7
.AfterDiploma
	writetext MapleAfterDiplomaText
	waitbutton
	closetext
	end

ChooseAPokemon
	writetext MapleText_ChooseAPokemon
	waitbutton
	closetext
	end

LabTryToLeaveScript:
	turnobject MAPLESLAB_MAPLE, DOWN
	opentext
	writetext LabWhereGoingText
	waitbutton
	closetext
	applymovement PLAYER, MaplesLab_CantLeaveMovement
	end

CharmanderPokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_MAPLE
	iftrue LookAtMaplePokeBallScript
	turnobject MAPLESLAB_MAPLE, DOWN
	refreshscreen
	pokepic CHARMANDER
	cry CHARMANDER
	waitbutton
	closepokepic
	opentext
	writetext TakeCharmanderText
	yesorno
	iffalse DidntChooseStarterScript
	disappear MAPLESLAB_POKE_BALL1
	setevent EVENT_GOT_CHARMANDER_FROM_MAPLE
	writetext ChoseCharmanderText
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
	ifequal RIGHT, MapleAfterStarterScript
	applymovement PLAYER, AfterCharmanderMovement
	jump MapleAfterStarterScript

SquirtlePokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_MAPLE
	iftrue LookAtMaplePokeBallScript
	turnobject MAPLESLAB_MAPLE, DOWN
	refreshscreen
	pokepic SQUIRTLE
	cry SQUIRTLE
	waitbutton
	closepokepic
	opentext
	writetext TakeSquirtleText
	yesorno
	iffalse DidntChooseStarterScript
	disappear MAPLESLAB_POKE_BALL2
	setevent EVENT_GOT_SQUIRTLE_FROM_MAPLE
	writetext ChoseSquirtleText
	buttonsound
	waitsfx
	pokenamemem SQUIRTLE, MEM_BUFFER_0
	writetext ReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	givepoke SQUIRTLE, 10, BERRY
	closetext
	applymovement PLAYER, AfterSquirtleMovement
	jump MapleAfterStarterScript

BulbasaurPokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_MAPLE
	iftrue LookAtMaplePokeBallScript
	turnobject MAPLESLAB_MAPLE, DOWN
	refreshscreen
	pokepic BULBASAUR
	cry BULBASAUR
	waitbutton
	closepokepic
	opentext
	writetext TakeBulbasaurText
	yesorno
	iffalse DidntChooseStarterScript
	disappear MAPLESLAB_POKE_BALL3
	setevent EVENT_GOT_BULBASAUR_FROM_MAPLE
	writetext ChoseBulbasaurText
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
	applymovement PLAYER, AfterBulbasaurMovement
	jump MapleAfterStarterScript
	
.StandingLeft:
	turnobject PLAYER, UP
	jump MapleAfterStarterScript

DidntChooseStarterScript:
	writetext DidntChooseStarterText
	waitbutton
	closetext
	end

MapleAfterStarterScript:
	turnobject PLAYER, UP
	opentext
	writetext MapleText_LetYourMonBattleIt
	waitbutton
	closetext
	setevent EVENT_GOT_A_POKEMON_FROM_MAPLE
	setevent EVENT_RIVAL_CHERRYGROVE_CITY
	clearevent EVENT_PLAYERS_HOUSE_MOM_1
	setevent EVENT_PLAYERS_HOUSE_MOM_2
	setscene SCENE_MAPLESLAB_AIDE_GIVES_POTION
	setmapscene PAVONA_VILLAGE, SCENE_PAVONAVILLAGE_MEET_RIVAL
	setmapscene PLAYERS_HOUSE_1F, SCENE_FINISHED
	end

MapleDescribesLeagueScript:
	writetext MapleDescribesLeagueText
	waitbutton
	closetext
	end

LookAtMaplePokeBallScript:
	opentext
	writetext MaplePokeBallText
	waitbutton
	closetext
	end

AideScript_WalkPotion1:
	turnobject MAPLESLAB_MAPLES_AIDE, RIGHT
	showemote EMOTE_SHOCK, MAPLESLAB_MAPLES_AIDE, 15
	opentext
	writetext AideText_WaitUp
	waitbutton
	closetext	
	applymovement MAPLESLAB_MAPLES_AIDE, AideWalksRight1
	turnobject PLAYER, UP
	scall AideScript_GivePotion
	applymovement MAPLESLAB_MAPLES_AIDE, AideWalksLeft1
	end

AideScript_WalkPotion2:
	turnobject MAPLESLAB_MAPLES_AIDE, RIGHT
	showemote EMOTE_SHOCK, MAPLESLAB_MAPLES_AIDE, 15
	opentext
	writetext AideText_WaitUp
	waitbutton
	closetext	
	applymovement MAPLESLAB_MAPLES_AIDE, AideWalksRight2
	turnobject PLAYER, UP
	scall AideScript_GivePotion
	applymovement MAPLESLAB_MAPLES_AIDE, AideWalksLeft2
	end

AideScript_GivePotion:
	opentext
	writetext AideText_GivePokedex
	writetext MapleText_MissionFromMrPokemon
	playsound SFX_ITEM
	waitsfx
	setflag ENGINE_POKEDEX
	writetext AideText_AlwaysBusy
	buttonsound
	writetext AideText_GiveYouPokeballs
	buttonsound
	itemtotext POKE_BALL, MEM_BUFFER_1
	scall AideScript_ReceiveTheBalls
	giveitem POKE_BALL, 5
	writetext AideText_CatchTips
	waitbutton
	closetext
	setscene SCENE_MAPLESLAB_NOTHING
	blackoutmod PAVONA_VILLAGE
	end

AideScript_ReceiveTheBalls:
	jumpstd receiveitem
	end

MaplesAideScript:
	faceplayer
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .Postgame
	checkevent EVENT_GOT_TM_CUT
	iftrue .MapleGettingOrganized
	checkevent EVENT_GOT_A_POKEMON_FROM_MAPLE
	iffalse .MaplesAideNoMon
	checkflag ENGINE_POKEDEX
	iffalse AideScript_GivePotion
	jumptext AideText_CatchTips
	
.MaplesAideNoMon:
	jumptext AideText_SoExcited
	
.MapleGettingOrganized:
	jumptext AideText_MapleOrganized

.Postgame
	jumptext AideText_Postgame

MaplesLabLass:
	jumptextfaceplayer MaplesLabLassText
	
MaplesLabBugCatcher:
	opentext
	writetext MaplesLabBugCatcherText1
	waitbutton
	faceplayer
	writetext MaplesLabBugCatcherText2
	waitbutton
	turnobject LAST_TALKED, UP
	closetext
	end
	
MaplesLabGameboyKid:
	jumptextfaceplayer MaplesLabGameboyKidText

MaplesLabAlternateBookshelf:
	conditional_event EVENT_BEAT_ELITE_FOUR, .Script
	
.Script:
MaplesLabBookshelf:
	jumpstd difficultbookshelf


MaplesLabPlant:
	checkevent EVENT_GOT_TM_CUT
	iftrue .WateredPlant
	jumptext MaplesLabPlantText
	
.WateredPlant:
	jumptext MaplesLabWateredPlantText
	
MaplesLabBook:
	jumptext MaplesLabBookText
	
MaplesLabShifurBook:
	refreshscreen
	pokepic SHIFUR
	waitbutton
	closepokepic
	writebyte SHIFUR
	special SetSeenMon
	jumptext MaplesLabPictureBook

MaplesLab_WalkUpToMapleMovement:
	step UP
	step UP
	step UP
	step UP
	step LEFT
	turn_head UP
	step_end

MaplesLab_CantLeaveMovement:
	step UP
	step_end

AideWalksRight2:
	run_step RIGHT

AideWalksRight1:
	run_step RIGHT
	run_step RIGHT
	turn_head DOWN
	step_end

AideWalksLeft2:
	step LEFT

AideWalksLeft1:
	step LEFT
	step LEFT
	turn_head DOWN
	step_end

AfterCharmanderMovement:
	step RIGHT

AfterSquirtleMovement:
	step RIGHT

AfterBulbasaurMovement:
	step RIGHT
	step UP
	step_end

MapleText_Intro:
	text "MAPLE: <PLAY_G>!"
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
	
	para "and begin your"
	line "journey as a"
	cont "#MON trainer?"
	done

MapleText_Refused:
	text "Don't lie."
	
	para "Your mother told"
	line "me how excited"
	cont "you've been!"
	
	para "So what do"
	line "you say?"
	done

MapleText_MissionFromMrPokemon:
	text "<PLAYER> received"
	line "#DEX!"
	done

MapleText_Splendid:
	text "Splendid!"
	prompt

MapleText_ChooseAPokemon:
	text "You can select any"
	line "one of the"

	para "#MON contained"
	line "in these BALLs."

	para "You'll be that"
	line "#MON's first"
	cont "partner, <PLAY_G>!"

	para "Go on. Pick one!"
	done

MapleText_LetYourMonBattleIt:
	text "Now, the best way"
	line "to grow close with"
	cont "your new partner"
	cont "is to send it out"
	cont "into battle."
	
	para "<……><……><……>"
	
	para "Oh, don't worry!"
	
	para "#MON are fine"
	line "with battling"
	cont "alongside people."
	cont "In fact, some live"
	cont "for it!"
	
	para "If you want to see"
	line "for yourself, try"
	cont "talking to some of"
	cont "the trainers on"
	cont "ROUTE 2. They are"
	cont "always looking for"
	cont "a battle!"
	done

LabWhereGoingText:
	text "MAPLE: Wait! Where"
	line "are you going?"
	done

TakeCharmanderText:
	text "MAPLE: You'll take"
	line "CHARMANDER, the"
	cont "fire #MON?"
	done

TakeSquirtleText:
	text "MAPLE: Do you want"
	line "SQUIRTLE, the"
	cont "water #MON?"
	done

TakeBulbasaurText:
	text "MAPLE: So, you"
	line "like BULBASAUR,"
	cont "the grass #MON?"
	done

DidntChooseStarterText:
	text "MAPLE: Think it"
	line "over carefully."

	para "Your first partner"
	line "is important!"
	done

ChoseCharmanderText:
	text "MAPLE: Wow! That"
	line "one is quite the"
	cont "popular #MON!"
	done
	
ChoseSquirtleText:
	text "MAPLE: Hm… I did"
	line "not expect you to"
	cont "pick that #MON."
	done
	
ChoseBulbasaurText:
	text "MAPLE: You must"
	line "have aspirations"
	cont "of being number 1!"
	done

ReceivedStarterText:
	text "<PLAYER> received"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

MapleDirectionsText3:
	text "Best of luck on"
	line "your adventure!"
	
	para "I'm sure you and"
	line "your #MON will"
	cont "form a truly"
	cont "special bond."
	done

MapleDescribesLeagueText:
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
	cont "TOWN MAP if you"
	cont "get lost!"
	done
	
MapleMetBrotherText:
	text "Hello, <PLAYER>!"
	
	para "How is your adven-"
	line "ture coming along?"
	
	para "You came back from"
	line "RUGOSA CITY?"
	
	para "You know, my bro-"
	line "ther runs the GYM"
	cont "there."
	
	para "<……><……><……>"
	
	para "Oh my! I see!"
	
	para "If JOEL is asking"
	line "for your help, you"
	cont "must be shaping up"
	cont "to be quite the"
	cont "#MON TRAINER!"
	done
	
MapleDefeatedBrotherText:
	text "Yes, <PLAYER>?"
	line "Is there something"
	cont "you would like to"
	cont "tell me?"
	
	para "<……><……><……>"
	
	para "Wow! You took on"
	line "JOEL's GYM CHALLE-"
	cont "NGE? And you won?"
	
	para "That's marvelous!"
	
	para "Sadly, I don't get"
	line "the chance to see"
	cont "my brother often…"
	
	para "Work here has been"
	line "so hectic that I"
	cont "can hardly come"
	cont "home to visit…"
	
	para "<……><……><……>"
	
	para "I shouldn't ruin"
	line "your mood!"
	
	para "I am proud of you"
	line "for earning the"
	cont "COGBADGE! I could"
	cont "never defeat JOEL"
	cont "myself, truth be"
	cont "told."
	
	para "I would wish you"
	line "luck on the rest"
	cont "of your journey,"
	cont "but you don't need"
	cont "it! You will reach"
	cont "the #MON LEAGUE"
	cont "in no time!"
	done
	
MapleAfterBadgeText:
	text "Hello, <PLAYER>!"
	
	para "How is the #MON"
	line "I gave you doing?"
	
	para "If you want to be"
	line "a truly successful"
	cont "TRAINER, you need"
	cont "to use a variety"
	cont "of #MON."
	
	para "Every #MON has"
	line "its weaknesses,"
	cont "you must account"
	cont "for those when"
	cont "selecting a team!"
	done

MapleAfterCogbadgeText:
	text "<PLAYER>! Hello!"
	
	para "I'm happy you have"
	line "time to stop by"
	cont "and see us here-"
	cont "I know I hardly"
	cont "have time to do"
	cont "the same."
	
	para "Some day I will"
	line "become organized,"
	cont "I promise! Ha!"
	done

MaplePostgameText:
	text "<PLAYER>! Hello!"

	para "The BATTLE"
	line "SIMULATION is"
	cont "realy to use!"

	para "It has taken a lot"
	line "of hard work and"
	cont "determination, but"
	cont "my AIDE has"
	cont "created a wonder-"
	cont "ful tool for help-"
	cont "ing people learn"
	cont "about #MON!"
	done

MapleDiplomaText:
	text "Hello, <PLAYER>!"
	line "Do you have some-"
	cont "thing to tell me?"

	para "……………………"

	para "You completed the"
	line "#DEX?"

	para "That's marvelous!"

	para "You have earned"
	line "your DIPLOMA!"
	done

MapleSendDiplomaHomeText:
	text "I will send your"
	line "DIPLOMA home so"
	cont "you can hang it up"
	cont "in your room."
	done

MapleAfterDiplomaText:
	text "It's incredible"
	line "that you have"
	cont "captured every"
	cont "kind of #MON!"

	para "I hope this doesn't"
	line "mean you will stop"
	cont "visiting the LAB."
	done

MaplePokeBallText:
	text "It contains a"
	line "#MON caught by"
	cont "PROF.MAPLE."
	done

AideText_GiveYouPokeballs:
	text "Here, these will"
	line "also be useful to"
	cont "a new trainer."
	done

AideText_SoExcited:
	text "Not everyone gets"
	line "to pick one of our"
	cont "#MON to start"
	cont "out. You're very"
	cont "lucky."
	done
	
AideText_WaitUp:
	text "Wait, <PLAYER>!"
	line "Don't leave yet!"
	done
	
AideText_GivePokedex:
	text "PROF. MAPLE forgot"
	line "to give you this!"
	prompt

AideText_AlwaysBusy:
	text "A #DEX is one"
	line "of the most impor-"
	cont "tant tools for a"
	cont "trainer to have!"
	
	para "It will record"
	line "information on any"
	cont "#MON that you"
	cont "encounter."

	para "…You'll have to"
	line "excuse her, PROF."
	cont "MAPLE is still"
	cont "rather young and"
	cont "disorganized."
	
	para "I always have my"
	line "hands full trying"
	cont "to help out how-"
	cont "ever I can."
	done
	
AideText_CatchTips:
	text "You will need to"
	line "weaken a #MON"
	cont "before you are"
	cont "able to catch it."
	
	para "A strong #MON"
	line "may break free!"
	done

AideText_MapleOrganized:
	text "Oh, <PLAYER>!" 
	line "Nice to see you"
	cont "stop by!"

	para "PROF. MAPLE has"
	line "matured greatly"
	cont "since you first"
	cont "left here with"
	cont "your #MON."
	
	para "Not needing to"
	line "correct her mis-"
	cont "takes has made my"
	cont "job easier!"
	done

AideText_Postgame:
	text "Hello, <PLAYER>!"

	para "Did PROF.MAPLE"
	line "tell you about the"
	cont "project I've been"
	cont "working on?"

	para "I'm sorry to say"
	line "that it's not quite"
	cont "ready yet."

	para "She must have been"
	line "too excited to"
	cont "keep it a secret."

	para "I can't blame her,"
	line "I'm excited too!"
	done
	
MaplesLabBookText:
	text "It looks like a"
	line "book all about"
	cont "#MON."
	done
	
MaplesLabPlantText:
	text "This plant doesn't"
	line "look too good."
	
	para "Did someone forget"
	line "to water it?"
	done
	
MaplesLabWateredPlantText:
	text "This plant must be"
	line "getting lots of"
	cont "attention."
	
	para "It looks so"
	line "lively!"
	done
	
MaplesLabPictureBook:
	text "This looks like"
	line "a newly-discovered"
	cont "#MON!"
	done
	
MaplesLabLassText:
	text "If your #MON"
	line "get hurt, you"
	cont "should visit the"
	cont "PAVONA INN."
	
	para "My big sister runs"
	line "it!"
	done
	
MaplesLabBugCatcherText1:
	text "Hmm…"
	
	para "It says here that"
	line "SHIFUR is weak to"
	cont "FIRE and FIGHTING-"
	cont "type moves."
	done
	
MaplesLabBugCatcherText2:
	text "Have you ever seen"
	line "one? It looks"
	cont "really cool!"
	done
	
MaplesLabGameboyKidText:
	text "This is amazing!"
	
	para "They got every"
	line "character I could"
	cont "ever want in this"
	cont "game. Even the"
	cont "ones that nobody"
	cont "thought would ever"
	cont "happen!"
	done

MaplesLab_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  4, 11, PAVONA_VILLAGE, 3
	warp_event  5, 11, PAVONA_VILLAGE, 3
	warp_event  2,  0, MAPLES_LAB_ELEVATOR, 1

	db 4 ; coord events
	coord_event  4, 11, SCENE_MAPLESLAB_CANT_LEAVE, LabTryToLeaveScript
	coord_event  5, 11, SCENE_MAPLESLAB_CANT_LEAVE, LabTryToLeaveScript
	coord_event  4, 11, SCENE_MAPLESLAB_AIDE_GIVES_POTION, AideScript_WalkPotion1
	coord_event  5, 11, SCENE_MAPLESLAB_AIDE_GIVES_POTION, AideScript_WalkPotion2

	db 14 ; bg events
	bg_event  0,  1, BGEVENT_READ, MaplesLabBookshelf
	bg_event  1,  1, BGEVENT_IFNOTSET, MaplesLabAlternateBookshelf
	bg_event  2,  1, BGEVENT_IFNOTSET, MaplesLabAlternateBookshelf
	bg_event  3,  1, BGEVENT_READ, MaplesLabBookshelf
	bg_event  0,  5, BGEVENT_READ, MaplesLabBookshelf
	bg_event  1,  5, BGEVENT_READ, MaplesLabBookshelf
	bg_event  2,  5, BGEVENT_READ, MaplesLabBookshelf
	bg_event  6,  7, BGEVENT_READ, MaplesLabBookshelf
	bg_event  7,  7, BGEVENT_READ, MaplesLabBookshelf
	bg_event  8,  7, BGEVENT_READ, MaplesLabBookshelf
	bg_event  9,  7, BGEVENT_READ, MaplesLabBookshelf
	bg_event  8,  3, BGEVENT_READ, MaplesLabShifurBook
	bg_event  8,  9, BGEVENT_READ, MaplesLabBook
	bg_event  9,  1, BGEVENT_READ, MaplesLabPlant

	db 8 ; object events
	object_event  3,  6, SPRITE_PROFESSOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ProfMapleScript, -1
	object_event  2, 10, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MaplesAideScript, EVENT_BEAT_ELITE_FOUR
	object_event  0,  7, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CharmanderPokeBallScript, EVENT_CHARMANDER_POKEBALL_IN_MAPLES_LAB
	object_event  1,  7, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SquirtlePokeBallScript, EVENT_SQUIRTLE_POKEBALL_IN_MAPLES_LAB
	object_event  2,  7, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BulbasaurPokeBallScript, EVENT_BULBASAUR_POKEBALL_IN_MAPLES_LAB
	object_event  7,  1, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, MaplesLabGameboyKid, -1
	object_event  8, 10, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MaplesLabLass, -1
	object_event  8,  4, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MaplesLabBugCatcher, -1
