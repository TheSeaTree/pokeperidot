	const_def 2 ; object constants

MoltenPeakOutside_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .HiddenCave

.HiddenCave
	checkevent EVENT_MOLTEN_PEAK_HIDDEN_CAVE_OPEN
	iffalse .skip
	changeblock 24, 6, $3d
.skip
	return

TrainerBlackbeltRiku:
	trainer BLACKBELT_T, RIKU, EVENT_BEAT_BLACKBELT_RIKU, BlackbeltRikuText, BlackbeltRikuWinText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext BlackbeltRikuAfterText
	waitbutton
	closetext
	end
	
TrainerCooltrainerTodd:
	trainer COOLTRAINERM, TODD, EVENT_BEAT_COOLTRAINER_TODD, CooltrainerToddText, CooltrainerToddWinText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext CooltrainerToddAfterText
	waitbutton
	closetext
	end
	
TrainerCooltrainerFaith:
	trainer COOLTRAINERF, FAITH, EVENT_BEAT_COOLTRAINER_FAITH, CooltrainerFaithText, CooltrainerFaithWinText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext CooltrainerFaithAfterText
	waitbutton
	closetext
	end
	
TrainerCamperNorris:
	trainer CAMPER, NORRIS, EVENT_BEAT_CAMPER_NORRIS, CamperNorrisText, CamperNorrisWinText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext CamperNorrisAfterText
	waitbutton
	closetext
	end	
	
TrainerSuperNerdDennis:
	trainer SUPER_NERD, DENNIS, EVENT_BEAT_SUPER_NERD_DENNIS, SuperNerdDennisText, SuperNerdDennisWinText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext SuperNerdDennisAfterText
	waitbutton
	closetext
	end	
	
MoltenPeakHealerScript:
	faceplayer
	opentext
	writetext MoltenPeakHealerText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	special StubbedTrainerRankings_Healings
	playmusic MUSIC_HEAL
	special HealParty
	pause 60
	special FadeInQuickly
	special RestartMapMusic
	opentext
	writetext MoltenPeakHealerGoodLuckText
	waitbutton
	turnobject LAST_TALKED, UP
	pause 10
	turnobject LAST_TALKED, DOWN
	pause 10
	closetext
	end

MoltenPeakClefableScript:
	opentext
	writetext MoltenPeakClefableText
	cry CLEFABLE
	waitbutton
	closetext
	end

MoltenPeakOutsideDragonScale:
	itemball DRAGON_SCALE
	
MoltenPeakOutsideSign:
	jumptext MoltenPeakOutsideSignText
	
BlackbeltRikuText:
	text "You've met with"
	line "too many cowards"
	cont "on your way here."
	
	para "Prepare for my"
	line "PHYSICAL might!"
	done
	
BlackbeltRikuWinText:
	text "I was just warming"
	line "up!"
	done
	
BlackbeltRikuAfterText:
	text "The trainers here"
	line "need to learn how"
	cont "a real man fights."
	
	para "Those fancy breath"
	line "moves won't do any-"
	cont "thing when the"
	cont "wind is knocked"
	cont "out of you!"
	done

CooltrainerToddText:
	text "There is no way to"
	line "crack my #MON's"
	cont "tough scales!"
	done

CooltrainerToddWinText:
	text "But how?"
	
	para "The heat was meant"
	line "to make my #MON"
	cont "stronger!"
	done

CooltrainerToddAfterText:
	text "I refuse to let a"
	line "single loss dis-"
	cont "courage me."
	
	para "I will just need"
	line "to train twice as"
	cont "hard!"
	done

CooltrainerFaithText:
	text "Watch your step."
	
	para "My elegant team"
	line "may blow you away!"
	done

CooltrainerFaithWinText:
	text "Elegance and"
	line "power."
	
	para "One is worthless"
	line "without the other."
	done

CooltrainerFaithAfterText:
	text "There is nothing"
	line "quite like the"
	cont "ferocity of a"
	cont "volcano."
	
	para "The danger only"
	line "makes me train"
	cont "harder."
	
	para "My #MON always"
	line "have FAITH!"
	done

CamperNorrisText:
	text "My shorts are per-"
	line "fect for this in-"
	cont "tense heat."
	
	para "They're so comfy!"
	done

CamperNorrisWinText:
	text "I need to get some"
	line "shots for my"
	cont "#MON to wear,"
	cont "so they can be as"
	cont "comfy as me!"
	done

CamperNorrisAfterText:
	text "I've still got"
	line "more time up here"
	cont "before I need to"
	cont "go home."
	
	para "You bet I will"
	line "spend all of it"
	cont "training my"
	cont "#MON harder!"
	done

SuperNerdDennisText:
	text "I heard from a"
	line "SCIENTIST friend"
	cont "that some #MON"
	cont "FOSSILs could be"
	cont "found here."
	
	para "Want to help me"
	line "look?"
	done

SuperNerdDennisWinText:
	text "Aw, man!"

	para "I must continue my"
	line "search alone."
	done

SuperNerdDennisAfterText:
	text "I've tried looking"
	line "on higher levels,"
	cont "but the trainers"
	cont "are too strong for"
	cont "my #MON."
	done

MoltenPeakHealerText:
	text "Your #MON look"
	line "awfully tired."

	para "Please, let me"
	line "and CLEFABLE help."
	done
	
MoltenPeakHealerGoodLuckText:
	text "There!"

	para "Your #MON are"
	line "looking good!"

	para "Good luck!"
	done
	
MoltenPeakClefableText:
	text "CLEFABLE: Pippi!"
	done

MoltenPeakOutsideSignText:
	text "ATTENTION!"
	
	para "Exercise extreme"
	line "caution around any"
	cont "lava pools!"
	done

MoltenPeakOutside_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 33, 27, ACROPORA_CAVE_1F, 9
	warp_event  7,  5, MOLTEN_PEAK_1F, 1
	warp_event 25,  7, MOLTEN_PEAK_HIDDEN_CAVE, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event 30, 28, BGEVENT_READ, MoltenPeakOutsideSign

	db 8 ; object events
	object_event 18, 19, SPRITE_BLACK_BELT, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBlackbeltRiku, -1
	object_event  8, 18, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerCooltrainerTodd, -1
	object_event  9,  8, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainerFaith, -1
	object_event 16, 12, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerCamperNorris, -1
	object_event 17, 29, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerSuperNerdDennis, -1
	object_event 12,  4, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MoltenPeakHealerScript, -1
	object_event 13,  4, SPRITE_CLEFAIRY, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MoltenPeakClefableScript, -1
	object_event  6, 14, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MoltenPeakOutsideDragonScale, EVENT_MOLTEN_PEAK_DRAGON_SCALE
