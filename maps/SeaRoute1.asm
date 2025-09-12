	const_def 2 ; object constants

SeaRoute1_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerFisherStan:
	trainer FISHER, STAN, EVENT_BEAT_FISHER_STAN, FisherStanText, FisherStanWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherStanAfterText
	waitbutton
	closetext
	end

TrainerFisherCody:
	trainer FISHER, CODY, EVENT_BEAT_FISHER_CODY, FisherCodyText, FisherCodyWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherCodyAfterText
	waitbutton
	closetext
	end

TrainerSailorTucker:
	trainer SAILOR, TUCKER, EVENT_BEAT_SAILOR_TUCKER, SailorTuckerText, SailorTuckerWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SailorTuckerAfterText
	waitbutton
	closetext
	end

TrainerSwimmerLaurie:
	trainer SWIMMERF, LAURIE, EVENT_BEAT_SWIMMERF_LAURIE, SwimmerLaurieText, SwimmerLaurieWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerLaurieAfterText
	waitbutton
	closetext
	end

TrainerSwimmerHarley:
	trainer SWIMMERM, HARLEY, EVENT_BEAT_SWIMMERM_HARLEY, SwimmerHarleyText, SwimmerHarleyWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerHarleyAfterText
	waitbutton
	closetext
	end

TrainerSwimmerSandra:
	trainer SWIMMERF, SANDRA, EVENT_BEAT_SWIMMERF_SANDRA, SwimmerSandraText, SwimmerSandraWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerSandraAfterText
	waitbutton
	closetext
	end

TrainerSwimmerRussel:
	trainer SWIMMERM, RUSSEL, EVENT_BEAT_SWIMMERM_RUSSEL, SwimmerRusselText, SwimmerRusselWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerRusselAfterText
	waitbutton
	closetext
	end

TrainerSwimmerBrett:
	trainer SWIMMERF, BRETT, EVENT_BEAT_SWIMMERF_BRETT, SwimmerBrettText, SwimmerBrettWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerBrettAfterText
	waitbutton
	closetext
	end
	
SeaRoute1Fisher:
	jumptextfaceplayer SeaRoute1FisherText
	
FisherStanText:
	text "I am in a fierce"
	line "competition to"
	cont "catch the best"
	cont "fish #MON."
	done

FisherStanWinText:
	text "Agh! Not my prized"
	line "catch!"
	done

FisherStanAfterText:
	text "Even if I did lose"
	line "to you, I'll sink"
	cont "CODY's #MON for"
	cont "sure!"
	done
	
FisherCodyText:
	text "I'm competing to"
	line "prove I'm the best"
	cont "FISHER!"
	done

FisherCodyWinText:
	text "Now let's see how"
	line "good you are at"
	cont "fishing!"
	done

FisherCodyAfterText:
	text "Your win doesn't"
	line "matter to me."
	
	para "I will show STAN's"
	line "#MON the light!"
	done
	
SailorTuckerText:
	text "The sea is my"
	line "home."
	
	para "As is this island!"
	done
	
SailorTuckerWinText:
	text "Stranded again!"
	done

SailorTuckerAfterText:
	text "I can never stray"
	line "far from the sea."
	
	para "Her and I have"
	line "spent too much"
	cont "time with each"
	cont "other."
	
	para "…I also can't swim."
	done
	
SwimmerLaurieText:
	text "It's liberating to"
	line "swim in the ocean!"
	done
	
SwimmerLaurieWinText:
	text "…But it comes at a"
	line "cost."
	done

SwimmerLaurieAfterText:
	text "You should get off"
	line "of your #MON"
	cont "and really enjoy"
	cont "the ocean."
	
	para "You won't want to"
	line "go back on land!"
	done
	
SwimmerHarleyText:
	text "Did you think you"
	line "could sneak by"
	cont "while riding your"
	cont "#MON?"
	done
	
SwimmerHarleyWinText:
	text "No fair!"
	
	para "I got water in my"
	line "eyes!"
	done
	
SwimmerHarleyAfterText:
	text "I'll know to dive"
	line "under next time I"
	cont "see you around."
	done
	
SwimmerSandraText:
	text "So many cute"
	line "#MON live in"
	cont "the ocean!"
	done
	
SwimmerSandraWinText:
	text "Ah! How could you"
	line "do that to my bea-"
	cont "utiful #MON?"
	done
	
SwimmerSandraAfterText:
	text "…Could you take my"
	line "#MON to a"
	cont "CENTER for me?"
	
	para "I'm all pruned!"
	done
	
SwimmerRusselText:
	text "Do you think you"
	line "handle the might"
	cont "a DRAGON?"
	done

SwimmerRusselWinText:
	text "Who do you think"
	line "you are, beating"
	cont "me like that?"
	done

SwimmerRusselAfterText:
	text "You won't stop me"
	line "on my goal to be"
	cont "king of the seas!"
	done
	
SwimmerBrettText:
	text "Hey!"
	line "You caught my eye!"
	
	para "Now we must have a"
	line "battle!"
	done
	
SwimmerBrettWinText:
	text "Rules are rules."
	done
	
SwimmerBrettAfterText:
	text "We have to follow"
	line "the rules, even"
	cont "out in the open"
	cont "sea."
	
	para "It would be pure"
	line "chaos otherwise!"
	done
	
SeaRoute1FisherText:
	text "The two FISHER on"
	line "this route have"
	cont "been bickering for"
	cont "years over who is"
	cont "the best."
	
	para "Fishing is meant"
	line "for relaxation!"
	done

SeaRoute1_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 0 ; bg events

	db 9 ; object events
	object_event  6, 11, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerFisherStan, -1
	object_event 19,  7, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerFisherCody, -1
	object_event 14, 21, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SeaRoute1Fisher, -1
	object_event 19, 27, SPRITE_SAILOR, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerSailorTucker, -1
	object_event 11, 16, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerLaurie, -1
	object_event 20, 14, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSwimmerHarley, -1
	object_event 28,  8, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerSwimmerSandra, -1
	object_event 35, 12, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSwimmerRussel, -1
	object_event 12, 29, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerBrett, -1
