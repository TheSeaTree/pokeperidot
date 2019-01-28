	const_def 2 ; object constants

TeamRocketBaseB3F_MapScripts:
	db 4 ; scene scripts
	scene_script .LanceGetsPassword ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_TEAMROCKETBASEB3F_RIVAL_ENCOUNTER
	scene_script .DummyScene2 ; SCENE_TEAMROCKETBASEB3F_ROCKET_BOSS
	scene_script .DummyScene3 ; SCENE_TEAMROCKETBASEB3F_NOTHING

	db 0 ; callbacks

.LanceGetsPassword:
	end

.DummyScene1:
	end

.DummyScene2:
	end

.DummyScene3:
	end

TeamRocketBaseB3F_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
