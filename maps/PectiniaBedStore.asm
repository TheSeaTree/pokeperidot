	const_def 2 ; object constants
	const PECTINIABEDSTORE_CLERK1
	const PECTINIABEDSTORE_CLERK2
	const PECTINIABEDSTORE_COOLTRAINER
	const PECTINIABEDSTORE_SNORLAX_DOLL

PectiniaBedStore_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PectiniaBedStoreClerk:
	faceplayer
	opentext
	writetext PectiniaBedStoreClerkText
.Start
	loadmenu .MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .Pink
	ifequal 2, .PolkaDot
	ifequal 3, .Pikachu
	ifequal 4, .Camo
	jump .Decline

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 10, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 5 ; items
	db "PINK@"
	db "POLKADOT@"
	db "PIKACHU@"
	db "CAMO@"
	db "CANCEL@"

.Pink
	checkevent EVENT_DECO_BED_2
	iftrue .AlreadyHave
	writetext PectiniaBedSalesmanAskBuyPinkBedText
	special PlaceMoneyTopRight
	yesorno
	iffalse .Decline
	checkmoney YOUR_MONEY, 10000
	ifequal HAVE_LESS, .NotEnoughMoney
	setevent EVENT_DECO_BED_2
	jump .BuyBed

.PolkaDot
	checkevent EVENT_DECO_BED_3
	iftrue .AlreadyHave
	writetext PectiniaBedSalesmanAskBuyPolkaDotBedText
	special PlaceMoneyTopRight
	yesorno
	iffalse .SomethingElse
	checkmoney YOUR_MONEY, 10000
	ifequal HAVE_LESS, .NotEnoughMoney
	setevent EVENT_DECO_BED_3
	jump .BuyBed

.Pikachu
	checkevent EVENT_DECO_BED_4
	iftrue .AlreadyHave
	writetext PectiniaBedSalesmanAskBuyPikachuBedText
	special PlaceMoneyTopRight
	yesorno
	iffalse .SomethingElse
	checkmoney YOUR_MONEY, 10000
	ifequal HAVE_LESS, .NotEnoughMoney
	setevent EVENT_DECO_BED_4
	jump .BuyBed

.Camo
	checkevent EVENT_DECO_CAMO_BED
	iftrue .AlreadyHave
	writetext PectiniaBedSalesmanAskBuyCamoBedText
	special PlaceMoneyTopRight
	yesorno
	iffalse .SomethingElse
	checkmoney YOUR_MONEY, 10000
	ifequal HAVE_LESS, .NotEnoughMoney
	setevent EVENT_DECO_CAMO_BED

.BuyBed
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	takemoney YOUR_MONEY, 10000
	pause 10
	playsound SFX_TRANSACTION
	waitsfx
	special PlaceMoneyTopRight
	writetext PectiniaBedSalesmanBoughtText
	waitbutton
	verbosegiveitem AWAKENING
	iftrue .AnythingElse
	writetext PectiniaBedStoreBagFull
	waitbutton
.AnythingElse
	writetext PectiniaBedSalesmanAnythingElseText
	waitbutton
	jump .Start

.AlreadyHave
	writetext PectiniaBedSalesmanAlreadyBoughtText
	waitbutton
	jump .Start

.SomethingElse
	writetext PectiniaBedSalesmanWrongBedText
	waitbutton
	jump .Start

.Decline
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .DeclineAfterPurchase
	writetext PectiniaBedSalesmanDeclineText
	waitbutton
	closetext
	end

.DeclineAfterPurchase
	writetext PectiniaBedSalesmanAfterPurchaseDelcineText
	waitbutton
	closetext
	end

.NotEnoughMoney
	writetext PectiniaBedSalesmanNotEnoughText
	waitbutton
	closetext
	end

