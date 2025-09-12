	const_def 2 ; object constants
	const PLAYERSHOUSE1F_MOM1
	const PLAYERSHOUSE1F_MOM2
	const PLAYERSHOUSE1F_MOM3
	const PLAYERSHOUSE1F_MOM4
	const PLAYERSHOUSE1F_MOM5
	const PLAYERSHOUSE1F_GRANNY
	const PLAYERSHOUSE1F_MAPLE
	const PLAYERSHOUSE1F_DAD

PlayersHouse1F_MapScripts:
	db 3 ; scene scripts
	scene_script .DummyScene0 ; SCENE_PLAYERSHOUSE1F_DEFAULT
	scene_script .DummyScene1 ; SCENE_PLAYERSHOUSE1F_FINISHED
	scene_script .PostGameScene ; SCENE_PLAYERSHOUSE1F_POSTGAME

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .HideObjects

.DummyScene0:
	end

.DummyScene1:
	end

.PostGameScene:
	turnobject PLAYERSHOUSE1F_MOM1, UP
	showemote EMOTE_SHOCK, PLAYERSHOUSE1F_MOM1, 15

	opentext
	writetext PostgameMomNoticePlayerText
	waitbutton
	closetext

	applymovement PLAYER, Postgame_PlayerApproachMom
	turnobject PLAYERSHOUSE1F_MOM1, RIGHT
	turnobject PLAYER, LEFT
	opentext
	writetext PostgameMomCongratulatePlayerText
	waitbutton
	closetext

	moveobject PLAYERSHOUSE1F_MAPLE, 6, 7
	appear PLAYERSHOUSE1F_MAPLE
	playsound SFX_ENTER_DOOR
	waitsfx
	turnobject PLAYER, DOWN
	turnobject PLAYERSHOUSE1F_MOM1, DOWN
	showemote EMOTE_QUESTION, PLAYERSHOUSE1F_MOM1, 30

	opentext
	writetext PostgameMapleInterruptText
	waitbutton
	writetext PostgameMomGreetMapleText
	waitbutton
	closetext
	applymovement PLAYERSHOUSE1F_MAPLE, Postgame_MapleApproachMom
	opentext
	writetext PostgameMapleGiftText
	waitbutton
	closetext
	applymovement PLAYERSHOUSE1F_MAPLE, Postgame_MapleApproachPlayer
	turnobject PLAYER, DOWN	

	opentext
	writetext PostgameMapleUpgradeTrainerCard
	waitbutton
	closetext
	playsound SFX_TRANSACTION
	setflag ENGINE_HAVE_BATTLE_PASS
	waitsfx
	opentext
	writetext PostgameMapleAfterTrainerCardUpgrade
	waitbutton
	closetext
	applymovement PLAYERSHOUSE1F_MAPLE, Postgame_MapleStepAway
	showemote EMOTE_SHOCK, PLAYERSHOUSE1F_MAPLE, 15
	opentext
	writetext PostgameMapleExplainSimulation
	waitbutton
	closetext
	applymovement PLAYERSHOUSE1F_MAPLE, Postgame_MapleLeaveHouse
	playsound SFX_EXIT_BUILDING
	disappear PLAYERSHOUSE1F_MAPLE
	waitsfx

	turnobject PLAYERSHOUSE1F_MOM1, RIGHT
	turnobject PLAYER, LEFT
	opentext
	writetext PostgameMomGotMailText
	waitbutton
	verbosegiveitem NORMAL_BOX
	iffalse .OpenNow
.DonePostgameScene
	writetext PostgameMomEndText
	waitbutton
	closetext
	setscene SCENE_FINISHED
	setmapscene ELKHORN_TOWN, SCENE_FINISHED
	setevent EVENT_PLAYERS_HOUSE_MOM_1
	setevent EVENT_GOT_A_POKEMON_FROM_MAPLE
	clearevent EVENT_PLAYERS_HOUSE_MOM_2
	disappear PLAYERSHOUSE1F_MOM3
	end

.OpenNow
	writetext NoRoomForNormalBoxText
	waitbutton
	closetext
	opentext
	writetext OpenSilverTrophyText
	playsound SFX_DEX_FANFARE_50_79
	waitsfx
	writetext PutSilverTrophyInRoomText
	waitbutton
	setevent EVENT_DECO_SILVER_TROPHY
	jump .DonePostgameScene

