	const_def 2 ; object constants
	const ROUTE18FARMHOUSE_DAD
	const ROUTE18FARMHOUSE_MOM
	const ROUTE18FARMHOUSE_GRAMPS

Route18Farmhouse_MapScripts:
	db 2 ; scene scripts
	scene_script .Default ; SCENE_DEFAULT
	scene_script .Done ; SCENE_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .InitializeHouse

.InitializeHouse:
	changeblock  4,  2, $17
	return

.Default
	disappear ROUTE18FARMHOUSE_GRAMPS
.Done
	end

Route18FarmhouseMother:
	faceplayer
	opentext
	checkevent EVENT_MARIE_GONE_HOME
	iftrue .SellMilk
	writetext Route18FarmhouseMotherMarieNotHomeText
	waitbutton
	closetext
	end
	
.SellMilk
	writetext BuyMilkText
	jump .Start
.PurchaseMore:
	writetext BuyMoreMilkText
.Start:
	special PlaceMoneyTopRight
	loadmenu .MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .One
	ifequal 2, .Dozen
	writetext DoneBuyingMilk
	waitbutton
	closetext
	end
	
.One:
	checkmoney YOUR_MONEY, 950
	ifequal HAVE_LESS, .NotEnoughMoney
	itemtotext MOOMOO_MILK, MEM_BUFFER_0
	jump .AskToVend1

.Dozen:
	checkmoney YOUR_MONEY, 11400
	ifequal HAVE_LESS, .NotEnoughMoney
	jump .AskToVend10
	
.AskToVend1:
	writetext Buy1MilkBottleText
	yesorno
	iffalse .No
	giveitem MOOMOO_MILK
	iffalse .NotEnoughSpace
	takemoney YOUR_MONEY, 950
	jump .VendItem
.AskToVend10:
	writetext BuyDozenMilkBottleText
	yesorno
	iffalse .No
	giveitem MOOMOO_MILK, 12
	iffalse .NotEnoughSpace
	takemoney YOUR_MONEY, 11400
.VendItem
	playsound SFX_TRANSACTION
	waitsfx
	special PlaceMoneyTopRight
	itemnotify
	jump .PurchaseMore

.NotEnoughMoney:
	writetext BuyMilkNoMoneyText
	waitbutton
	jump .Start

.NotEnoughSpace:
	writetext BuyMilkNoSpaceText
	waitbutton
	jump .PurchaseMore
	
.No:
	writetext DoneBuyingMilk
	waitbutton
	jump .Start

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 3 ; items
	db " 1 BOTTLE    ¥950@"
	db "12 BOTTLES ¥11400@"
	db "CANCEL@"
	
Route18FarmhouseFather:
	checkevent EVENT_MARIE_GONE_HOME
	iffalse .NotHome
	jumptextfaceplayer Route18FarmhouseFatherHomeText 
	
.NotHome
	jumptextfaceplayer Route18FarmhouseFatherAwayText

Route18FarmhouseGrandpa:
	jumptextfaceplayer Route18FarmhouseGrandpaText
	
Route18FarmhouseMotherMarieNotHomeText:
	text "Howdy! Are you lo-"
	line "okin' to buy some"
	cont "of our famous MOO-"
	cont "MOO MILK?"
	
	para "If you are, I'm"
	line "sorry to tell you"
	cont "that we're fresh"
	cont "out right now."
	
	para "My daughter took"
	line "our best MILTANK,"
	cont "so we're short on"
	cont "supply right now."
	
	para "Maybe you could"
	line "try coming back"
	cont "later."
	done
	
BuyMilkText:
	text "Howdy! Care to buy"
	line "some of our world-"
	cont "famous MOOMOO"
	cont "MILK?"
	
	para "It's not just deli-"
	line "cious for people,"
	cont "your #MON will"
	cont "love it too!"
	done
	
BuyMoreMilkText:
	text "Would you like any"
	line "more?"
	
	para "We got plenty!"
	done
	
DoneBuyingMilk:
	text "Y'all come back!"
	
	para "We get our MILK"
	line "fresh every day!"
	done
	
Buy1MilkBottleText:
	text "Just one for right"
	line "now? Okay!"
	
	para "That'll be ¥950!"
	done
	
BuyDozenMilkBottleText:
	text "Wow! A whole dozen"
	line "bottles?"
	
	para "That will come to"
	line "¥11400, alright?"
	done
	
BuyMilkNoMoneyText:
	text "Looks like you're"
	line "a bit short on"
	cont "cash."
	
	para "You can come back"
	line "later, we've never"
	cont "run out!"
	done
	
BuyMilkNoSpaceText:
	text "Looks like your"
	line "PACK can't fit any"
	cont "more in it."
	
	para "Were you fixin' to"
	line "drink it all right"
	cont "here?"
	done
	
Route18FarmhouseFatherHomeText:
	text "I can't help but"
	line "feel a bit of"
	cont "pride in MARIE."
	
	para "I used to be quite"
	line "the trainer myself"
	cont "in the past."
	
	para "Maybe she wants to"
	line "take after he old"
	cont "man."
	done
	
Route18FarmhouseFatherAwayText:
	text "I can't be upset"
	line "with my daughter."
	
	para "I know that I was"
	line "bored of small"
	cont "town life when I"
	cont "was her age."
	
	para "I was able to get"
	line "it out of my"
	cont "system."
	done
	
Route18FarmhouseGrandpaText:
	text "This FARM has been"
	line "passed down for"
	cont "generations."
	
	para "My grandpappy left"
	line "it to me, and some"
	cont "day I will leave"
	cont "it to my girls."
	
	para "…But that ain't"
	line "happenin' for a"
	cont "long time! Ehehe!"
	done
	
Route18Farmhouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  7, ROUTE_18, 6
	warp_event  4,  7, ROUTE_18, 6

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events 
	object_event  2,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route18FarmhouseFather, -1
	object_event  5,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route18FarmhouseMother, -1
	object_event  4,  2, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route18FarmhouseGrandpa, -1
