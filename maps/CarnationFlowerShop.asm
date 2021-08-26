	const_def 2 ; object constants
	const FLOWERSHOP_OWNER
	const FLOWERSHOP_SUDOWOODO

CarnationFlowerShop_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
FlowerShopLady:
	faceplayer
	opentext
	special GetFirstPokemonHappiness
	ifless  50 - 1, .ThirstyPlant
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
	turnobject LAST_TALKED, RIGHT
	end
	
.Magna
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
	jump .Confirm

.Tropic
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
	jump .Confirm

.Jumbo
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
	jump .Confirm

.Desert
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
	jump .Confirm

.Island
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
	
.Confirm
	playsound SFX_TRANSACTION
	waitsfx
	special PlaceMoneyTopRight
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
	
.ThirstyPlant:
	checkevent EVENT_DECO_PLANT_7
	iftrue .HaveThirstyPlant
	writetext CarnationFlowerShopReceiveThirstyPlantText
	waitbutton
	writetext PlayerReceiveThirstyPlantText
	setevent EVENT_DECO_PLANT_7
	playsound SFX_WRONG
	wait 8
	writetext PlayerRecieveThirstyPlantAfterText
	waitbutton
	closetext
	turnobject LAST_TALKED, RIGHT
	end
	
.HaveThirstyPlant:
	writetext CarnationFlowerShopRefuseServiceText
	waitbutton
	closetext
	end
	
FlowerShopSudowoodo:
	opentext
	writetext FlowerShopSudowoodoQuestionText
	waitbutton
	closetext
	playsound SFX_SANDSTORM
	applymovement FLOWERSHOP_SUDOWOODO, FlowerShopSudowoodoShakeMovement
	waitsfx
	opentext
	writetext FlowerShopSudowoodoAfterText
	waitbutton
	closetext
	end
	
FlowerShopMagnaPlant:
	jumptext FlowerShopMagnaPlantText

FlowerShopTropicPlant:
	jumptext FlowerShopTropicPlantText

FlowerShopJumboPlant:
	jumptext FlowerShopJumboPlantText

FlowerShopDesertPlant:
	jumptext FlowerShopDesertPlantText

FlowerShopIslandPlant:
	jumptext FlowerShopIslandPlantText

FlowerShopAssortedFlowers:
	jumptext FlowerShopAssortedFlowersText

FlowerShopSudowoodoShakeMovement:
	tree_shake
	step_resume

CarnationFlowerShopIntro:
	text "Welcome to my"
	line "FLOWER SHOP."
	
	para "Do you want to buy"
	line "one of my PLANTs?"
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
	
CarnationFlowerShopReceiveThirstyPlantText:
	text "Welcome to my"
	line "FLOWER SHOP."
	
	para "Do you want to buy"
	line "one of-"

	para "…My goodness."
	line "…Your #MON!"
	
	para "I'm sorry, I can't"
	line "in good faith sell"
	cont "you any of my"
	cont "PLANTS."
	
	para "The best I can do"
	line "is this one, on"
	cont "the house."
	done
	
PlayerReceiveThirstyPlantText:
	text "<PLAYER> received"
	line "the THIRSTYPLANT."
	done
	
PlayerRecieveThirstyPlantAfterText:
	text "You are welcome to"
	line "come back, but"
	cont "please…"

	para "Take better care"
	line "of your #MON!"
	done

CarnationFlowerShopRefuseServiceText:
	text "I'm terribly sorry,"
	line "but your #MON…"
	cont "It just…"

	para "How can you take"
	line "care of a PLANT if"
	cont "you can't care for"
	cont "your partners?"

	para "I can't serve you"
	line "right now."
	done
	
FlowerShopSudowoodoQuestionText:
	text "What kind of PLANT"
	line "is this?"
	done
	
FlowerShopSudowoodoAfterText:
	text "Oh, it's not a"
	line "PLANT after all."
	
	para "It's a #MON!"
	done

FlowerShopMagnaPlantText:
	text "The tag says this"
	line "is a MAGNAPLANT."
	done

FlowerShopTropicPlantText:
	text "The tag says this"
	line "is a TROPICPLANT."
	done

FlowerShopJumboPlantText:
	text "The tag says this"
	line "is a JUMBOPLANT."
	done

FlowerShopDesertPlantText:
	text "The tag says this"
	line "is a DESERTPLANT."
	done

FlowerShopIslandPlantText:
	text "The tag says this"
	line "is an ISLANDPLANT."
	done
	
FlowerShopAssortedFlowersText:
	text "There is an assor-"
	line "tment of pretty"
	cont "flowers."
	done

CarnationFlowerShop_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, CARNATION_TOWN, 7
	warp_event  3,  7, CARNATION_TOWN, 7

	db 0 ; coord events

	db 11 ; bg events
	bg_event  7,  4, BGEVENT_READ, FlowerShopMagnaPlant
	bg_event  2,  1, BGEVENT_READ, FlowerShopTropicPlant
	bg_event  0,  2, BGEVENT_READ, FlowerShopJumboPlant
	bg_event  5,  1, BGEVENT_READ, FlowerShopDesertPlant
	bg_event  0,  0, BGEVENT_READ, FlowerShopIslandPlant
	bg_event  7,  3, BGEVENT_READ, FlowerShopAssortedFlowers
	bg_event  3,  1, BGEVENT_READ, FlowerShopAssortedFlowers
	bg_event  1,  5, BGEVENT_READ, FlowerShopAssortedFlowers
	bg_event  1,  4, BGEVENT_READ, FlowerShopAssortedFlowers
	bg_event  0,  3, BGEVENT_READ, FlowerShopAssortedFlowers
	bg_event  6,  2, BGEVENT_READ, FlowerShopAssortedFlowers

	db 2 ; object events
	object_event  3,  4, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FlowerShopLady, -1
	object_event  4,  1, SPRITE_SUDOWOODO, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, FlowerShopSudowoodo, -1
