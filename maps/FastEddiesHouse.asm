	const_def 2 ; object constants

FastEddiesHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

FastEddie:
	faceplayer
	opentext
	checkevent EVENT_FAST_BALLS_FOR_SALE
	iftrue .Selling
	checkevent EVENT_MET_FAST_EDDIE
	iftrue .TryGiveSoda
	writetext FastEddieIntroText
	waitbutton
	closetext
	setevent EVENT_MET_FAST_EDDIE
	end

.TryGiveSoda:
	writetext FastEddieAskAboutSodaPopText
	yesorno
	iffalse .DeclineSodaPop
	checkitem SODA_POP
	iffalse .NoSodaPopInBag
	takeitem SODA_POP
	copybytetovar wMooMooBerries
	addvar 1
	copyvartobyte wMooMooBerries
	ifequal 6, .DoneSoda
	writetext FastEddiePlayerHaveSodaPopText
	waitbutton
	closetext
	end
	
.DoneSoda
	writetext FastEddieHasEnoughSodaPopText
	waitbutton
	setevent EVENT_FAST_BALLS_FOR_SALE
.Selling
	writetext FastEddieSellingFastBallsText
	jump .Start
.PurchaseMore:
	writetext FastEddieMoreSelectionText
.Start:
	special PlaceMoneyTopRight
	loadmenu .MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .OneBall
	ifequal 2, .TenBalls
	writetext FastEddieComeBackText
	waitbutton
	closetext
	end
	
.OneBall:
	checkmoney YOUR_MONEY, 750
	ifequal HAVE_LESS, .NotEnoughMoney
	jump .AskToVend1

.TenBalls:
	checkmoney YOUR_MONEY, 7500
	ifequal HAVE_LESS, .NotEnoughMoney
	jump .AskToVend10

.AskToVend1:
	writetext FastEddieBuy1Text
	yesorno
	iffalse .No
	giveitem FAST_BALL
	iffalse .NotEnoughSpace
	takemoney YOUR_MONEY, 750
	jump .VendItem
.AskToVend10:
	writetext FastEddieBuy10Text
	yesorno
	iffalse .No
	giveitem FAST_BALL, 10
	iffalse .NotEnoughSpace
	takemoney YOUR_MONEY, 7500
.VendItem
	playsound SFX_TRANSACTION
	waitsfx
	special PlaceMoneyTopRight
	itemnotify
	jump .PurchaseMore

.NotEnoughMoney:
	writetext FastEddieNotEnoughMoneyText
	waitbutton
	jump .Start

.NotEnoughSpace:
	writetext FastEddieNoSpaceText
	waitbutton
	jump .PurchaseMore
	
.No:
	writetext FastEddieDeclineSellingText
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
	db "1   ¥750@"
	db "10 ¥7500@"
	db "CANCEL@"
	
.DeclineSodaPop
	writetext FastEddiePlayerDeclineSodaPopText
	waitbutton
	closetext
	end
	
.NoSodaPopInBag
	writetext FastEddiePlayerNoSodaPopText
	waitbutton
	closetext
	end
	
FastEddieN64:
	jumptext FastEddieN64Text
	
FastEddieBookshelf:
	jumptext FastEddieBookshelfText

FastEddieIntroText:
	text "Hey there, kid!"
	line "Do you like to go"
	cont "fast?"
	
	para "Of course you do!"
	line "What kind of ques-"
	cont "tion is that?"
	
	para "Well it just so"
	line "happens they call"
	cont "me FAAAAAST EDDIE!"

	para "Why's that?"

	para "Because I am F-A-"
	line "S-T, FAST!"
	
	para "But I can't be this"
	line "speedy all on my"
	cont "own, no!"
	
	para "I gotta have a"
	line "steady supply of"
	cont "SODA POP!"
	
	para "Problem is, they"
	line "don't sell it here"
	cont "in the #MON"
	cont "LEAGUE!"
	
	para "If you want to get"
	line "me some SODA POP,"
	cont "I might be able to"
	cont "do something nice"
	cont "in return!"
	
	para "So what are you"
	line "waiting for? Get"
	cont "moving!"
	done