.HideObjects:
	checkscene
	ifnotequal SCENE_PLAYERSHOUSE1F_POSTGAME, .Dad
	disappear PLAYERSHOUSE1F_MOM2
.Dad:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .NoHide
	moveobject PLAYERSHOUSE1F_DAD,  -4, -3
	appear PLAYERSHOUSE1F_DAD
.NoHide:
	return

MeetMomScript:
	opentext
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Girl
	writetext BoyText
	waitbutton
	jump .After

.Girl
	writetext GirlText
	waitbutton
.After
	writetext HurryUpMapleIsWaitingText
	yesorno
	iffalse .Directions
	writetext MomGoodLuck
	waitbutton
	turnobject PLAYERSHOUSE1F_MOM1, LEFT
	closetext
	setevent EVENT_PLAYERS_HOUSE_MOM_1
	clearevent EVENT_PLAYERS_HOUSE_MOM_2
	end

.Directions
	writetext MaplesLabDirections
	waitbutton
	turnobject PLAYERSHOUSE1F_MOM1, LEFT
	closetext
	end

MomScript:
	faceplayer
	checkscene
	iffalse MeetMomScript ; SCENE_DEFAULT
.Outside
	opentext
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .Postgame
	checkevent EVENT_SHOWED_MOM_ALL_BADGES
	iftrue .AfterShownBadges
	checkflag ENGINE_RISINGBADGE
	iftrue .GotAllBadges
	checkflag ENGINE_GLACIERBADGE
	iftrue .GotTerraBadge
	checkflag ENGINE_COGBADGE
	iftrue .GotCogBadge
	checkflag ENGINE_ROOTBADGE
	iftrue .GotRootBadge
	checkflag ENGINE_SKULLBADGE
	iftrue .GotSkullBadge
	checkflag ENGINE_MYSTICBADGE
	iftrue .GotMysticBadge
	checkflag ENGINE_WAVEBADGE
	iftrue .GotWaveBadge
	checkflag ENGINE_FISTBADGE
	iftrue .GotFistBadge
	checkevent EVENT_GOT_A_POKEMON_FROM_MAPLE
	iftrue .GotAPokemon
	writetext HurryUpMapleIsWaitingText
	yesorno
	iffalse .Directions
	writetext MomGoodLuck
	waitbutton
	closetext
	turnobject PLAYERSHOUSE1F_MOM1, LEFT
	end

.Directions
	writetext MaplesLabDirections
	waitbutton
	closetext
	turnobject PLAYERSHOUSE1F_MOM1, LEFT
	end

.GotAPokemon:
	writetext SoWhatWasProfMaplesErrandText
	waitbutton
	checkevent EVENT_GOT_CHARMANDER_FROM_MAPLE
	iftrue .CheckCharmander
	checkevent EVENT_GOT_SQUIRTLE_FROM_MAPLE
	iftrue .CheckSquirtle
	writebyte BULBASAUR
.CheckForStarter
	special FindPartyMonThatSpecies
	iffalse .DontHaveStarter
	showemote EMOTE_HEART, LAST_TALKED, 15
	writetext MomHaveStarterText
	waitbutton
	closetext
	end

.DontHaveStarter
	writetext MomDontHaveStarterText
	waitbutton
	closetext
	end

.CheckCharmander:
	writebyte CHARMANDER
	jump .CheckForStarter

.CheckSquirtle:
	writebyte SQUIRTLE
	jump .CheckForStarter

.GotAllBadges:
	writetext MomAllBadgesText
	waitbutton
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Girl
	writetext MomAllBadgesBoyText
	jump .AfterShownBadges
.Girl:
	writetext MomAllBadgesGirlText
.AfterShownBadges:
	waitbutton
	setevent EVENT_SHOWED_MOM_ALL_BADGES
	writetext MomPokemonLeagueQualificationText
	waitbutton
	closetext
	end

.GotTerraBadge:
	checkflag ENGINE_PLAYER_IS_FEMALE
	writetext MomTerraBadgeBoyText
	jump .ContinueTerraBadge
	iftrue .Girl
	writetext MomTerraBadgeGirlText
.ContinueTerraBadge
	waitbutton
	writetext MomTerraBadgeText
	waitbutton
	closetext
	end

.GotCogBadge:
	writetext MomCogBadgeText
	waitbutton
	closetext
	end

.GotRootBadge:
	writetext MomRootBadgeText
	waitbutton
	closetext
	end

