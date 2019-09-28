	const_def 2 ; object constants

AzaleaApartmentRight3F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

AzaleaApartmentRight3FCooltrainerScript:
	jumptextfaceplayer AzaleaApartmentRight3FCooltrainerText
	
AzaleaApartmentRight3FBuenaScript:
	jumptextfaceplayer AzaleaApartmentRight3FBuenaText
	
AzaleaApartmentRight3FHiddenNugget:
	hiddenitem NUGGET, EVENT_AZALEA_APARTMENT_HIDDEN_NUGGET

AzaleaApartmentRight3FHiddenBigPearl:
	hiddenitem BIG_PEARL, EVENT_AZALEA_APARTMENT_HIDDEN_BIG_PEARL
	
AzaleaApartmentRight3FCooltrainerText:
	text "Man, this is the"
	line "life!"
	
	para "The top floor of"
	line "this building is"
	cont "all mine, I got"
	cont "my beautiful girl-"
	cont "friend visiting."
	
	para "I've made it!"
	done
	
AzaleaApartmentRight3FBuenaText:
	text "My boyfriend is"
	line "always so busy"
	cont "managing his"
	cont "money, but I'm"
	cont "glad he can afford"
	cont "a place as nice as"
	cont "this one."
	
	para "Even if the stairs"
	line "are tiring."
	
	para "But hey, he always"
	line "gets me jewelry!"
	done
	
AzaleaApartmentRight3F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  4,  0, AZALEA_APARTMENT_RIGHT_2F, 2

	db 0 ; coord events

	db 2 ; bg events
	bg_event 1, 7, BGEVENT_ITEM, AzaleaApartmentRight3FHiddenNugget
	bg_event 2, 7, BGEVENT_ITEM, AzaleaApartmentRight3FHiddenBigPearl

	db 2 ; object events
	object_event  8,  3, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, AzaleaApartmentRight3FCooltrainerScript, -1	
	object_event  6,  5, SPRITE_BUENA, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, AzaleaApartmentRight3FBuenaScript, -1
