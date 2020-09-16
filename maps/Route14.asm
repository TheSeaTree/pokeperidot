	const_def 2 ; object constants
	const ROUTE_14_TUTOR
	const ROUTE_14_ODDISH

Route14_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
TrainerLadTristan:
	trainer LAD, TRISTAN, EVENT_BEAT_LAD_TRISTAN, LadTristanText, LadTristanWinText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext LadTristanAfterText
	waitbutton
	closetext
	end
	
TrainerTwinLeah:
	trainer TWINS, LEAHANDMIA1, EVENT_BEAT_TWINS_LEAH_AND_MIA, TwinLeahText, TwinLeahWinText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext TwinLeahAfterText
	waitbutton
	closetext
	end
	
TrainerTwinMia:
	trainer TWINS, LEAHANDMIA2, EVENT_BEAT_TWINS_LEAH_AND_MIA, TwinMiaText, TwinMiaWinText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext TwinMiaAfterText
	waitbutton
	closetext
	end
	
TrainerBugCatcherCarlos:
	trainer BUG_CATCHER, CARLOS, EVENT_BEAT_BUG_CATCHER_CARLOS, BugCatcherCarlosText, BugCatcherCarlosWinText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext BugCatcherCarlosAfterText
	waitbutton
	closetext
	end
	
TrainerLassGinger:
	trainer LASS, GINGER, EVENT_BEAT_LASS_GINGER, LassGingerText, LassGingerWinText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext LassGingerAfterText
	waitbutton
	closetext
	end

TrainerPsychicWes:
	trainer PSYCHIC_T, WES, EVENT_BEAT_PSYCHIC_WES, PsychicWesText, PsychicWesWinText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext PsychicWesAfterText
	waitbutton
	closetext
	end
	
TrainerLassKelly:
	trainer LASS, KELLY, EVENT_BEAT_LASS_KELLY, LassKellyText, LassKellyWinText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext LassKellyAfterText
	waitbutton
	closetext
	end

TrainerTeacherLisa:
	trainer TEACHER, LISA, EVENT_BEAT_TEACHER_LISA, TeacherLisaText, TeacherLisaWinText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext TeacherLisaAfterText
	waitbutton
	closetext
	end
	
TrainerSuperNerdSandy:
	trainer SUPER_NERD, SANDY, EVENT_BEAT_SUPER_NERD_SANDY, SuperNerdSandyText, SuperNerdSandyWinText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext SuperNerdSandyAfterText
	waitbutton
	closetext
	end
	
Route14MoveTutor:
	applymovement ROUTE_14_TUTOR, Route14TutorDance
	faceplayer
	opentext
	writetext Route14TutorText
	waitbutton
	applymovement ROUTE_14_TUTOR, Route14TutorDance
	faceplayer
	writetext Route14TutorDanceText
	waitbutton
	checkitem GOLD_LEAF
	iffalse .NoLeaf
	applymovement ROUTE_14_TUTOR, Route14TutorDance
	faceplayer
	writetext Route14TutorTeach
	yesorno
	iftrue .PetalDance
	jump .Refused
	
.PetalDance
	writetext Route14TutorWhichOne
	buttonsound
	writebyte PETAL_DANCE
	special MoveTutor
	ifequal $0, .TeachMove
	jump .Refused

.TeachMove
	takeitem SILVER_LEAF
	writetext Route14TutorThankYou
	waitbutton
	applymovement ROUTE_14_TUTOR, Route14TutorDance
	faceplayer
	applymovement PLAYER, Route14TutorDance
	closetext
	end
	
.Refused
	writetext Route14TutorRefused
	waitbutton
	closetext
	end
	
.NoLeaf
	writetext Route14TutorExplainSilverLeaf
	waitbutton
	turnobject LAST_TALKED, DOWN
	closetext
	end
	
BlackGlassesGuy:
	faceplayer
	opentext
	checkevent EVENT_GOT_BLACKGLASSES
	iftrue .GotGlasses
	writetext Route14BlackGlassesGuy
	checkevent EVENT_GOT_TM_SUNNY_DAY
	waitbutton
	iftrue .GiveGlasses
	closetext
	end

