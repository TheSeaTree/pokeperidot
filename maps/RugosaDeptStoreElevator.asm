RugosaDeptStoreElevator_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

RugosaDeptStoreElevatorScript:
	opentext
	elevator RugosaDeptStoreElevatorData
	closetext
	iffalse .Done
	pause 5
	playsound SFX_ELEVATOR
	earthquake 60
	waitsfx
.Done
	end

RugosaDeptStoreElevatorData:
	db 6 ; floors
	elevfloor FLOOR_1F,  4, RUGOSA_DEPT_STORE_1F
	elevfloor FLOOR_2F,  3, RUGOSA_DEPT_STORE_2F
	elevfloor FLOOR_3F,  3, RUGOSA_DEPT_STORE_3F
	elevfloor FLOOR_4F,  3, RUGOSA_DEPT_STORE_4F
	elevfloor FLOOR_5F,  3, RUGOSA_DEPT_STORE_5F
	elevfloor FLOOR_6F,  2, RUGOSA_DEPT_STORE_6F
	db -1 ; end

RugosaDeptStoreElevator_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  1,  3, RUGOSA_DEPT_STORE_1F, -1
	warp_event  2,  3, RUGOSA_DEPT_STORE_1F, -1

	db 0 ; coord events

	db 1 ; bg events
	bg_event  3,  0, BGEVENT_READ, RugosaDeptStoreElevatorScript

	db 0 ; object events
