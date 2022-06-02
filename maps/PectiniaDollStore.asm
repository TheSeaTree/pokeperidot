	const_def 2 ; object constants

PectiniaDollStore_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PectiniaDollStoreSaleswomanScript:
	faceplayer
	opentext
	writetext BigDollSaleswomanIntroText
.Page1
	special PlaceMoneyTopRight
	loadmenu .MenuHeaderPage1
	verticalmenu
	closewindow
	ifequal 1, .Snorlax
	ifequal 2, .Sudowoodo
	ifequal 3, .Lapras
	ifequal 4, .Page2
	jump .Goodbye

.Page2
	special PlaceMoneyTopRight
	loadmenu .MenuHeaderPage2
	verticalmenu
	closewindow
	ifequal 1, .BigOnix
	ifequal 2, .BigLapras
	ifequal 3, .Goodbye
	jump .Page1
.Goodbye
	writetext BigDollSaleswomanGoodbyeText
	waitbutton
	closetext
	end

.Snorlax
	pokenamemem SNORLAX, MEM_BUFFER_0
	writetext RegularDollSaleswomanConfirmText
	yesorno
	iffalse .SomethingElse
	checkmoney YOUR_MONEY, 5500
	ifequal HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_SNORLAX_DOLL
	iftrue .AlreadyHave
	takemoney YOUR_MONEY, 5500
	special PlaceMoneyTopRight
	setevent EVENT_DECO_SNORLAX_DOLL
	pause 10
	playsound SFX_TRANSACTION
	waitsfx
	special PlaceMoneyTopRight
	jump .Confirm

.Sudowoodo
	pokenamemem SUDOWOODO, MEM_BUFFER_0
	writetext RegularDollSaleswomanConfirmText
	yesorno
	iffalse .SomethingElse
	checkmoney YOUR_MONEY, 5500
	ifequal HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_SUDOWOODO_DOLL
	iftrue .AlreadyHave
	takemoney YOUR_MONEY, 5500
	special PlaceMoneyTopRight
	setevent EVENT_DECO_SUDOWOODO_DOLL
	pause 10
	playsound SFX_TRANSACTION
	waitsfx
	special PlaceMoneyTopRight
	jump .Confirm

.Lapras
	pokenamemem LAPRAS, MEM_BUFFER_0
	writetext RegularDollSaleswomanConfirmText
	yesorno
	iffalse .SomethingElse
	checkmoney YOUR_MONEY, 5500
	ifequal HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_LAPRAS_DOLL
	iftrue .AlreadyHave
	takemoney YOUR_MONEY, 5500
	special PlaceMoneyTopRight
	setevent EVENT_DECO_LAPRAS_DOLL
	pause 10
	playsound SFX_TRANSACTION
	waitsfx
	special PlaceMoneyTopRight
	jump .Confirm

.BigOnix
	pokenamemem ONIX, MEM_BUFFER_0
	writetext BigDollSaleswomanBuyText
	yesorno
	iffalse .SomethingElse
	checkmoney YOUR_MONEY, 50000
	ifequal HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_BIG_ONIX_DOLL
	iftrue .BigDollAlreadyHave
	takemoney YOUR_MONEY, 50000
	special PlaceMoneyTopRight
	setevent EVENT_DECO_BIG_ONIX_DOLL
	pause 10
	playsound SFX_TRANSACTION
	waitsfx
	special PlaceMoneyTopRight
	jump .Confirm

.BigLapras
	pokenamemem LAPRAS, MEM_BUFFER_0
	writetext BigDollSaleswomanBuyText
	yesorno
	iffalse .SomethingElse
	checkmoney YOUR_MONEY, 50000
	ifequal HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_BIG_LAPRAS_DOLL
	iftrue .BigDollAlreadyHave
	takemoney YOUR_MONEY, 50000
	special PlaceMoneyTopRight
	setevent EVENT_DECO_BIG_LAPRAS_DOLL
	pause 10
	playsound SFX_TRANSACTION
	waitsfx
	special PlaceMoneyTopRight