.GiveGlasses:
	writetext Route14GiveBlackGlasses
	waitbutton
	verbosegiveitem BLACKGLASSES
	waitbutton
	closetext
	setevent EVENT_GOT_BLACKGLASSES
	end
	
.GotGlasses:
	writetext Route14ExplainBlackGlasses
	waitbutton
	closetext
	end
	
Route14CaveGuard:
	jumptextfaceplayer Route14CaveGuardText
	
Route14UltraBall:
	itemball ULTRA_BALL
	
Route14Nugget:
	itemball NUGGET
	
Route14TutorDance:
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	step_end
	
LadTristanText:
	text "I saw a really"
	line "rare #MON enter"
	cont "the cave!"
	done
	
LadTristanWinText:
	text "That was the first"
	line "time I ever lost…"
	done
	
LadTristanAfterText:
	text "If I catch some"
	line "rare #MON my-"
	cont "self, I won't lose"
	cont "ever again."
	done

TwinLeahText:
	text "LEAH: We may be"
	line "little,"
	
	para "MIA: But we have"
	line "strong #MON!"
	done
	
TwinLeahWinText:
	text "MIA: I told you we"
	line "should have led"
	cont "with my #MON,"
	cont "LEAH!"
	
	para "LEAH: Sorry!"
	done
	
TwinLeahAfterText:
	text "LEAH: Wouldn't it"
	line "have been neat if"
	cont "we could have a"
	cont "two-on-two battle?"
	
	para "MIA: LEAH, you"
	line "know those are"
	cont "against the rules!"
	done

TwinMiaText:
	text "MIA: My sister and"
	line "I can read each"
	cont "others' mind."
	
	para "LEAH: Yeah! So you"
	line "had better watch"
	cont "out!"
	done
	
TwinMiaWinText:
	text "LEAH: Cheer up,"
	line "MIA. We'll win"
	cont "the next one."
	
	para "MIA: For sure!"
	done
	
TwinMiaAfterText:
	text "MIA: Not only do"
	line "LEAH and I have a"
	cont "special bond, but"
	cont "our #MON know"
	cont "what we're think-"
	cont "ing too."
	
	para "LEAH: It's like"
	line "all of our minds"
	cont "are synced up!"
	done
	
LassGingerText:
	text "My #MON have"
	line "all become so"
	cont "unique!"
	done
	
LassGingerWinText:
	text "My team wasn't"
	line "diverse enough."
	done
	
LassGingerAfterText:
	text "I was always told"
	line "that training a"
	cont "diverse team was"
	cont "important."
	
	para "Even if they have"
	line "the same starting"
	cont "point!"
	done
	
BugCatcherCarlosText:
	text "Some people think"
	line "BUG-type #MON"
	cont "are weak."
	done
	
BugCatcherCarlosWinText:
	text "Oh no!"
	line "They were right!"
	done
	
PsychicWesText:
	text "I have trained my"
	line "mind over many"
	cont "years to reach"
	cont "this level!"
	done
	
PsychicWesWinText:
	text "My #MON's minds"
	line "were not strong"
	cont "enough."
	done
	
PsychicWesAfterText:
	text "I will train my"
	line "#MON as strict"
	cont "as I train myself."
	
	para "Then we will be"
	line "unstoppable!"
	done
	
BugCatcherCarlosAfterText:
	text "I traveled all the"
	line "way out here to"
	cont "show people my BUG"
	cont "#MON."
	
	para "…They didn't care."
	done

LassKellyText:
	text "I skipped class to"
	line "be out here."
	done
	
LassKellyWinText:
	text "Don't tell on me!"
	done
	
LassKellyAfterText:
	text "Sometimes you just"
	line "need to take a"
	cont "break to relieve"
	cont "some stress."
	done
	
TeacherLisaText:
	text "Normally I don't"
	line "encourage battles"
	cont "around students."
	
	para "Today is my day"
	line "off, though."
	done
	
