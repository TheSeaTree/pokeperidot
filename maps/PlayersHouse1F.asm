	const_def 2 ; object constants
	const PLAYERSHOUSE1F_MOM1
	const PLAYERSHOUSE1F_MOM2
	const PLAYERSHOUSE1F_MOM3
	const PLAYERSHOUSE1F_MOM4
	const PLAYERSHOUSE1F_GRANNY

PlayersHouse1F_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 0 ; callbacks

.DummyScene0:
	end

.DummyScene1:
	end

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
	jump .After
	
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
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	checkscene
	iffalse MeetMomScript ; SCENE_DEFAULT
	opentext
	checkevent EVENT_SHOWED_MOM_ALL_BADGES
	iftrue .AfterShownBadges
	checkflag ENGINE_RISINGBADGE
	iftrue .GotAllBadges
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
	closetext
	end

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
	setscene SCENE_FINISHED
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
	setscene SCENE_FINISHED
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
	line "where her lab is?"
	done
	
MaplesLabDirections:	
	text "Her lab is in"
	line "PAVONA VILLAGE,"
	cont "right at the other"
	cont "end of Route 1."
	
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
	
	para "Aw! It's adorable!"

	para "It's good to see"
	line "you inherited"
	cont "my taste."
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

	para "Go visit her lab"
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
	coord_event  6,  7, SCENE_DEFAULT, TownMapSceneLeft
	coord_event  7,  7, SCENE_DEFAULT, TownMapSceneRight

	db 4 ; bg events
	bg_event  0,  1, BGEVENT_READ, StoveScript
	bg_event  1,  1, BGEVENT_READ, SinkScript
	bg_event  2,  1, BGEVENT_READ, FridgeScript
	bg_event  4,  1, BGEVENT_READ, TVScript

	db 5 ; object events
	object_event  7,  3, SPRITE_REDS_MOM, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_1
	object_event  2,  2, SPRITE_REDS_MOM, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, MORN, 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_2
	object_event  7,  3, SPRITE_REDS_MOM, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, DAY, 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_2
	object_event  0,  2, SPRITE_REDS_MOM, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, NITE, 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_2
	object_event  4,  4, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, NeighborScript, EVENT_PLAYERS_HOUSE_1F_NEIGHBOR
