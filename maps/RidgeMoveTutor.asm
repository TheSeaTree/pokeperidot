	const_def 2 ; object constants

RidgeMoveTutor_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
RidgeMoveTutor:
	faceplayer
	opentext
	writetext RidgeTutorText
	waitbutton
	checkitem SILVER_LEAF
	iffalse .NoLeaf
	writetext RidgeTutorTeach
	loadmenu .MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .SweetKiss
	ifequal 2, .LovelyKiss
	ifequal 3, .DrainKiss
	jump .Refused
	end

.SweetKiss	
	writebyte SWEET_KISS
	special MoveTutor
	ifequal $0, .TeachMove
	jump .Refused

.LovelyKiss	
	writebyte LOVELY_KISS
	special MoveTutor
	ifequal $0, .TeachMove
	jump .Refused
	
.DrainKiss	
	writebyte DRAIN_KISS
	special MoveTutor
	ifequal $0, .TeachMove
	jump .Refused
	
.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 15, 7
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 3 ; items
	db "SWEET KISS@"
	db "LOVELY KISS@"
	db "DRAIN KISS@"

.TeachMove
	takeitem SILVER_LEAF
	writetext RidgeTutorThankYou
	waitbutton
	turnobject LAST_TALKED, RIGHT
	closetext
	end
	
.Refused
	writetext RidgeTutorRefused
	waitbutton
	turnobject LAST_TALKED, RIGHT
	closetext
	end
	
.NoLeaf
	writetext RidgeTutorExplainSilverLeaf
	waitbutton
	turnobject LAST_TALKED, RIGHT
	closetext
	end

RidgeTutorText:
	text "Hello there!"
	
	para "I'm a MOVE TUTOR."
	
	para "I can teach your"
	line "#MON a special"
	cont "move, but it will"
	cont "cost you a SILVER"
	cont "LEAF."
	done
	
RidgeTutorExplainSilverLeaf:
	text "It doesn't seem"
	line "like you have one."
	
	para "Come back with a"
	line "SILVER LEAF and I"
	cont "will teach your"
	cont "#MON something"
	cont "special!"
	done
	
RidgeTutorTeach:
	text "Oh! You already"
	line "have one!"

	para "What move should I"
	line "teach?"
	done

RidgeTutorRefused:
	text "Come back whenever"
	line "you like."
	done
	
RidgeTutorThankYou:
	text "Mwah!" 
	
	para "Thank you!"
	done

RidgeMoveTutor_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, RIDGE_VILLAGE, 4
	warp_event  3,  7, RIDGE_VILLAGE, 4

	db 0 ; coord events

	db 0 ; bg events
	
	db 1 ; object events
	object_event  2, 4, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RidgeMoveTutor, -1
