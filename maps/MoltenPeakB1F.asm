	const_def 2 ; object constants

MoltenPeakB1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
TrainerFirebreatherLouis:
	trainer FIREBREATHER, LOUIS, EVENT_BEAT_FIREBREATHER_LOUIS, FirebreatherLouisText, FirebreatherLouisWinText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext FirebreatherLouisAfterText
	waitbutton
	closetext
	end
	
TrainerHikerIsaiah:
	trainer HIKER, ISAIAH, EVENT_BEAT_HIKER_ISAIAH, HikerIsaiahText, HikerIsaiahWinText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext HikerIsaiahAfterText
	waitbutton
	closetext
	end
	
TrainerCooltrainerJordan:
	trainer COOLTRAINERM, JORDAN, EVENT_BEAT_COOLTRAINER_JORDAN, CooltrainerJordanText, CooltrainerJordanWinText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext CooltrainerJordanAfterText
	waitbutton
	closetext
	end
	
MoltenPeakHiddenMaxPotion:
	hiddenitem MAX_POTION, EVENT_MOLTEN_PEAK_HIDDEN_MAX_POTION
	
MoltenPeakHiddenMaxRevive:
	hiddenitem MAX_REVIVE, EVENT_MOLTEN_PEAK_HIDDEN_MAX_REVIVE
	
MoltenPeakHiddenFireStone:
	hiddenitem FIRE_STONE, EVENT_MOLTEN_PEAK_HIDDEN_FIRE_STONE
	
MoltenPeakHiddenHeatCharm:
	hiddenitem HEAT_CHARM, EVENT_MOLTEN_PEAK_HIDDEN_HEAT_CHARM
	
MoltenPeakHiddenXAttack:
	hiddenitem X_ATTACK, EVENT_MOLTEN_PEAK_HIDDEN_X_ATTACK
	
MoltenPeakHiddenRareCandy:
	hiddenitem RARE_CANDY, EVENT_MOLTEN_PEAK_HIDDEN_RARE_CANDY
	
MoltenPeakB1FBoulder:
	jumpstd strengthboulder

FirebreatherLouisText:
	text "Let's see if you"
	line "are tough enough"
	cont "for this scorching"
	cont "cave!"
	done

FirebreatherLouisWinText:
	text "Doused so easily?"
	line "No way!"
	done
	
FirebreatherLouisAfterText:
	text "Watch your step"
	line "around those lava"
	cont "pools."
	
	para "If you slip, you"
	line "are toast!"
	done
	
HikerIsaiahText:
	text "My #MON aren't"
	line "phased by this"
	cont "blistering heat!"
	done
	
HikerIsaiahWinText:
	text "We cracked under"
	line "pressure."
	done
	
HikerIsaiahAfterText:
	text "I train in this"
	line "cave every day."
	
	para "I barely even feel"
	line "the heat anymore."
	done
	
CooltrainerJordanText:
	text "The best teams"
	line "will hit a wide"
	cont "range of #MON."
	done
	
CooltrainerJordanWinText:
	text "Magnificent!"
	
	para "You are my first"
	line "loss in quite some"
	cont "time."
	done
	
CooltrainerJordanAfterText:
	text "This volcano is"
	line "unforgiving to the"
	cont "inexperienced."
	
	para "That makes it the"
	line "perfect place for"
	cont "me to train!"
	done

MoltenPeakB1F_MapEvents:
	db 0, 0 ; filler

	db 8 ; warp events
	warp_event 33,  7, MOLTEN_PEAK_1F,  2
	warp_event  5, 19, MOLTEN_PEAK_B2F, 1
	warp_event 11,  3, MOLTEN_PEAK_B2F, 2
	warp_event 13, 17, MOLTEN_PEAK_B2F, 3
	warp_event 19,  7, MOLTEN_PEAK_B2F, 4
	warp_event 23,  3, MOLTEN_PEAK_1F,  3
	warp_event 21, 19, MOLTEN_PEAK_B2F, 5
	warp_event 23, 13, MOLTEN_PEAK_B2F, 6

	db 0 ; coord events

	db 6 ; bg events
	bg_event 28,  3, BGEVENT_ITEM, MoltenPeakHiddenMaxPotion
	bg_event 40, 13, BGEVENT_ITEM, MoltenPeakHiddenMaxRevive
	bg_event 15, 16, BGEVENT_ITEM, MoltenPeakHiddenFireStone
	bg_event 24, 28, BGEVENT_ITEM, MoltenPeakHiddenHeatCharm
	bg_event 18,  2, BGEVENT_ITEM, MoltenPeakHiddenXAttack
	bg_event 21, 24, BGEVENT_ITEM, MoltenPeakHiddenRareCandy

	db 10 ; object events
	object_event 33, 12, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerFirebreatherLouis, -1
	object_event 19, 26, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerHikerIsaiah, -1
	object_event  9,  7, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerCooltrainerJordan, -1
	object_event 27, 16, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MoltenPeakB1FBoulder, -1
	object_event 25, 18, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MoltenPeakB1FBoulder, -1
	object_event 23, 24, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MoltenPeakB1FBoulder, -1
	object_event 24, 23, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MoltenPeakB1FBoulder, -1
	object_event  4, 12, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MoltenPeakB1FBoulder, -1
	object_event  9, 10, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MoltenPeakB1FBoulder, -1
	object_event 15, 26, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MoltenPeakB1FBoulder, -1
	object_event  8, 23, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MoltenPeakB1FBoulder, -1
	object_event  9, 22, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MoltenPeakB1FBoulder, -1
