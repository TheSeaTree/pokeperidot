	const_def 2 ; object constants

Route12Shelter_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene ; SCENE_ROUTE12SHELTER_DEFAULT
	scene_script .DummyScene ; SCENE_ROUTE12SHELTER_MAROWAK

	db 0 ; callbacks
	
.DummyScene:
	end
	
Route12Leader:
	faceplayer
	opentext
	checkevent EVENT_HEARD_ROUTE_12_LEADER
	iftrue .HeardIntro
	writetext Route12LeaderIntro
	yesorno
	iffalse .No
.Yes
	setevent EVENT_HEARD_ROUTE_12_LEADER
	writetext Route12LeaderYes
	waitbutton
.HeardIntro
	writetext Route12LeaderAfter
	waitbutton
	closetext
	end

.No
	writetext Route12LeaderNo
	yesorno
	iftrue .Yes
	iffalse .No
	end
	
Route12ShelterKangaskhan:
	faceplayer
	cry KANGASKHAN
	waitsfx
	end
	
; Leader and/or teacher explains why Kangaskhan seems so distraught. The Cubone it was raising ran away shortly after evolving. The player will need to find it on Route 13/14, then have a boss encounter with it. Afterwards, the teacher will come find the Marowak and all 3 characters will return back to the shelter. Kangaskhan will "talk" with the Marowak and come to the understanding that Marowak is mature enough to no longer need its foster parent. Thankful for your help, and no longer needing to stay at the shelter with no young to take care of, Kangaskhan will offer to join your party. Kangaskhan will know the moves Headbutt, Counter, Foresight, and Milk Drink. The leader will return to the gym and the player will now be able to challenge it.

; Leader must stay behind to comfort the Kangaskhan, and the Teacher cannot go up ahead because she is not a trainer. This leaves only the player to go on ahead. The leader mentions a cave up ahead on Route 14, and that would be a good starting point. Marowak are shy creatures, and will not initiate a battle unless they absolutely have to.

Route12LeaderIntro:
	text "Oh, this is"
	line "terrible!"
	
	para "The MAROWAK we"
	line "were taking care"
	cont "of here has gone"
	cont "missing!"
	
	para "It evolved from a"
	line "CUBONE recently,"
	cont "and KANGASKHAN has"
	cont "been in shambles."
	
	para "CUBONE have no"
	line "mother, so"
	cont "KANGASKHAN's"
	cont "motherly instinct"
	cont "took over."
	
	para "I would go out and"
	line "find MAROWAK on my"
	cont "own, but I need to"
	cont "stay here and com-"
	cont "fort KANGASKHAN."
	
	para "The volunteer at"
	line "this shelter isn't"
	cont "a trainer, so it"
	cont "would be too"
	cont "dangerous for her"
	cont "to go alone."
	
	para "…You look like a"
	line "trainer."

	para "Please, could you"
	line "help us and go"
	cont "find MAROWAK?"
	done
	
Route12LeaderYes:
	text "Oh, thank you so"
	line "very much!"
	
	para "There is a cave on"
	line "ROUTE 14 where"
	cont "MAROWAK would love"
	cont "to play when it"
	cont "young. You could"
	cont "start by looking"
	cont "there."
	done
	
Route12LeaderAfter:
	text "MAROWAK are timid"
	line "creatures. They"
	cont "will not attack"
	cont "unless they are"
	cont "given no other"
	cont "choice."
	done
	
Route12LeaderNo:
	text "…What? You won't"
	line "help?"
	
	para "Please reconsider."
	line "For me?"
	done

Route12Shelter_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, ROUTE_12, 3
	warp_event  3,  7, ROUTE_12, 3

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  5,  4, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route12ShelterKangaskhan, -1
	object_event  2,  4, SPRITE_POSEY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route12Leader, -1
	object_event  4,  5, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Route12ShelterKangaskhan, -1
	object_event  5,  5, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_HIDE_SHELTER_MAROWAK
