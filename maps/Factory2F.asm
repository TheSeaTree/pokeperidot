	const_def 2 ; object constants
	const FACTORY2F_BOULDER1

Factory2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Factory2FVendingMachine:
	opentext
	writetext FactoryVendingMachineText
	yesorno
	iffalse .Decline
	checkevent EVENT_FACTORY_2F_MOON_BALL
	iftrue .NothingThere
	checkevent EVENT_FACTORY_2F_LEVEL_BALL
	iftrue .FriendBall
	itemtotext LEVEL_BALL, MEM_BUFFER_0
	writetext FactoryVendingMachineFoundItemText
	waitbutton
	giveitem LEVEL_BALL
	iffalse .NoRoom
	writetext FactoryVendingMachineTakeItemText
	specialsound
	waitbutton
	setevent EVENT_FACTORY_2F_LEVEL_BALL
	itemtotext MOON_BALL, MEM_BUFFER_0
	writetext FactoryVendingMachineAnotherItemText
	waitbutton
	giveitem MOON_BALL
	iffalse .NoRoom
	writetext FactoryVendingMachineTakeItemText
	specialsound
	waitbutton
	setevent EVENT_FACTORY_2F_MOON_BALL
.Decline
	closetext
	end

.FriendBall
	itemtotext MOON_BALL, MEM_BUFFER_0
	writetext FactoryVendingMachineFoundItemText
	waitbutton
	giveitem MOON_BALL
	iffalse .NoRoom
	writetext FactoryVendingMachineTakeItemText
	specialsound
	waitbutton
	setevent EVENT_FACTORY_2F_MOON_BALL
	closetext
	end

.NothingThere
	writetext FactoryVendingMachineEmptyText
	waitbutton
	closetext
	end

.NoRoom
	writetext FactoryVendingMachineNoRoomText
	waitbutton
	closetext
	end

Factory2FHiddenLoveBall:
	hiddenitem LOVE_BALL, EVENT_FACTORY_HIDDEN_LOVE_BALL

Factory2FHiddenUpGrade:
	hiddenitem UP_GRADE, EVENT_FACTORY_HIDDEN_UP_GRADE

Factory2FHiddenCarbos:
	hiddenitem CARBOS, EVENT_FACTORY_HIDDEN_CARBOS

Factory2FHiddenLightBall:
	hiddenitem LIGHT_BALL, EVENT_FACTORY_HIDDEN_LIGHT_BALL

Factory2FThunderstone:
	itemball THUNDERSTONE

Factory2FPokeDoll:
	itemball POKE_DOLL

Factory2FHeatCharm:
	itemball HEAT_CHARM

Factory2FBoulder:
	jumpstd strengthboulder

Factory2FSmashRock:
	jumpstd smashrock

Factory2F_MapEvents:
	db 0, 0 ; filler

	db 12 ; warp events
	warp_event  4, 14, FACTORY_1F, 5
	warp_event  0,  2, FACTORY_1F, 6
	warp_event 27,  6, FACTORY_1F, 7
	warp_event  7, 12, FACTORY_1F, 10
	warp_event 15, 11, FACTORY_1F, 11
	warp_event 15,  8, FACTORY_1F, 12
	warp_event 22, 12, FACTORY_1F, 13
	warp_event 25, 14, FACTORY_1F, 14
	warp_event 20,  9, FACTORY_1F, 15
	warp_event  8,  9, FACTORY_1F, 16
	warp_event  9, 10, FACTORY_1F, 17
	warp_event 17, 13, FACTORY_1F, 18

	db 0 ; coord events

	db 5 ; bg events
	bg_event 20,  3, BGEVENT_UP, Factory2FVendingMachine
	bg_event  1, 12, BGEVENT_ITEM, Factory2FHiddenLoveBall
	bg_event  3,  1, BGEVENT_ITEM, Factory2FHiddenUpGrade
	bg_event 26,  4, BGEVENT_ITEM, Factory2FHiddenCarbos
	bg_event 14,  2, BGEVENT_ITEM, Factory2FHiddenLightBall

	db 5 ; object events
	object_event 11,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Factory2FThunderstone, EVENT_FACTORY_2F_THUNDERSTONE
	object_event  0, 14, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Factory2FPokeDoll, EVENT_FACTORY_2F_POKE_DOLL
	object_event 27, 14, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Factory2FHeatCharm, EVENT_FACTORY_2F_HEAT_CHARM
	object_event 26, 10, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Factory2FBoulder, -1
	object_event 14, 15, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Factory2FSmashRock, -1