.GotSkullBadge:
	writetext MomSkullBadgeText
	waitbutton
	closetext
	end

.GotMysticBadge:
	writetext MomMysticBadgeText
	waitbutton
	closetext
	end

.GotWaveBadge:
	writetext MomWaveBadgeText
	waitbutton
	closetext
	end

.GotFistBadge:
	writetext MomFistBadgeText
	waitbutton
	closetext
	end

.Postgame:
	writetext MomPostgameText
	waitbutton
	closetext
	end

NeighborScript:
	faceplayer
	opentext
	checktime MORN
	iftrue .MornScript
	checktime DAY
	iftrue .DayScript
	checktime NITE
	iftrue .NiteScript

.MornScript:
	writetext NeighborMornIntroText
	buttonsound
	jump .Main

.DayScript:
	writetext NeighborDayIntroText
	buttonsound
	jump .Main

.NiteScript:
	writetext NeighborNiteIntroText
	buttonsound
	jump .Main

.Main:
	closetext
	turnobject PLAYERSHOUSE1F_GRANNY, RIGHT
	end

DadScript:
	faceplayer
	opentext
	checkevent EVENT_MET_DAD
	iffalse .DadIntroduction
	random 5
	ifequal 1, .SecondTextbox
	ifequal 2, .ThirdTextbox
	ifequal 3, .FourthTextbox
	ifequal 4, .FifthTextbox
	writetext DadText1
	jump .CloseText
.SecondTextbox
	writetext DadText2
	jump .CloseText
.ThirdTextbox
	writetext DadText3
	jump .CloseText
.FourthTextbox
	writetext DadText4
	jump .CloseText
.FifthTextbox
	writetext DadText5
.CloseText
	waitbutton
	closetext
	end

.DadIntroduction
	setevent EVENT_MET_DAD
	writetext MeetDadText
	waitbutton
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Girl
	writetext MeetDadBoyText
	waitbutton
	closetext
	end

.Girl
	writetext MeetDadGirlText
	waitbutton
	closetext
	end

TownMapSceneLeft:
	turnobject PLAYERSHOUSE1F_GRANNY, DOWN
	showemote EMOTE_SHOCK, PLAYERSHOUSE1F_GRANNY, 15
	opentext
	writetext NeighborGivesPotion1
	waitbutton
	closetext
	playmusic MUSIC_MOM
	turnobject PLAYER, LEFT
	showemote EMOTE_QUESTION, PLAYER, 15
	applymovement PLAYERSHOUSE1F_GRANNY, GrannyWalksToPlayerLeft
	scall TownMapPocketWatchScript
	applymovement PLAYER, MovementData_MoveForGranny
	applymovement PLAYERSHOUSE1F_GRANNY, MovementData_GrannyLeave1
	setscene SCENE_PLAYERSHOUSE1F_FINISHED
	playsound SFX_ENTER_DOOR
	disappear PLAYERSHOUSE1F_GRANNY
	waitsfx
	special RestartMapMusic
	setevent EVENT_PLAYERS_HOUSE_1F_NEIGHBOR
	end

TownMapSceneRight:
	turnobject PLAYERSHOUSE1F_GRANNY, DOWN
	showemote EMOTE_SHOCK, PLAYERSHOUSE1F_GRANNY, 15
	opentext
	writetext NeighborGivesPotion1
	waitbutton
	closetext
	playmusic MUSIC_MOM
	turnobject PLAYER, LEFT
	showemote EMOTE_QUESTION, PLAYER, 15
	applymovement PLAYERSHOUSE1F_GRANNY, GrannyWalksToPlayerRight
	scall TownMapPocketWatchScript
	applymovement PLAYERSHOUSE1F_GRANNY, MovementData_GrannyLeave2
	setscene SCENE_PLAYERSHOUSE1F_FINISHED
	playsound SFX_ENTER_DOOR
	disappear PLAYERSHOUSE1F_GRANNY
	waitsfx
	special RestartMapMusic
	setevent EVENT_PLAYERS_HOUSE_1F_NEIGHBOR
	end
	
TownMapPocketWatchScript:
	opentext
	writetext NeighborGivesPotion2
	waitbutton
	verbosegiveitem POCKET_WATCH
	writetext NeighborGivesPocketWatch
	waitbutton
	verbosegiveitem TOWN_MAP
	writetext NeighborGivesTownMap
	waitbutton
	closetext
	applymovement PLAYERSHOUSE1F_GRANNY, GrannyLeftTurn
	opentext
	writetext NeighborGivesPotion3
	waitbutton
	closetext
	applymovement PLAYERSHOUSE1F_GRANNY, GrannyRightTurn
	opentext
	writetext NeighborGivesPotion4
	waitbutton
	closetext
	end

