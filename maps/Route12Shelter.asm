	const_def 2 ; object constants

Route12Shelter_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
Route12ShelterKangaskhan:
	faceplayer
	cry KANGASKHAN
	waitsfx
	end
	
; Leader and/or teacher explains why Kangaskhan seems so distraught. The Cubone it was raising ran away shortly after evolving. The player will need to find it on Route 13/14, then have a boss encounter with it. Afterwards, the teacher will come find the Marowak and all 3 characters will return back to the shelter. Kangaskhan will "talk" with the Marowak and come to the understanding that Marowak is mature enough to no longer need its foster parent. Thankful for your help, and no longer needing to stay at the shelter with no young to take care of, Kangaskhan will offer to join your party. Kangaskhan will know the moves Headbutt, Counter, Foresight, and Milk Drink. The leader will return to the gym and the player will now be able to challenge it.

Route12Shelter_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, ROUTE_12, 3
	warp_event  3,  7, ROUTE_12, 3

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  5,  4, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route12ShelterKangaskhan, -1
	object_event  2,  4, SPRITE_ERIKA, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route12ShelterKangaskhan, -1
	object_event  4,  5, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Route12ShelterKangaskhan, -1
