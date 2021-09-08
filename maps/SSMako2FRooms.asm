	const_def 2 ; object constants
	const SSMAKO2FROOMS_FANGIRL
	const SSMAKO2FROOMS_GENTLEMAN
	const SSMAKO2FROOMS_YOUNGSTER
	const SSMAKO2FROOMS_POKEFAN_M
	const SSMAKO2FROOMS_COOLTRAINER_F
	const SSMAKO2FROOMS_SUPER_NERD
	const SSMAKO2FROOMS_BUENA_SLEEPING
	const SSMAKO2FROOMS_CHAMPION

SSMako2FRooms_MapScripts:
	db 3 ; scene scripts
	scene_script .DummyScene0 ; SCENE_SSMAKO2FROOMS_DEFAULT
	scene_script .DummyScene1 ; SCENE_SSMAKO2FROOMS_FOLLOWING
	scene_script .DummyScene2 ; SCENE_SSMAKO2FROOMS_FINISHED

	db 0 ; callbacks
	
.DummyScene0:
	setmapscene SS_MAKO_2F, SCENE_SSMAKO2F_DEFAULT
	end

.DummyScene1:
.DummyScene2:
	end

TrainerGentlemanCharles:
	trainer GENTLEMAN, CHARLES, EVENT_BEAT_GENTLEMAN_CHARLES, GentlemanCharlesText, GentlemanCharlesWinText, 0, .Script

.Script:
	checkjustbattled
	iffalse .After
	copybytetovar wSSMako2FFightCount
	ifgreater  3, .End
	jump SSMako2FRoomsBattleCount
.After
	opentext
	writetext GentlemanCharlesAfterText
	waitbutton
	closetext
.End
	end

TrainerCooltrainerFHeidy:
	trainer COOLTRAINERF, HEIDY, EVENT_BEAT_COOLTRAINERF_HEIDY, CooltrainerFHeidyText, CooltrainerFHeidyWinText, 0, .Script

.Script:
	checkjustbattled
	iffalse .After
	copybytetovar wSSMako2FFightCount
	ifgreater  3, .End
	jump SSMako2FRoomsBattleCount
.After
	opentext
	writetext CooltrainerFHeidyAfterText
	waitbutton
	closetext
.End
	end

TrainerBeautyErin:
	trainer BEAUTY, ERIN, EVENT_BEAT_BEAUTY_ERIN, BeautyErinText, BeautyErinWinText, 0, .Script

.Script:
	checkjustbattled
	iffalse .After
	copybytetovar wSSMako2FFightCount
	ifgreater  3, .End
	jump SSMako2FRoomsBattleCount
.After
	opentext
	writetext BeautyErinAfterText
	waitbutton
	closetext
.End
	end

TrainerSuperNerdMax:
	trainer SUPER_NERD, MAX, EVENT_BEAT_SUPER_NERD_MAX, SuperNerdMaxText, SuperNerdMaxWinText, 0, .Script

.Script:
	checkjustbattled
	iffalse .After
	copybytetovar wSSMako2FFightCount
	ifgreater  3, .End
	jump SSMako2FRoomsBattleCount
.After
	opentext
	writetext SuperNerdMaxAfterText
	waitbutton
	closetext
.End
	end

TrainerPokefanMHans:
	trainer POKEFANM, HANS, EVENT_BEAT_POKEFANM_HANS, PokefanMHansText, PokefanMHansWinText, 0, .Script
	
.Script:
	checkjustbattled
	iffalse .After
	copybytetovar wSSMako2FFightCount
	ifgreater  3, .End
	jump SSMako2FRoomsBattleCount
.After
	opentext
	writetext PokefanMHansAfterText
	waitbutton
	closetext
.End
	end

TrainerSchoolboyOliver:
	trainer SCHOOLBOY, OLIVER, EVENT_BEAT_SCHOOLBOY_OLIVER, SchoolboyOliverText, SchoolboyOliverWinText, 0, .Script

.Script:
	faceobject PLAYER, SSMAKO2FROOMS_YOUNGSTER
	opentext
	writetext SchoolboyOliverAfterText
	waitbutton
	closetext
	turnobject SSMAKO2FROOMS_YOUNGSTER, UP
	copybytetovar wSSMako2FFightCount
	ifgreater  3, .End
	scall SSMako2FRoomsBattleCount
.End
	end
	
SSMako2FRoomsBattleCount:
	copybytetovar wSSMako2FFightCount
	addvar 1
	copyvartobyte wSSMako2FFightCount
	copybytetovar wSSMako2FFightCount
	ifequal  4, SSMakoSternCrowdCleared
	end

SSMakoSternCrowdCleared:
	faceobject PLAYER, SSMAKO2FROOMS_FANGIRL
	faceobject SSMAKO2FROOMS_FANGIRL, PLAYER
	opentext
	writetext SSMakoSternCrowdClearedText
	waitbutton
	closetext
	setevent EVENT_SS_MAKO_DECK_CLEARED
	end
	