TVScript:
	jumptext TVText

StoveScript:
	jumptext StoveText

SinkScript:
	jumptext SinkText

FridgeScript:
	jumptext FridgeText
	
GrannyWalksToPlayerLeft:
	step DOWN
	step DOWN
	step DOWN
	step RIGHT
	step_end

GrannyWalksToPlayerRight:
	step DOWN
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step_end
	
GrannyLeftTurn:
	turn_step LEFT
	step_end

GrannyRightTurn:
	turn_step RIGHT
	step_end

PlayerWalksToMomMovement:
	step LEFT
	step_end
	
MovementData_GrannyLeave1:
	step RIGHT
	turn_step DOWN
	step_end

MovementData_GrannyLeave2:
	turn_step DOWN
	step_end

MovementData_MoveForGranny:
	step RIGHT
	turn_step LEFT
	step_end

Postgame_PlayerApproachMom:
	step DOWN
	step DOWN
	step LEFT
	step_end

Postgame_MapleApproachMom:
	step UP
	step UP
	step RIGHT
	step UP
	step_resume

Postgame_MapleApproachPlayer:
	step RIGHT
	turn_head UP
	step_resume

Postgame_MapleStepAway:
	step DOWN
	step DOWN
	step LEFT
	step DOWN
	step_resume

Postgame_MapleLeaveHouse:
	turn_step DOWN
	step_resume

BoyText:
	text "I can't believe my"
	line "baby is ready to"
	cont "receive a #MON"
	cont "of his very own."
	
	para "I'm so excited"
	line "for you!"
	done
	
GirlText:
	text "I can't believe my"
	line "baby is ready to"
	cont "receive a #MON"
	cont "of her very own."
	
	para "I'm so excited"
	line "for you!"
	done
	
HurryUpMapleIsWaitingText:
	text "Go pay PROF. MAPLE"
	line "a visit. She will"
	cont "be expecting you."

	para "Do you remember"
	line "where her LAB is?"
	done
	
MaplesLabDirections:	
	text "Her LAB is in"
	line "PAVONA VILLAGE,"
	cont "right at the other"
	cont "end of ROUTE 1."
	
	para "Good luck, honey!"
	
	para "Be sure to pick a"
	line "good #MON!"
	done
	
MomGoodLuck:
	text "Alright baby,"
	line "good luck!"
	done

SoWhatWasProfMaplesErrandText:
	text "You chose a"
	line "#MON already?"
	
	para "Let me see!"
	done

MomHaveStarterText:
	text "Aw! It's adorable!"

	para "It's good to see"
	line "you inherited your"
	cont "mother's taste."
	done

MomDontHaveStarterText:
	text "Huh? This isn't one"
	line "of the #MON"
	cont "PROF.MAPLE had to"
	cont "choose from."

	para "But it's still"
	line "pretty cute."
	done

MomFistBadgeText:
	text "Back so soon," 
	line "<PLAYER>?"

	para "Oh my! You already"
	line "have a GYM BADGE?"

	para "That's amazing!"
	
	para "You're on your"
	line "first step toward"
	cont "greatness, baby!"
	done

MomWaveBadgeText:
	text "I always love when"
	line "you come back home"
	cont "to visit, <PLAYER>."

	para "I see you have the"
	line "BADGE from RIDGE"
	cont "VILLAGE now."

	para "Did you bring your"
	line "mother back some"
	cont "seashells?"

	para "I'm only kidding!"

	para "You're going to"
	line "need all the PACK"
	cont "space you can get!"
	done

MomMysticBadgeText:
	text "Welcome home,"
	line "<PLAYER>! Have you"
	cont "been up to any-"
	cont "thing exciting?"

	para "I've been seeing a"
	line "lot of NATU lately"
	cont "while tending to"
	cont "the garden."

	para "I'm sure it's"
	line "nothing compared"
	cont "to what you have"
	cont "been doing, but"
	cont "those little"
	cont "#MON always"
	cont "make me smile!"
	done

