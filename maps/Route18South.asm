	const_def 2 ; object constants

Route18South_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route18SouthWeatherCharmGuy:
	faceplayer
	opentext
	checkflag ENGINE_BOUGHT_CHARM_TODAY
	iftrue .NotToday
	checkevent EVENT_MET_WEATHER_CHARM_GUY
	iftrue .BuyMenu
	writetext Route18SouthWeatherCharmGuyText
	waitbutton
	checkitem TM_SUNNY_DAY
	iffalse .Goodbye
	checkitem TM_RAIN_DANCE
	iffalse .Goodbye
	checkitem TM_SANDSTORM
	iffalse .Goodbye
	writetext Route18SouthWeatherCharmGuyHaveTMsText
	waitbutton
	closetext
	opentext
	writetext Route18SouthWeatherCharmGuyShowTMsText
	waitbutton
	setevent EVENT_MET_WEATHER_CHARM_GUY
	jump .BuyMenu
.AlreadyMet
	writetext Route18SouthWeatherCharmGuyGreetingText
	waitbutton
.BuyMenu
	writetext Route18SouthWeatherCharmGuySellText
	special PlaceMoneyTopRight
	loadmenu .MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .Heat
	ifequal 2, .Damp
	ifequal 3, .Coarse
	jump .Decline

.Heat
	checkmoney YOUR_MONEY, 1500
	ifequal HAVE_LESS, .NotEnoughMoney

	itemtotext HEAT_CHARM, MEM_BUFFER_0
	writetext Route18SouthWeatherCharmGuyConfirmText
	yesorno
	iffalse .Decline

	giveitem HEAT_CHARM, 5
	iffalse .NotEnoughSpace
	takemoney YOUR_MONEY, 1500
	special PlaceMoneyTopRight
	jump .VendItem

.Damp
	checkmoney YOUR_MONEY, 1500
	ifequal HAVE_LESS, .NotEnoughMoney

	itemtotext DAMP_CHARM, MEM_BUFFER_0
	writetext Route18SouthWeatherCharmGuyConfirmText
	yesorno
	iffalse .Decline

	giveitem DAMP_CHARM, 5
	iffalse .NotEnoughSpace
	takemoney YOUR_MONEY, 1500
	special PlaceMoneyTopRight
	jump .VendItem

.Coarse
	checkmoney YOUR_MONEY, 1500
	ifequal HAVE_LESS, .NotEnoughMoney

	itemtotext COARSE_CHARM, MEM_BUFFER_0
	writetext Route18SouthWeatherCharmGuyConfirmText
	yesorno
	iffalse .Decline

	giveitem COARSE_CHARM, 5
	iffalse .NotEnoughSpace
	takemoney YOUR_MONEY, 1500
	special PlaceMoneyTopRight

.VendItem
	writetext Route18SouthBuyCharmsText
	playsound SFX_ITEM
	waitsfx
	setflag ENGINE_BOUGHT_CHARM_TODAY
	jump .NotToday

.NotEnoughMoney
	writetext Route18SouthWeatherCharmGuyNotEnoughMoneyText
	waitbutton
	jump .Goodbye

.NotEnoughSpace
	writetext Route18SouthWeatherCharmGuyNoRoomText
	waitbutton
	jump .Goodbye

.NotToday
	writetext Route18SouthWeatherCharmGuyNoItemsText
	waitbutton
.Goodbye
	closetext
	end

.Decline
	writetext Route18SouthWeatherCharmGuyDeclineText
	waitbutton
	jump .Goodbye

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 4, 2, TEXTBOX_WIDTH - 1, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "HEAT CHARM@"
	db "DAMP CHARM@"
	db "COARSE CHARM@"
	db "CANCEL@"

Route18SouthSign:
	jumptext Route18SouthSignText

Route18NorthBigMushroom:
	itemball BIG_MUSHROOM

Route18NorthMaxRepel:
	itemball MAX_REPEL

Route18SouthFruitTree1:
	itembush FRUITTREE_ROUTE_18_SOUTH_1

Route18SouthFruitTree2:
	fruittree FRUITTREE_ROUTE_18_SOUTH_2

