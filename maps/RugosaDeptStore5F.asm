	const_def 2 ; object constants
	const MAHOGANYDEPTSTORE5F_CLERK1
	const MAHOGANYDEPTSTORE5F_CLERK2
	const MAHOGANYDEPTSTORE5F_LASS
	const MAHOGANYDEPTSTORE5F_YOUNGSTER
	const MAHOGANYDEPTSTORE5F_SNES
	const MAHOGANYDEPTSTORE5F_VIRTUAL_BOY
	const MAHOGANYDEPTSTORE5F_N64
	const MAHOGANYDEPTSTORE5F_PIKACHU
	const MAHOGANYDEPTSTORE5F_CLEFAIRY
	const MAHOGANYDEPTSTORE5F_SHIFUR

RugosaDeptStore5F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


RugosaDeptStore5FDollClerkScript:
	faceplayer
	opentext
	writetext RugosaDeptStore5FDollClerkIntro
.Page1
	special PlaceMoneyTopRight
	loadmenu .MenuHeaderPage1
	verticalmenu
	closewindow
	ifequal 1, .Pikachu
	ifequal 2, .Clefairy
	ifequal 3, .Shifur
	ifequal 4, .Page2
	jump .Goodbye

.Page2
	special PlaceMoneyTopRight
	loadmenu .MenuHeaderPage2
	verticalmenu
	closewindow
	ifequal 1, .Bulbasaur
	ifequal 2, .Charmander
	ifequal 3, .Squirtle
	ifequal 4, .Goodbye
	jump .Page1
.Goodbye
	writetext RugosaDeptStore5FGoodbye
	waitbutton
	closetext
	end

.Pikachu
	pokenamemem PIKACHU, MEM_BUFFER_0
	writetext RugosaDeptStore5FDollClerkConfirm
	yesorno
	iffalse .SomethingElse
	checkmoney YOUR_MONEY, 5500
	ifequal HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_PIKACHU_DOLL
	iftrue .AlreadyHave
	takemoney YOUR_MONEY, 5500
	special PlaceMoneyTopRight
	setevent EVENT_DECO_PIKACHU_DOLL
	pause 10
	playsound SFX_TRANSACTION
	waitsfx
	special PlaceMoneyTopRight
	jump .Confirm

.Clefairy
	pokenamemem CLEFAIRY, MEM_BUFFER_0
	writetext RugosaDeptStore5FDollClerkConfirm
	yesorno
	iffalse .SomethingElse
	checkmoney YOUR_MONEY, 5500
	ifequal HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_CLEFAIRY_DOLL
	iftrue .AlreadyHave
	takemoney YOUR_MONEY, 5500
	special PlaceMoneyTopRight
	setevent EVENT_DECO_CLEFAIRY_DOLL
	pause 10
	playsound SFX_TRANSACTION
	waitsfx
	special PlaceMoneyTopRight
	jump .Confirm

.Shifur
	pokenamemem SHIFUR, MEM_BUFFER_0
	writetext RugosaDeptStore5FDollClerkConfirm
	yesorno
	iffalse .SomethingElse
	checkmoney YOUR_MONEY, 5500
	ifequal HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_SHIFUR_DOLL
	iftrue .AlreadyHave
	takemoney YOUR_MONEY, 5500
	special PlaceMoneyTopRight
	setevent EVENT_DECO_SHIFUR_DOLL
	pause 10
	playsound SFX_TRANSACTION
	waitsfx
	special PlaceMoneyTopRight
	jump .Confirm

.Bulbasaur
	pokenamemem BULBASAUR, MEM_BUFFER_0
	writetext RugosaDeptStore5FDollClerkConfirm
	yesorno
	iffalse .SomethingElse
	checkmoney YOUR_MONEY, 17500
	ifequal HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_BULBASAUR_DOLL
	iftrue .AlreadyHave
	takemoney YOUR_MONEY, 17500
	special PlaceMoneyTopRight
	setevent EVENT_DECO_BULBASAUR_DOLL
	pause 10
	playsound SFX_TRANSACTION
	waitsfx
	special PlaceMoneyTopRight
	jump .Confirm

.Charmander
	pokenamemem CHARMANDER, MEM_BUFFER_0
	writetext RugosaDeptStore5FDollClerkConfirm
	yesorno
	iffalse .SomethingElse
	checkmoney YOUR_MONEY, 17500
	ifequal HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_CHARMANDER_DOLL
	iftrue .AlreadyHave
	takemoney YOUR_MONEY, 17500
	special PlaceMoneyTopRight
	setevent EVENT_DECO_CHARMANDER_DOLL
	pause 10
	playsound SFX_TRANSACTION
	waitsfx
	special PlaceMoneyTopRight
	jump .Confirm

.Squirtle
	pokenamemem SQUIRTLE, MEM_BUFFER_0
	writetext RugosaDeptStore5FDollClerkConfirm
	yesorno
	iffalse .SomethingElse
	checkmoney YOUR_MONEY, 17500
	ifequal HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_SQUIRTLE_DOLL
	iftrue .AlreadyHave
	takemoney YOUR_MONEY, 17500
	special PlaceMoneyTopRight
	setevent EVENT_DECO_SQUIRTLE_DOLL
	pause 10
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	waitsfx