PectiniaBedStoreDollSalesman:
	faceplayer
	checkevent EVENT_DECO_BIG_SNORLAX_DOLL
	iftrue .SoldOut
	opentext
	writetext PectiniaBedStoreDollSalesmanText
	special PlaceMoneyTopRight
	yesorno
	iffalse .Decline
	checkmoney YOUR_MONEY, 50000
	ifequal HAVE_LESS, .NotEnoughMoney
	takemoney YOUR_MONEY, 50000
	setevent EVENT_DECO_BIG_SNORLAX_DOLL
	disappear PECTINIABEDSTORE_SNORLAX_DOLL
	pause 10
	playsound SFX_TRANSACTION
	waitsfx
	special PlaceMoneyTopRight
	writetext PectiniaBedStoreDollBuyText
	waitbutton
	closetext
	end

.Decline:
	writetext PectiniaBedStoreDollDeclineText
	waitbutton
	closetext
	end

.NotEnoughMoney:
	writetext PectiniaBedStoreDollNotEnoughMoneyText
	waitbutton
	closetext
	end	

.SoldOut:
	jumptext PectiniaBedStoreDollSoldOutText

PectiniaBedStoreDrowzeeScript:
	opentext
	writetext PectiniaBedStoreDrowzeeText
	cry DROWZEE
	waitsfx
	waitbutton
	closetext
	end

PectiniaBedStoreCooltrainer:
	jumptextfaceplayer PectiniaBedStoreCooltrainerText

PectiniaBedStoreSnorlaxDoll:
	jumptext PectiniaBedStoreSnorlaxDollText

PectiniaCamoBed:
	jumptext PectiniaCamoBedText

PectiniaPikachuBed:
	jumptext PectiniaPikachuBedText

PectiniaPinkBed:
	jumptext PectiniaPinkBedText

PectiniaPolkaDotBed:
	jumptext PectiniaPolkaDotBedText

PectiniaBedStoreClerkText:
	text "Welcome!"

	para "Please feel free"
	line "to browse through"
	cont "our selection of"
	cont "comfy BEDs!"

	para "Or do you want to"
	line "buy one now?"
	done

PectiniaBedStoreDollSalesmanText:
	text "I see that your"
	line "eye was drawn to"
	cont "this SNORLAX DOLL."

	para "What would compli-"
	line "ment the purchase"
	cont "of a bed more than"
	cont "the sleepiest"
	cont "#MON around?"

	para "What do you say?"
	line "This DOLL can be"
	cont "yours for ¥50000."
	done

PectiniaBedSalesmanAskBuyPinkBedText:
	text "The PINK BED will"
	line "cost ¥10000, okay?"
	done

PectiniaBedSalesmanAskBuyPolkaDotBedText:
	text "The POLKADOT BED"
	line "is ¥10000, okay?"
	done

PectiniaBedSalesmanAskBuyPikachuBedText:
	text "The PIKACHU BED"
	line "is ¥10000, okay?"
	done

PectiniaBedSalesmanAskBuyCamoBedText:
	text "The CAMO BED will"
	line "cost ¥10000, okay?"
	done

PectiniaBedSalesmanBoughtText:
	text "Thank you very"
	line "much!"

	para "Your new BED will"
	line "be shipped to your"
	cont "home in no time!"

	para "As part of a"
	line "special promotion,"
	cont "I will include an"
	cont "AWAKENING with"
	cont "your purchase."
	done

PectiniaBedStoreBagFull:
	text "What a shame. Your"
	line "bag has no space"
	cont "for our promo-"
	cont "tional AWAKENING."
	done

PectiniaBedSalesmanAnythingElseText:
	text "How may I assist"
	line "you further today?"
	done

PectiniaBedSalesmanAlreadyBoughtText:
	text "Our records"
	line "indicate that you"
	cont "have already pur-"
	cont "chased that BED"
	cont "from us."

	para "Did you mean a"
	line "different one?"
	done

PectiniaBedSalesmanWrongBedText:
	text "Did you select the"
	line "wrong BED?"

	para "No problem."
	
	para "Here is our"
	line "selection again."
	done

PectiniaBedSalesmanDeclineText:
	text "Oh? Are you satis-"
	line "fied with the BED"
	cont "you are currently"
	cont "sleeping in?"

	para "Come again when"
	line "you are in the"
	cont "market for a more"
	cont "restful night."
	done

