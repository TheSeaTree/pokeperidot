	const_def 2 ; object constants
	const ARGENT_DEPTHS_B1F_BOULDER1
	const ARGENT_DEPTHS_B1F_BOULDER2
	const ARGENT_DEPTHS_B1F_BOULDER3
	const ARGENT_DEPTHS_B1F_BOULDER4 ; dummy
	const ARGENT_DEPTHS_B1F_BOULDER5 ; dummy
	const ARGENT_DEPTHS_B1F_BOULDER6 ; dummy
	const ARGENT_DEPTHS_B1F_BOULDER7 ; dummy
	const ARGENT_DEPTHS_B1F_BOULDER8 ; dummy
	const ARGENT_DEPTHS_B1F_BOULDER9 ; dummy

ArgentDepthsB1F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_CMDQUEUE, .SetUpStoneTable

.SetUpStoneTable:
	writecmdqueue .CommandQueue
	return
	
.CommandQueue:
	cmdqueue CMDQUEUE_STONETABLE, .StoneTable ; check if any stones are sitting on a warp

.StoneTable:
	stonetable 1, ARGENT_DEPTHS_B1F_BOULDER1, .Boulder1
	stonetable 2, ARGENT_DEPTHS_B1F_BOULDER2, .Boulder2
	stonetable 3, ARGENT_DEPTHS_B1F_BOULDER3, .Boulder3
	db -1 ; end
	
.Boulder1:
	disappear ARGENT_DEPTHS_B1F_BOULDER1
	setevent EVENT_ARGENT_DEPTHS_B1F_BOULDER_1
	clearevent EVENT_ARGENT_DEPTHS_B2F_BOULDER_1
	jump .Fall

.Boulder2:
	disappear ARGENT_DEPTHS_B1F_BOULDER2
	setevent EVENT_ARGENT_DEPTHS_B1F_BOULDER_2
	clearevent EVENT_ARGENT_DEPTHS_B2F_BOULDER_2
	jump .Fall

.Boulder3:
	disappear ARGENT_DEPTHS_B1F_BOULDER3
	setevent EVENT_ARGENT_DEPTHS_B1F_BOULDER_3
	clearevent EVENT_ARGENT_DEPTHS_B2F_BOULDER_3
	jump .Fall
	
.Fall:
	pause 30
	scall .FX
	opentext
	writetext ArgentDepthsB1FBoulderFellText
	waitbutton
	closetext
	end
	
.FX:
	playsound SFX_STRENGTH
	earthquake 80
	end
	
ArgentDepthsB1FBoulder:
	jumpstd strengthboulder
	
ArgentDepthsB1FMaxRepel:
	itemball MAX_REPEL
	
ArgentDepthsB1FQuickClaw:
	itemball QUICK_CLAW
	
ArgentDepthsB1FPPUp:
	itemball PP_UP
	
ArgentDepthsB1FHiddenRareCandy:
	hiddenitem RARE_CANDY, EVENT_ARGENT_DEPTHS_B1F_HIDDEN_RARE_CANDY

ArgentDepthsB1FHiddenXAttack:
	hiddenitem X_ATTACK, EVENT_ARGENT_DEPTHS_B1F_HIDDEN_X_ATTACK
	
ArgentDepthsB1FHiddenUltraBall:
	hiddenitem ULTRA_BALL, EVENT_ARGENT_DEPTHS_B1F_HIDDEN_ULTRA_BALL
	
ArgentDepthsB1FHiddenBigPearl:
	hiddenitem BIG_PEARL, EVENT_ARGENT_DEPTHS_B1F_HIDDEN_BIG_PEARL

ArgentDepthsB1FBoulderFellText:
	text "The boulder fell"
	line "through!"
	done

ArgentDepthsB1F_MapEvents:
	db 0, 0 ; filler

	db 6 ; warp events
	warp_event  6,  3, ARGENT_DEPTHS_B2F, 4 ; hole
	warp_event 26, 19, ARGENT_DEPTHS_B2F, 5 ; hole
	warp_event 20,  8, ARGENT_DEPTHS_B2F, 6 ; hole
	warp_event 19, 15, ARGENT_DEPTHS_1F,  2
	warp_event 13, 13, ARGENT_DEPTHS_B2F, 7
	warp_event 29, 11, ARGENT_DEPTHS_B2F, 8

	db 0 ; coord events

	db 4 ; bg events
	bg_event 17, 14, BGEVENT_ITEM, ArgentDepthsB1FHiddenRareCandy
	bg_event 13,  7, BGEVENT_ITEM, ArgentDepthsB1FHiddenXAttack
	bg_event 21, 11, BGEVENT_ITEM, ArgentDepthsB1FHiddenUltraBall
	bg_event  5, 18, BGEVENT_ITEM, ArgentDepthsB1FHiddenBigPearl

	db 12 ; object events
	object_event  9,  9, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, 0, 0, 0, OBJECTTYPE_SCRIPT, 0, ArgentDepthsB1FBoulder, EVENT_ARGENT_DEPTHS_B1F_BOULDER_1
	object_event 24, 17, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, 0, 0, 0, OBJECTTYPE_SCRIPT, 0, ArgentDepthsB1FBoulder, EVENT_ARGENT_DEPTHS_B1F_BOULDER_2
	object_event 26,  8, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, 0, 0, 0, OBJECTTYPE_SCRIPT, 0, ArgentDepthsB1FBoulder, EVENT_ARGENT_DEPTHS_B1F_BOULDER_3
	object_event  2,  8, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, 0, 0, 0, OBJECTTYPE_SCRIPT, 0, ArgentDepthsB1FBoulder, -1
	object_event  3,  9, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, 0, 0, 0, OBJECTTYPE_SCRIPT, 0, ArgentDepthsB1FBoulder, -1
	object_event  4,  9, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, 0, 0, 0, OBJECTTYPE_SCRIPT, 0, ArgentDepthsB1FBoulder, -1
	object_event  7, 13, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, 0, 0, 0, OBJECTTYPE_SCRIPT, 0, ArgentDepthsB1FBoulder, -1
	object_event  6, 14, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, 0, 0, 0, OBJECTTYPE_SCRIPT, 0, ArgentDepthsB1FBoulder, -1
	object_event 23, 16, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, 0, 0, 0, OBJECTTYPE_SCRIPT, 0, ArgentDepthsB1FBoulder, -1
	object_event 15, 18, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, 0, 0, 0, OBJECTTYPE_ITEMBALL, 0, ArgentDepthsB1FMaxRepel, EVENT_ARGENT_DEPTHS_B1F_MAX_REPEL
	object_event 28, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, 0, 0, 0, OBJECTTYPE_ITEMBALL, 0, ArgentDepthsB1FQuickClaw, EVENT_ARGENT_DEPTHS_B1F_QUICK_CLAW
	object_event  3, 11, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, 0, 0, 0, OBJECTTYPE_ITEMBALL, 0, ArgentDepthsB1FPPUp, EVENT_ARGENT_DEPTHS_B1F_PP_UP