.Confirm
	writetext RugosaDeptStore5FShippedToHome
	jump .Page1
	
.NotEnoughMoney:
	writetext RugosaDeptStore5FNotEnough
	waitbutton
	jump .SomethingElse
	
.AlreadyHave:
	writetext RugosaDeptStore5FAlreadyHave
	waitbutton
	
.SomethingElse:
	writetext RugosaDeptStore5FSomethingElse
	jump .Page1

.MenuHeaderPage1:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .MenuDataPage1
	db 1 ; default option

.MenuDataPage1:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "PIKACHU     ¥5500@"
	db "CLEFAIRY    ¥5500@"
	db "SHIFUR      ¥5500@"
	db "NEXT@"

.MenuHeaderPage2:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .MenuDataPage2
	db 1 ; default option

.MenuDataPage2:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "BULBASAUR  ¥17500@"
	db "CHARMANDER ¥17500@"
	db "SQUIRTLE   ¥17500@"
	db "CANCEL@"

RugosaDeptStore5FConsoleClerkScript:
	faceplayer
	opentext
	writetext RugosaDeptStore5FConsoleClerkIntro
.Start
	special PlaceMoneyTopRight
	loadmenu .MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .SNES
	ifequal 2, .N64
	ifequal 3, .VirtualBoy
.Goodbye
	writetext RugosaDeptStore5FGoodbye
	waitbutton
	closetext
	end
	
.SNES
	writetext RugosaDeptStore5SNESConfirm
	yesorno
	iffalse .SomethingElse
	checkmoney YOUR_MONEY, 20000
	ifequal HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_SNES
	iftrue .AlreadyHave
	takemoney YOUR_MONEY, 20000
	special PlaceMoneyTopRight
	setevent EVENT_DECO_SNES
	pause 10
	playsound SFX_TRANSACTION
	waitsfx
	special PlaceMoneyTopRight
	jump .Confirm

.N64
	writetext RugosaDeptStore5N64Confirm
	yesorno
	iffalse .SomethingElse
	checkmoney YOUR_MONEY, 25000
	ifequal HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_N64
	iftrue .AlreadyHave
	takemoney YOUR_MONEY, 25000
	special PlaceMoneyTopRight
	setevent EVENT_DECO_N64
	pause 10
	playsound SFX_TRANSACTION
	waitsfx
	special PlaceMoneyTopRight
	jump .Confirm

.VirtualBoy
	writetext RugosaDeptStore5VirtualBoyConfirm
	yesorno
	iffalse .SomethingElse
	checkmoney YOUR_MONEY, 20000
	ifequal HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_VIRTUAL_BOY
	iftrue .AlreadyHave
	takemoney YOUR_MONEY, 20000
	special PlaceMoneyTopRight
	setevent EVENT_DECO_VIRTUAL_BOY
	pause 10
	playsound SFX_TRANSACTION
	waitsfx
	special PlaceMoneyTopRight
	jump .Confirm
	
.Confirm
	writetext RugosaDeptStore5FShippedToHome
	jump .Start
	
.NotEnoughMoney:
	writetext RugosaDeptStore5FNotEnough
	waitbutton
	jump .SomethingElse
	
.AlreadyHave:
	writetext RugosaDeptStore5FAlreadyHave
	waitbutton
	
.SomethingElse:
	writetext RugosaDeptStore5FSomethingElse
	jump .Start
	
.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "SNES       ¥20000@"
	db "N64        ¥25000@"
	db "VIRTUAL BOY¥20000@"
	db "CANCEL@"

RugosaDeptStore5FGiveDoll:
	checkevent EVENT_DECO_SHIFUR_DOLL
	iftrue .AlreadyHave
	setevent EVENT_DECO_SHIFUR_DOLL
.AlreadyHave
	warpfacing UP, PLAYERS_HOUSE_2F, 3, 3
	end
	
DeptStorePikachuDollScript:
	opentext
	pokenamemem PIKACHU, MEM_BUFFER_0
	jump DeptStoreGenericDoll
	
DeptStoreClefairyDollScript:
	opentext
	pokenamemem CLEFAIRY, MEM_BUFFER_0
	jump DeptStoreGenericDoll
	
DeptStoreShifurDollScript:
	opentext
	pokenamemem SHIFUR, MEM_BUFFER_0
	jump DeptStoreGenericDoll

DeptStoreBulbasaurDollScript:
	opentext
	pokenamemem BULBASAUR, MEM_BUFFER_0
	jump DeptStoreGenericDoll

DeptStoreCharmanderDollScript:
	opentext
	pokenamemem CHARMANDER, MEM_BUFFER_0
	jump DeptStoreGenericDoll

DeptStoreSquirtleDollScript:
	opentext
	pokenamemem SQUIRTLE, MEM_BUFFER_0
	
DeptStoreGenericDoll:	
	writetext RugosaDeptStore5FDollText
	waitbutton
	closetext
	end
	
DeptStoreSNES:
	jumptext RugosaDeptStoreSNESText

