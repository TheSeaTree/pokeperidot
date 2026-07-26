	const_def 2 ; object constants
	const ABANDONEDFACTORY2F_BOULDER1

AbandonedFactory2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

AbandonedFactory2FVendingMachine:
	opentext
	writetext AbandonedFactoryVendingMachineText
	yesorno
	iffalse .Decline
	checkevent EVENT_ABANDONED_FACTORY_2F_MOON_BALL
	iftrue .NothingThere
	checkevent EVENT_ABANDONED_FACTORY_2F_LEVEL_BALL
	iftrue .FriendBall
	itemtotext LEVEL_BALL, MEM_BUFFER_0
	writetext AbandonedFactoryVendingMachineFoundItemText
	waitbutton
	giveitem LEVEL_BALL
	iffalse .NoRoom
	writetext AbandonedFactoryVendingMachineTakeItemText
	specialsound
	waitbutton
	setevent EVENT_ABANDONED_FACTORY_2F_LEVEL_BALL
	itemtotext MOON_BALL, MEM_BUFFER_0
	writetext AbandonedFactoryVendingMachineAnotherItemText
	waitbutton
	giveitem MOON_BALL
	iffalse .NoRoom
	writetext AbandonedFactoryVendingMachineTakeItemText
	specialsound
	waitbutton
	setevent EVENT_ABANDONED_FACTORY_2F_MOON_BALL
.Decline
	closetext
	end

.FriendBall
	itemtotext MOON_BALL, MEM_BUFFER_0
	writetext AbandonedFactoryVendingMachineFoundItemText
	waitbutton
	giveitem MOON_BALL
	iffalse .NoRoom
	writetext AbandonedFactoryVendingMachineTakeItemText
	specialsound
	waitbutton
	setevent EVENT_ABANDONED_FACTORY_2F_MOON_BALL
	closetext
	end

.NothingThere
	writetext AbandonedFactoryVendingMachineEmptyText
	waitbutton
	closetext
	end

.NoRoom
	writetext AbandonedFactoryVendingMachineNoRoomText
	waitbutton
	closetext
	end

AbandonedFactory2FHiddenLoveBall:
	hiddenitem LOVE_BALL, EVENT_ABANDONED_FACTORY_HIDDEN_LOVE_BALL

AbandonedFactory2FHiddenUpGrade:
	hiddenitem UP_GRADE, EVENT_ABANDONED_FACTORY_HIDDEN_UP_GRADE

AbandonedFactory2FHiddenCarbos:
	hiddenitem CARBOS, EVENT_ABANDONED_FACTORY_HIDDEN_CARBOS

AbandonedFactory2FHiddenLightBall:
	hiddenitem LIGHT_BALL, EVENT_ABANDONED_FACTORY_HIDDEN_LIGHT_BALL

AbandonedFactory2FThunderstone:
	itemball THUNDERSTONE

AbandonedFactory2FPokeDoll:
	itemball POKE_DOLL

AbandonedFactory2FHeatCharm:
	itemball HEAT_CHARM

AbandonedFactory2FBoulder:
	jumpstd strengthboulder

AbandonedFactory2FSmashRock:
	jumpstd smashrock

AbandonedFactory2F_MapEvents:
	db 0, 0 ; filler

	db 12 ; warp events
	warp_event  4, 14, ABANDONED_FACTORY_1F, 5
	warp_event  0,  2, ABANDONED_FACTORY_1F, 6
	warp_event 27,  6, ABANDONED_FACTORY_1F, 7
	warp_event  7, 12, ABANDONED_FACTORY_1F, 10
	warp_event 15, 11, ABANDONED_FACTORY_1F, 11
	warp_event 15,  8, ABANDONED_FACTORY_1F, 12
	warp_event 22, 12, ABANDONED_FACTORY_1F, 13
	warp_event 25, 14, ABANDONED_FACTORY_1F, 14
	warp_event 20,  9, ABANDONED_FACTORY_1F, 15
	warp_event  8,  9, ABANDONED_FACTORY_1F, 16
	warp_event  9, 10, ABANDONED_FACTORY_1F, 17
	warp_event 17, 13, ABANDONED_FACTORY_1F, 18

	db 0 ; coord events

	db 5 ; bg events
	bg_event 20,  3, BGEVENT_UP, AbandonedFactory2FVendingMachine
	bg_event  1, 12, BGEVENT_ITEM, AbandonedFactory2FHiddenLoveBall
	bg_event  3,  1, BGEVENT_ITEM, AbandonedFactory2FHiddenUpGrade
	bg_event 26,  4, BGEVENT_ITEM, AbandonedFactory2FHiddenCarbos
	bg_event 14,  2, BGEVENT_ITEM, AbandonedFactory2FHiddenLightBall

	db 5 ; object events
	object_event 11,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, AbandonedFactory2FThunderstone, EVENT_ABANDONED_FACTORY_2F_THUNDERSTONE
	object_event  0, 14, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, AbandonedFactory2FPokeDoll, EVENT_ABANDONED_FACTORY_2F_POKE_DOLL
	object_event 27, 14, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, AbandonedFactory2FHeatCharm, EVENT_ABANDONED_FACTORY_2F_HEAT_CHARM
	object_event 26, 10, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AbandonedFactory2FBoulder, -1
	object_event 14, 15, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AbandonedFactory2FSmashRock, -1