MomSkullBadgeText:
	text "Hi honey! Your"
	line "journey has been"
	cont "well, I hope!"
	
	para "You already won"
	line "the BADGE from"
	cont "HEPATICA TOWN?"

	para "That town is very"
	line "cold, isn't it?"

	para "I wish you had"
	line "told me you were"
	cont "going! I would"
	cont "have gotten you"
	cont "a pair of mittens!"
	done

MomRootBadgeText:
	text "Hi <PLAYER>!"

	para "You'll never"
	line "believe what I saw"
	cont "the other day!"

	para "While I was out"
	line "in the garden, a"
	cont "POLIWHIRL hopped"
	cont "out of the pond"
	cont "and helped water"
	cont "the flowers!"

	para "It was adorable!"
	line "Can you catch a"
	cont "POLIWHIRL for me?"
	done

MomCogBadgeText:
	text "<PLAYER>, honey!"
	line "How are you?"

	para "You just won the"
	line "BADGE from RUGOSA"
	cont "CITY? That's great!"

	para "Is PROF. MAPLE's"
	line "brother still the"
	cont "leader there?"

	para "I used to babysit"
	line "him!"
	done

MomTerraBadgeBoyText:
	text "Welcome home! How"
	line "is my little man's"
	cont "journey going?"
	done

MomTerraBadgeGirlText:
	text "Welcome home! How"
	line "is my little girl's"
	cont "journey going?"
	done

MomTerraBadgeText:
	text "You have 7 BADGEs?"

	para "Wow! You got those"
	line "fast!"

	para "Where is your next"
	line "one?"

	para "…………………………"

	para "ORCHID CITY?"

	para "Remember to drink"
	line "lots of water."
	cont "ORCHID CITY is a"
	cont "very warm place!"

	para "Be careful, babe!"
	line "I know you can win"
	cont "your final BADGE!"
	done

MomAllBadgesText:
	text "How nice of you to"
	line "come home and"
	cont "visit <PLAYER>!"

	para "Oh my goodness!"

	para "You won every"
	line "BADGE?"
	done

MomAllBadgesBoyText:
	text "My little boy"
	line "really did it!"
	done

MomAllBadgesGirlText:
	text "My little girl"
	line "really did it!"
	done

MomPokemonLeagueQualificationText:
	text "I knew you could!"

	para "That means you've"
	line "qualified for the"
	cont "#MON LEAGUE!"
	cont "I'm so proud of"
	cont "you!"

	para "I'll be supporting"
	line "you all the way,"
	cont "honey! I know you"
	cont "can win it!"
	done

MomAfterCreditsMorningText:
	text "Good morning,"
	line "sleepyhead!"
	done

MomAfterCreditsDayText:
	text "There you are!"
	line "I was worried you'd"
	cont "sleep all day!"
	done

MomAfterCreditsNiteText:
	text "Oh, honey! #MON"
	line "training has"
	cont "really messed up"
	cont "your sleeping"
	cont "pattern!"
	done

MomAfterCreditsVisitorText:
	text "PROF. MAPLE"
	line "dropped by earlier"
	cont "while you were"
	cont "still asleep."

	para "Go visit her LAB"
	line "when you get the"
	cont "chance. I know you"
	cont "must be rather"
	cont "busy signing auto-"
	cont "graphs, <PLAYER>!"

	para "Or should I say,"
	line "CHAMPION <PLAYER>?"

	para "Just don't forget"
	line "about home now"
	cont "you're a big famous"
	cont "#MON trainer!"
	done

MomCongratulationsText:
	text "Hi, honey! I'm so"
	line "glad you can find"
	cont "time to come home"
	cont "and see your MOM!"

	para "You must be so"
	line "busy these days,"
	cont "but I'm proud of"
	cont "you, <PLAYER>!"
	done

ImBehindYouText:
	text "<PLAYER>, do it!"

	para "I'm behind you all"
	line "the way!"
	done

NeighborMornIntroText:
	text "Good morning,"
	line "<PLAY_G>!"

	para "I'm visiting!"
	done

NeighborDayIntroText:
	text "Hello, <PLAY_G>!"
	line "I'm visiting!"
	done

NeighborNiteIntroText:
	text "Good evening,"
	line "<PLAY_G>!"

	para "I'm visiting!"
	done

NeighborGivesPotion1:
	text "Leaving so soon,"
	line "<PLAY_G>?"
	done

NeighborGivesPotion2:
	text "I got you some-"
	line "thing to help out"
	cont "on the start of"
	cont "your adventure!"
	done
	