TeacherLisaWinText:
	text "Thankfully none of"
	line "my students were"
	cont "around to see my"
	cont "loss."
	done
	
TeacherLisaAfterText:
	text "Respect is key in"
	line "running a class-"
	cont "room."
	done
	
SuperNerdSandyText:
	text "Ha! Sneak attack!"
	
	para "Roll with dis-"
	line "advantage!"
	done
	
SuperNerdSandyWinText:
	text "I needed my"
	line "saving throw!"
	done
	
SuperNerdSandyAfterText:
	text "That was a fun"
	line "encounter. I will"
	cont "reference it the"
	cont "next time I run a"
	cont "campaign."
	done

Route14TutorText:
	text "Hello there."
	
	para "I'm sorry, you"
	line "caught me right in"
	cont "the middle of my"
	cont "dance routine."
	done
	
Route14TutorDanceText:
	text "The dance's name?"
	
	para "Why it's no other"
	line "than PETAL DANCE!"
	
	para "If you would like"
	line "to give me a GOLD"
	cont "LEAF, I would be"
	cont "delighted to teach"
	cont "your #MON such"
	cont "a dance."
	done
	
Route14TutorTeach:
	text "Would you like to"
	line "teach your #MON"
	cont "PETAL DANCE?"
	done

Route14TutorRefused:
	text "No matter. You may"
	line "always find me"
	cont "right here."
	done

Route14TutorExplainSilverLeaf:
	text "Oh. You don't seem"
	line "to have a GOLD"
	cont "LEAF."
	
	para "No matter! I won't"
	cont "be going anywhere."
	done
	
Route14TutorWhichOne:
	text "Which #MON"
	line "should I tutor?"
	done
	
Route14TutorThankYou:
	text "Thank you!"
	
	para "Please, won't you"
	line "dance with me too?"
	done
	
Route14CaveGuardText:
	text "Groan…"

	para "A #MON in there"
	line "clobbered me and"
	cont "my team!"

	para "If I can't take it"
	line "on, there's no way"
	cont "some kid could."
	
	para "… … …"
	line "Ouch!"
	done
	
Route14BlackGlassesGuy:
	text "You like these"
	line "glasses I have on?"
	
	para "Thanks, I wear"
	line "them to protect my"
	cont "eyes from the sun-"
	cont "light."
	done

Route14GiveBlackGlasses:
	text "The sun seems a"
	line "lot brighter with"
	cont "you around."

	para "Here, I have an"
	line "extra pair you can"
	cont "have."
	done

Route14ExplainBlackGlasses:
	text "Those glasses"
	line "aren't just for"
	cont "looking cool, they"
	cont "also boost DARK-"
	cont "type moves."
	
	para "You might want to"
	line "use them yourself"
	cont "when SUNNY DAY is"
	cont "active."
	done

Route14_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 40,  7, ROUTE_14_CAVE_1F, 5
	warp_event 55, 10, ROUTE_14_OLIVINE_GATE, 1
	warp_event 55, 11, ROUTE_14_OLIVINE_GATE, 2
	warp_event 17,  5, ROUTE_18, 1

	db 0 ; coord events

	db 0 ; bg events

	db 14 ; object events
	object_event 26,  7, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route14MoveTutor, -1
	object_event 40,  8, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route14CaveGuard, EVENT_HEARD_ROUTE_12_LEADER
	object_event 42, 14, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinLeah, -1
	object_event 43, 14, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinMia, -1
	object_event 39, 17, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBugCatcherCarlos, -1
	object_event 41, 20, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerLassGinger, -1
	object_event 53, 13, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPsychicWes, -1
	object_event 37, 12, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerLadTristan, -1
	object_event 20,  8, SPRITE_PHARMACIST, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 1, BlackGlassesGuy, -1
	object_event 47,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route14UltraBall, EVENT_ROUTE_14_ULTRA_BALL
	object_event 26, 18, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route14Nugget, EVENT_ROUTE_14_NUGGET
	object_event 12, 16, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerLassKelly, -1
	object_event 14, 12, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerTeacherLisa, -1
	object_event  6, 17, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerSuperNerdSandy, -1
	