	const_def 2 ; object constants

CarnationFlowerShop_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
FlowerShopLady:
	faceplayer
	opentext
	writetext CarnationFlowerShopIntro
.Page1
	special PlaceMoneyTopRight
	loadmenu .MenuHeaderPage1
	verticalmenu
	closewindow
	ifequal 1, .Magna
	ifequal 2, .Tropic
	ifequal 3, .Jumbo
	ifequal 4, .Page2
	jump .Goodbye

.Page2
	special PlaceMoneyTopRight
	loadmenu .MenuHeaderPage2
	verticalmenu
	closewindow
	ifequal 1, .Desert
	ifequal 2, .Island
	ifequal 3, .Page1
	ifequal 4, .Goodbye
.Goodbye
	writetext CarnationFlowerShopGoodbye
	waitbutton
	closetext
	end
	
.Magna
;	pokenamemem PIKACHU, MEM_BUFFER_0
	writetext CarnationFlowerShopConfirm
	yesorno
	iffalse .SomethingElse
	checkmoney YOUR_MONEY, 5500
	ifequal HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_PLANT_1
	iftrue .AlreadyHave
	takemoney YOUR_MONEY, 5500
	special PlaceMoneyTopRight
	setevent EVENT_DECO_PLANT_1
	pause 10
	playsound SFX_TRANSACTION
	waitsfx
	jump .Confirm

.Tropic
;	pokenamemem PIKACHU, MEM_BUFFER_0
	writetext CarnationFlowerShopConfirm
	yesorno
	iffalse .SomethingElse
	checkmoney YOUR_MONEY, 5500
	ifequal HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_PLANT_2
	iftrue .AlreadyHave
	takemoney YOUR_MONEY, 5500
	special PlaceMoneyTopRight
	setevent EVENT_DECO_PLANT_2
	pause 10
	playsound SFX_TRANSACTION
	waitsfx
	jump .Confirm

.Jumbo
;	pokenamemem PIKACHU, MEM_BUFFER_0
	writetext CarnationFlowerShopConfirm
	yesorno
	iffalse .SomethingElse
	checkmoney YOUR_MONEY, 5500
	ifequal HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_PLANT_3
	iftrue .AlreadyHave
	takemoney YOUR_MONEY, 5500
	special PlaceMoneyTopRight
	setevent EVENT_DECO_PLANT_3
	pause 10
	playsound SFX_TRANSACTION
	waitsfx
	jump .Confirm

.Desert
;	pokenamemem PIKACHU, MEM_BUFFER_0
	writetext CarnationFlowerShopConfirm
	yesorno
	iffalse .SomethingElse
	checkmoney YOUR_MONEY, 5500
	ifequal HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_PLANT_5
	iftrue .AlreadyHave
	takemoney YOUR_MONEY, 5500
	special PlaceMoneyTopRight
	setevent EVENT_DECO_PLANT_5
	pause 10
	playsound SFX_TRANSACTION
	waitsfx
	jump .Confirm

.Island
;	pokenamemem PIKACHU, MEM_BUFFER_0
	writetext CarnationFlowerShopConfirm
	yesorno
	iffalse .SomethingElse
	checkmoney YOUR_MONEY, 5500
	ifequal HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_PLANT_6
	iftrue .AlreadyHave
	takemoney YOUR_MONEY, 5500
	special PlaceMoneyTopRight
	setevent EVENT_DECO_PLANT_6
	pause 10
	playsound SFX_TRANSACTION
	waitsfx
	jump .Confirm
	
.Confirm
	writetext CarnationFlowerShopShippedToHome
	waitbutton
	jump .SomethingElse
	
.NotEnoughMoney:
	writetext CarnationFlowerShopNotEnough
	waitbutton
	jump .SomethingElse
	
.AlreadyHave:
	writetext CarnationFlowerShopAlreadyHave
	waitbutton
	
.SomethingElse:
	writetext CarnationFlowerShopSomethingElse
	jump .Page1

.MenuHeaderPage1:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .MenuDataPage1
	db 1 ; default option

.MenuDataPage1:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "MAGNAPLANT  ¥5500@"
	db "TROPICPLANT ¥5500@"
	db "JUMBOPLANT  ¥5500@"
	db "PAGE 2@"

.MenuHeaderPage2:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .MenuDataPage2
	db 1 ; default option

.MenuDataPage2:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "DESERTPLANT ¥7500@"
	db "ISLANDPLANT ¥7500@"
	db "PAGE 1@"
	db "CANCEL@"
	
FlowerShopMagnaPlant:
FlowerShopTropicPlant:
FlowerShopJumboPlant:
FlowerShopDesertPlant:
FlowerShopIslandPlant:
	end

CarnationFlowerShopIntro:
	text "Welcome to my"
	line "FLOWER SHOP."
	
;	para "Feel free to look"
;	line "around and let me"
;	cont "know if there is"
;	cont "anything you would"
;	cont "like to buy."
	done

CarnationFlowerShopConfirm:
	text "You want that one?"
	done

CarnationFlowerShopGoodbye:
	text "You're welcome to"
	line "look around as"
	cont "much as you'd like."
	done
	
CarnationFlowerShopShippedToHome:
	text "I'll send that home"
	line "for you."
	
	para "Take good care of"
	line "it!"
	done
	
CarnationFlowerShopNotEnough:
	text "I don't think you"
	line "have enough money"
	cont "for that one."
	done
	
CarnationFlowerShopAlreadyHave:
	text "Didn't you already"
	line "order that one"
	cont "from me?"
	done
	
CarnationFlowerShopSomethingElse:
	text "Would you like to"
	line "see any others?"
	done

CarnationFlowerShop_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, CARNATION_TOWN, 7
	warp_event  3,  7, CARNATION_TOWN, 7

	db 0 ; coord events

	db 5 ; bg events
	bg_event  0,  2, BGEVENT_READ, FlowerShopMagnaPlant
	bg_event  2,  1, BGEVENT_READ, FlowerShopTropicPlant
	bg_event  7,  7, BGEVENT_READ, FlowerShopJumboPlant
	bg_event  5,  1, BGEVENT_READ, FlowerShopDesertPlant
	bg_event  0, -1, BGEVENT_READ, FlowerShopIslandPlant

	db 1 ; object events
	object_event  3,  4, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FlowerShopLady, -1