.Confirm
	writetext DollSaleswomanShippedToHome
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .SomethingElse
	waitbutton
	writetext DollSaleswomanElkhornText
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	jump .SomethingElse
	
.NotEnoughMoney:
	writetext DollSaleswomanNotEnoughMoneyText
	jump .SomethingElse
	
.AlreadyHave:
	writetext DollSaleswomanCheckRecordsText
	wait 60
	writetext DollSaleswomanAlreadyHaveText
	jump .SomethingElse
	
.BigDollAlreadyHave:
	writetext BigDollSaleswomanAlreadyHaveText
	waitbutton

.SomethingElse:
	waitbutton
	writetext DollSaleswomanSomethingElseText
	jump .Page1

.MenuHeaderPage1:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .MenuDataPage1
	db 1 ; default option

.MenuDataPage1:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "SNORLAX     ¥7500@"
	db "SUDOWOODO   ¥7500@"
	db "LAPRAS      ¥7500@"
	db "NEXT@"

.MenuHeaderPage2:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, SCREEN_WIDTH - 1, TEXTBOX_Y - 3
	dw .MenuDataPage2
	db 1 ; default option

.MenuDataPage2:
	db STATICMENU_CURSOR ; flags
	db 3 ; items
	db "BIG ONIX   ¥50000@"
	db "BIG LAPRAS ¥50000@"
	db "CANCEL@"

PectiniaDollStoreTwinScript:
	jumptextfaceplayer PectiniaDollStoreTwinText

PectiniaDollStoreYoungsterScript:
	jumptextfaceplayer PectiniaDollStoreYoungsterText

PectiniaDollStoreTeacherScript:
	jumptextfaceplayer PectiniaDollStoreTeacherText

PectiniaDollStoreSudowoodoDollScript:
	opentext
	pokenamemem SUDOWOODO, MEM_BUFFER_0
	jump PectiniaDollStoreGenericDoll

PectiniaDollStoreSnorlaxDollScript:
	opentext
	pokenamemem SNORLAX, MEM_BUFFER_0
	jump PectiniaDollStoreGenericDoll

PectiniaDollStoreLaprasDollScript:
	opentext
	pokenamemem LAPRAS, MEM_BUFFER_0

PectiniaDollStoreGenericDoll:
	writetext PectiniaDollStoreDollText
	waitbutton
	closetext
	end

PectiniaDollStoreBigLaprasDollScript:
	opentext
	pokenamemem LAPRAS, MEM_BUFFER_0
	jump PectiniaDollStoreGenericBigDoll

PectiniaDollStoreBigOnixDollScript:
	opentext
	pokenamemem ONIX, MEM_BUFFER_0

PectiniaDollStoreGenericBigDoll:
	writetext PectiniaDollStoreBigDollText
	waitbutton
	closetext
	end

PectiniaDollStoreMerchandise:
	jumptext PectiniaDollStoreMerchandiseText

BigDollSaleswomanIntroText:
	text "Hello!"

	para "Would you like to"
	line "take home some new"
	cont "DOLLs today?"
	done

BigDollSaleswomanAlreadyHaveText:
	text "Are you sure you"
	line "have the space for"
	cont "another one of"
	cont "those?"
	done

DollSaleswomanCheckRecordsText:
	text "One moment,"
	line "please…"
	done

DollSaleswomanAlreadyHaveText:
	text "According to our"
	line "records, you have"
	cont "already purchased"
	cont "that DOLL."
	done

RegularDollSaleswomanConfirmText:
	text "You would like the"
	line "@"
	text_ram wStringBuffer3
	text " DOLL?"

	para "It costs ¥7500."
	done

BigDollSaleswomanBuyText:
	text "Would you like the"
	line "BIG @"
	text_ram wStringBuffer3
	text " DOLL?"
	
	para "It costs ¥50000."
	done

