	const_def 2 ; object constants

Route24South_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route24SouthWeatherCharmGuy:
	faceplayer
	opentext
	checkflag ENGINE_BOUGHT_CHARM_TODAY
	iftrue .NotToday
	checkevent EVENT_MET_WEATHER_CHARM_GUY
	iftrue .BuyMenu
	writetext Route24SouthWeatherCharmGuyText
	waitbutton
	checkitem TM_SUNNY_DAY
	iffalse .Goodbye
	checkitem TM_RAIN_DANCE
	iffalse .Goodbye
	checkitem TM_SANDSTORM
	iffalse .Goodbye
	writetext Route24SouthWeatherCharmGuyHaveTMsText
	waitbutton
	closetext
	opentext
	writetext Route24SouthWeatherCharmGuyShowTMsText
	waitbutton
	setevent EVENT_MET_WEATHER_CHARM_GUY
	jump .BuyMenu
.AlreadyMet
	writetext Route24SouthWeatherCharmGuyGreetingText
	waitbutton
.BuyMenu
	writetext Route24SouthWeatherCharmGuySellText
	waitbutton
	special PlaceMoneyTopRight
	loadmenu .MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .Heat
	ifequal 2, .Damp
	ifequal 3, .Coarse
	jump .Goodbye

.Heat
	checkmoney YOUR_MONEY, 1500
	ifequal HAVE_LESS, .NotEnoughMoney
	giveitem HEAT_CHARM, 5
	iffalse .NotEnoughSpace
	takemoney YOUR_MONEY, 1500
	itemtotext HEAT_CHARM, MEM_BUFFER_0
	jump .VendItem

.Damp
	checkmoney YOUR_MONEY, 1500
	ifequal HAVE_LESS, .NotEnoughMoney
	giveitem DAMP_CHARM, 5
	iffalse .NotEnoughSpace
	takemoney YOUR_MONEY, 1500
	itemtotext DAMP_CHARM, MEM_BUFFER_0
	jump .VendItem

.Coarse
	checkmoney YOUR_MONEY, 1500
	ifequal HAVE_LESS, .NotEnoughMoney
	giveitem COARSE_CHARM, 5
	iffalse .NotEnoughSpace
	takemoney YOUR_MONEY, 1500
	itemtotext COARSE_CHARM, MEM_BUFFER_0
	jump .VendItem

.VendItem
	writetext Route24SouthBuyCharmsText
	waitbutton
	setflag ENGINE_BOUGHT_CHARM_TODAY
	jump .NotToday

.NotEnoughMoney
	writetext Route24SouthWeatherCharmGuyNotEnoughMoneyText
	waitbutton
	jump .Goodbye

.NotEnoughSpace
	writetext Route24SouthWeatherCharmGuyNoRoomText
	waitbutton
	jump .Goodbye

.NotToday
	writetext Route24SouthWeatherCharmGuyNoItemsText
	waitbutton
.Goodbye
	closetext
	end

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "HEAT CHARM   ¥1500@"
	db "DAMP CHARM   ¥1500@"
	db "COARSE CHARM ¥1500@"
	db "CANCEL@"

Route24SouthSign:
	jumptext Route24SouthSignText

Route24NorthBigMushroom:
	itemball BIG_MUSHROOM

Route24NorthMaxRepel:
	itemball MAX_REPEL

Route24SouthFruitTree1:
	fruittree FRUITTREE_ROUTE_24_SOUTH_1
	
Route24SouthFruitTree2:
	fruittree FRUITTREE_ROUTE_24_SOUTH_2

Route24SouthHiddenTinyMushroom:
	hiddenitem TINYMUSHROOM, EVENT_ROUTE_24_HIDDEN_TINYMUSHROOM

Route24SouthHiddenHeatCharm:
	hiddenitem HEAT_CHARM, EVENT_ROUTE_24_HIDDEN_HEAT_CHARM

Route24SouthHiddenXDefend:
	hiddenitem X_DEFEND, EVENT_ROUTE_24_HIDDEN_X_DEFEND

Route24SouthWeatherCharmGuyText:
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

Route24SouthWeatherCharmGuyHaveTMsText:
	text "Hm, what's that?"

	para "You have some TMs"
	line "that let your"
	cont "#MON change the"
	cont "weather?"

	para "May I see them?"
	done

Route24SouthWeatherCharmGuyShowTMsText:
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

Route24SouthWeatherCharmGuyGreetingText:
	text "Hey, it's you"
	line "again!"
	done

Route24SouthWeatherCharmGuySellText:
	text "Would you like me"
	line "to make you some"
	cont "CHARMs to change"
	cont "the weather?"
	done

Route24SouthWeatherCharmGuyNotEnoughMoneyText:
	text "Sorry, it takes a"
	line "lost of effort to"
	cont "find these mater-"
	cont "itals. I can't make"
	cont "CHARMs for free."
	done

Route24SouthWeatherCharmGuyNoRoomText:
	text "It seems like your"
	line "BAG can't hold any"
	cont "more items."
	done

Route24SouthWeatherCharmGuyNoItemsText:
	text "I can't make any"
	line "more CHARMs today,"
	cont "but I should have"
	cont "the required mat-"
	cont "erials to make"
	cont "more by tomorrow."
	done

Route24SouthBuyCharmsText:
	text "<PLAYER> received"
	line "5 @"
	text_from_ram wStringBuffer3
	text_start
	text "s!"
	done

Route24SouthSignText:
	text "ROUTE 18"
	
	para "ACROPORA CITY -"
	line "ROUTE 19"
	done

Route24South_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 23, 13, ROUTE_25_GATE, 1
	warp_event 24, 13, ROUTE_25_GATE, 2

	db 0 ; coord events

	db 4 ; bg events
	bg_event 11,  9, BGEVENT_ITEM, Route24SouthHiddenTinyMushroom
	bg_event 29,  8, BGEVENT_ITEM, Route24SouthHiddenHeatCharm
	bg_event  3,  3, BGEVENT_ITEM, Route24SouthHiddenXDefend
	bg_event 34,  5, BGEVENT_READ, Route24SouthSign

	db 5 ; object events
	object_event 39,  5, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route24SouthWeatherCharmGuy, -1
	object_event  0, 11, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route24NorthBigMushroom, EVENT_ROUTE_24_BIG_MUSHROOM
	object_event 33, 14, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route24NorthMaxRepel, EVENT_ROUTE_24_MAX_REPEL
	object_event 47, 14, SPRITE_BUSH, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route24SouthFruitTree1, -1
	object_event 48, 14, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route24SouthFruitTree2, -1
