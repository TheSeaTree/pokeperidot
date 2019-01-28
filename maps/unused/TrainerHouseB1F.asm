	const_def 2 ; object constants

TrainerHouseB1F_MapScripts:
	db 1 ; scene scripts
	scene_script .DummyScene ; SCENE_DEFAULT

	db 0 ; callbacks

.DummyScene:
	end

TrainerHouseB1F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  9,  4, TRAINER_HOUSE_1F, 3

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
