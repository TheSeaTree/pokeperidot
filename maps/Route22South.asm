	const_def 2 ; object constants

Route22South_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	

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
	
Route22HealerScript:
	faceplayer
	opentext
	writetext Route22HealerText
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
	writetext Route22HealerGoodLuckText
	waitbutton
	turnobject LAST_TALKED, UP
	pause 10
	turnobject LAST_TALKED, DOWN
	pause 10
	closetext
	end

Route22ClefableScript:
	opentext
	writetext Route22ClefableText
	cry CLEFABLE
	waitbutton
	closetext
	end

Route22SouthDragonScale:
	itemball DRAGON_SCALE
	
Route22SouthSign:
	jumptext Route22SouthSignText
	
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
	text "Elegance and power."
	
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

Route22HealerText:
	text "Your #MON look"
	line "awfully tired."

	para "Please, let me"
	line "and CLEFABLE help."
	done
	
Route22HealerGoodLuckText:
	text "There!"

	para "Your #MON are"
	line "looking good!"

	para "Good luck!"
	done
	
Route22ClefableText:
	text "CLEFABLE: Pippi!"
	done

Route22SouthSignText:
	text "ATTENTION!"
	
	para "Exercise extreme"
	line "caution around any"
	cont "lava pools!"
	done

Route22South_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 33, 27, ROUTE_22_CAVE_1F, 4
	warp_event  7,  5, ROUTE_22_CAVE_1F, 1
	warp_event 25,  7, ROUTE_22_HIDDEN_CAVE, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event 30, 28, BGEVENT_READ, Route22SouthSign

	db 6 ; object events
	object_event 18, 19, SPRITE_BLACK_BELT, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBlackbeltRiku, -1
	object_event  8, 18, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerCooltrainerTodd, -1
	object_event  9,  8, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainerFaith, -1
	object_event 16, 26, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route22HealerScript, -1
	object_event 17, 26, SPRITE_CLEFAIRY, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route22ClefableScript, -1
	object_event  6, 14, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route22SouthDragonScale, EVENT_ROUTE_22_DRAGON_SCALE
