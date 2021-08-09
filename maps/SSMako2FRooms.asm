	const_def 2 ; object constants
	const SSMAKO2FROOMS_FANGIRL

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

; Use wSSMako2FFightCount to keep track of how many battles the trainer has had. After X many battles, have Emily mention that it might be a good idea to see if the people on the deck have moved. Set the event to despawn them.
	; "EMILY: Do you think the crowd outside has dispersed? Let's go check it out again!"
; loadvar wSSMako2FFightCount, 1 (2, 3, 4, etc.), keep increasing the value even after hitting the required amount so that the message won't pop up after every battle.
	
TrainerGentlemanCharles:
	trainer GENTLEMAN, CHARLES, EVENT_BEAT_GENTLEMAN_CHARLES, GentlemanCharlesText, GentlemanCharlesWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GentlemanCharlesAfterText
	waitbutton
	closetext
	end

TrainerPokefanFIlene:
	trainer POKEFANF, ILENE, EVENT_BEAT_POKEFANF_ILENE, PokefanFIleneText, PokefanFIleneWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanFIleneAfterText
	waitbutton
	closetext
	end

TrainerBeautyErin:
	trainer BEAUTY, ERIN, EVENT_BEAT_BEAUTY_ERIN, BeautyErinText, BeautyErinWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BeautyErinAfterText
	waitbutton
	closetext
	end

TrainerSuperNerdMax:
	trainer SUPER_NERD, MAX, EVENT_BEAT_SUPER_NERD_MAX, SuperNerdMaxText, SuperNerdMaxWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SuperNerdMaxAfterText
	waitbutton
	closetext
	end

TrainerPokefanMHans:
	trainer POKEFANM, HANS, EVENT_BEAT_POKEFANM_HANS, PokefanMHansText, PokefanMHansWinText, 0, .Script
	
.Script:
	endifjustbattled
	opentext
	writetext PokefanMHansAfterText
	waitbutton
	closetext
	end

TrainerSchoolboyOliver:
	trainer SCHOOLBOY, OLIVER, EVENT_BEAT_SCHOOLBOY_OLIVER, SchoolboyOliverText, SchoolboyOliverWinText, 0, .Script
	
	turnobject LAST_TALKED, UP
	end

.Script:
;	endifjustbattled
	opentext
	writetext SchoolboyOliverAfterText
	waitbutton
	closetext
	turnobject LAST_TALKED, UP
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
	moveobject SSMAKO2FROOMS_FANGIRL, 44, 9
	jump Rooms2FFangirlContinueFolow
	
Rooms2FFangirlTeleport5:
	moveobject SSMAKO2FROOMS_FANGIRL,  4, 10
	jump Rooms2FFangirlContinueFolow
	
Rooms2FFangirlTeleport6:
	moveobject SSMAKO2FROOMS_FANGIRL, 18, 10
	jump Rooms2FFangirlContinueFolow
	
Rooms2FFangirlTeleport7:
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

GentlemanCharlesText:
	text "I'm taking my hands"
	line "off the wheel for"
	cont "this battle."
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
	
PokefanFIleneText:
	text "I can still turn"
	line "heads just as well"
	cont "as any BEAUTY!"
	done
	
PokefanFIleneWinText:
	text "What? Old?"

	para "Hmph!"

	para "You must need"
	line "glasses!"
	done

PokefanFIleneAfterText:
	text "I don't care about"
	line "a child's opinion"
	cont "on my appearance"
	cont "anyway!"
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
	text "I lost."
	done

PokefanMHansAfterText:
	text "The tough part of"
	line "staying in these"
	cont "cabins is the won-"
	cont "derful buffet!"
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
	text "I refuse to accept"
	line "that loss!"
	
	para "I considered all"
	line "possibilities!"
	done

SchoolboyOliverAfterText:
	text "I must return to"
	line "my studies."
	
	para "There is too much"
	line "pressure on me to"
	cont "do well at the"
	cont "#MON LEAGUE!"
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

	db 15 ; coord events
	coord_event  1,  5, SCENE_SSMAKO2FROOMS_DEFAULT, Rooms2FFangirlTeleport1
	coord_event  2,  4, SCENE_SSMAKO2FROOMS_DEFAULT, Rooms2FFangirlTeleport1
	coord_event  3,  5, SCENE_SSMAKO2FROOMS_DEFAULT, Rooms2FFangirlTeleport1
	coord_event 15,  5, SCENE_SSMAKO2FROOMS_DEFAULT, Rooms2FFangirlTeleport2
	coord_event 16,  4, SCENE_SSMAKO2FROOMS_DEFAULT, Rooms2FFangirlTeleport2
	coord_event 17,  5, SCENE_SSMAKO2FROOMS_DEFAULT, Rooms2FFangirlTeleport2
	coord_event 29,  5, SCENE_SSMAKO2FROOMS_DEFAULT, Rooms2FFangirlTeleport3
	coord_event 30,  4, SCENE_SSMAKO2FROOMS_DEFAULT, Rooms2FFangirlTeleport3
	coord_event 31,  5, SCENE_SSMAKO2FROOMS_DEFAULT, Rooms2FFangirlTeleport3
	coord_event 43,  9, SCENE_SSMAKO2FROOMS_DEFAULT, Rooms2FFangirlTeleport4
	coord_event 44,  8, SCENE_SSMAKO2FROOMS_DEFAULT, Rooms2FFangirlTeleport4
	coord_event 45,  9, SCENE_SSMAKO2FROOMS_DEFAULT, Rooms2FFangirlTeleport4
	coord_event  4, 11, SCENE_SSMAKO2FROOMS_DEFAULT, Rooms2FFangirlTeleport5
	coord_event 18, 11, SCENE_SSMAKO2FROOMS_DEFAULT, Rooms2FFangirlTeleport6
	coord_event 32, 11, SCENE_SSMAKO2FROOMS_DEFAULT, Rooms2FFangirlTeleport7

	db 6 ; bg events
	bg_event 14, 11, BGEVENT_READ, IceColdCoffee
	bg_event  0,  1, BGEVENT_READ, SSMakoJournals
	bg_event  1,  1, BGEVENT_READ, SSMakoJournals
	bg_event  5,  1, BGEVENT_READ, SSMakoJournals
	bg_event  6,  1, BGEVENT_READ, SSMakoJournals
	bg_event  7,  1, BGEVENT_READ, SSMakoJournals

	db 7 ; object events
	object_event 49, 15, SPRITE_FANGIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSMako2FRoomsFangirl, -1
	object_event 30,  2, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerGentlemanCharles, -1
	object_event  3,  3, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 0, ObjectEvent, -1
	object_event  4, 13, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 0, TrainerPokefanMHans, -1
	object_event 16, 3, SPRITE_POKEFAN_F, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerPokefanFIlene, -1
	object_event 30, 12, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 0, TrainerSuperNerdMax, -1
	object_event 14, 14, SPRITE_BUENA_SLEEPING, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 0, TrainerBeautyErin, -1