NeighborGivesPocketWatch:
	text "That POCKET WATCH"
	line "will tell you the"
	cont "time whenever you"
	cont "want. Be sure to"
	cont "adjust it for DST."
	
	para "That watch has"
	line "been passed down"
	cont "over generations."
	
	para "I have no grand-"
	line "children, so I am"
	cont "passing this watch"
	cont "down to you."
	
	para "I want you to have"
	line "this too."
	done
	
NeighborGivesTownMap:
	text "A traveler should"
	line "always have a map."
	
	para "You never know"
	line "when it will be"
	cont "useful."
	done
	
NeighborGivesPotion3:
	text "It was so long ago"
	line "I began my own"
	cont "journey."
	
	para "I was but a little"
	line "girl at the time…"
	done

NeighborGivesPotion4:
	text "I shouldn't waste"
	line "your time with my"
	cont "stories."

	para "You will make"
	line "plenty of your"
	cont "own in time."

	para "Good luck on"
	line "journey! Come"
	cont "visit any time."
	done

PostgameMomNoticePlayerText:
	text "MOM: There's my"
	line "little CHAMPION!"
	done

PostgameMomCongratulatePlayerText:
	text "I didn't want to"
	line "bother you when"
	cont "you got home, you"
	cont "seemed exhausted!"

	para "I'm so proud of my"
	line "baby for becoming"
	cont "the CHAMPION!"
	done

PostgameMapleInterruptText:
	text "MAPLE: Sorry to"
	line "intrude."

	para "I hope I'm not"
	line "interrupting any-"
	cont "thing."
	done

PostgameMomGreetMapleText:
	text "MOM: Oh, PROF."
	line "MAPLE! Welcome!"

	para "I was just congra-"
	line "tulating <PLAYER>"
	cont "for winning at the"
	cont "#MON LEAGUE."
	done

PostgameMapleGiftText:
	text "MAPLE: You must be"
	line "quite proud of"
	cont "your child."

	para "I wish I could"
	line "have seen the"
	cont "battle in person."

	para "I actually came to"
	line "visit because I"
	cont "have something to"
	cont "tell <PLAYER>."
	done

PostgameMapleUpgradeTrainerCard:
	text "The BATTLE SUBWAY"
	line "in PECTINIA CITY"
	cont "has opened up!"

	para "It's a place where"
	line "you can battle all"
	cont "kinds of trainers."

	para "Before you go over"
	line "there, let me see"
	cont "your TRAINER CARD"
	cont "for a second…"
	done

PostgameMapleAfterTrainerCardUpgrade:
	text "There! Now your"
	line "TRAINER CARD will"
	cont "keep track of the"
	cont "BP you've earned."

	para "BATTLE POINTS, or"
	line "BP, is what the"
	cont "BATTLE SUBWAY"
	cont "gives out for"
	cont "each victory."

	para "You can trade in"
	line "your BP for all"
	cont "kinds of items."
	done

PostgameMapleExplainSimulation:
	text "Oh! I had nearly"
	line "forgotten!"

	para "My AIDE and I have"
	line "been busy making"
	cont "an expansion to"
	cont "the LAB."

	para "I need to get back"
	line "there to make some"
	cont "finishing touches."

	para "You should stop by"
	line "and see what we've"
	cont "been up to!"
	done

PostgameMomGotMailText:
	text "The BATTLE SUBWAY,"
	line "huh? Sounds just"
	cont "right for you."

	para "Oh! I nearly"
	line "forgot!"

	para "There was a"
	line "package delivered"
	cont "for you earlier."

	para "I wonder what it"
	line "could be."
	done

NoRoomForNormalBoxText:
	text "Since you don't"
	line "have room for it,"
	cont "I'll just open it"
	cont "for you here."
	done

OpenSilverTrophyText:
	text "Oh wow! It's a"
	line "SILVER TROPHY!"
	done

PutSilverTrophyInRoomText:
	text "I'll just put this"
	line "up in your room."
	done

PostgameMomEndText:
	text "You've had such an"
	line "exciting journey"
	cont "so far, and I bet"
	cont "this is only the"
	cont "beginning!"

	para "Maybe you could"
	line "see what the GYM"
	cont "LEADERs have been"
	cont "up to since you"
	cont "challenged them."

	para "Whatever you end"
	line "up doing, I want"
	cont "you to know that"
	cont "your father and I"
	cont "are so proud of"
	cont "everything you've"
	cont "accomplished!"

	para "I'm excited to see"
	line "what you do next."

	para "I'm always rooting"
	line "for you, baby!"
	done