Route18SouthHiddenTinyMushroom:
	hiddenitem TINYMUSHROOM, EVENT_ROUTE_18_HIDDEN_TINYMUSHROOM

Route18SouthHiddenHeatCharm:
	hiddenitem HEAT_CHARM, EVENT_ROUTE_18_HIDDEN_HEAT_CHARM

Route18SouthHiddenXDefend:
	hiddenitem X_DEFEND, EVENT_ROUTE_18_HIDDEN_X_DEFEND

Route18SouthWeatherCharmGuyText:
	text "Did you know that"
	line "some items can"
	cont "influence the"
	cont "weather in battle?"

	para "I might be able to"
	line "make some myself,"
	cont "but I don't know"
	cont "how #MON can"
	cont "change the weather"
	cont "to begin with."
	done

Route18SouthWeatherCharmGuyHaveTMsText:
	text "Hm, what's that?"

	para "You have some TMs"
	line "that let your"
	cont "#MON change the"
	cont "weather?"

	para "May I see them?"
	done

Route18SouthWeatherCharmGuyShowTMsText:
	text "………………………"

	para "Yes, I see!"

	para "I think I can make"
	line "some CHARM items"
	cont "to change the"
	cont "weather, but I"
	cont "don't have many"
	cont "materials on hand"
	cont "right now."
	done

Route18SouthWeatherCharmGuyGreetingText:
	text "Hey, it's you"
	line "again!"
	done

Route18SouthWeatherCharmGuySellText:
	text "Would you like me"
	line "to make you some"
	cont "CHARMs to change"
	cont "the weather?"

	para "A set of 5 will"
	line "cost ¥1500."
	done

Route18SouthWeatherCharmGuyConfirmText:
	text "You want the"
	line "@"
	text_from_ram wStringBuffer3
	text "s?"

	para "I can only make"
	line "one set today."
	done

Route18SouthWeatherCharmGuyDeclineText:
	text "Okay, but you'd"
	line "better not wait"
	cont "too long."

	para "Someone else might"
	line "want my CHARMs."
	done

Route18SouthWeatherCharmGuyNotEnoughMoneyText:
	text "Sorry, it takes a"
	line "lost of effort to"
	cont "find these mater-"
	cont "itals. I can't make"
	cont "CHARMs for free."
	done

Route18SouthWeatherCharmGuyNoRoomText:
	text "It seems like your"
	line "BAG can't hold any"
	cont "more items."
	done

Route18SouthWeatherCharmGuyNoItemsText:
	text "I can't make any"
	line "more CHARMs today,"
	cont "but I should have"
	cont "the required mat-"
	cont "erials to make"
	cont "more by tomorrow."
	done

Route18SouthBuyCharmsText:
	text "<PLAYER> received"
	line "5 @"
	text_from_ram wStringBuffer3
	text "s!"
	done

Route18SouthSignText:
	text "ROUTE 18"
	
	para "ACROPORA CITY -"
	line "ROUTE 19"
	done

Route18South_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 23, 13, ROUTE_19_GATE, 1
	warp_event 24, 13, ROUTE_19_GATE, 2

	db 0 ; coord events

	db 4 ; bg events
	bg_event 11,  9, BGEVENT_ITEM, Route18SouthHiddenTinyMushroom
	bg_event 29,  8, BGEVENT_ITEM, Route18SouthHiddenHeatCharm
	bg_event  3,  3, BGEVENT_ITEM, Route18SouthHiddenXDefend
	bg_event 34,  5, BGEVENT_READ, Route18SouthSign

	db 5 ; object events
	object_event 39,  5, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route18SouthWeatherCharmGuy, -1
	object_event  0, 11, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route18NorthBigMushroom, EVENT_ROUTE_18_BIG_MUSHROOM
	object_event 33, 14, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route18NorthMaxRepel, EVENT_ROUTE_18_MAX_REPEL
	object_event 47, 14, SPRITE_BUSH, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route18SouthFruitTree1, -1
	object_event 48, 14, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route18SouthFruitTree2, -1
