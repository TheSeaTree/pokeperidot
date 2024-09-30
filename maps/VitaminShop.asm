	const_def 2 ; object constants

VitaminShop_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
VitaminShopClerk1Script:
	opentext
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .Postgame
	pokemart MARTTYPE_STANDARD, MART_POKEMON_LEAGUE_VITAMINS
	closetext
	end
	
.Postgame
	pokemart MARTTYPE_BARGAIN, 0
	closetext
	end

VitaminShopClerk2Script:
	opentext
	checkevent EVENT_ROUTE_3_BLACKBELT
	iffalse .NoItems
	checkevent EVENT_GOT_BLACKGLASSES
	iffalse .NoItems
	checkevent EVENT_SEA_ROUTE_4_SOFT_SAND
	iffalse .NoItems
	pokemart MARTTYPE_STANDARD, MART_POKEMON_LEAGUE_HELD
	closetext
	end

.NoItems
	writetext VitaminShopClerk2NoItemsText
	waitbutton
	closetext
	end

VitaminShopBlackbelt1:
	jumptextfaceplayer VitaminShopBlackbelt1Text

VitaminShopBlackbelt2:
	jumptextfaceplayer VitaminShopBlackbelt2Text

VitaminShopYoungster:
	jumptextfaceplayer VitaminShopYoungsterText

VitaminShopClerk2NoItemsText:
	text "I have nothing to"
	line "sell right now."

	para "I am waiting for"
	line "my shipment of"
	cont "items to come in."
	done

VitaminShopBlackbelt1Text:
	text "Ooh, yeah!"

	para "I gave my #MON"
	line "lots of VITAMINs"
	cont "and now they are"
	cont "pumped for battle!"

	para "The ELITE FOUR"
	line "stands no chance"
	cont "against me!"
	done

VitaminShopBlackbelt2Text:
	text "How does a kid"
	line "like you make it"
	cont "all the way to the"
	cont "#MON LEAGUE"
	cont "with no mass?"

	para "If your #MON"
	line "are anything like"
	cont "you, I bet I could"
	cont "fight them with my"
	cont "bare hands!"
	done

VitaminShopYoungsterText:
	text "This place gives a"
	line "discount to very"
	cont "strong trainers."

	para "I'm going to train"
	line "until I'm as strong"
	cont "as a BLACKBELT!"
	done

VitaminShop_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, POKEMON_LEAGUE, 4
	warp_event  3,  7, POKEMON_LEAGUE, 4

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VitaminShopClerk1Script, -1
	object_event  1,  2, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VitaminShopClerk2Script, -1
	object_event  8,  2, SPRITE_BLACK_BELT, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VitaminShopBlackbelt1, -1
	object_event  5,  5, SPRITE_BLACK_BELT, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VitaminShopBlackbelt2, -1
	object_event 10,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VitaminShopYoungster, -1
