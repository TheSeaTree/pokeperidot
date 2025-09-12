	const_def 2 ; object constants

StaghornFriendBallHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
StaghornFriendBallMerchant:
	faceplayer
	opentext
	checkevent EVENT_FRIEND_BALLS_FOR_SALE
	iftrue .SellBalls
	special GetFirstPokemonHappiness
	writetext FriendBallMerchantLassText
	buttonsound
	ifgreater 250 - 1, .LovesYouALot
	ifgreater 200 - 1, .ReallyTrustsYou
	ifgreater 150 - 1, .SortOfHappy
	ifgreater 100 - 1, .QuiteCute
	ifgreater  50 - 1, .NotUsedToYou
	jump .LooksMean

.LovesYouALot:
	writetext FriendBallMerchantText_LovesYouALot
	waitbutton
	setevent EVENT_FRIEND_BALLS_FOR_SALE
	jump .SellBalls
	end

.ReallyTrustsYou:
	writetext FriendBallMerchantText_ReallyTrustsYou
	waitbutton
	closetext
	end

.SortOfHappy:
	writetext FriendBallMerchantText_SortOfHappy
	waitbutton
	closetext
	end

.QuiteCute:
	writetext FriendBallMerchantText_QuiteCute
	waitbutton
	closetext
	end

.NotUsedToYou:
	writetext FriendBallMerchantText_NotUsedToYou
	waitbutton
	closetext
	end

.LooksMean:
	writetext FriendBallMerchantText_LooksMean
	waitbutton
	closetext
	end
	
.SellBalls
	writetext MerchantSellFriendBall
	jump .Start
.PurchaseMore:
	writetext FriendBallMerchantMoreSelection
.Start:
	special PlaceMoneyTopRight
	loadmenu .MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .OneBall
	ifequal 2, .TenBalls
	writetext FriendBallMerchantComeBack
	waitbutton
	closetext
	end
	
.OneBall:
	checkmoney YOUR_MONEY, 400
	ifequal HAVE_LESS, .NotEnoughMoney
	itemtotext FRIEND_BALL, MEM_BUFFER_0
	jump .AskToVend1

.TenBalls:
	checkmoney YOUR_MONEY, 4000
	ifequal HAVE_LESS, .NotEnoughMoney
	jump .AskToVend10
	
.AskToVend1:
	writetext FriendBallMerchantBuy1Text
	yesorno
	iffalse .No
	giveitem FRIEND_BALL
	iffalse .NotEnoughSpace
	takemoney YOUR_MONEY, 400
	jump .VendItem
.AskToVend10:
	writetext FriendBallMerchantBuy10Text
	yesorno
	iffalse .No
	giveitem FRIEND_BALL, 10
	iffalse .NotEnoughSpace
	takemoney YOUR_MONEY, 4000
.VendItem
	playsound SFX_TRANSACTION
	waitsfx
	special PlaceMoneyTopRight
	itemnotify
	jump .PurchaseMore

.NotEnoughMoney:
	writetext FriendBallMerchantNoMoneyText
	waitbutton
	jump .Start

.NotEnoughSpace:
	writetext FriendBallMerchantNoSpaceText
	waitbutton
	jump .PurchaseMore

.No:
	writetext FriendBallMerchantNo
	waitbutton
	jump .Start

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, SCREEN_WIDTH - 10, TEXTBOX_Y - 2
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 3 ; items
	db "1   ¥400@"
	db "10 ¥4000@"
	db "CANCEL@"

MerchantSellFriendBall:
	text "I have something"
	line "which can make any"
	cont "#MON you catch"
	cont "become friendly"
	cont "right away."
	
	para "Would you like to"
	line "purchase some"
	cont "FRIEND BALLs?"
	done
	
FriendBallMerchantMoreSelection:
	text "Would you like any"
	line "more FRIEND BALLs?"
	done
	
FriendBallMerchantNoMoneyText:
	text "Sorry, but you do"
	line "not have enough"
	cont "money for that."
	done

FriendBallMerchantNoSpaceText:
	text "You won't have any"
	line "space for those."
	done
	
FriendBallMerchantBuy1Text:
	text "A @"
	text_from_ram wStringBuffer3
	text_start
	line "will cost ¥400,"
	cont "okay?"
	done	

FriendBallMerchantBuy10Text:
	text "10 FRIEND BALLs"
	line "will cost ¥4000,"
	cont "okay?"
	done
	
FriendBallMerchantNo:
	text "Would you prefer a"
	line "different amount?"
	done
	
FriendBallMerchantComeBack:
	text "You're welcome to"
	line "as many FRIEND"
	cont "BALLs that you can"
	cont "afford."
	done
	
FriendBallMerchantLassText:
	text "I can tell what a"
	line "#MON feels for"
	cont "its trainer."

	para "Let me see"
	line "your @"
	text_ram wStringBuffer3
	text "…"
	done

FriendBallMerchantText_LovesYouALot:
	text "My, oh my! It must"
	line "have taken a lot"
	cont "of work for your"
	cont "#MON to love"
	cont "you so much!"
	done

FriendBallMerchantText_ReallyTrustsYou:
	text "This #MON seems"
	line "to be very happy"
	cont "that it's with"
	cont "you!"
	done

FriendBallMerchantText_SortOfHappy:
	text "Your #MON likes"
	line "you quite a bit."
	done

FriendBallMerchantText_QuiteCute:
	text "It seems to be"
	line "growing friendly"
	cont "toward you."
	done

FriendBallMerchantText_NotUsedToYou:
	text "You should treat"
	line "this #MON with"
	cont "more kindness."
	
	para "It almost looks"
	line "afraid of you."
	done

FriendBallMerchantText_LooksMean:
	text "I have never seen"
	line "a #MON so full"
	cont "of hatred."
	
	para "…I don't even want"
	line "to think of what"
	cont "this poor creature"
	cont "has been through."
	done

StaghornFriendBallHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, STAGHORN_TOWN, 8
	warp_event  3,  7, STAGHORN_TOWN, 8

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  2,  3, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, StaghornFriendBallMerchant, -1