SSMako2FRoomsChampion:
	faceplayer
	opentext
	writetext SSMako2FRoomsChampionText
	waitbutton
	closetext
	end

Rooms2FFangirlTeleport1:
	moveobject SSMAKO2FROOMS_FANGIRL,  2, 5
	jump Rooms2FFangirlContinueFolow

Rooms2FFangirlTeleport2:
	moveobject SSMAKO2FROOMS_FANGIRL, 16, 5
	jump Rooms2FFangirlContinueFolow

Rooms2FFangirlTeleport3:
	moveobject SSMAKO2FROOMS_FANGIRL, 30, 5
	jump Rooms2FFangirlContinueFolow

Rooms2FFangirlTeleport4:
	moveobject SSMAKO2FROOMS_FANGIRL,  4, 10
	jump Rooms2FFangirlContinueFolow

Rooms2FFangirlTeleport5:
	moveobject SSMAKO2FROOMS_FANGIRL, 18, 10
	jump Rooms2FFangirlContinueFolow

Rooms2FFangirlTeleport6:
	moveobject SSMAKO2FROOMS_FANGIRL, 32, 10
	jump Rooms2FFangirlContinueFolow

Rooms2FFangirlContinueFolow:
	appear SSMAKO2FROOMS_FANGIRL
	follow PLAYER, SSMAKO2FROOMS_FANGIRL
	setscene SCENE_SSMAKO2FROOMS_FOLLOWING
	setmapscene SS_MAKO_2F, SCENE_SSMAKO2F_DEFAULT
	end

SSMako2FRoomsFangirl:
	jumpstd emilycompanion

IceColdCoffee:
	jumptext IceColdCoffeeText
	
SSMakoJournals:
	jumptext SSMakoJournalsText
	
SSMakoTapes:
	jumptext SSMakoTapesText

GentlemanCharlesText:
	text "I'm taking my hands"
	line "off the wheel for"
	cont "this battle."
	
	para "My #MON know"
	line "what to do!"
	done
	
GentlemanCharlesWinText:
	text "What fun is a"
	line "battle if I alrea-"
	cont "dy know the out-"
	cont "come?"
	done
	
GentlemanCharlesAfterText:
	text "You know what the"
	line "problem with unce-"
	cont "rtainty is?"
	
	para "I can't tell when"
	line "it will cost me a"
	cont "battle."
	done
	
CooltrainerFHeidyText:
	text "Do you know the"
	line "full potential of"
	cont "your #MON?"
	done

CooltrainerFHeidyWinText:
	text "I need to learn"
	line "the limits of my"
	cont "own party!"
	done

CooltrainerFHeidyAfterText:
	text "Knowing that my"
	line "#MON is not as"
	cont "strong as it poss-"
	cont "ibly can be gives"
	cont "me purpose as a"
	cont "trainer!"
	done

BeautyErinText:
	text "…Sleepy, sleepy,"
	line "sleepy…………"

	para "…Zzzzz…"
	done

BeautyErinWinText:
	text "<……> <……>Yawn!"
	
	para "…Zzz…"
	done

BeautyErinAfterText:
	text "…She's still sound"
	line "asleep after the"
	cont "battle!"
	done
	
SuperNerdMaxText:
	text "Must you interrupt"
	line "me during my trai-"
	cont "ning?"
	
	para "You made me miss"
	line "the most important"
	cont "move!"
	done

SuperNerdMaxWinText:
	text "No! No! No!"
	line "This is all wrong!"

	para "I would never lose"
	line "in my own movies!"
	done

SuperNerdMaxAfterText:
	text "I'm always watching"
	line "battles on TV."

	para "Studying the moves"
	line "of others has got-"
	cont "ten me this far!"
	done
	
PokefanMHansText:
	text "A trainer?"
	line "Perfect!"

	para "My #MON can"
	line "work off every-"
	cont "thing they ate!"
	done

PokefanMHansWinText:
	text "Urgh… I'm just too"
	line "full to battle…"
	done

PokefanMHansAfterText:
	text "The tough part of"
	line "staying in these"
	cont "cabins is the won-"
	cont "derful buffet!"
	
	para "I just can never"
	line "resist!"
	done

SchoolboyOliverText:
	text "Do you mind? I am"
	line "very deep in my"
	cont "studies!"
	
	para "…On second"
	line "thought, I could"
	cont "put my theories to"
	cont "practice."
	done

SchoolboyOliverWinText:
	text "No way you won!"
	
	para "I studied every"
	line "possible outcome!"
	done

SchoolboyOliverAfterText:
	text "I must return to"
	line "my studies."
	
	para "There is too much"
	line "pressure on me to"
	cont "do well at the"
	cont "#MON LEAGUE!"
	done
	
SSMakoSternCrowdClearedText:
	text "EMILY: Hey,"
	line "<PLAYER>. Maybe the"
	cont "party has cleared"
	cont "out by now."
	
	para "Let's go check the"
	line "DECK out again!"
	done

