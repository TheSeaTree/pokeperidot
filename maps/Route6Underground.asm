	const_def 2 ; object constants
	

Route6Underground_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Mikey:
	faceplayer
	opentext
	trade NPC_TRADE_MIKEY
	waitbutton
	turnobject LAST_TALKED, DOWN
	closetext
	end
	
SodaMan:
	faceplayer
	opentext
	checkflag EVENT_ROUTE_7_BOUGHT_SODA
	iftrue .BuyAgain
	writetext GiveSodaText
	waitbutton
	verbosegiveitem SODA_POP
	iffalse .NotEnoughSpace
	setflag EVENT_ROUTE_7_BOUGHT_SODA
	writetext AfterGiveSodaText
	jump .EndSodaGuy
	
.refused
	writetext RefusedSodaText
	jump .EndSodaGuy
	
.NotEnoughMoney:
	writetext SodaNoMoneyText
	jump .EndSodaGuy

.NotEnoughSpace:
	writetext SodaNoSpaceText
	jump .EndSodaGuy
	
.BuyAgain
	checkflag ENGINE_SODA_POP_GUY
	iftrue .AlreadyBought
	writetext BuyAgainText
	special PlaceMoneyTopRight
	yesorno
	iffalse .refused
	checkmoney YOUR_MONEY, 3600
	ifequal HAVE_LESS, .NotEnoughMoney
	giveitem SODA_POP, 6
	iffalse .NotEnoughSpace
	takemoney YOUR_MONEY, 3600
	itemtotext SODA_POP, MEM_BUFFER_0
	writetext BoughtSoda
	playsound SFX_ITEM
	buttonsound
	itemnotify
	writetext BoughtSodaAfter
	jump .EndSodaGuy
	
.AlreadyBought:
	writetext BoughtSodaTodayText
.EndSodaGuy:
	waitbutton
	closetext
	turnobject LAST_TALKED, RIGHT
	end
	
Route6UndergroundNerd:
	jumptextfaceplayer Route6UndergroundNerdText

Route6UndergroundLass:
	jumptextfaceplayer Route6UndergroundLassText
	
Route6UndergroundOfficer1:
	jumptextfaceplayer Route6UndergroundOfficer1Text

Route6UndergroundOfficer2:
	jumptextfaceplayer Route6UndergroundOfficer2Text
	
GiveSodaText:
	text "Hey, kid. I got"
	line "something you"
	cont "might want."
	
	para "Just take it."
	line "On the house."
	done
	
AfterGiveSodaText:
	text "Hehe! Thanks!"
	
	para "Tell your friends!"
	done
	
RefusedSodaText:
	text "You sure, kid?"
	
	para "Your #MON look"
	line "mighty thirsty…"
	done
	
SodaNoMoneyText:
	text "You trying to play"
	line "me, kid? Get lost!"
	done

SodaNoSpaceText:
	text "Looks like you got"
	line "no place to put"
	cont "it. Make some room"
	cont "then come back."
	done
	
BoughtSoda:
	text "<PLAYER> bought"
	line "6 SODA POP!"
	done
	
BoughtSodaAfter:
	text "Alright, little"
	line "dude! You really"
	cont "helped me out!"
	done
	
BuyAgainText:
	text "You need some more"
	line "SODA POP? I'm not"
	cont "running a charity."
	
	para "A six-pack will"
	line "run you ¥3600."
	
	para "How about it?"
	done
	
BoughtSodaTodayText:
	text "I'm fresh out of"
	line "stock for today."
	
	para "Try coming back"
	line "tomorrow. I'll"
	cont "hook you up."
	done
	
Route6UndergroundNerdText:
	text "That guy over"
	line "there at the table"
	cont "is selling SODA"
	cont "POP at really high"
	cont "prices."
	
	para "He knows you can't"
	line "buy it anywhere"
	cont "around here."
	
	para "He's really smart!"
	done
	
Route6UndergroundLassText:
	text "This tunnel is"
	line "mostly underwater."
	cont "It was built for"
	cont "trainers who can't"
	cont "use SURF."
	done
	
Route6UndergroundOfficer1Text:
	text "This tunnel will"
	line "take you to ROUTE"
	cont "8."
	done

Route6UndergroundOfficer2Text:
	text "You're working on"
	line "a #DEX? That's"

	para "really something."
	line "Don't give up!"
	done

Route6Underground_MapEvents:
	db 0, 0 ; filler

	db 8 ; warp events
	warp_event 31, 19, ROUTE_6, 1
	warp_event 32, 19, ROUTE_6, 1
	warp_event 32, 15, ROUTE_6_UNDERGROUND, 4
	warp_event 31,  4, ROUTE_6_UNDERGROUND, 3
	warp_event  3, 10, ROUTE_6_UNDERGROUND, 6
	warp_event 18, 15, ROUTE_6_UNDERGROUND, 5
	warp_event 17, 19, ROUTE_8, 1
	warp_event 18, 19, ROUTE_8, 1

	db 0 ; coord events

	db 0 ; bg events

	db 6 ; object events
	object_event  1,  6, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Mikey, -1
	object_event 16,  4, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SodaMan, -1
	object_event 12,  2, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route6UndergroundNerd, -1
	object_event  4,  4, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route6UndergroundLass, -1
	object_event 27,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route6UndergroundOfficer1, -1
	object_event  0,  9, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route6UndergroundOfficer2, -1
