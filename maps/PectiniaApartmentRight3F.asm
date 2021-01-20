	const_def 2 ; object constants

PectiniaApartmentRight3F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PectiniaApartmentRight3FCooltrainerScript:
	jumptextfaceplayer PectiniaApartmentRight3FCooltrainerText
	
PectiniaApartmentRight3FBuenaScript:
	jumptextfaceplayer PectiniaApartmentRight3FBuenaText
	
PectiniaApartmentRight3FHiddenNugget:
	hiddenitem NUGGET, EVENT_AZALEA_APARTMENT_HIDDEN_NUGGET

PectiniaApartmentRight3FHiddenBigPearl:
	hiddenitem BIG_PEARL, EVENT_AZALEA_APARTMENT_HIDDEN_BIG_PEARL
	
PectiniaApartmentRight3FCooltrainerText:
	text "Man, this is the"
	line "life!"
	
	para "The top floor of"
	line "this building is"
	cont "all mine, I got"
	cont "my beautiful girl-"
	cont "friend visiting."
	
	para "I've made it!"
	done
	
PectiniaApartmentRight3FBuenaText:
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
	
PectiniaApartmentRight3F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  4,  0, PECTINIA_APARTMENT_RIGHT_2F, 2

	db 0 ; coord events

	db 2 ; bg events
	bg_event 1, 7, BGEVENT_ITEM, PectiniaApartmentRight3FHiddenNugget
	bg_event 2, 7, BGEVENT_ITEM, PectiniaApartmentRight3FHiddenBigPearl

	db 2 ; object events
	object_event  8,  3, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PectiniaApartmentRight3FCooltrainerScript, -1	
	object_event  6,  5, SPRITE_BUENA, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PectiniaApartmentRight3FBuenaScript, -1
