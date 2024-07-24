MaplesLabElevator_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

MaplesLabElevatorScript:
	opentext
	elevator MaplesLabElevatorData
	closetext
	iffalse .Done
	pause 5
	playsound SFX_ELEVATOR
	earthquake 60
	earthquake 60
	waitsfx
.Done
	end

MaplesLabElevatorData:
	db 2 ; floors
	elevfloor FLOOR_B1F, 2, BATTLE_SIMULATION
	elevfloor FLOOR_1F,  3, MAPLES_LAB
	db -1 ; end

MaplesLabElevator_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  3, MAPLES_LAB, -1
	warp_event  1,  3, MAPLES_LAB, -1

	db 0 ; coord events

	db 1 ; bg events
	bg_event  3,  0, BGEVENT_READ, MaplesLabElevatorScript

	db 0 ; object events