IceColdCoffeeText:
	text "This mug is filled"
	line "with coffee."

	para "<……><……>"

	para "It's ice cold!"
	done
	
SSMakoJournalsText:
	text "The shelves are"
	line "stuffed with study"
	cont "materials and jou-"
	cont "rnals of battle"
	cont "strategies."
	done

SSMakoTapesText:
	text "These shelves are"
	line "packed with many"
	cont "video tapes."
	
	para "They seem to all"
	line "be labeled with"
	cont "battle names."
	done

SSMako2FRoomsChampionText:
	text "Huh? Who are you?"
	line "How did you get in"
	line "here?"

	para "<……><……>"

	para "<PLAYER>, huh?"

	para "Are you planning"
	line "to challenge the"
	cont "#MON LEAGUE?"

	para "Kid, you know how"
	line "many people try"
	cont "that challenge?"

	para "Most can't even"
	line "make it past the"
	cont "first member of"
	cont "the ELITE FOUR."

;	"I'm not trying to say it can't be done, but you have to be realistic. You're still young. There are people who challenge the LEAGUE that have been training for years."
	; Come up with something better than the above.
	done

SSMako2FRooms_MapEvents:
	db 0, 0 ; filler

	db 11 ; warp events
	warp_event  2,  5, SS_MAKO_2F, 2
	warp_event  3,  5, SS_MAKO_2F, 2
	warp_event 16,  5, SS_MAKO_2F, 3
	warp_event 17,  5, SS_MAKO_2F, 3
	warp_event 30,  5, SS_MAKO_2F, 4
	warp_event 31,  5, SS_MAKO_2F, 4
	warp_event 44,  9, SS_MAKO_2F, 5
	warp_event 45,  9, SS_MAKO_2F, 5
	warp_event  4, 10, SS_MAKO_2F, 6
	warp_event 18, 10, SS_MAKO_2F, 7
	warp_event 32, 10, SS_MAKO_2F, 8

	db 12 ; coord events
	coord_event  1,  5, SCENE_SSMAKO2FROOMS_DEFAULT, Rooms2FFangirlTeleport1
	coord_event  2,  4, SCENE_SSMAKO2FROOMS_DEFAULT, Rooms2FFangirlTeleport1
	coord_event  3,  5, SCENE_SSMAKO2FROOMS_DEFAULT, Rooms2FFangirlTeleport1
	coord_event 15,  5, SCENE_SSMAKO2FROOMS_DEFAULT, Rooms2FFangirlTeleport2
	coord_event 16,  4, SCENE_SSMAKO2FROOMS_DEFAULT, Rooms2FFangirlTeleport2
	coord_event 17,  5, SCENE_SSMAKO2FROOMS_DEFAULT, Rooms2FFangirlTeleport2
	coord_event 29,  5, SCENE_SSMAKO2FROOMS_DEFAULT, Rooms2FFangirlTeleport3
	coord_event 30,  4, SCENE_SSMAKO2FROOMS_DEFAULT, Rooms2FFangirlTeleport3
	coord_event 31,  5, SCENE_SSMAKO2FROOMS_DEFAULT, Rooms2FFangirlTeleport3
	coord_event  4, 11, SCENE_SSMAKO2FROOMS_DEFAULT, Rooms2FFangirlTeleport4
	coord_event 18, 11, SCENE_SSMAKO2FROOMS_DEFAULT, Rooms2FFangirlTeleport5
	coord_event 32, 11, SCENE_SSMAKO2FROOMS_DEFAULT, Rooms2FFangirlTeleport6

	db 8 ; bg events
	bg_event 14, 11, BGEVENT_READ, IceColdCoffee
	bg_event  0,  1, BGEVENT_READ, SSMakoJournals
	bg_event  1,  1, BGEVENT_READ, SSMakoJournals
	bg_event  5,  1, BGEVENT_READ, SSMakoJournals
	bg_event  6,  1, BGEVENT_READ, SSMakoJournals
	bg_event  7,  1, BGEVENT_READ, SSMakoJournals
	bg_event 28, 11, BGEVENT_READ, SSMakoTapes
	bg_event 29, 11, BGEVENT_READ, SSMakoTapes

	db 8 ; object events
	object_event 49, 15, SPRITE_FANGIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSMako2FRoomsFangirl, -1
	object_event 31,  3, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerGentlemanCharles, -1
	object_event  3,  3, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 0, TrainerSchoolboyOliver, -1
	object_event  4, 13, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 0, TrainerPokefanMHans, -1
	object_event 16, 3, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerCooltrainerFHeidy, -1
	object_event 30, 12, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 0, TrainerSuperNerdMax, -1
	object_event 14, 14, SPRITE_BUENA_SLEEPING, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 0, TrainerBeautyErin, -1
	object_event 45,  5, SPRITE_LANCE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSMako2FRoomsChampion, -1
