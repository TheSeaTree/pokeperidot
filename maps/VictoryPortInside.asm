	const_def 2 ; object constants

VictoryPortInside_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

VictoryPortCaptain2Script:
	opentext
	faceplayer
	checkitem PASS
	iftrue .HavePass
	writetext VictoryPortInsideShipNotHereText
	waitbutton
	closetext
	end

.HavePass
	writetext VictoryPortInsideHavePassText
	yesorno
	iffalse .Decline
	waitbutton
	closetext
	end

.Decline
	writetext VictoryPortInsidePassDeclineText
	waitbutton
	closetext
	end

VictoryPortInsideShipNotHereText:
	text "Aye, there be no"
	line "ship makin' her"
	cont "home at this dock."

	para "Maybe we will see"
	line "one in the near"
	cont "future."
	done

VictoryPortInsideHavePassText:
	text "That PASS you have"
	line "there…"
	
	para "Could it be?"
	line "No…"
	
	para "I hadn't seen one"
	line "of those since I"
	cont "was a wee lad."
	
	para "Wherever did you"
	line "find it?"
	
	para "Ah, that doesn't"
	line "matter!"
	
	para "Shall I ferry ye'"
	line "to the island?"
	done

VictoryPortInsidePassDeclineText:
	text "Do ye' need more"
	line "time to prepare?"

	para "I will be docked"
	line "at this port for"
	cont "a little while"
	cont "longer."
	done

VictoryPortInside_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 10, 25, VICTORY_PORT, 1
	warp_event 11, 25, VICTORY_PORT, 1

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