FastEddieAskAboutSodaPopText:
	text "Did you get me the"
	line "delicious fuel?"
	done

FastEddiePlayerDeclineSodaPopText:
	text "What are you doing"
	line "just standing"
	cont "around here for?"
	
	para "SODA POP, my"
	line "friend. Quickly!"
	done

FastEddiePlayerNoSodaPopText:
	text "You got nothing?"
	line "Not a drop?"

	para "Gah! Kid, you're"
	line "killing me here!"

	para "If I ain't FAST,"
	line "then I'm just"
	cont "REGULAR EDDIE,"
	cont "and that's totally"
	cont "lame!"

	para "Go get me some"
	line "SODA POP!"
	done
	
FastEddiePlayerHaveSodaPopText:
	text "Aww yeah! That's"
	line "the stuff!"
	
	para "Thanks kid, but I'm"
	line "gonna need more"
	cont "than that to keep"
	cont "up my FAST life-"
	cont "style!"
	done

FastEddieHasEnoughSodaPopText:
	text "Ooh yeah! Perfect!"
	
	para "I think I have"
	line "enough SODA POP"
	cont "now to hold me for"
	cont "a little while."
	
	para "By the way, I"
	line "didn't forget our"
	cont "deal!"
	done

FastEddieSellingFastBallsText:
	text "If you got the"
	line "need for speed"
	cont "like me, then you"
	cont "must also want a"
	cont "#MON that moves"
	cont "just as quickly!"

	para "Boy, do I have"
	line "something for you!"
	
	para "For a measy ¥750,"
	line "you too can have"
	cont "your very own FAST"
	cont "BALL, best used"
	cont "against only the"
	cont "quickest #MON!"

	para "So how's about it? "

	para "You wanna buy some"
	line "FAST BALLs?"
	done
	
FastEddieComeBackText:
	text "Hurry on back now,"
	line "you hear?"
	
	para "There's always a"
	line "faster #MON to"
	cont "capture!"
	done
	
FastEddieBuy1Text:
	text "Just 1? You must"
	line "be a daredevil as"
	cont "well as a speed"
	cont "demon!"
	done
	
FastEddieBuy10Text:
	text "Hold up? 10?"
	
	para "I respect that a"
	line "ton! Speed is a"
	cont "real lifestyle for"
	cont "you."
	done

FastEddieMoreSelectionText:
	text "You gonna keep"
	line "going?"
	done

FastEddieDeclineSellingText:
	text "I sure hope you're"
	line "not slowing down"
	cont "on me, pal!"
	done

FastEddieNoSpaceText:
	text "I know these aren't"
	line "that big, but you"
	cont "seriously can't fit"
	cont "any more in your"
	cont "PACK there!"
	done

FastEddieNotEnoughMoneyText:
	text "Whoa there, buddy!"
	
	para "I hate to say it,"
	line "but pump the"
	cont "brakes there!"
	
	para "You ain't got"
	line "enough cash!"
	
	para "This isn't a"
	line "charity, you hear?"
	done
	
FastEddieN64Text:
	text "This N64 looks"
	line "like it was over-"
	cont "clocked."
	
	para "The games are run-"
	line "ning so smoothly!"
	done
	
FastEddieBookshelfText:
	text "There's lots of"
	line "car magazines on"
	cont "the shelves."
	done

FastEddiesHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, POKEMON_LEAGUE, 3
	warp_event  3,  7, POKEMON_LEAGUE, 3

	db 0 ; coord events

	db 4 ; bg events
	bg_event 0, 2, BGEVENT_READ, FastEddieN64
	bg_event 1, 1, BGEVENT_READ, FastEddieBookshelf
	bg_event 6, 1, BGEVENT_READ, FastEddieBookshelf
	bg_event 7, 1, BGEVENT_READ, FastEddieBookshelf

	db 1 ; object events
	object_event  2,  3, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, FastEddie, -1
