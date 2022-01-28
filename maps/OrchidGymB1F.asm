	const_def 2 ; object constants

OrchidGymB1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerFirebreatherKenny:
	trainer FIREBREATHER, KENNY, EVENT_BEAT_FIREBREATHER_KENNY, FirebreatherKennyText, FirebreatherKennyWinText, 0, .AfterScript

.AfterScript:
	opentext
	writetext FirebreatherKennyAfterText
	waitbutton
	closetext
	end

TrainerFirebreatherAiden:
	trainer FIREBREATHER, AIDEN, EVENT_BEAT_FIREBREATHER_AIDEN, FirebreatherAidenText, FirebreatherAidenWinText, 0, .AfterScript

.AfterScript:
	opentext
	writetext FirebreatherAidenAfterText
	waitbutton
	closetext
	end

TrainerJuggglerUri:
	trainer JUGGLER, URI, EVENT_BEAT_JUGGLER_URI, JugglerUriText, JugglerUriWinText, 0, .AfterScript

.AfterScript:
	opentext
	writetext JugglerUriAfterText
	waitbutton
	closetext
	end

TrainerJuggglerKai:
	trainer JUGGLER, KAI, EVENT_BEAT_JUGGLER_KAI, JugglerKaiText, JugglerKaiWinText, 0, .AfterScript

.AfterScript:
	opentext
	writetext JugglerKaiAfterText
	waitbutton
	closetext
	end

TrainerBikerDante:
	trainer BIKER, DANTE, EVENT_BEAT_BIKER_DANTE, BikerDanteText, BikerDanteWinText, 0, .AfterScript

.AfterScript:
	opentext
	writetext BikerDanteAfterText
	waitbutton
	closetext
	end

FirebreatherKennyText:
	text "Do you think it's"
	line "too dark in here?"
	
	para "Let's fix that!"
	done

FirebreatherKennyWinText:
	text "The candle that"
	line "burns twice as"
	cont "fast…"

	para "………………"

	para "I forgot the rest…"
	done

FirebreatherKennyAfterText:
	text "Hey kid, you'd"
	line "better get a move"
	cont "on if you want to"
	cont "reach ENYA."
	
	para "By the looks of"
	line "it, you have about"
	cont "@"
	text_decimal wFireGymStepsRemaining, 1, 2
	text " steps left in"
	cont "you."
	done

FirebreatherAidenText:
	text "Ah! I love this"
	line "heat! Don't you?"
	
	para "No?"
	
	para "I take that as an"
	line "insult!"
	done

FirebreatherAidenWinText:
	text "I've been doused!"
	line "Smothered!"
	done

FirebreatherAidenAfterText:
	text "Hey, you might"
	line "want to head up-"
	cont "stairs in the next"
	cont "@"
	text_decimal wFireGymStepsRemaining, 1, 2
	text " steps."
	
	para "I don't want to"
	line "drag you out of"
	cont "here if you pass"
	cont "out."
	done

JugglerKaiText:
	text "Do you want me to"
	line "show you to the"
	cont "nearest stairs?"
	
	para "How about I show"
	line "you to the exit"
	cont "instead?"
	done

JugglerKaiWinText:
	text "It's way too hot to"
	line "be wearing this"
	cont "ridiculous"
	cont "costume!"
	done

JugglerKaiAfterText:
	text "Are you good to"
	line "continue?"
	
	para "I'd say you have @"
	text_decimal wFireGymStepsRemaining, 1, 2
	text_start
	line "steps remaining."
	
	para "Be careful not to"
	line "pass out."
	done

JugglerUriText:
	text "Did you think only"
	line "FIRE-type #MON"
	cont "were used in this"
	cont "GYM?"
	
	para "Hahaha!"
	line "How foolish!"
	done

JugglerUriWinText:
	text "I could sense your"
	line "victory, but I did"
	cont "not want to"
	cont "believe it would"
	cont "happen."
	done

JugglerUriAfterText:
	text "I predict you can"
	line "only last about @"
	text_decimal wFireGymStepsRemaining, 1, 2
	text_start
	cont "steps in here."
	
	para "You might want to"
	line "head upstairs for"
	cont "a short rest."
	done

BikerDanteText:
	text "Where there's"
	line "smoke, there is"
	cont "fire!"
	
	para "Careful not to"
	line "get burned as I"
	cont "rev up my engine!"
	done
	
BikerDanteWinText:
	text "Gah! My bike back-"
	line "fired!"
	
	para "Even she ain't"
	line "happy with this"
	cont "loss!"
	done
	
BikerDanteAfterText:
	text "You're almost to"
	line "the leader, but"
	cont "you'd better burn"
	cont "rubber!"
	
	para "You only have @"
	text_decimal wFireGymStepsRemaining, 1, 2
	text_start
	line "steps to go!"
	done

OrchidGymB1F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  8, 25, ORCHID_GYM_1F, 1
	warp_event 16,  9, ORCHID_GYM_LEADER_ROOM, 2
	warp_event  2, 10, ORCHID_GYM_LEADER_ROOM, 1
	warp_event 10,  3, ORCHID_GYM_LEADER_ROOM, 3

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	object_event  7, 19, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerFirebreatherKenny, EVENT_BEAT_ELITE_FOUR
	object_event  9, 11, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerJuggglerKai, EVENT_BEAT_ELITE_FOUR
	object_event 14, 11, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerFirebreatherAiden, EVENT_BEAT_ELITE_FOUR
	object_event 18, 10, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerJuggglerUri, EVENT_BEAT_ELITE_FOUR
	object_event  5,  3, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBikerDante, EVENT_BEAT_ELITE_FOUR
