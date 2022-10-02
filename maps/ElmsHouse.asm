	const_def 2 ; object constants
	const ELMSHOUSE_ELMS_WIFE
	const ELMSHOUSE_ELMS_SON

ElmsHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

ElmsWife:
	faceplayer
	opentext
	checkevent EVENT_GOT_A_POKEMON_FROM_MAPLE
	iffalse .NoPokemon
	checkmoney YOUR_MONEY, 200
	ifequal HAVE_LESS, .NoMoney

.Normal
	writetext ElmsWifeText
	waitbutton
	closetext
	end
	
.NoPokemon:
	writetext ElmsWifeNoPokemonText
	waitbutton
	closetext
	end
	
.NoMoney
	checkitem POKE_BALL
	iftrue .Normal
	checkitem GREAT_BALL
	iftrue .Normal
	checkitem ULTRA_BALL
	iftrue .Normal
	writetext CantAffordBalls
	waitbutton
	writetext GiftPokeballs
	playsound SFX_ITEM
	pause 10
	giveitem POKE_BALL, 6
	waitbutton
	writetext GiftPokeballsPutAway
	waitbutton
	closetext
	end

ElmsSon:
	jumptextfaceplayer ElmsSonText

ElmsHouseLicense:
	jumptext ElmsHouseLicenseText

ElmsHouseBookshelf:
	jumpstd difficultbookshelf

ElmsWifeText:
	text "Hi, <PLAYER>!"

	para "You must be busy"
	line "as a trainer, but"
	cont "it is great you"
	cont "find the time to"
	cont "come visit us!"
	done
	
ElmsWifeNoPokemonText:
	text "Hi, <PLAYER>!"
	
	para "I know I said you"
	line "could visit at any"
	cont "time, but don't"
	cont "you want to get a"
	cont "#MON?"
	done
	
CantAffordBalls:
	text "Oh, you don't have"
	line "enough money to"
	cont "buy a #BALL?"
	
	para "Here, let us help."
	done

GiftPokeballs:
	text "<PLAYER> got"
	line "6 #BALLs!"
	done
	
GiftPokeballsPutAway:
	text "<PLAYER> put the"
	line "#BALLs in"
	cont "the BALL POCKET."
	done

ElmsSonText:
	text "When I was just a"
	line "lad, I ran my own"
	cont "#MON GYM."
	
	para "My specialty was"
	line "the NORMAL type!"
	done

ElmsHouseLicenseText:
	text "It looks like an"
	line "old license for a"
	cont "#MON GYM."
	done

ElmsHouseLabFoodText:
; unused
	text "There's some food"
	line "here. It must be"
	cont "for the LAB."
	done

ElmsHousePokemonFoodText:
; unused
	text "There's some food"
	line "here. This must be"
	cont "for #MON."
	done

ElmsHousePCText:
	text "#MON. Where do"
	line "they come from? "

	para "Where are they"
	line "going?"

	para "Why has no one"
	line "ever witnessed a"
	cont "#MON's birth?"

	para "I want to know! I"
	line "will dedicate my"

	para "life to the study"
	line "of #MON!"

	para "…"

	para "It's a part of"
	line "PROF.ELM's re-"
	cont "search papers."
	done

ElmsHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  7, ELKHORN_TOWN, 3
	warp_event  4,  7, ELKHORN_TOWN, 3

	db 0 ; coord events

	db 4 ; bg events
	bg_event  6,  1, BGEVENT_READ, ElmsHouseBookshelf
	bg_event  7,  1, BGEVENT_READ, ElmsHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, ElmsHouseBookshelf
	bg_event  5,  0, BGEVENT_READ, ElmsHouseLicense

	db 2 ; object events
	object_event  2,  3, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ElmsWife, -1
	object_event  5,  4, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ElmsSon, -1
