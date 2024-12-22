	const_def 2 ; object constants
	const ROUTE_13_TUTOR
	const ROUTE_13_ODDISH

Route13_MapScripts:
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
	
Route13MoveTutor:
	applymovement ROUTE_13_TUTOR, Route13TutorDance
	faceplayer
	opentext
	checkevent EVENT_LOVE_BALLS_FOR_SALE
	iftrue .SellBalls
	writetext Route13TutorText
	waitbutton
	applymovement ROUTE_13_TUTOR, Route13TutorDance
	faceplayer
	writetext Route13TutorDanceText
	waitbutton
	yesorno
	iffalse .Refused
	writetext Route13DancerAcceptText
	waitbutton
	closetext
	winlosstext Route13DancerWinText, 0
	loadtrainer KIMONO_GIRL, ANRI
	startbattle
	reloadmapafterbattle
	setevent EVENT_LOVE_BALLS_FOR_SALE
	applymovement ROUTE_13_TUTOR, Route13TutorDance
	faceplayer
	opentext
	writetext Route13DancerAfterText
	waitbutton
	jump .Start
	
.SellBalls
	writetext MerchantSellLoveBall
	jump .Start
.PurchaseMore:
	writetext LoveBallMerchantMoreSelection
.Start:
	special PlaceMoneyTopRight
	loadmenu .MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .OneBall
	ifequal 2, .TenBalls
	applymovement ROUTE_13_TUTOR, Route13TutorDance
	faceplayer
	writetext LoveBallMerchantComeBack
	waitbutton
	closetext
	end
	
.Refused:
	writetext Route13TutorRefused
	waitbutton
	closetext
	end
	
.OneBall:
	checkmoney YOUR_MONEY, 300
	ifequal HAVE_LESS, .NotEnoughMoney
	itemtotext LOVE_BALL, MEM_BUFFER_0
	jump .AskToVend1

.TenBalls:
	checkmoney YOUR_MONEY, 3000
	ifequal HAVE_LESS, .NotEnoughMoney
	jump .AskToVend10
	
.AskToVend1:
	writetext LoveBallMerchantBuy1Text
	yesorno
	iffalse .No
	giveitem LOVE_BALL
	iffalse .NotEnoughSpace
	takemoney YOUR_MONEY, 300
	jump .VendItem
.AskToVend10:
	writetext LoveBallMerchantBuy10Text
	yesorno
	iffalse .No
	giveitem LOVE_BALL, 10
	iffalse .NotEnoughSpace
	takemoney YOUR_MONEY, 3000
.VendItem
	playsound SFX_TRANSACTION
	waitsfx
	special PlaceMoneyTopRight
	itemnotify
	jump .PurchaseMore

.NotEnoughMoney:
	writetext LoveBallMerchantNoMoneyText
	waitbutton
	jump .Start

.NotEnoughSpace:
	writetext LoveBallMerchantNoSpaceText
	waitbutton
	jump .PurchaseMore
	
.No:
	writetext LoveBallMerchantNo
	waitbutton
	jump .Start

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, SCREEN_WIDTH - 10, TEXTBOX_Y - 2
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 3 ; items
	db "1   ¥300@"
	db "10 ¥3000@"
	db "CANCEL@"

BlackGlassesGuy:
	faceplayer
	opentext
	checkevent EVENT_GOT_BLACKGLASSES
	iftrue .GotGlasses
	writetext Route13BlackGlassesGuy
	checkevent EVENT_GOT_TM_SUNNY_DAY
	waitbutton
	iftrue .GiveGlasses
	closetext
	end

.GiveGlasses:
	writetext Route13GiveBlackGlasses
	waitbutton
	verbosegiveitem BLACKGLASSES
	iffalse .NoRoom
	closetext
	setevent EVENT_GOT_BLACKGLASSES
	end
	
.GotGlasses:
	writetext Route13ExplainBlackGlasses
	waitbutton
	closetext
	end

.NoRoom:
	writetext Route13BlackGlassesGuyBagFullText
	waitbutton
	closetext
	end

TheBoneyardGuard:
	jumptextfaceplayer TheBoneyardGuardText
	
Route13UltraBall:
	itemball ULTRA_BALL
	
Route13Nugget:
	itemball NUGGET
	
Route13HiddenPowerHerb:
	hiddenitem POWER_HERB, EVENT_ROUTE_13_HIDDEN_POWER_HERB
	
Route13HiddenEnergyRoot:
	hiddenitem ENERGY_ROOT, EVENT_ROUTE_13_HIDDEN_ENERGY_ROOT
	
Route13HiddenMaxEther:
	hiddenitem MAX_ETHER, EVENT_ROUTE_13_HIDDEN_MAX_ETHER
	
Route13TutorDance:
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