MomPostgameText:
	text "I still can't"
	line "believe that my"
	cont "baby has won the"
	cont "#MON LEAGUE."

	para "I hope you don't"
	line "get too busy to"
	cont "come home and"
	cont "visit every once"
	cont "in a while."

	para "I know your father"
	line "missed you a ton."
	done

MeetDadText:
	text "DAD: <PLAYER>!"
	line "Your mother told"
	cont "me all about the"
	cont "adventure you had."

	para "I'm sorry I wasn't"
	line "there for you. I"
	cont "was just so busy"
	cont "with my work."
	done

MeetDadBoyText:
	text "But from now on,"	
	line "I'll always be here"
	cont "for my boy!"
	done

MeetDadGirlText:
	text "But from now on,"	
	line "I'll always be here"
	cont "for my girl!"
	done

DadText1:
	text "Hey there, CHAMP!"

	para "I hope that you"
	line "never let anything"
	cont "get in your way of"
	cont "becoming the best"
	cont "trainer around."

	para "Your mother and I"
	line "know you have it"
	cont "in you!"
	done

DadText2:
	text "Hey CHAMP!"

	para "When are you going"
	line "to teach your"
	cont "mother and me how"
	cont "to battle #MON"
	cont "like you?"

	para "Haha! You have so"
	line "much to teach us!"
	done

DadText3:
	text "I look forward to"
	line "your mother's cook-"
	cont "ing all day when"
	cont "I'm at work."

	para "It's my favorite"
	line "part of the day,"
	cont "tied with when you"
	cont "come home."
	done

DadText4:
	text "How are your"
	line "#MON treating"
	cont "you, <PLAYER>?"

	para "They must be proud"
	line "of you for train-"
	cont "ing them so well!"

	para "Are you proud of"
	line "them too?"
	done

DadText5:
	text "Now that work has"
	line "let up a bit, I'll"
	cont "be sure to catch"
	cont "all of your"
	cont "battles on TV!"
	done

StoveText:
	text "Mom's specialty!"

	para "MOLTEN PEAK"
	line "HOT WINGS!"
	done

SinkText:
	text "The sink is spot-"
	line "less. Mom likes it"
	cont "clean."
	done

FridgeText:
	text "Let's see what's"
	line "in the fridge…"

	para "FRESH WATER and"
	line "tasty LEMONADE!"
	done

TVText:
	text "There's a movie on"
	line "TV: A car exploded"
	cont "into a flash of"
	cont "light, leaving a"
	cont "trail of fire!"

	para "I better make like"
	line "a tree and get out"
	cont "of here!"
	done

PlayersHouse1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  6,  7, ELKHORN_TOWN, 1
	warp_event  7,  7, ELKHORN_TOWN, 1
	warp_event  9,  0, PLAYERS_HOUSE_2F, 1

	db 2 ; coord events
	coord_event  6,  7, SCENE_PLAYERSHOUSE1F_DEFAULT, TownMapSceneLeft
	coord_event  7,  7, SCENE_PLAYERSHOUSE1F_DEFAULT, TownMapSceneRight

	db 4 ; bg events
	bg_event  0,  1, BGEVENT_READ, StoveScript
	bg_event  1,  1, BGEVENT_READ, SinkScript
	bg_event  2,  1, BGEVENT_READ, FridgeScript
	bg_event  4,  1, BGEVENT_READ, TVScript

	db 8 ; object events
	object_event  7,  3, SPRITE_VARIABLE_MOM, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_GOT_A_POKEMON_FROM_MAPLE
	object_event  7,  3, SPRITE_VARIABLE_MOM, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, DAY, 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_1
	object_event  2,  2, SPRITE_VARIABLE_MOM, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, NITE, 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_1
	object_event  7,  3, SPRITE_VARIABLE_MOM, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, DAY, 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_2
	object_event  0,  2, SPRITE_VARIABLE_MOM, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, NITE, 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_2
	object_event  4,  4, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, NeighborScript, EVENT_PLAYERS_HOUSE_1F_NEIGHBOR
	object_event -4, -4, SPRITE_PROFESSOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  4,  3, SPRITE_VARIABLE_DAD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, NITE, 0, OBJECTTYPE_SCRIPT, 0, DadScript, -1
