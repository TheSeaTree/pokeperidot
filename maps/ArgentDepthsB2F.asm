	const_def 2 ; object constants
	const ARGENT_DEPTHS_B2F_BOULDER1
	const ARGENT_DEPTHS_B2F_BOULDER2
	const ARGENT_DEPTHS_B2F_BOULDER3
	const ARGENT_DEPTHS_B2F_BOULDER4 ; Dummy
	const ARGENT_DEPTHS_B2F_BOULDER5 ; Dummy
	const ARGENT_DEPTHS_B2F_BOULDER6 ; Dummy

ArgentDepthsB2F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_CMDQUEUE, .SetUpStoneTable
	
.SetUpStoneTable:
	writecmdqueue .CommandQueue
	return
	
.CommandQueue:
	cmdqueue CMDQUEUE_STONETABLE, .StoneTable ; check if any stones are sitting on a warp

.StoneTable:
	stonetable 1, ARGENT_DEPTHS_B2F_BOULDER1, .Boulder1
	stonetable 2, ARGENT_DEPTHS_B2F_BOULDER2, .Boulder2
	stonetable 3, ARGENT_DEPTHS_B2F_BOULDER3, .Boulder3
	db -1 ; end
	
.Boulder1:
	clearevent EVENT_ARGENT_DEPTHS_B2F_BOULDER_4
	moveobject ARGENT_DEPTHS_B2F_BOULDER4, 10, 10
	appear ARGENT_DEPTHS_B2F_BOULDER4
	scall .Open
	setevent EVENT_ARGENT_DEPTHS_GATE_1
	setevent EVENT_ARGENT_DEPTHS_B2F_BOULDER_1
	disappear ARGENT_DEPTHS_B2F_BOULDER1
	end

.Boulder2:
	clearevent EVENT_ARGENT_DEPTHS_B2F_BOULDER_5
	moveobject ARGENT_DEPTHS_B2F_BOULDER5, 24, 19
	appear ARGENT_DEPTHS_B2F_BOULDER5
	scall .Open
	setevent EVENT_ARGENT_DEPTHS_GATE_2
	setevent EVENT_ARGENT_DEPTHS_B2F_BOULDER_2
	disappear ARGENT_DEPTHS_B2F_BOULDER2
	end

.Boulder3:
	clearevent EVENT_ARGENT_DEPTHS_B2F_BOULDER_6
	moveobject ARGENT_DEPTHS_B2F_BOULDER6, 28, 10
	appear ARGENT_DEPTHS_B2F_BOULDER6
	scall .Open
	setevent EVENT_ARGENT_DEPTHS_GATE_3
	setevent EVENT_ARGENT_DEPTHS_B2F_BOULDER_3
	disappear ARGENT_DEPTHS_B2F_BOULDER3
	end

.Open
	earthquake 10
	playsound SFX_STRENGTH
	pause 10
	opentext
	writetext ArgentDepthsB2FButtonText
	waitbutton
	closetext
	end
	
ArgentDepthsB2FFullRestore:
	itemball FULL_RESTORE
	
ArgentDepthsB2FHiddenCoarseCharm:
	hiddenitem COARSE_CHARM, EVENT_ARGENT_DEPTHS_B2F_HIDDEN_COARSE_CHARM

ArgentDepthsB2FHiddenFocusSash:
	hiddenitem FOCUS_SASH, EVENT_ARGENT_DEPTHS_B2F_HIDDEN_FOCUS_SASH
	
ArgentDepthsB2FHiddenStardust:
	hiddenitem STARDUST, EVENT_ARGENT_DEPTHS_B2F_HIDDEN_STARDUST
	
ArgentDepthsB2FHiddenXAccuracy:
	hiddenitem X_ACCURACY, EVENT_ARGENT_DEPTHS_B2F_HIDDEN_X_ACCURACY
	
ArgentDepthsB2FBoulder:
	jumpstd strengthboulder

ArgentDepthsB2FStuckBoulder:
	jumptext ArgentDepthsB2FBoulderText
	
ArgentDepthsB2FButtonText:
	text "A sound could be"
	line "heard deeper with-"
	cont "in the cave."
	done
	
ArgentDepthsB2FBoulderText:
	text "It won't budge!"
	done

ArgentDepthsB2F_MapEvents:
	db 0, 0 ; filler

	db 9 ; warp events
	warp_event 10, 10, ARGENT_DEPTHS_B2F, 1 ; button
	warp_event 24, 19, ARGENT_DEPTHS_B2F, 2 ; button
	warp_event 28, 10, ARGENT_DEPTHS_B2F, 3 ; button
	warp_event 10,  4, ARGENT_DEPTHS_B1F, 1 ; hole
	warp_event 31, 21, ARGENT_DEPTHS_B1F, 2 ; hole
	warp_event 23, 10, ARGENT_DEPTHS_B1F, 3 ; hole
	warp_event 17, 15, ARGENT_DEPTHS_B1F, 5
	warp_event 33, 13, ARGENT_DEPTHS_B1F, 6
	warp_event 25, 25, ARGENT_DEPTHS_GATE_CHAMBER, 2

	db 0 ; coord events

	db 4 ; bg events
	bg_event 16, 19, BGEVENT_ITEM, ArgentDepthsB2FHiddenCoarseCharm
	bg_event 11, 16, BGEVENT_ITEM, ArgentDepthsB2FHiddenFocusSash
	bg_event  7, 24, BGEVENT_ITEM, ArgentDepthsB2FHiddenStardust
	bg_event 38, 27, BGEVENT_ITEM, ArgentDepthsB2FHiddenXAccuracy

	db 7 ; object events
	object_event 10,  5, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, 0, 0, 0, OBJECTTYPE_SCRIPT, 0, ArgentDepthsB2FBoulder, EVENT_ARGENT_DEPTHS_B2F_BOULDER_1
	object_event 30, 21, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, 0, 0, 0, OBJECTTYPE_SCRIPT, 0, ArgentDepthsB2FBoulder, EVENT_ARGENT_DEPTHS_B2F_BOULDER_2
	object_event 24, 10, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, 0, 0, 0, OBJECTTYPE_SCRIPT, 0, ArgentDepthsB2FBoulder, EVENT_ARGENT_DEPTHS_B2F_BOULDER_3
	object_event 10, 10, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, 0, 0, 0, OBJECTTYPE_SCRIPT, 0, ArgentDepthsB2FBoulder, EVENT_ARGENT_DEPTHS_B2F_BOULDER_4
	object_event 24, 19, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, 0, 0, 0, OBJECTTYPE_SCRIPT, 0, ArgentDepthsB2FBoulder, EVENT_ARGENT_DEPTHS_B2F_BOULDER_5
	object_event 28, 10, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, 0, 0, 0, OBJECTTYPE_SCRIPT, 0, ArgentDepthsB2FBoulder, EVENT_ARGENT_DEPTHS_B2F_BOULDER_6
	object_event 39, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, 0, 0, 0, OBJECTTYPE_ITEMBALL, 0, ArgentDepthsB2FFullRestore, EVENT_ARGENT_DEPTHS_B2F_FULL_RESTORE