Route13TutorText:
	text "Hello there."
	
	para "I'm sorry, you"
	line "caught me right in"
	cont "the middle of my"
	cont "dance routine."
	done
	
Route13TutorDanceText:
	text "I love to dance"
	line "with my #MON."
	
	para "I also adore comb-"
	line "ining dance with"
	cont "battle."
	
	para "Would you care to"
	line "perform with us?"
	done

Route13TutorRefused:
	text "No matter. You may"
	line "always find me"
	cont "right here."
	done

Route13DancerAcceptText:
	text "Wonderful!"
	
	para "I hope you can"
	line "keep up!"
	done
	
Route13DancerWinText:
	text "Oh my…"
	
	para "I did not expect"
	line "such moves out of"
	cont "you. You're good."
	done

Route13DancerAfterText:
	text "Dance has been so"
	line "often used in cou-"
	cont "rtship between"
	cont "members of the"
	cont "opposite gender."
	
	para "…While I don't have"
	line "feelings for you"
	cont "in that way, I'd be"
	cont "happy to share"
	cont "some LOVE with you"
	cont "in the form of the"
	cont "LOVE BALL!"
	
	para "Would you care to"
	line "buy some from me?"
	done
	
MerchantSellLoveBall:
	text "Ah! It's you!"

	para "Do you need more"
	line "LOVE BALLs?"
	done

LoveBallMerchantMoreSelection:
	text "Would you like any"
	line "more LOVE BALLs?"
	done
	
LoveBallMerchantNoMoneyText:
	text "Sorry, but you can"
	line "not afford that"
	cont "many right now…"
	done

LoveBallMerchantNoSpaceText:
	text "How could you"
	line "dance so well with"
	cont "your PACK stuffed"
	cont "so full?"
	
	para "Please clear up"
	line "some space for an"
	cont "item."
	done
	
LoveBallMerchantBuy1Text:
	text "A @"
	text_from_ram wStringBuffer3
	text_start
	line "will cost ¥300,"
	cont "okay?"
	done	

LoveBallMerchantBuy10Text:
	text "10 LOVE BALLs will"
	line "cost ¥3000, okay?"
	done

LoveBallMerchantNo:
	text "Would you prefer a"
	line "different amount?"
	done
	
LoveBallMerchantComeBack:
	text "Take care!"
	
	para "Also."
	
	para "You don't need to"
	line "see me just to buy"
	cont "LOVE BALLs."
	
	para "You may also be my"
	line "dance partner any"
	cont "time."
	done

TheBoneyardGuardText:
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
	
Route13BlackGlassesGuy:
	text "You like these"
	line "glasses I have on?"
	
	para "Thanks, I wear"
	line "them to protect my"
	cont "eyes from the sun-"
	cont "light."
	done

Route13GiveBlackGlasses:
	text "The sun seems a"
	line "lot brighter with"
	cont "you around."

	para "Here, I have an"
	line "extra pair you can"
	cont "have."
	done

Route13ExplainBlackGlasses:
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

Route13BlackGlassesGuyBagFullText:
	text "Woah, there!"

	para "It ain't cool to"
	line "have a BAG overfl-"
	cont "owing with items."
	done

Route13_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 40,  7, THE_BONEYARD_1F, 5
	warp_event 55, 10, ROUTE_13_RUGOSA_GATE, 1
	warp_event 55, 11, ROUTE_13_RUGOSA_GATE, 2
	warp_event 17,  5, ROUTE_13_GATE, 1

	db 0 ; coord events

	db 3 ; bg events
	bg_event 54, 23, BGEVENT_ITEM, Route13HiddenPowerHerb
	bg_event 49, 17, BGEVENT_ITEM, Route13HiddenEnergyRoot
	bg_event 34, 13, BGEVENT_ITEM, Route13HiddenMaxEther

	db 14 ; object events
	object_event 26,  7, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route13MoveTutor, -1
	object_event 40,  8, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, TheBoneyardGuard, EVENT_HEARD_ROUTE_11_LEADER
	object_event 42, 14, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinLeah, -1
	object_event 43, 14, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinMia, -1
	object_event 39, 17, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBugCatcherCarlos, -1
	object_event 41, 20, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerLassGinger, -1
	object_event 53, 13, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPsychicWes, -1
	object_event 37, 12, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerLadTristan, -1
	object_event 20,  8, SPRITE_PHARMACIST, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 1, BlackGlassesGuy, -1
	object_event 47,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route13UltraBall, EVENT_ROUTE_13_ULTRA_BALL
	object_event 26, 18, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route13Nugget, EVENT_ROUTE_13_NUGGET
	object_event 12, 16, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerLassKelly, -1
	object_event 14, 12, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerTeacherLisa, -1
	object_event  6, 17, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerSuperNerdSandy, -1
	