DeptStoreN64:
	jumptext RugosaDeptStoreN64Text

DeptStoreVirtualBoy:
	jumptext RugosaDeptStoreVirtualBoyText
	
RugosaDeptStore5FLassScript:
	jumptextfaceplayer RugosaDeptStore5FLassText

RugosaDeptStore5FYoungsterScript:
	jumptextfaceplayer RugosaDeptStore5FYoungsterText

RugosaDeptStore5FDirectory:
	jumptext RugosaDeptStore5FDirectoryText

RugosaDeptStore5FElevatorButton:
	jumpstd elevatorbutton

RugosaDeptStore5FDollClerkIntro:
	text "Welcome to the"
	line "DOLL SHOP."
	
	para "Which DOLL would"
	line "you like?"
	done
	
RugosaDeptStore5FDollClerkConfirm:
	text "You would like the"
	line "@"
	text_ram wStringBuffer3
	text " DOLL?"
	done
	
RugosaDeptStore5FShippedToHome:
	text "OK! We will have"
	line "that item shipped"
	cont "to your home right"
	cont "away!"
	
	para "Would you like"
	line "anything else?"
	done
	
RugosaDeptStore5FAlreadyHave:
	text "Hm…"
	
	para "Our records show"
	line "you have already"
	cont "purchased that."
	done
	
RugosaDeptStore5FConsoleClerkIntro:
	text "Welcome to the"
	line "CONSOLE CORNER!"
	
	para "Would you like to"
	line "buy a CONSOLE?"
	done

RugosaDeptStore5SNESConfirm:
	text "You would like the"
	line "SNES?"
	done

RugosaDeptStore5N64Confirm:
	text "You would like the"
	line "N64?"
	done

RugosaDeptStore5VirtualBoyConfirm:
	text "You would like the"
	line "VIRTUAL BOY?"
	done
	
RugosaDeptStore5FNotEnough:
	text "You can't afford"
	line "that item right"
	cont "now. Sorry…"
	done
	
RugosaDeptStore5FSomethingElse:
	text "Did you want some-"
	line "thing else?"
	done
	
RugosaDeptStore5FGoodbye:
	text "OK! We hope to see"
	line "you again!"
	done

RugosaDeptStore5FDollText:
	text "It's an adorable"
	line "@"
	text_ram wStringBuffer3
	text " DOLL!"
	done

RugosaDeptStoreSNESText:
	text "This game has a"
	line "pair of friends"
	cont "defending their"
	cont "town from zombies!"
	done
	
RugosaDeptStoreN64Text:
	text "This game shows a"
	line "female spy with an"
	cont "alien!"
	done
	
RugosaDeptStoreVirtualBoyText:
	text "Wow! The 3D effect"
	line "on this game is"
	cont "incredible!"
	done

RugosaDeptStore5FLassText:
	text "I wish this place"
	line "had a better"
	cont "selection…"
	
	para "They only stock"
	line "the most popular"
	cont "#MON."
	done

RugosaDeptStore5FYoungsterText:
	text "This shop always"
	line "has the latest"
	cont "games. Sometimes"
	cont "they even get new"
	cont "games early!"
	
	para "This one I'm play-"
	line "ing now isn't out"
	cont "for another month!"
	done

RugosaDeptStore5FDirectoryText:
	text "Personalize Your"
	line "Room!"

	para "5F DECORATIONS"
	done

RugosaDeptStore5F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 12,  0, RUGOSA_DEPT_STORE_4F, 1
	warp_event 15,  0, RUGOSA_DEPT_STORE_6F, 1
	warp_event  2,  0, RUGOSA_DEPT_STORE_ELEVATOR, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event 14,  0, BGEVENT_READ, RugosaDeptStore5FDirectory
	bg_event  3,  0, BGEVENT_READ, RugosaDeptStore5FElevatorButton

	db 13 ; object events
	object_event  7,  5, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RugosaDeptStore5FDollClerkScript, -1
	object_event  8,  5, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RugosaDeptStore5FConsoleClerkScript, -1
	object_event  4,  6, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RugosaDeptStore5FLassScript, -1
	object_event 15,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RugosaDeptStore5FYoungsterScript, -1
	object_event 12,  4, SPRITE_SNES, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DeptStoreSNES, -1
	object_event 14,  6, SPRITE_VIRTUAL_BOY, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DeptStoreVirtualBoy, -1
	object_event 14,  4, SPRITE_N64, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DeptStoreN64, -1
	object_event  3,  4, SPRITE_PIKACHU, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, DeptStorePikachuDollScript, -1
	object_event  2,  4, SPRITE_CLEFAIRY, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DeptStoreClefairyDollScript, -1
	object_event  1,  4, SPRITE_SHIFUR, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DeptStoreShifurDollScript, -1
	object_event  0,  6, SPRITE_BULBASAUR, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DeptStoreBulbasaurDollScript, -1
	object_event  1,  6, SPRITE_CHARMANDER, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DeptStoreCharmanderDollScript, -1
	object_event  2,  6, SPRITE_SQUIRTLE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DeptStoreSquirtleDollScript, -1
