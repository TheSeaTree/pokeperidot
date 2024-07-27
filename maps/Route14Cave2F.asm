	const_def 2 ; object constants
	const THE_BONEYARD_2F_BOULDER1
	const THE_BONEYARD_2F_BOULDER2
	const THE_BONEYARD_2F_BOULDER3

Route14Cave2F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_CMDQUEUE, .SetUpStoneTable
	
.SetUpStoneTable:
	writecmdqueue .CommandQueue
	return
	
.CommandQueue:
	cmdqueue CMDQUEUE_STONETABLE, .StoneTable ; check if any stones are sitting on a warp

.StoneTable:
	stonetable 4, THE_BONEYARD_2F_BOULDER3, .Boulder3
	stonetable 2, THE_BONEYARD_2F_BOULDER1, .Boulder1
	stonetable 3, THE_BONEYARD_2F_BOULDER2, .Boulder2
	db -1 ; end
	
.Boulder1:
	disappear THE_BONEYARD_2F_BOULDER1
	clearevent EVENT_THE_BONEYARD_1F_BOULDER_1
	jump .Fall

.Boulder2:
	disappear THE_BONEYARD_2F_BOULDER2
	clearevent EVENT_THE_BONEYARD_1F_BOULDER_2
	jump .Fall

.Boulder3:
	disappear THE_BONEYARD_2F_BOULDER3
	clearevent EVENT_THE_BONEYARD_1F_BOULDER_3
	jump .Fall
	
.Fall:
	pause 30
	scall .FX
	opentext
	writetext Route14Cave2FBoulderFellText
	waitbutton
	closetext
	end
	
.FX:
	playsound SFX_STRENGTH
	earthquake 80
	end

Route14Cave2FBoulder:
	jumpstd strengthboulder

Route14Cave2FHiddenThickClub:
	hiddenitem THICK_CLUB, EVENT_ROUTE_13_HIDDEN_THICK_CLUB
	
Route14Cave2FBoulderFellText:
	text "The boulder fell"
	line "through!"
	done
	
Route14Cave2F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  9,  5, THE_BONEYARD_1F, 1
	warp_event  8,  9, THE_BONEYARD_1F, 2 ; hole
	warp_event  4, 11, THE_BONEYARD_1F, 4 ; hole
	warp_event  8, 15, THE_BONEYARD_1F, 3 ; hole

	db 0 ; coord events

	db 1 ; bg events
	bg_event 10, 17, BGEVENT_ITEM, Route14Cave2FHiddenThickClub

	db 3 ; object events
	object_event 15,  6, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route14Cave2FBoulder, EVENT_THE_BONEYARD_2F_BOULDER_1
	object_event  3, 13, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route14Cave2FBoulder, EVENT_THE_BONEYARD_2F_BOULDER_2
	object_event  8, 11, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route14Cave2FBoulder, EVENT_THE_BONEYARD_2F_BOULDER_3