BigDollSaleswomanGoodbyeText:
	text "You're welcome to"
	line "browse as much as"
	cont "you like."

	para "You can't find our"
	line "selection of DOLLs"
	cont "anywhere else!"
	done

DollSaleswomanShippedToHome:
	text "I'll have that DOLL"
	line "sent to your home."
	done

DollSaleswomanElkhornText:
	text "Since you are from"
	line "ELKHORN TOWN, it"
	cont "will be delivered"
	cont "in no time!"
	done

DollSaleswomanSomethingElseText:
	text "Would you like"
	line "anything else?"
	done

DollSaleswomanNotEnoughMoneyText:
	text "I'm sorry, but you"
	line "don't have enough"
	cont "money to afford"
	cont "that DOLL."
	done

PectiniaDollStoreTwinText:
	text "Isn't LAPRAS so"
	line "cute?"

	para "I wanted the BIG"
	line "DOLL, but my dad"
	cont "said we had no"
	cont "space for it."

	para "I got the little"
	line "one instead!"
	done

PectiniaDollStoreYoungsterText:
	text "I'm almost done"
	line "collecting every"
	cont "DOLL, but I'm"
	cont "missing one."

	para "These DOLL"
	line "CAPSULEs keep"
	cont "giving me ones I"
	cont "already have!"
	done

PectiniaDollStoreTeacherText:
	text "My son never stops"
	line "talking about"
	cont "how much he loves"
	cont "SCIZOR, so I am"
	cont "going to get him"
	cont "a SCIZOR toy."

	para "His birthday is"
	line "coming up soon, I"
	cont "am going to surpr-"
	cont "ise him with it."
	done

PectiniaDollStoreDollText:
	text "It's an adorable"
	line "@"
	text_ram wStringBuffer3
	text " DOLL!"
	done

PectiniaDollStoreBigDollText:
	text "It's a BIG"
	line "@"
	text_ram wStringBuffer3
	text " DOLL!"

	para "…With an equally"
	line "big price tag."
	done

PectiniaDollStoreMerchandiseText:
	text "The shelves are"
	line "full of #MON-"
	cont "themed toys and"
	cont "games for kids."
	done

PectiniaDollStore_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  7,  7, PECTINIA_MALL, 5
	warp_event  8,  7, PECTINIA_MALL, 5

	db 0 ; coord events

	db 5 ; bg events
	bg_event  1,  6, BGEVENT_READ, PectiniaDollStoreMerchandise
	bg_event  2,  6, BGEVENT_READ, PectiniaDollStoreMerchandise
	bg_event  3,  6, BGEVENT_READ, PectiniaDollStoreMerchandise
	bg_event  4,  6, BGEVENT_READ, PectiniaDollStoreMerchandise
	bg_event 10,  2, BGEVENT_READ, PectiniaDollStoreMerchandise

	db 9 ; object events
	object_event  7,  2, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PectiniaDollStoreSaleswomanScript, -1
	object_event 12,  3, SPRITE_TWIN, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PectiniaDollStoreTwinScript, -1
	object_event  3,  2, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PectiniaDollStoreYoungsterScript, -1
	object_event  2,  7, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PectiniaDollStoreTeacherScript, -1
	object_event 14,  2, SPRITE_BIG_LAPRAS, SPRITEMOVEDATA_BIGDOLLSYM, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PectiniaDollStoreBigLaprasDollScript, -1
	object_event  0,  2, SPRITE_BIG_ONIX, SPRITEMOVEDATA_BIGDOLL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PectiniaDollStoreBigOnixDollScript, -1
	object_event 12,  5, SPRITE_SUDOWOODO, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PectiniaDollStoreSudowoodoDollScript, -1
	object_event 11,  5, SPRITE_SNORLAX, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PectiniaDollStoreSnorlaxDollScript, -1
	object_event 13,  5, SPRITE_SURF, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PectiniaDollStoreLaprasDollScript, -1