PectiniaBedSalesmanAfterPurchaseDelcineText:
	text "It was a pleasure"
	line "to satisfy your"
	cont "sleeping needs."

	para "Please come again."
	done

PectiniaBedSalesmanNotEnoughText:
	text "Apologies, but you"
	line "can't afford that"
	cont "BED right now."

	para "But please do"
	line "return when you"
	cont "able to."
	done

PectiniaBedStoreDollBuyText:
	text "Alright, thank"
	line "you!"

	para "We will ship that"
	line "DOLL to your home"
	cont "as soon as we can."
	done

PectiniaBedStoreDollDeclineText:
	text "Undecided?"
	line "I get it."

	para "But you better"
	line "make up your mind"
	cont "fast. We don't have"
	cont "many DOLLs left."
	done

PectiniaBedStoreDollNotEnoughMoneyText:
	text "I guess that might"
	line "be a little much"
	cont "for a kid."

	para "But I assure you"
	line "this is the lowest"
	cont "I can go."

	para "This DOLL is made"
	line "of only the most"
	cont "premium materials."
	done

PectiniaBedStoreSnorlaxDollText:
	text "It's a BIG SNORLAX"
	line "DOLL."

	para "Its big belly"
	line "looks comfy enough"
	cont "to sleep on."
	done

PectiniaBedStoreDollSoldOutText:
	text "I'm sorry, but we"
	line "don't have any BIG"
	cont "SNORLAX DOLLs left"
	cont "in stock."

	para "Our next shipment"
	line "has been delayed,"
	cont "but we will let"
	cont "you know when we"
	cont "get more in stock."
	done

PectiniaBedStoreIncludeAwakening:
	text "For your purchase"
	line "of a new bed, we"
	cont "will also include"
	cont "an AWAKENING."

	para "We guarantee you"
	line "will need it tomm-"
	cont "orow morning!"
	done

PectiniaBedStoreDrowzeeText:
	text "DROWZEE: Drow-row…"
	done

PectiniaBedStoreCooltrainerText:
	text "I really need to"
	line "get a new bed be-"
	cont "fore I leave."
	
	para "I'm just so- yawn…"
	line "…tired."
	done

PectiniaCamoBedText:
	text "It's a CAMO BED."
	done

PectiniaPikachuBedText:
	text "It's a PIKACHU BED."
	done

PectiniaPinkBedText:
	text "It's a PINK BED."
	done

PectiniaPolkaDotBedText:
	text "It's a POLKADOT"
	line "BED."
	done

PectiniaBedStore_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  6,  5, PECTINIA_MALL, 4
	warp_event  7,  5, PECTINIA_MALL, 4

	db 0 ; coord events

	db 8 ; bg events
	bg_event  0,  2, BGEVENT_READ, PectiniaCamoBed
	bg_event  0,  1, BGEVENT_READ, PectiniaCamoBed
	bg_event  0,  5, BGEVENT_READ, PectiniaPikachuBed
	bg_event  0,  4, BGEVENT_READ, PectiniaPikachuBed
	bg_event  3,  2, BGEVENT_READ, PectiniaPinkBed
	bg_event  3,  1, BGEVENT_READ, PectiniaPinkBed
	bg_event  3,  5, BGEVENT_READ, PectiniaPolkaDotBed
	bg_event  3,  4, BGEVENT_READ, PectiniaPolkaDotBed

	db 5 ; object events
	object_event 11,  1, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PectiniaBedStoreDollSalesman, -1
	object_event  7,  1, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PectiniaBedStoreClerk, -1
	object_event 11,  4, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PectiniaBedStoreCooltrainer, -1
	object_event 12,  1, SPRITE_BIG_SNORLAX, SPRITEMOVEDATA_BIGDOLLSYM, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PectiniaBedStoreSnorlaxDoll, EVENT_DECO_BIG_SNORLAX_DOLL
	object_event  8,  1, SPRITE_JYNX, SPRITEMOVEDATA_POKEMON, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PectiniaBedStoreDrowzeeScript, -1
